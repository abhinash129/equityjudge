<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html ng-app="myApp">
<head>
<script type="text/javascript"
	src="<c:url value="/resources/angular/controller/portfolio_controller.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/angular/service/portfolio_service.js"/>"></script>

</head>
<body ng-controller="PortfolioController">
	<!-- Content Wrapper. Contains page content -->
	<div class="wrapper">
		<!-- Content Header (Page header) -->
		<div class="page-header"
			style="margin-top: -5px; margin-left: 20px; margin-bottom: -10px">
			<h3>Portfolio History && Capital Gain/Loss</h3>
		</div>

	<div class="col-sm-12 col-md-12 col-md-offset-10 col-sm-offset-8" style="margin-top: -25px">
			<ul class="nav nav-pills">
				<li role="presentation" class="active"><a href="<c:url value="/companydatas/portfoliohome"/>"> <i
						class="fa fa-reply" aria-hidden="true"></i> Go to MyPortfolio
				</a></li>
			</ul>
		</div>


		<!-- Main content -->
		<section class="content">
			<div class="box box-default col-sm-12 col-md-10">
				<div class="box-header with-border">
					<h3 class="box-title">Select Dates</h3>
				</div>
				<div class="box-body">
					<form
						action="${pageContext.request.contextPath}/companydatas/getHistoryData"
						modelAttribute="portfolioHistoryCommand" method="post" name="form">

						<div class='form-group col-sm-12 col-md-12'
							style="margin-top: 10px">
							<label class='control-label col-sm-1 col-md-1'>From </label>
							<div class='col-sm-3 col-md-3'
								style="margin-left: -20px; margin-top: -5px">

								<div class="form-group">
									<div class="date">
										<div class="input-group input-append date"
											id="startdatePicker">
											<input type="text" class="form-control" name="startDate"
												ng-model="startDate" class="form-control input-sm"
												placeholder="Select From Date"/> <span
												class="input-group-addon add-on"><span
												class="glyphicon glyphicon-calendar"></span></span>
										</div>
									</div>
								</div>
								<!-- 
								<input type="text" ui-date required name="startDate"
									ng-model="startDate" class="form-control input-sm"
									placeholder="Select From Date"> -->
							</div>

							<label class='control-label col-sm-1 col-md-1'>To </label>
							<div class='col-sm-3 col-md-3'
								style="margin-left: -30px; margin-top: -5px">
								<div class="form-group">
									<div class="date">
										<div class="input-group input-append date" id="enddatePicker">
											<input type="text" class="form-control" name="endDate"
												ng-model="endDate" class="form-control input-sm"
												placeholder="Select To Date" /> <span
												class="input-group-addon add-on"><span
												class="glyphicon glyphicon-calendar"></span></span>
										</div>
									</div>
								</div>

								<!-- <input type="text" ui-date required name="endDate"
									ng-model="endDate" class="form-control input-sm"
									placeholder="Select To Date"> -->


							</div>

							<script type="text/javascript">
								$(document).ready(

								function() {
									$('#startdatePicker').datepicker({
										format : 'dd-mm-yyyy',
										endDate : '+0d',
										autoclose : true
									}),

									$('#enddatePicker').datepicker({
										format : 'dd-mm-yyyy',
										autoclose : true
									})

								});
							</script>

							<div class='col-sm-3 col-md-3'
								style="margin-left: 0px; margin-top: -7px">
								<button class='btn btn-primary' type="submit"
									ng-click="onSubmit($event)">Show History</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</section>
	</div>
</body>
</html>
