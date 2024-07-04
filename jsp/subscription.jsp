<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>


<script type="text/javascript"
	src="<c:url value="/resources/angular/controller/companyController.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/angular/service/companyService.js"/>"></script>
<link href="<c:url value="/resources/css/pricing.css"/>"
	rel="stylesheet" type="text/css" />
</head>
<body ng-app="myApp" ng-controller="CompanyController">
	<div class="wrapper">
		<div class="container">
			<div class="page-header">
				<h2>Subscription Packages</h2>
			</div>
			<c:if
				test="${sessionScope.sessionBO.role != 'Admin' && sessionScope.sessionBO.userName != null && sessionScope.sessionBO.role != 'office'}">
				<div class="container" id="cnt1"
					style="border: 3px solid #008000; border-radius: 8px; margin-bottom: 20px">
					<div class="row feature">
						<div class="col-md-4">
							<font size="5px" color="green"> <i>Your Current
									Subscription</i>:-
							</font>
						</div>
						<div class="col-md-4">
							<font size="5px" color="blue">
<%-- 								<h1> Trial ${sessionScope.sessionBO.userRemainingDays } </h1>  --%>
								<h1>${sessionScope.sessionBO.role } </h1> 
							</font>
						</div>
					</div>
				</div>
			</c:if>

		<div align="center" style="font-size: large; font-weight:bold; color: green;">Please Choose...</div>
			<div class="pricing-plans">
				<div class="wrap">
					<div class="pricing-grids">
						<div class="pricing-grid1">
							<div class="price-value">
								<h2>
									<a href="">1 Week</a>
								</h2>
								<h5>
									<span>${Week } Rs.</span>
								</h5>
								<div class="sale-box">
									<span class="on_sale title_shop">NEW</span>
								</div>

							</div>
							<div class="price-bg">
								<ul>
										<li class="whyt"><a href="">Trend (Graphical Representation)</a></li>
									<li ><a href="">Stock Price Comparison With All DMA(15,30,100,200) & BSE</a></li>
									<li class="whyt"><a href="">Algorithmic Prediction(Help in
											Buy/Sell/Hold your Stocks)</a></li>
									<li><a href="">Portfolio Tracker</a></li>
									<li class="whyt"><a href="">Portfolio Demo (Help)</a></li>
								</ul>
								<div class="cart1">
									<a href="#myModal2" data-toggle="modal"
										class="btn btn-info lower">Details</a>
										<%--  <a href="<c:url  value="/suscribe?time=1 Week&price=${Week }" />"
										class="btn btn-success lower">Subscribe</a> --%>
										<a href="" ng-click="subscription()" class="btn btn-success lower">Subscribe</a>
								</div>
							</div>
						</div>
						<div class="pricing-grid2">
							<div class="price-value two">
								<h3>
									<a href="">1 Month</a>
								</h3>
								<h5>
									<span>${Month } Rs.</span>
								</h5>
								<div class="sale-box two">
									<span class="on_sale title_shop">NEW</span>
								</div>

							</div>
							<div class="price-bg">
								<ul>
								<li class="whyt"><a href="">Trend (Graphical Representation)</a></li>
									<li ><a href="">Stock Price Comparison With All DMA(15,30,100,200) & BSE</a></li>
									<li class="whyt"><a href="">Algorithmic Prediction(Help in
											Buy/Sell/Hold your Stocks)</a></li>
									<li><a href="">Portfolio Tracker</a></li>
									<li class="whyt"><a href="">Portfolio Demo (Help)</a></li>
								</ul>
								<div class="cart2">
									<a href="#myModal2" data-toggle="modal"
										class="btn btn-info lower">Details</a> 
							<%-- 			<a href="<c:url  value="/suscribe?time=1 Month&price=${Month }" />" class="btn btn-success lower">Subscribe</a>
							 --%>
			<a href="" ng-click="subscription()" class="btn btn-success lower">Subscribe</a>
							</div>
							</div>
						</div>
						<div class="pricing-grid3">
							<div class="price-value three">
								<h4>
									<a href="">3 Month</a>
								</h4>
								<h5>
									<span>${Months } Rs.</span>
								</h5>
								<div class="sale-box three">
									<span class="on_sale title_shop">NEW</span>
								</div>

							</div>
							<div class="price-bg">
								<ul>
									<li class="whyt"><a href="">Trend (Graphical Representation)</a></li>
									<li ><a href="">Stock Price Comparison With All DMA(15,30,100,200) & BSE</a></li>
									<li class="whyt"><a href="">Algorithmic Prediction(Help in
											Buy/Sell/Hold your Stocks)</a></li>
									<li><a href="">Portfolio Tracker</a></li>
									<li class="whyt"><a href="">Portfolio Demo (Help)</a></li>
								</ul>
								<div class="cart3">
									<a href="#myModal2" data-toggle="modal"
										class="btn btn-info lower">Details</a> 
										<%-- <a href="<c:url  value="/suscribe?time=3 Month&price=${Months }" />"
										class="btn btn-success lower">Subscribe</a> --%>
			<a href="" ng-click="subscription()" class="btn btn-success lower">Subscribe</a>
							
								</div>
							</div>
						</div>
					</div>
					<div class="clear"></div>
				</div>
			</div>
			<!--//End-pricingplans-->



		</div>

		<div class="row"
			style="margin-left: 160px; margin-top: 30px; margin-bottom: 20px">
			<!-- <div class="col-md-10"
				style="background-color: silver; padding: 10px 10px 10px 10px; border: medium; border-color: black; border-width: medium; border-style: solid;">
				<font size="5px">Customize Subscription ... </font><a
					href="#myModal" data-toggle="modal">
					<button class="btn-lg btn-primary pull-right">Customize</button>
				</a>
				<h3>Choose as per your requirements...</h3>
			</div> -->
		</div>

