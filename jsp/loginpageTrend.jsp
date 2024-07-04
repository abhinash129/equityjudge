<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<link href="<c:url value="/resources/dist/autocomplete/jquery-ui.css"/>"
	rel="stylesheet">
<script
	src="<c:url value="/resources/dist/autocomplete/jquery-ui.js" />"></script>

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

.panel.with-nav-tabs .nav-tabs {
	border-bottom: none;
}
</style>

<link rel="stylesheet"
	href="<c:url value="/resources/css/stickyNotes.css"/>" />

<link href="<c:url value="/resources/css/graph.css"/>" rel="stylesheet">
<script src="<c:url value="/resources/js/graph.js" />"></script>


</head>
<body ng-app="myApp" ng-controller="GraphController"
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
							href="${pageContext.request.contextPath}/graphpattern/graph/selectCompnyDemo?companyName=${BSESensexValue.companyName}">${BSESensexValue.companyName }</a>:
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
									<form
										action="${pageContext.request.contextPath}/graphpattern/graph/detailsList"
										method="post" novalidate name="form">
										<div class="col-sm-6 col-md-4" style="margin-bottom: 10px">
											<input type="hidden" name="companyName1"
												ng-model="companyName" required> <input type="text"
												id="automplete-1" name="companyName"
												placeholder="Search company" class="form-control"
												ng-keydown="checkKeyDown($event)"
												ng-keyup="checkKeyUp($event)" ng-model="companyName"
												ng-change="search()">
										</div>
										<div class="col-sm-1 col-md-1" style="margin-left: -25px;">
											<button type="submit" ng-disabled="form.$invalid"
												class="btn btn-primary">GO</button>
										</div>
									</form>
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
				<%-- 	<div class="row">
						<div class="highlightbox " ng-show="sug">
							<h1
								style="font-size: 20px; font-weight: bold; text-align: center; margin-top: 5px; text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.3);">Algorithmic
								Suggestion</h1>

							<a href="<c:url value="/companydatas/portfoliohome" />"> <span
								style="font-size: 63px; margin: 55px 0px 20px 125px; color: light-blue;"
								class="glyphicon glyphicon-lock" aria-hidden="true"></span></a> <a
								href="<c:url value="/companydatas/portfoliohome" />">
								<p align="center" style="font-weight: bolder;">Access Only
									for Registered Users</p>
							</a>

							<p align="center" style="font-weight: bolder;">Click here to <a
								href="<c:url value="/companydatas/portfoliohome" />"> Login </a></p>
							<!-- <ul ng-repeat="suggestion in list" style="font-size: medium;">
								<li ng-repeat="(key, value) in suggestion">
									<p ng-if='key == "Caution"'>
										<font color="Red">{{key}}:- {{value}}</font>
									</p>
									<p ng-if='key != "Caution"'>
										{{key}}:- <font>{{value}}</font>
									</p>
								</li>


							</ul> -->
						</div>
					</div> --%>
				</div>


			</div>
		</div>

	</div>
	<!-- /.wrapper -->
</body>
</html>

