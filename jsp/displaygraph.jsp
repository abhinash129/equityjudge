<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html ng-app="myApp">
<head>


<script type="text/javascript"
	src="<c:url value="/resources/angular/controller/graphController.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/angular/service/graphService.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/angular/service/watchlist_Service.js"/>"></script>
<style type="text/css">
.nv-legend {
	transform: translate(-150px, 370px);
}

.datepicker {
	z-index: 1151 !important;
}
</style>

<script src="<c:url value="/resources/dist/ticker/js/endlessRiver.js"/>"></script>
<link rel="stylesheet"
	href="<c:url value="/resources/dist/ticker/css/endlessRiver.css"/>" />
<link href="<c:url value="/resources/css/graph.css"/>" rel="stylesheet">
<script src="<c:url value="/resources/js/graph.js" />"></script>


<link rel="stylesheet"
	href="<c:url value="/resources/css/stickyNotes.css"/>" />

</head>
<body ng-controller="GraphController"
	data-ng-init="passCompanyName('${FirstCompny.companyName }','${FirstCompny.companyCode }','${FirstCompny.companyId }')">

	<div>
		<ul id="myCompany">
			<c:forEach items="${LiveBSE }" var="liveBSE">
				<li>&#10148; <font color="blue">${liveBSE.companyName }:</font>
					${liveBSE.current_Value } <small><c:if
							test="${liveBSE.chang_points <=0 }">
							<font color="red">[&#9660;${liveBSE.chang_points }(${liveBSE.change_per }%)]</font>
						</c:if> <c:if test="${liveBSE.chang_points >0 }">
							<font color="green">[&#9650;${liveBSE.chang_points }(${liveBSE.change_per }%)]</font>
						</c:if></small>
				</li>
			</c:forEach>
		</ul>
	</div>

	<div class="wrapper">
		<div class="page-header"
			style="margin-top: 10px; margin-left: 20px; margin-bottom: 20px; margin-right: 15px">
			<font size="6px">Trend</font> <font id="ul" size="2px"
				style="font-weight: bold;"> <font id="li">
					<p style="padding-top: 10px; padding-left: 15px;">
						<font color="blue"> <a
							href="${pageContext.request.contextPath}/graphpattern/graph/selectCompny?companyName=${BSESensexValue.companyName}">${BSESensexValue.companyName }</a>:
						</font> ${BSESensexValue.current_Value } <small><c:if
								test="${BSESensexValue.chang_points <=0 }">
								<font color="red">[&#9660;${BSESensexValue.chang_points }(${BSESensexValue.change_per }%)]</font>
							</c:if> <c:if test="${BSESensexValue.chang_points >0 }">
								<font color="green">[&#9650;${BSESensexValue.chang_points }(${BSESensexValue.change_per }%)]</font>
							</c:if></small>
					</p>
			</font>
			</font>

		</div>

		<div class="row">
			<div class="col-sm-12 col-md-12">

				<div class="col-sm-9 col-md-9">

					<div class="row">
						<div id="sticky_navigation_wrapper" style="margin-bottom: 10px">
							<div class="demo_container" id="sticky_navigation">
								<div class="col-sm-12 col-md-12" style="margin-top: 7px">
									<div class="col-sm-5 col-md-7">
										<form
											action="${pageContext.request.contextPath}/graphpattern/graph/details"
											method="post" name="searchform">
											<div class="col-sm-11 col-md-8" style="margin-bottom: 10px">
												<input type="hidden" name="companyName1"
													ng-model="companyName" required> <input type="text"
													id="automplete-1" name="companyName"
													placeholder="Search company" class="form-control"
													ng-keydown="checkKeyDown($event)"
													ng-keyup="checkKeyUp($event)" ng-model="companyName"
													ng-change="search()" required>
											</div>
											<div class="col-sm-1 col-md-1" style="margin-left: -25px;">
												<button type="submit" ng-disabled="searchform.$invalid"
													class="btn btn-primary">GO</button>
											</div>
										</form>
									</div>
									<div class="col-sm-7 col-md-5 pull-right">
										<div class="col-sm-6 col-md-6 pull-right">
											<button type="button" class="btn btn-info dropdown-toggle"
												ng-click="addWatchList(labelName,sc_code)"
												ng-disabled="bseflag">Add to watchlist</button>
										</div>
										<div class="col-sm-6 col-md-6 pull-right">
											<button type="submit" class="btn btn-info dropdown-toggle"
												href="#emailChange" data-toggle="modal"
												ng-disabled="bseflag">Add to MyPortfolio</button>
										</div>
									</div>


								</div>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-sm-12 col-md-12">
							<div class="box">
								<div class="box-header">
									<!-- for suggestion url -->
									<h3>
										<a href="#"
											style="text-decoration: none; color: red; font-weight: bolder; font-size: 75%;">{{labelName}}</a>
										<font size="2px" style="font-weight: bold;" ng-hide="load">{{sc_id}}</font>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img ng-show="load"
											src="<c:url value="/resources/images/load1.gif"/>">
									</h3>
								</div>


								<div class="box-body">

									<div class="panel panel-default col-sm-12 col-md-9">
										<div class="panel-heading">
											BSE Quotes
											<div class="pull-right">
												{{date}} <font ng-show="close">[Close]</font>
											</div>
										</div>
										<div class="panel-body">
											<div class="table-responsive" ng-hide="nodata">
												<table
													class="table table-striped table-bordered table-hover">
													<tbody align="center" style="font-size: medium;"
														ng-show="others">
														<tr>
															<td>Price (Rs.)
																<p style="font-weight: bold; font-size: large;">{{ClosePrice}}</p>
															</td>
															<td>Open (Rs.)
																<p style="font-weight: bold; font-size: large;">{{OpenPrice}}</p>
															</td>
															<td>High (Rs.)
																<p style="font-weight: bold; font-size: large;">{{HighPrice}}</p>
															</td>
															<td>Low (Rs.)
																<p style="font-weight: bold; font-size: large;">{{LowPrice}}</p>
															</td>
														</tr>
														<tr>
															<td>% Change
																<p
																	style="color: green; font-weight: bold; font-size: large;"
																	ng-show="positive">
																	<img src="<c:url value="/resources/images/up.png"/>">&nbsp;&nbsp;&nbsp;&nbsp;{{Variation}}
																</p>
																<p
																	style="color: red; font-weight: bold; font-size: large;"
																	ng-show="nagative">
																	<img src="<c:url value="/resources/images/down.png"/>">&nbsp;&nbsp;&nbsp;&nbsp;{{Variation}}
																</p>
															</td>
															<td>Volume
																<p style="font-weight: bold; font-size: large;">{{Volume}}</p>
															</td>
															<td>Value (Rs.)
																<p style="font-weight: bold; font-size: large;">{{Value}}</p>
															</td>
															<td>52Week H/L
																<p style="font-weight: bold; font-size: large;">{{High}}/{{Low}}</p>
															</td>
														</tr>
													</tbody>
													<tbody align="center" style="font-size: medium;"
														ng-show="BSE">
														<tr>
															<td>Price (Rs.)
																<p style="font-weight: bold; font-size: large;">{{ClosePrice}}</p>
															</td>
															<td>% Change
																<p
																	style="color: green; font-weight: bold; font-size: large;"
																	ng-show="positive">
																	<img src="<c:url value="/resources/images/up.png"/>">&nbsp;&nbsp;&nbsp;&nbsp;{{Variation}}
																</p>
																<p
																	style="color: red; font-weight: bold; font-size: large;"
																	ng-show="nagative">
																	<img src="<c:url value="/resources/images/down.png"/>">&nbsp;&nbsp;&nbsp;&nbsp;{{Variation}}
																</p>
															</td>
															<td>52Week High
																<p style="font-weight: bold; font-size: large;">{{High}}</p>
															</td>
															<td>52Week Low
																<p style="font-weight: bold; font-size: large;">{{Low}}</p>
															</td>
														</tr>
													</tbody>
												</table>
											</div>
											<div align="center" ng-show="nodata">
												<h4>No Data Available</h4>
											</div>
										</div>
									</div>


									<div class="panel panel-default col-sm-12 col-md-12">
										<div class="col-sm-12 col-md-12"
											style="height: 550px; width: 90%;">
											<nvd3 options="options" data="data"
												class="with-3d-shadow with-transitions"></nvd3>
										</div>
										<div class="col-sm-12 col-md-12">
											<table id="example1"
												class="table table-bordered table-hover table-responsive">
												<tr>
													<td><input type="radio" name="choose" id="mvradio"
														value="avarage" ng-click="MovingAvarage();" /><label
														style="padding-left: 10px" class="control-label">MOVING
															AVG:</label></td>
													<th ng-repeat="option in optionss"><input
														onclick="javascript:if (this.checked){document.getElementById('mvradio').checked = 
true;}"
														ng-change="changetoma()" ng-disabled="mv" type="checkbox"
														ng-model="option.value">{{option.name}}</th>

												</tr>
												<tr>
													<td><input type="radio" name="choose" id="cmpny"
														value="company" ng-click="Company();" /><label
														class="control-label" style="padding-left: 10px">COMPARE
															WITH:</label></td>
													<td colspan="4"><input type="checkbox"
														onclick="javascript:if (this.checked){document.getElementById('cmpny').checked = 
true;}"
														ng-disabled="cmpny" ng-change="changetocmpny()"
														name="BSE_SENSEX" ng-model="BSE_SNX" value="BSE SENSEX">BSE
														SENSEX</td>

												</tr>
												<tr>
													<th style="padding-left: 30px">PERIOD:</th>


													<td colspan="2"><form:select path="period"
															class='form-control' ng-model='year'>
															<c:forEach items="${period}" var="var">
																<form:option value="${ var.displayname }" />
															</c:forEach>
														</form:select></td>
													<td colspan="2">
														<button type="button" ng-click="passCompanyName(-2)"
															class="btn btn-primary pull-left">GO</button>
													</td>
												</tr>
											</table>
										</div>
									</div>

								</div>
								<!-- /.box-body -->
							</div>
							<!-- /.box -->
						</div>

					</div>

				</div>


				<div class="col-sm-3 col-md-3">

					<div class="row">
						<div class="highlightbox">
							<h5>
								<ul type="circle">
									<li>Execute buy on a day of WEAK market(Sensex variation
										-1%)</li>
									<li>Execute sell on a day of STRONG market(Sensex
										variation 1%)</li>
										<li>Risk element is more for BUY recommendation compared to Strong Buy.
										That is why appreciation is better in Buy recommendation (High Risk/High Gain).</li>
								</ul>
							</h5>
						</div>
					</div>

					<p ng-show="load1">
						<img src="<c:url value="/resources/images/load.gif"/>"
							height="50px" width="50px">
					<p>
					<div class="row">
						<div class="highlightbox" ng-show="sug">
							<h1
								style="font-size: 20px; font-weight: bold; text-align: center; margin-top: 5px; text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.3);">Algorithmic
								Suggestion</h1>
							<ul style="font-size: medium;">
								<li ng-repeat="(key, value) in list">
									<p ng-if='key == "Caution"'>
										<font color="Red">{{key}}:- {{value}}</font>
									</p>
									<p ng-if='key != "Caution"'>
										{{key}}:- <font>{{value}}</font>
									</p>
								</li>


							</ul>
						</div>
					</div>
					<p></p>



					<div class="row">
						<div class="highlightbox">
							<form:form method="POST" name="form"
								action="${pageContext.request.contextPath}/graphpattern/gainerAndLoserdisplay"
								modelAttribute="gainerAndLosserCommand">
								<h1
									style="font-size: 20px; font-weight: bold; margin-top: 5px; text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.3);"
									align="center">MARKET STATS</h1>

								<div style="margin: 10px 10px 10px 10px">
									<form:select path="durationRange" class='form-control'>
										<c:forEach items="${variation}" var="var">
											<form:option value="${var.logicalvalue}"
												label="${var.displayname}">${var.displayname}</form:option>
										</c:forEach>
									</form:select>
								</div>

								<div style="margin: 10px 10px 10px 10px">
									<form:select path="priceRange" class='form-control'>
										<c:forEach items="${price}" var="var">
											<form:option value="${var.logicalvalue}"
												label="${var.displayname}">${var.displayname}</form:option>
										</c:forEach>
									</form:select>
								</div>

								<div style="margin: 10px 10px 10px 10px">
									<form:select path="indexRange" class='form-control'>
										<c:forEach items="${indexrange}" var="var">
											<form:option value="${var.logicalvalue}"
												label="${var.displayname}">${var.displayname}</form:option>
										</c:forEach>
									</form:select>

								</div>
								<div style="margin-bottom: 10px; margin-right: 10px"
									align="right">
									<button type="submit" class="btn btn-primary">GO</button>
								</div>
							</form:form>
						</div>
					</div>


				</div>



			</div>
		</div>

	</div>
	<!-- /.wrapper -->





	<div class="modal fade" id="emailChange" role="dialog"
		style="margin-top: 8%">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Add to Portfolio</h4>
				</div>
				<div class="modal-body">
					<p style="color: green;" ng-hide="addStockLoad" align="center">{{addStockSuccess}}</p>
					<p style="color: red;" ng-hide="addStockLoad" align="center">{{addStockFail}}</p>
					<div ng-show="addStockLoad"
						style="color: green; font-size: medium;" align="center">
						Please wait.. <img
							src="<c:url value="/resources/images/load.gif"/>" height="50px"
							width="50px">
					</div>

					<form name='form' role='form' action="#" novalidate
						ng-show="addStock">
						<div class="row" align="left">
							<div class="form-group col-sm-12 col-md-12">
								<label class="col-sm-3 col-md-3 control-lable" for="file"
									style="margin-top: 7px">Company</label> <label
									class="col-sm-3 col-md-3 control-lable" for="file"
									style="margin-top: 7px">Buy_Date</label> <label
									class="col-sm-3 col-md-3 control-lable" for="file"
									style="margin-top: 7px">Buy Value</label> <label
									class="col-sm-3 col-md-3 control-lable" for="file"
									style="margin-top: 7px">No.of Shares</label>
							</div>
						</div>

						<div class="row">
							<div class="form-group col-sm-12 col-md-12">
								<div class="col-sm-3 col-md-3" style="">
									<input type="text" value="{{labelName}}" name="company"
										class=" form-control input-sm" readonly /> <input
										type="hidden" value="{{sc_code}}" name="sc_code"
										class=" form-control input-sm" ng-model="sc_code" />
								</div>
								<div class="col-sm-3 col-md-3" style="">
									<div class="input-group input-append date" id="datePicker">
										<input type="text" name="buydate" ng-model="buydate"
											class="form-control input-sm" placeholder="Date(dd-mm-yyyy)"
											required> <span class="input-group-addon add-on"><span
											class="glyphicon glyphicon-calendar"></span></span>
									</div>
								</div>

								<div class="col-sm-3 col-md-3" style="">
									<input type="text" name="price" ng-model="buyprice"
										ng-pattern="/^(([1-9][0-9]*)|(([0-9]*)\.([0-9]*)))$/"
										ng-maxlength="8" class="form-control input-sm"
										placeholder="Enter stock price" required>
								</div>

								<div class="col-sm-2 col-md-2" style="">
									<input type="text" style="width: 100px" name="shares"
										ng-model="shares" ng-pattern="/^[1-9][0-9]*$/"
										ng-maxlength="6" class="form-control input-sm"
										placeholder="Enter quantity" required>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="form-group col-sm-12 col-md-12">

								<div class="col-sm-3 col-md-3"></div>

								<div class="col-sm-3 col-md-3">
									<div class="form-group"
										ng-class="{ 'has-error' : form.buydate.$invalid && (form.buydate.$dirty || submitted)}">
										<div style="color: red;"
											ng-show="form.buydate.$error.required" class="help-block">
											Buy Date is required.</div>
									</div>
								</div>

								<div class="col-sm-3 col-md-3">
									<div class="form-group"
										ng-class="{ 'has-error' : form.price.$invalid && (form.price.$dirty || submitted)}">
										<span style="color: red;" ng-show="form.price.$error.required"
											class="help-block">Price is required.</span> <span
											style="color: red" ng-show="form.price.$error.maxlength"
											class="help-block">Length less than 8</span> <span
											style="color: red;"
											ng-show="form.price.$invalid && form.price.$error.pattern"
											class="help-block">Only positive Digit is allow & pre
											zero is not allow & After point value required...... </span>
									</div>
								</div>


								<div class="col-sm-3 col-md-3">
									<div class="form-group"
										ng-class="{ 'has-error' : form.shares.$invalid && (form.shares.$dirty || submitted)}">
										<div style="color: red;" ng-show="form.shares.$error.required"
											class="help-block">Quantity is required.</div>
										<span style="color: red"
											ng-show="form.shares.$error.maxlength" class="help-block">Length
											less than 5</span> <span style="color: red;"
											ng-show="form.shares.$invalid && form.shares.$error.pattern"
											class="help-block">Only positive Digit is allow & pre
											zero is not allow </span>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-8 col-md-8" style="color: blue;">
								Note : Please Enter the total buy value inclusive all brokerage
								and tax.
								<div class="help-tip" style="right: 44px">
									<p>
										Example : One Stock Price : 100 rs., <br>Quantity : 2,<br>
										Tax : 14rs., <br>Your Buy Value is : 214 rs.
									</p>
								</div>
							</div>
							<div class="col-sm-4 col-md-4" style="margin-left: 0px">
								<button type="button" class="btn btn-primary pull-right"
									ng-disabled="form.$invalid" ng-click="addStockPortfolio();">Add
									Stock</button>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>


</body>
</html>

