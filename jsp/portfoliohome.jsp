<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html ng-app="myApp">
<head>
<script type="text/javascript"
	src="<c:url value="/resources/angular/controller/portfolio_controller.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/angular/service/portfolio_service.js"/>"></script>
<link rel="stylesheet"
	href="<c:url value="/resources/css/stickyNotes.css"/>" />

</head>
<body>
	<div class="wrapper" ng-controller="PortfolioController" style="">
		<!-- Content Header (Page header) -->

		<div class="container">

			<div class="page-header row col-sm-12 col-md-12">
				<div class="col-sm-12 col-md-3">
					<font size="6px">My Portfolio</font>
				</div>


				<div class="col-sm-12 col-md-6" align="center"
					style="margin-top: 15px; margin-bottom: 15px">
					<font id="ul" size="2px" style="font-weight: bold;">
						<ul class="nav nav-pills">
							<li role="presentation" class="active"><a href="#">Portfolio</a></li>
							<li role="presentation"><a
								href="<c:url value="/watchlist/watchlisthome"/>">Watchlist</a></li>
							<!-- 							<li role="presentation"><a href="<c:url value="/companydata/portfoliodemo"/>">Portfolio Demo</a></li> -->
							<li role="presentation"><a
								href="<c:url value="/companydatas/Portfolio_history"/>">Portfolio
									History</a></li>
							<li role="presentation"><a
								href="<c:url value="/companydatas/Portfolio_history"/>">Capital
									Gain & Loss</a></li>
						</ul>
					</font>

				</div>
				<div class="col-sm-12 col-md-3">
					<font id="ul" size="2px" style="font-weight: bold;"> <font
						id="li">
							<p style="padding-top: 10px; padding-left: 15px">
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
				</div>
				</font>
			</div>


			<font id="ul" size="2px" style="font-weight: bold;"> <c:if
					test="${empty sell_data}">
					<h3 align="center">
						<font color="green">${listInfo} {{listInfo}}</font>
					</h3>
				</c:if>
				<div class="row">
					<div class="well col-sm-7 col-md-5">
						<div class="row">
							<div class="col-sm-12 col-md-12" style="margin-top: -10px;">
								<h4 style="margin-bottom: -10px;">
									<a
										href="${pageContext.request.contextPath}/companydata/companydatasearch">
										<i class="fa fa-plus-square-o" aria-hidden="true"></i> Add
										Stocks
									</a>
								</h4>
								<hr>
							</div>

							<div class="col-sm-12 col-md-12"
								style="margin-top: -10px; margin-bottom: -20px">
								<h4 style="color: gray;">MY NETWORTH</h4>

								<h3 style="color: black; font-weight: bolder; margin-top: -5px">
									<c:if test="${not empty networth }">
						${networth} 
							<c:if test="${overallGainLoss<0}">
											<font color="red" size="3px"> ${overallGainLoss }
												[${overallGainLossPer }%]</font>
										</c:if>

										<c:if test="${overallGainLoss>=0}">
											<font color="green" size="3px"> +${overallGainLoss }
												[${overallGainLossPer }%]</font>
										</c:if>
									</c:if>
									<c:if test="${empty networth }">
							0
							</c:if>
								</h3>
							</div>
						</div>
						<hr>
						<div class="row" style="margin-top: -20px">
							<div class="col-sm-12 col-md-6">
								<h4 style="color: gray;">MAX GAINER</h4>
								<font color="green" size="4px" style="font-weight: bolder;">${top_gainer_company}
									<i class="fa fa-chevron-circle-up" aria-hidden="true"></i><br>
									${top_gainer_company_value}
								</font> <font color="green" size="2px" style="font-weight: bold;">
									<c:if test="${not empty top_gainer_company_variation }">
						[${top_gainer_company_variation}(${top_gainer_company_per}%)]
						</c:if>
								</font>
							</div>

							<div class="col-sm-12 col-md-6">
								<h4 style="color: gray;">MAX LOSER</h4>
								<font color="red" size="4px" style="font-weight: bolder;">${top_losser_company}
									<i class="fa fa-chevron-circle-down" aria-hidden="true"></i><br>
									${top_losser_company_value}
								</font>
								<c:if test="${not empty top_losser_company_variation }">
									<font color="red" size="2px" style="font-weight: bold;">[${top_losser_company_variation}(${top_losser_company_per}%)]</font>
								</c:if>
							</div>
						</div>
					</div>
				</div> <c:if test="${not empty sell_data}">
					<div class="row">
						<div align="center" id="hideMe">
							<font color="green" size="4px">${listInfo} </font>
						</div>

						<div class="box box-default col-sm-12 col-md-11">
							<div class="box-header with-border">
								<div class="col-sm-12 col-md-3">
									<h3 class="box-title">Your Stocks</h3>
								</div>
								<div class="well well-sm col-sm-12 col-md-9 pull-right"
									style="font-size: medium; font-weight: bolder; color: blue; margin-bottom: -5px; margin-top: 0px">
									<div class="col-sm-4 col-md-4">
										<u>Investments</u> : ${investment }
									</div>
									<div class="col-sm-4 col-md-4">

										<c:if test="${overallGainLoss<0}">
											<font color="red"><u>Overall Loss</u> :
												${overallGainLoss } </font>
										</c:if>

										<c:if test="${overallGainLoss>=0}">
											<font color="green"><u>Overall Gain</u> :
												${overallGainLoss } </font>
										</c:if>

									</div>
									<div class="col-sm-4 col-md-4">
										<u>Latest Value</u> : ${latestValue }
									</div>
								</div>

							</div>
							<div class="box-body">
								<form:form class="form-horizontal" method="POST"
									action="${pageContext.request.contextPath}/companydatas/selling">
									<div class="row">
										<div class="col-md-12 table-responsive">
											<table class="table table-bordered">
												<thead>
													<tr>
														<th>Sl.No.</th>
														<th width="25%">Company Name</th>
														<th width="9%">Buy Date</th>

														<th>Quantity</th>
														<th>Current Rate</th>
														<th>Buy Value</th>
														<th>Holding (%)</th>
														<th>Current Value</th>
														<th>Overall Gain/Loss</th>
														<th>Appreciation (%)</th>
														<th>#</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${sell_data }" var="data"
														varStatus="counter">
														<c:if test="${data.gain_or_loss<0}">
															<tr class="danger">
																<td>${counter.count }</td>
																<td><a
																	href="${pageContext.request.contextPath}/graphpattern/graph/selectCompny?companyName=${data.sc_name}"><c:out
																			value="${data.sc_name}" /></a></td>
																<td><fmt:formatDate type="both" dateStyle="medium"
																		pattern="dd-MM-yyyy" value="${data.date}" /></td>

																<td><c:out value="${data.qunatity}" /></td>
																<td><c:out value="${data.current_rate}" /></td>
																<td><c:out value="${data.buy_value}" /></td>
																<td><c:out value="${data.holding_percentage}" /></td>
																<td><c:out value="${data.current_value}" /></td>
																<td style="color: red"><c:out
																		value="${data.gain_or_loss}" /></td>
																<td style="color: red"><c:out
																		value="${data.appreciation}" /></td>

																<td><input id="${data.sc_name}" type="checkbox"
																	value="${data.sc_name}"
																	ng-checked="selection.indexOf('${data.sc_name}') > -1"
																	ng-click="toggleSelection('${data.sc_name}')" /></td>
															</tr>
														</c:if>
														<c:if test="${data.gain_or_loss>=0}">
															<tr>
																<td>${counter.count }</td>
																<td><a
																	href="${pageContext.request.contextPath}/graphpattern/graph/selectCompny?companyName=${data.sc_name}"><c:out
																			value="${data.sc_name}" /></a></td>
																<td><fmt:formatDate type="both" dateStyle="medium"
																		pattern="dd-MM-yyyy" value="${data.date}" /></td>

																<td><c:out value="${data.qunatity}" /></td>
																<td><c:out value="${data.current_rate}" /></td>
																<td><c:out value="${data.buy_value}" /></td>
																<td><c:out value="${data.holding_percentage}" /></td>
																<td><c:out value="${data.current_value}" /></td>
																<td><c:out value="${data.gain_or_loss}" /></td>
																<td><c:out value="${data.appreciation}" /></td>

																<td><input id="${data.sc_name}" type="checkbox"
																	value="${data.sc_name}"
																	ng-checked="selection.indexOf('${data.sc_name}') > -1"
																	ng-click="toggleSelection('${data.sc_name}')" /></td>
															</tr>
														</c:if>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
									<!-- Here inside input hidden box i pass company name when we checked checkbox and that form name we are take as a value in in controller getSellByNames @RequestParam(value = "companyName",required=true) -->
									<input type="hidden" name="companyName" value="{{flag}}">
									<div class="row">
										<div class="col-md-12" align="right">
											<button type="button" class="btn btn-success "
												onclick="location.href='${pageContext.request.contextPath}/companydata/companydatasearch'"
												value="Buy Stock">Add</button>
											&nbsp;
											<button type="submit" class="btn btn-primary"
												ng-disabled="checkList()">Sell</button>
											&nbsp;
											<button type="button" ng-click="editStock()"
												class="btn btn-info" ng-disabled="checkList()">Edit</button>
											&nbsp;
											<button type="button" ng-click="deleteStock()"
												class="btn btn-danger" ng-disabled="checkList()">Delete</button>

										</div>
									</div>
								</form:form>
							</div>
						</div>

					</div>
				</c:if>


				<div class="row" ng-show="show_3" id="scrolldown1">
					<form class="form-horizontal" method="POST" name="form1"
						action="${pageContext.request.contextPath}/companydatas/editStock"
						novalidate="true">
						<div class="box box-default col-sm-12 col-md-11">
							<div class="box-header with-border">
								<h3 class="box-title">Edit Stock</h3>
								<div class="box-tools pull-right">
									<a href="" ng-click="closeEdit()"><span
										class="glyphicon glyphicon-remove"></span></a>
								</div>
							</div>

							<div class="box-body">
								<table class="table table-bordered table-hover">
									<div class="col-sm-12 col-md-12">
										<div class="col-md-3"></div>
										<div class="col-md-3">
											<div class="form-group"
												ng-class="{ 'has-error' : form.date.$invalid && (form.date.$dirty || submitted)}"></div>
										</div>

										<div class="col-md-3"
											style="margin-bottom: -30px; margin-left: 40px">
											<div class="form-group"
												ng-class="{ 'has-error' : form.price.$invalid && (form.price.$dirty || submitted)}"></div>
										</div>
										<div class="col-md-3"
											style="margin-bottom: -30px; margin-left: 780px;">
											<div class="form-group"
												ng-class="{ 'has-error' : form.shares.$invalid && (form.shares.$dirty || submitted)}"></div>
										</div>
									</div>

									<thead>
										<tr>

											<th>Company Code</th>
											<th width="400px">Company Name</th>
											<th>Buy Date</th>
											<th>Total Amount
												<font class="help-tip" style="top: -6px;padding: 6px;" >
													<p>
														Example : One Stock Price : 100 rs., <br>Quantity :
														2,<br> Tax : 14rs., <br>Your Total Amount is : 214
														rs.
													</p>
												</font>
											</th>
											<th>No of Shares</th>
										</tr>
									</thead>
									<tbody>

										<tr ng-repeat="company in ListOfEditValue">

											<input type="hidden" id="pid" name="p_id"
												class="form-control input-sm" value={{company.p_id}}
												readonly="readonly" />

											<td><input type="text" id="sccode" name="sc_code"
												class="form-control input-sm" value={{company.sc_code}}
												readonly="readonly" /></td>
											<td><input type="text" id="company" name="company"
												class="form-control input-sm" value={{company.sc_name}}
												readonly="readonly" /></td>
											<td><ng-form name="dateForm">

												<div class="date">
													<div class="datepick input-group input-append date">


														<input type="text" ng-model="company.date"
															date='dd-MM-yyyy' class="form-control input-sm"
															name="date" required="required"
															placeholder="Date(dd-mm-yyyy)" /> <span
															class="input-group-addon add-on"><span
															class="glyphicon glyphicon-calendar"></span></span>
													</div>


													<script type="text/javascript">
														$('.datepick')
																.each(
																		function() {
																			$(
																					this)
																					.datepicker(
																							{
																								format : 'dd-mm-yyyy',
																								autoclose : true,
																								endDate : '+0d'

																							});
																		});
													</script>
												</div>
												<span style="color: red;"
													ng-show="dateForm.date.$error.required" class="help-block">Date
													is required.</span> </ng-form></td>

											<td><ng-form name="priceForm"> <input
													type="text" ng-model="company.buy_value" ng-maxlength="8"
													name="price"
													ng-pattern="/^(([1-9][0-9]*)|(([0-9]*)\.([0-9]*)))$/"
													class="form-control input-sm" placeholder="Total Amount"
													required="required" /> <!-- 													 ng-bind={{company.price}} -->
												<span style="color: red;"
													ng-show="priceForm.price.$error.required && (priceForm.price.$dirty || submitted)"
													class="help-block">Total Amount is required.</span> <span
													style="color: red"
													ng-show="priceForm.price.$error.maxlength && (priceForm.price.$dirty || submitted)"
													class="help-block">Total Amount Length less than 8
													required</span> <span style="color: red"
													ng-show="priceForm.price.$error.pattern && (priceForm.price.$dirty || submitted) "
													class="help-block">Total Amount more than zero</span> </ng-form></td>

											<td><ng-form name="shareForm"> <input
													type="text" ng-model="company.no_of_shrs" ng-maxlength="6"
													name="shares" ng-pattern="/^[1-9][0-9]*$/"
													class="form-control input-sm" placeholder="quantity"
													ng-bind={{company.no_of_shrs}} required="required" /> <span
													style="color: red;"
													ng-show="shareForm.shares.$error.required && (shareForm.shares.$dirty || submitted)"
													class="help-block">Quantity is required.</span> <span
													style="color: red"
													ng-show="shareForm.shares.$error.maxlength && (shareForm.shares.$dirty || submitted) "
													class="help-block">Quantity Length less than 6
													required</span> <span style="color: red"
													ng-show="shareForm.shares.$error.pattern && (shareForm.shares.$dirty || submitted) "
													class="help-block">Quantity must not be less than 1</span>
												</ng-form></td>
										</tr>
									</tbody>

								</table>

								<br>

								<div class="col-sm-12 col-md-12">
									<button type="submit" class="btn btn-info pull-right"
										ng-disabled="form1.$invalid">Update</button>
								</div>
							</div>
						</div>
					</form>
				</div>








				<div class="row" ng-show="show_4" id="scrolldown2">
					<form class="form-horizontal" name="form" novalidate>
						<div class="box box-default col-md-11">
							<div class="box-header with-border">
								<h3 class="box-title">Delete Stock</h3>
								<div class="box-tools pull-right">
									<a href="" ng-click="closeDelete()"><span
										class="glyphicon glyphicon-remove"></span></a>
								</div>
							</div>
							<div class="box-body">
								<table class="table table-bordered table-hover">
									<thead>
										<tr>
											<!-- 											<th>P_ID</th> -->
											<th>Company Code</th>
											<th>Company Name</th>
											<th>Buy Date</th>
											<th>Total Amount</th>
											<th>No of Shares</th>
											<th>#</th>
										</tr>
									</thead>
									<tbody>
										<tr data-ng-repeat="company in ListOfEditValue">
											<!-- 										<input type="hidden" id="pid" name="p_id" value={{company.p_id}} />  -->
											<!-- <td>{{company.p_id}}</td> -->
											<td>{{company.sc_code}}</td>
											<td>{{company.sc_name}}</td>
											<td><p ng-bind="company.date | date:'dd-MM-yyyy'"></p></td>
											<td>{{company.buy_value}}</td>
											<td>{{company.no_of_shrs}}</td>


											<td><input type="checkbox"
												ng-checked="selection1.indexOf({{company.p_id}}) > -1"
												ng-click="toggleSelection1(company.p_id)" /></td>

										</tr>
									</tbody>

								</table>
								<br>
								<div class=" col-md-12">
									<button type="button" class="btn btn-danger pull-right"
										ng-click="deletingStock()">Delete</button>
									<!-- 										ng-disabled="checkList1()" -->
								</div>
							</div>
						</div>
					</form>
				</div>
			</font>
		</div>
		<!-- /.content -->
	</div>
	<!-- /.content-wrapper -->
</body>
</html>