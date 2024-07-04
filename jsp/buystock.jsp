<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html ng-app="myApp">
<head>
<script type="text/javascript"
	src="<c:url value="/resources/angular/controller/portfolio_controller.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/angular/service/portfolio_service.js"/>"></script>
<style type="text/css">
hr {
	height: 10px;
	border: 0;
	box-shadow: 0 10px 10px -10px #8c8b8b inset;
}
</style>
</head>
<body>

	<div class="wrapper" ng-controller="PortfolioController">

		<!-- Content Header (Page header) -->
		<div class="page-header" style="margin-top: -5px; margin-left: 20px;">
			<h2>Add Stock</h2>
		</div>
		<div class="col-sm-12 col-md-12 col-md-offset-10 col-sm-offset-8">
			<ul class="nav nav-pills">
				<li role="presentation" class="active"><a
					href="<c:url value="/companydatas/portfoliohome"/>"> <i
						class="fa fa-reply" aria-hidden="true"></i> Go to MyPortfolio
				</a></li>
			</ul>
		</div>
		<!-- Main content -->
		<section class="content">
			<div class="col-sm-12 col-md-9">
				<div align="center" style="color: red; margin-bottom: 10px;">{{errMsg}}</div>
				<div class="col-sm-12 col-md-12">
					<div class="form-group col-sm-4 col-md-3" style="">
						<label style="font-style: italic; color: navy; font-size: large;">Company
							Name:</label>
					</div>
					<div class="form-group col-sm-5 col-md-4"
						style="margin-left: -50px; margin-top: -5px">
						<input type="text" name="scname" ng-model="scname"
							class="form-control" placeholder="Enter Company Name"
							ng-keypress="checkIfEnterKeyWasPressed($event)" />
					</div>
					<div class="form-group col-sm-3 col-md-3"
						style="margin-left: -20px; margin-top: -5px">
						<button type="button" ng-click="searchName()"
							class="btn btn-primary">Search</button>
					</div>
				</div>
				<div class="col-sm-12 col-md-8" style="margin-top: -20px">
					<hr>
				</div>
			</div>


			<div class="row" ng-show="show_1">
				<div class="col-sm-12 col-md-9">
					<div class="box">
						<div class="box-header">
							<h3 class="box-title"></h3>
							<small>Search Result for "{{scname}}"</small>
						</div>
						<!-- /.box-header -->
						<div class="box-body">
							<table id="proctable" class="table table-bordered table-hover">
								<tr>
									<th>No</th>
									<th>Company Name</th>
									<th>Company Code</th>
									<th>Add</th>
								</tr>
								<tr ng-repeat="data in suggestions track by $index"
									id="item{{data}}">
									<td>{{$index+1}}</td>
									<td>{{data.companyName}}</td>
									<td>{{data.companyCode}}</td>

									<td align="center" width="10%"><a
										ng-if="data.companyName != 'BSE SENSEX'" href=""
										data-ng-click="addStock(data)"> <img
											src="<c:url value="/resources/dist/img/add.png"/>"
											class="img-responsive" />
									</a> <a ng-if="data.companyName == 'BSE SENSEX'" href=""
										data-ng-click="bseSensex()"> <img
											src="<c:url value="/resources/dist/img/add.png"/>"
											class="img-responsive" />
									</a></td>

								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
			<!--/.col  -->


			<form:form method="POST"
				action="${pageContext.request.contextPath}/companydata/addstock"
				name="form" novalidate="true">

				<div class="form-horizontal" ng-show="show_2" id="scroll">

					<div class="row" id="myModal">
						<div class="col-sm-12 col-md-11">
							<div class="panel panel-default">
								<div class="panel-heading">
									<span class="lead">Add Stocks </span>
								</div>
								<div class="box-body">

									<div class="row">
										<div class="form-group col-sm-12 col-md-12">
											<div class="col-sm-4 col-md-4">
												<div class="form-group"
													ng-class="{ 'has-error' : form.date.$invalid && (form.date.$dirty || submitted)}"></div>
											</div>

											<div class="col-sm-6 col-md-6"
												style="margin-bottom: -30px; margin-left: 40px; color: blue;">
												<div class="form-group"
													ng-class="{ 'has-error' : form.price.$invalid && (form.price.$dirty || submitted)}"></div>
											</div>

											<div class="col-sm-1 col-md-1"
												style="margin-bottom: -30px; margin-left: 780px;">
												<div class="form-group"
													ng-class="{ 'has-error' : form.shares.$invalid && (form.shares.$dirty || submitted)}"></div>
											</div>
										</div>
									</div>

									<fieldset ng-repeat="company in companyList">
										<div class="row">


											<div class="form-group col-sm-12 col-md-12">
												<label class="col-sm-1 col-md-1 control-lable" for="file"
													style="margin-top: 7px">Company</label>
												<div class="col-sm-2 col-md-2">
													<input type="text" value="{{company.companyName}}"
														name="company" class=" form-control input-sm" readonly />
													<input type="hidden" value="{{company.companyCode}}"
														name="sc_code" class=" form-control input-sm" />

												</div>


												<label class="col-sm-1 col-md-1 control-lable" for="file"
													style="margin: 7px 0px 0px -17px">Date</label>
												<div class="col-sm-2 col-md-2"
													style="margin: 0px 16px 0px -16px">
													<ng-form name="dateForm">
													<div class="form-group">
														<div class="date">
															<div class="datepick input-group input-append date">
																<input type="text" required name="date" ng-model="date"
																	class="form-control input-sm"
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
													</div>
													<div style="color: red;"
														ng-show="dateForm.date.$error.required" class="help-block">Date
														is required.</div>
													</ng-form>

												</div>

												<label class="col-sm-1 col-md-1 control-lable" for="file"
													style="margin: 7px 32px 0px -5px">Total_Amount</label>
												<div class="col-sm-2 col-md-2"
													style="margin: 0px 17px 0px -25px">
													<ng-form name="priceForm">
													<div class="input-group">
														<input type="text" name="price" ng-model="price"
															ng-pattern="/^(([1-9][0-9]*)|(([0-9]*)\.([0-9]*)))$/"
															ng-maxlength="8" class="form-control input-sm"
															placeholder="Enter Total Amount" required> <span
															class="input-group-addon help-tip" style="background-color: #7ba9d0;">
															<p>
																Example : One Stock Price : 100 rs., <br>Quantity :
																2,<br> Tax : 14rs., <br>Your Total Amount is :
																214 rs.
															</p>
														</span>

													</div>
													<span style="color: red;"
														ng-show="priceForm.price.$error.required"
														class="help-block">Total Amount is required.</span> <span
														style="color: red"
														ng-show="priceForm.price.$error.maxlength"
														class="help-block">Total Amount Length less than 8</span>
													<span style="color: red;"
														ng-show="priceForm.price.$invalid && priceForm.price.$error.pattern"
														class="help-block">Only positive Digit is allow &
														pre zero is not allow & After point value required...... </span>
													</ng-form>


												</div>

												<label class="col-sm-1 col-md-1 control-lable" for="file"
													style="margin: 7px 0px 0px -5px">Quantity</label>
												<div class="col-sm-1 col-md-1"
													style="margin: 0px 0px 0px -7px">
													<ng-form name="shareForm"> <input type="text"
														style="width: 100px" name="shares" ng-model="shares"
														ng-pattern="/^[1-9][0-9]*$/" ng-maxlength="6"
														class="form-control input-sm" placeholder="Enter quantity"
														required> <span
														style="color: red; margin-left: -68px;"
														ng-show="shareForm.shares.$error.required"
														class="help-block">Quantity is required.</span> <span
														style="color: red; margin-left: -68px;"
														ng-show="shareForm.shares.$error.maxlength "
														class="help-block">Length less than 5</span> <span
														style="color: red; margin-left: -68px;"
														ng-show="shareForm.shares.$invalid && shareForm.shares.$error.pattern"
														class="help-block">Only positive Digit is allow &
														pre zero is not allow </span> </ng-form>


												</div>

											</div>
											<a href="" ng-click="removeCompany(company)"><span
												class="glyphicon glyphicon-remove"
												style="margin: 7px 0px 0px -15px;"></span></a>
										</div>
									</fieldset>

									<div class="col-sm-11 col-md-11">
										<button type="submit" class="btn btn-primary pull-right"
											ng-disabled="form.$invalid">Add Stock</button>
									</div>
								</div>
							</div>
							<!-- /.box-body -->
						</div>
						<!-- /.box -->
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</form:form>
		</section>
		<!-- /.content -->
	</div>
	<!-- /.wrapper -->



</body>
</html>