</div>
		<!-- For See Feature List -->
		<div class="modal fade" id="myModal2" role="dialog"
			style="margin-top: 2%">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Features Details</h4>
					</div>
					<div class="modal-body">

						<div class="row">
							<div class="col-lg-12">
								<div class="row" align="justify">
									<div class="col-lg-4">
										<h3 align="center" style="font-family: cursive; color: olive;">
											"<u>Algorithmic predictions</u>"
										</h3>
										<div align="center">
											<img src="<c:url value="/resources/images/equityjudge.jpg"/>" />
										</div>
										<br>
										<p style="color: navy;">
											&nbsp;&nbsp;&nbsp; <i class="fa fa-tag" aria-hidden="true"></i>
											We are offering the Algorithmic predictions on stocks based
											on the share market movements . It gives you the current
											status of the individual stock and what would be the
											algorithmic future status of that stock. We are suggesting
											investors to get profit based on our algorithmic predictions
											either they might invest for short term or long term.
										</p>
									</div>
									<div class="col-lg-4">
										<h3 align="center" style="font-family: cursive; color: olive;">
											"<u>Portfolio</u>"
										</h3>
										<div align="center">
											<img src="<c:url value="/resources/images/portfolio.jpg"/>" />
										</div>
										<br>
										<p style="color: navy;">
											&nbsp;&nbsp;&nbsp; <i class="fa fa-tag" aria-hidden="true"></i>
											Tracker Portfolio tracker provides information like which
											shares user purchased , how- many share( quantity) user is
											holding , purchase date ,on what rate you purchased and
											current status like how much profit and loss user getting
											,etc.
										</p>
									</div>
									<div class="col-lg-4">
										<h3 align="center" style="font-family: cursive; color: olive;">
											"<u>Trend</u>"
										</h3>
										<div align="center">
											<img src="<c:url value="/resources/images/graph.jpg"/>" />
										</div>
										<br>
										<p style="color: navy;">
											&nbsp;&nbsp;&nbsp; <i class="fa fa-tag" aria-hidden="true"></i>
											Trend provides the graphical representation of the selected
											stocks over a period of past 1 year. Its allows the user to
											calculate 15, 30, 100 and 200 daily moving average and also
											provide the facility to compare the stock movement with
											respect to BSE SENSEX. We are using latest technology for
											plotting
										</p>
									</div>
								</div>
							</div>
						</div>

					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>


		<!-- For Customization -->
		<div class="modal fade" id="myModal" role="dialog"
			style="margin-top: 8%">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Subscription Customization</h4>
					</div>
					<div class="modal-body">

						<div class="row">
							<div class="col-md-12">
								<label class="col-md-3 control-lable" style="padding-top: 20px"><h2>Duration:</h2></label>
								<div class="col-md-2 form-group">
									<label>Month:</label>

									<form:select path="month" ng-model="month" class='form-control'>
										<c:forEach items="${month}" var="var">
											<form:option value="${ var.displayname }" />
										</c:forEach>
									</form:select>
								</div>

								<div class="col-md-2 form-group">
									<label>Week:</label>

									<form:select path="week" ng-model="week" class='form-control'>
										<c:forEach items="${week}" var="var">
											<form:option value="${ var.displayname }" />
										</c:forEach>
									</form:select>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-md-12">
								<label class="col-md-3 control-lable"><h2>Services:</h2></label>
								<div class="col-md-3">
									<font size="3px" style="font-weight: bold;">All Features</font>
								</div>
							</div>
						</div>
						<hr>
						<br>
						<div class="row">
							<div class="col-md-12">
								<div class="col-md-3" style="margin-top: -20px">
									<button class="btn btn-info" ng-click="calculate();">Calculate
										Price</button>
								</div>
								<div class="col-md-3" style="margin-top: -10px; color: green;">
									<label
										style="margin-top: 0px; font-weight: bolder; font-size: large;"
										ng-show="rs"> {{total}} Rs/-</label>
								</div>
								
								
								
								<div class="col-md-6" style="margin-top: -20px;">
								<a href="<c:url  value="/suscribe?time={{month}} Month And {{week}} Week&price={{total}}" />"
										class="btn btn-success pull-right">Subscribe</a>
<!-- 								<button class="btn btn-success pull-right">Subscribe</button> -->
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
</body>
</html>