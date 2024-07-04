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
</head>
<body>
	<div class="wrapper" ng-controller="PortfolioController" id="div1">
		<!-- Content Header (Page header) -->
		<div class="page-header"
			style="margin-top: -5px; margin-left: 20px; margin-bottom: -10px">
			<h3>My Portfolio</h3>

		</div>

		<div class="col-sm-12 col-md-12 col-md-offset-10 col-sm-offset-8"
			style="margin-top: -25px">
			<ul class="nav nav-pills">
				<li role="presentation" class="active"><a
					href="<c:url value="/companydatas/portfoliohome"/>"> <i
						class="fa fa-reply" aria-hidden="true"></i> Go to MyPortfolio
				</a></li>
			</ul>
		</div>

		<!-- Main content -->
		<section class="content">
			<div class="row">
				<div class="col-sm-12 col-md-10">
					<div class="box">
						<div class="box box-default">
							<div class="box-header with-border">
								<h3 class="box-title">Stocks for Sell</h3>
							</div>
						</div>
						<div class="box-body">
							<table class="table table-bordered table-hover">
								<thead>
									<tr>
										<th>P_ID</th>
										<th>Company Code</th>
										<th>Company Name</th>
										<th>Date</th>
										<th>Total Buy Amount</th>
										<th>Quantity</th>
										<th>#</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${sellinglist}" var="data">
										<tr>
											<td><c:out value="${data.p_id}" /></td>
											<td><c:out value="${data.sc_code}" /></td>
											<td><c:out value="${data.sc_name}" /></td>
											<td><fmt:formatDate type="both" dateStyle="medium"
													pattern="dd-MM-yyyy" value="${data.date}" /></td>
											<td><c:out value="${data.buy_value}" /></td>
											<td><c:out value="${data.no_of_shrs}" /></td>
											<td width="20px">
												<button type="button" class="btn btn-primary "
													ng-click="sellStock('${data.sc_code}','${data.p_id}','${data.no_of_shrs}','${data.date}')">Sell</button>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<!--/.col  -->




			<div class="form-horizontal" ng-show="show1">
				<form:form class="form-horizontal" method="POST" name="form"
					action="${pageContext.request.contextPath}/companydatas1/sellstock"
					novalidate="true">
					<div class="row">
						<div class="col-sm-12 col-md-10">
							<div class="panel panel-default">
								<div class="panel-heading">
									<span class="lead">Stocks for Sell </span>
									<div class="box-tools pull-right">
										<a href="" ng-click="closeSell()"><span
											class="glyphicon glyphicon-remove"></span></a>
									</div>
								</div>

								<div class="box-body">

									<!-- <div class="row" style="padding-bottom: -100px;">
										<div class="col-sm-12 col-md-12">
											<div class="col-sm-5 col-md-6"></div>
											<div class="col-sm-5 col-md-4" style="color: blue;">
												Note : Please Enter the total buy value inclusive all
												brokerage and tax.
												<div class="help-tip">
													<p>
														Example : One Stock Price : 100 rs., <br> Quantity :
														2,<br> Tax : 14rs., <br> Your Sell Value is :
														214 rs.
													</p>
												</div>
											</div>
											<div class="col-sm-2 col-md-2"></div>
										</div>
									</div> -->



									<div class="row">
										<div class="col-sm-12 col-md-12"
											style="padding-bottom: -100px">
											<div class="col-sm-3 col-md-3"></div>
											<div class="col-sm-1 col-md-1"></div>
											<div class="col-sm-2 col-md-2">
												<div style="color: red;"
													ng-show="form.date.$error.required && (form.date.$dirty || submitted)"
													class="help-block">Date is required.</div>
												<div
													ng-class="{ 'has-error' : form.date.$invalid && (form.date.$dirty || submitted)}"></div>
											</div>

											<div class="col-sm-3 col-md-3" style="">
												<div style="color: red;"
													ng-show="form.price.$error.required && (form.price.$dirty || submitted)"
													class="help-block">Total Sell Amount is required.</div>
												<span style="color: red"
													ng-show="form.price.$error.maxlength " class="help-block">Length
													less than 8</span> <span style="color: red;"
													ng-show="form.price.$invalid && form.price.$error.pattern && (form.price.$dirty || submitted)"
													class="help-block">Only positive Digit is allow &
													pre zero is not allow & After point value required...... </span>
												<div
													ng-class="{ 'has-error' : form.price.$invalid && (form.price.$dirty || submitted)}"></div>
											</div>
											<div class="col-sm-3 col-md-3" style="">
												<div style="color: red;"
													ng-show="form.shares.$error.required && (form.shares.$dirty || submitted)"
													class="help-block">Quantity is required.</div>
												<span style="color: red"
													ng-show="form.shares.$error.maxlength " class="help-block">Length
													less than 5</span> <span style="color: red;"
													ng-show="form.shares.$invalid && form.shares.$error.pattern && (form.shares.$dirty || submitted)"
													class="help-block">Only Digit is allow... </span> <span
													style="color: red;"
													ng-show="form.shares.$error.max || form.shares.$error.min && (form.shares.$dirty || submitted)">
													Quantity is exceeded..</span>
												<div
													ng-class="{ 'has-error' : form.shares.$invalid && (form.shares.$dirty || submitted)}"></div>
											</div>
										</div>
									</div>

									<fieldset data-ng-repeat="company in companyList">
										<div class="row">
											<div class="form-group col-sm-12 col-md-12">
												<label class="col-sm-1 col-md-1 control-lable" for="file"
													style="margin-top: 7px;">Company</label>
												<div class="col-sm-2 col-md-2">
													<input type="text" value="{{company}}" name="sc_code"
														class=" form-control input-sm" readonly />

												</div>

												<input type="text" value="{{company}}" ng-model="p_id"
													name="p_id" class=" form-control input-sm" readonly
													ng-show="s">

												<!-- till here -->
												<label class="col-sm-1 col-md-1 control-lable"
													style="margin-top: 7px">Sell_Date</label>
												<div class="col-sm-2 col-md-2">
													<script type="text/javascript">
														$(function() {
															var scope = angular
																	.element(
																			"#div1")
																	.scope();
															$("#datepickersell")
																	.datepicker(
																			{
																				format : 'dd-mm-yyyy',
																				startDate : new Date(
																						scope.buyDate),
																				autoclose : true,
																			});
														});
													</script>
													<div class="input-group input-append date"
														id="datepickersell">
														<input type="text" name="date" ng-model="date"
															placeholder="Date(dd-mm-yyyy)"
															class="form-control input-sm" required /> <span
															class="input-group-addon add-on"><span
															class="glyphicon glyphicon-calendar"></span></span>
													</div>
												</div>

												<label class="col-sm-1 col-md-1 control-lable" for="file"
													style="margin-top: 7px">Sell_Amount</label>
												<div class="col-sm-2 col-md-2" style="margin-left: 7px">
													<div class="input-group">
														<input type="text" name="price" ng-model="price"
															ng-pattern="/^(([1-9][0-9]*)|(([0-9]*)\.([0-9]*)))$/"
															ng-maxlength="8" class="form-control input-sm"
															placeholder="Enter Total Sell Amount" required /> <span
															class="input-group-addon help-tip"
															style="background-color: #7ba9d0;">
															<p>
																Example : One Stock Price : 100 rs., <br> Quantity
																: 2,<br> Tax : 14rs., <br> Your Total Sell Amount is
																: 214 rs.
															</p>
														</span>

													</div>

												</div>
												<label class="col-sm-1 col-md-1 control-lable" for="file"
													style="margin-top: 7px; margin-left: -14px">Quantity</label>
												<div class="col-sm-2 col-md-2">
													<input type="hidden" name="sharess" id="sharess"
														ng-model="sharess" class="form-control input-sm" /> <input
														type="number" ng-pattern="/^[1-9][0-9]*$/"
														ng-maxlength="6" name="shares" ng-model="shares"
														id="shares" class="form-control input-sm"
														max="{{sharess}}" min="1" placeholder="quantity" required />
												</div>
											</div>
										</div>
									</fieldset>
									<div class="col-sm-12 col-md-12">
										<button type="submit" class="btn btn-primary pull-right"
											ng-disabled="form.$invalid">Sell Stock</button>
									</div>
								</div>
							</div>
							<!-- /.box-body -->
						</div>
						<!-- /.box -->
					</div>
				</form:form>
				<!-- /.col -->
			</div>
			<!-- /.row -->



		</section>
		<!-- /.content -->
	</div>
	<!-- /.content-wrapper -->


</body>
</html>