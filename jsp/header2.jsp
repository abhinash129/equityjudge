<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script type="text/javascript"
	src="<c:url value="/resources/angular/controller/module_controller.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/angular/service/module_service.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/angular/controller/loginController.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/angular/service/loginService.js"/>"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$(".trigger").click(function() {
			$(".panel1").toggle("fast");
			$(this).toggleClass("active");
			return false;
		});
	});
	function myfunc() {
		alert("\t\n This feature is only for our Subscribers.\n\n To get this feature Subscribe.")
	}
	function blinker() {
		$('.blinking').fadeOut(500);
		$('.blinking').fadeIn(500);
	}
	setInterval(blinker, 1500);
</script>


<style type="text/css">
/* enable absolute positioning */
.inner-addon {
	position: relative;
}

#main-menu ul {
	margin: -8px auto;
	padding: 0px;
	position: relative;
}

.inner-addon .glyphicon {
	position: absolute;
	padding-left: 10px;
	padding-top: 10px;
	pointer-events: none;
}

.left-addon .glyphicon {
	left: 0px;
}

.right-addon .glyphicon {
	right: 0px;
}

.left-addon input {
	padding-left: 30px;
}
</style>
</head>
<body>
	<noscript>
		<meta HTTP-EQUIV="REFRESH"
			content="3; url=<c:url value="/javascriptdisabled"/>">
	</noscript>
	<div class="row">
		<div class="col-md-12">

			<div class="col-sm-4 col-md-3">
				<a href="<c:url value="/login_home"/>"> <img
					src="<c:url value="/resources/header/images/logo.png"/>"
					class="img-responsive" />
				</a>
			</div>

			<div class="col-sm-4 col-md-3">
				<div class="col-md-12"
					style="border: 2px solid grey; border-radius: 3px;" align="center">
					<font size="4px" style="color: red; font-weight: bolder;"
						class="blinking"> <!-- Success rate of our Algorithmic
						Prediction is between <font color="green">80-100%</font> -->
						FURTHER MADE EASY <font color="green">GET FILTERED LIST
							AFTER CLICKING THE LATEST SUGGESTION </font>

					</font>
				</div>
			</div>

			<div class=" col-sm-3 col-md-2">
				<a
					href="https://play.google.com/store/apps/details?id=com.equityjudge"
					target="_blank"> <img
					src="<c:url value="/resources/images/Android App.png"/>"
					class="img-responsive" width="80%"
					style="margin-left: 20%; margin-top: 2%;" />
				</a>


			</div>


			<div class="col-sm-12 col-md-4">

				<div class="col-sm-8 col-md-6" style="margin-top: 20px;">Free_Registration&nbsp;&&nbsp;Login&nbsp;&#10148;</div>

				<div class="col-sm-2 col-md-3"
					style="margin-top: 13px; margin-bottom: 10px">
					<form action="${pageContext.request.contextPath}/signuphome"
						method="post">
						<button type="submit" class="btn btn-success btn-md">
							<i class="glyphicon glyphicon-list-alt"></i> Register
						</button>
					</form>
				</div>


				<div class="col-sm-1 pull-left col-md-3"
					style="margin-top: 13px; z-index: 9999999">
					<ul class="nav navbar-nav navbar-right">
						<button type="button" data-toggle="dropdown"
							class="dropdown-toggle btn btn-success btn-md">
							<i class="glyphicon glyphicon-log-in"></i> Login
						</button>


						<ul class="dropdown-menu" style="padding: 15px; width: 300px;">
							<li>
								<div class="col-md-12" align="center"
									style="color: #BA4A00; font-size: large; font-weight: bold; margin-bottom: 0px">
									<u>LOGIN</u>
								</div>
								<div class="row" align="center">
									<div class="col-md-12">
										<form name="form" id="form" class="form" role="form"
											method="POST"
											action="${pageContext.request.contextPath}/login"
											id="login-nav">
											<div>
												<p style="color: red;">
													<strong>${userUNSuccessResult} </strong>
												</p>
											</div>
											<div class="form-group">
												<div class="inner-addon left-addon">
													<i class="glyphicon glyphicon-user"></i> <input type="text"
														class="form-control" name="userName" placeholder="UserID"
														required>
												</div>
											</div>
											<div class="form-group">
												<div class="inner-addon left-addon">
													<i class="glyphicon glyphicon-lock"></i> <input
														type="password" class="form-control" name="password"
														placeholder="Password" required>
												</div>
											</div>
											<div class="form-group">
												<button type="submit" class="btn btn-success btn-block">Login</button>
											</div>
										</form>
									</div>
								</div>
							</li>
							<li class="divider" style="width: 270px"></li>
							<div align="right">
								<a href="#myModal1" data-toggle="modal"> Forgot Password??</a>
							</div>
						</ul>
					</ul>
				</div>


			</div>
		</div>
	</div>

	<div class="row" style="background-color: #7c7c7f">
		<div id="menu-container" ng-controller="ModuleController"
			class="col-sm-11 col-md-11" data-ng-init="getFirstModules()">
			<nav id="main-menu">
			<ul class="menu">

				<li class="menu-item-simple-parent"><a
					href="<c:url value="/login_home"/>">Home</a></li>

				<li class="menu-item-simple-parent"
					ng-repeat="allmodules in homelistmodules"><a
					ng-repeat-start="(menu, value) in allmodules" href="#">{{menu}}</a>
					<ul class="sub-menu">
						<li ng-repeat="(key1, value1) in value"><a
							href="${pageContext.request.contextPath}{{key1}}">
								<div ng-repeat="(submenu, value2) in value1">{{submenu}}</div>
						</a></li>
					</ul>
					<p ng-repeat-end></p></li>
				<li class="menu-item-simple-parent"><a href="#"
					onclick="myfunc()">Latest Suggestions<span class="blinking"
						style="font-size: 12px; color: rgb(255, 255, 255);"> <sup
							style="height: 6px; background: red; border: 1px; border-radius: 4px">&nbsp
								New &nbsp</sup></span></a></li>

				<li class="menu-item-simple-parent"><a
					href="<c:url value="/about_us"/>">About Us</a></li>


				<li class="menu-item-simple-parent"><a
					href="<c:url value="/contact_us"/>">Contact Us</a></li>
				<li class="menu-item-simple-parent"><a
					href="<c:url value="/subscription"/>">Customer Area</a></li>

				<li class="menu-item-simple-parent"><a
					href="<c:url value="/subscription"/>">Guest Register</a></li>


				
					<li class="menu-item-simple-parent"><a
					href="<c:url value="/graphpattern/quotation"/>"> Quotation<span class="blinking"
						style="font-size: 16px; color: rgb(255, 255, 255);"><sup
							style="height: 10px; background: red; border: 1px; border-radius: 4px">&nbsp
								31-01-2018 &nbsp</sup></span></a></li>


				<li class="menu-item-simple-parent"><a href="#">Algorithmic
						Efficacy<span class="blinking"
						style="font-size: 16px; color: rgb(255, 255, 255);"><sup
							style="height: 10px; background: red; border: 1px; border-radius: 4px">&nbsp
								15-12-2017 &nbsp</sup></span>
				</a>
					<ul class="sub-menu">
						<li><a href="#">THREE MONTHS</a>
							<ul class="sub-menu" style="left: 180px; top: 27px;">
								<li><a href="#myModal5" data-toggle="modal">01-12-2017
										To 15-12-2017</a></li>
								<li><a href="#myModal3" data-toggle="modal">15-11-2017
										To 30-11-2017</a></li>
								<li><a href="#myModal7" data-toggle="modal">05-11-2017
										To 15-11-2017</a></li>


							</ul></li>
						<li><a href="#"> SIX MONTHS</a>
							<ul class="sub-menu" style="left: 180px; top: 27px;">
								<li><a href="#myModal4" data-toggle="modal">01-12-2017
										To 15-12-2017</a></li>
								<li><a href="#myModal2" data-toggle="modal">15-11-2017
										To 30-11-2017</a></li>
								<li><a href="#myModal6" data-toggle="modal">05-11-2017
										To 15-11-2017</a></li>


							</ul></li>
					</ul></li>


			</ul>
			</nav>
		</div>


		<div class="col-sm-1 col-md-1">
			<a class="trigger" href="#">Feedback</a>
		</div>
		<div class="panel1" ng-controller="LoginController"
			style="z-index: 999999">
			<form method="post" name="form1" novalidate>
				<div>
					<h4 id="{{hideMe}}">{{results}}</h4>
					<p ng-show="feedbacks" style="color: green; font-size: medium;">
						Please wait.. <img
							src="<c:url value="/resources/images/load.gif"/>" height="50px"
							width="50px">
					</p>
					<div
						ng-class="{ 'has-error' : form1.names.$invalid && (form1.names.$dirty || submitted)}">
						<p style="color: red; margin-top: -10px"
							ng-show="form1.names.$error.required && (form1.names.$dirty || submitted)"
							class="help-block">FirstName required...</p>
						<span style="color: red; margin-top: -10px"
							ng-show="form1.names.$error.maxlength " class="help-block">Name
							Length less than 20</span> <span style="color: red; margin-top: -10px"
							ng-show="form1.name.$invalid && form1.name.$error.pattern && (form1.name.$dirty || submitted)"
							class="help-block">Only Alphabetics is allow... </span>
					</div>
					<div
						ng-class="{ 'has-error' : form1.Email.$invalid && (form1.Email.$dirty || submitted)}">
						<p style="color: red; margin-top: -10px"
							ng-show="form1.Email.$error.required && (form1.Email.$dirty || submitted)"
							class="help-block">Email Id required...</p>
						<span style="color: red; margin-top: -10px"
							ng-show="form1.Email.$invalid && form1.Email.$error.pattern && (form1.Email.$dirty || submitted)"
							class="help-block">Email pattern
							like:_ab1bc2._asc@gmail.(com/in) </span> <span
							style="color: red; margin-top: -10px"
							ng-show="form1.Email.$error.maxlength " class="help-block">Email
							Length less than 40</span>
					</div>
					<div
						ng-class="{ 'has-error' : form1.messages.$invalid && (form1.messages.$dirty || submitted)}">
					</div>

				</div>
				<div>
					<div class="form-group">
						<input id="name" name="names" ng-model="names" type="text"
							placeholder="Name(*)" ng-maxlength="20" class="form-control"
							ng-pattern="/^[a-zA-Z ]*$/" required>
					</div>
					<div class="form-group">
						<input id="email" name="Email" type="text" ng-model="Email"
							placeholder="Email Address(*)" ng-maxlength="40"
							class="form-control"
							ng-pattern="/^[_a-z0-9]+(\.[_a-z0-9]+)*@[a-z0-9-]+(\[a-z0-9-]+)*(\.[com|in]{2,3})$/"
							required>
					</div>
					<div class='form-group'>
						<select class="form-control" ng-model="category"
							ng-options="category.value as category.name for category in categoryList"></select>
					</div>
					<div class="form-group">
						<textarea class="form-control" id="messages" name="messages"
							ng-model="messages" ng-maxlength="500"
							placeholder="Enter your message for us here. We will get back to you as soon as possible.."
							rows="5" required></textarea>
						<p style="color: red; margin-top: 0px"
							ng-show="form1.messages.$error.required && (form1.messages.$dirty || submitted)"
							class="help-block">Message is required...</p>
						<span style="color: red; margin-top: 0px"
							ng-show="form1.messages.$error.maxlength " class="help-block">Message
							Length less than 500</span>
					</div>
					<div class="form-group">
						<button type="submit" ng-disabled="form1.$invalid"
							class="btn btn-primary btn-md pull-left" ng-click="feedback()">Submit</button>
					</div>
				</div>
			</form>
		</div>
	</div>


	<div class="modal fade" id="myModal1" role="dialog"
		style="margin-top: 8%" ng-controller="LoginController">
		<div class="modal-dialog modal-md">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Forgot Password</h4>
				</div>
				<div class="modal-body">
					<div class='form-group'>
						<div class="col-md-12" ng-show="forgotP"
							style="color: green; font-size: medium; margin-left: 160px; margin-bottom: 15px">
							Please wait.. <img
								src="<c:url value="/resources/images/load.gif"/>" height="50px"
								width="50px">
						</div>
						<p style="color: green; font-size: medium;" align="center">{{success}}</p>

						<p style="color: red; font-size: medium; margin-left: 160px;">{{error}}</p>

						<div ng-show="responseFlag">
							<div class="row" style="padding-top: 5px; padding-bottom: 10px">
								<div class="col-md-12">
									<label class='control-label col-md-3 col-md-offset-1'>User
										ID:</label>
									<div class='col-md-4'>
										<div class='form-group internal'
											style="margin-top: -10px; margin-left: -40px">
											<input type="text" class="form-control" name="userName"
												ng-model="userName" placeholder="Enter User ID" tabindex="1"
												required />
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<label class='control-label col-md-3 col-md-offset-1'>Email
										Id:</label>
									<div class='col-md-4'>
										<div class='form-group internal'
											style="margin-top: -10px; margin-left: -40px; padding-bottom: 10px">
											<input type="text" class="form-control" name="emailid"
												ng-model="emailid" placeholder="Enter Registered Email Id"
												tabindex="2" required>
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-7">
									<button class="btn btn-md btn-primary pull-right" type="button"
										ng-click="forgotPassword()">Submit</button>
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
	<div class="modal fade" id="myModal2" role="dialog">
		<div class="modal-dialog modal-lg">

			<div class="modal-content">
				<div class="modal-header" style="text-align: center">

					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h2 class="modal-title" style="color: green">
						<center>
							Success Rate of Suggestions <span style="color: red"><b>80-100
									%</b></span>
						</center>
					</h2>
					<br>
					<h4 class="modal-title">
						<center>6 Month's Algorithmic Efficacy For 20-11-2017 To
							30-11-2017</center>
					</h4>
				</div>

				<div class="modal-body">

					<div class="table-responsive">
						<table class="table table-bordered table-hover table-condensed"
							style="border: 1px solid rgb(204, 204, 204); box-shadow: rgba(0, 0, 0, 0.298039) 0px 0px 10px; z-index: 2">


							<tr>
								<th rowspan="2"
									style="color: blue; text-align: center; vertical-align: middle; font-size: 18px">BSE
									SENSEX</th>

								<th>Price on 30-05-2017</th>
								<th>Current Price</th>
								<th>%Change</th>
							</tr>



							<tr>

								<td><b>31159.4</b></td>
								<td><b>33149.35</b></td>
								<td style="color: green"><b>+ 6.39</b></td>
							</tr>

						</table>
					</div>

					<div class="table-responsive">
						<table class="table table-bordered table-hover table-condensed">
							<caption style="text-align: center">
								<h4>Top 10 Companies List Displayed 1 Dec,2017</h4>
							</caption>
							<thead>
								<tr>
									<th>Company Name</th>
									<th>Pattern Name</th>
									<th>Suggestion</th>
									<th>Detected Date</th>
									<th>Detected Price</th>
									<th>Current Price</th>
									<th>%Change</th>
								</tr>
							</thead>
							<tbody>
								<tr>

									<td>GOA CARBON LTD.</td>
									<td>UPTREND</td>
									<td>BUY</td>
									<td>29-05-2017</td>
									<td>130.45</td>
									<td>863.9</td>
									<td style="color: rgb(0, 179, 0)"><b>+ 562.25</b></td>
								</tr>

								<tr>

									<td>ITL INDUSTRIES LTD.</td>
									<td>UPTREND</td>
									<td>BUY</td>
									<td>25-05-2017</td>
									<td>70.0</td>
									<td>245.0</td>
									<td style="color: rgb(0, 179, 0)"><b>+ 250.00</b></td>
								</tr>

								<tr>

									<td>ELDECO HOUSING INDUSTRIES LTD.</td>
									<td>UPTREND</td>
									<td>BUY</td>
									<td>22-05-2017</td>
									<td>680.0</td>
									<td>2295.0</td>
									<td style="color: rgb(0, 179, 0)"><b>+ 237.50</b></td>
								</tr>

								<tr>
									<td>SREE RAYALASEEMA ALKALIES ALLIED CHEMICALS LTD.</a></td>
									<td>UPTREND</td>
									<td>BUY</td>
									<td>22-05-2017</td>
									<td>23.05</td>
									<td>72.8</td>
									<td style="color: rgb(0, 179, 0)"><b>+ 215.84</b></td>
								</tr>

								<tr>
									<td>EMAMI INFRASTRUCTURE LTD.</a></td>
									<td>UPTREND</td>
									<td>BUY</td>
									<td>22-05-2017</td>
									<td>91.85</td>
									<td>284.8</td>
									<td style="color: rgb(0, 179, 0)"><b>+ 210.07</b></td>
								</tr>

								<tr>
									<td>BHARAT SEATS LTD.</a></td>
									<td>UPTREND</td>
									<td>BUY</td>
									<td>29-05-2017</td>
									<td>82.55</td>
									<td>245.95</td>
									<td style="color: rgb(0, 179, 0)"><b>+ 197.94</b></td>
								</tr>

								<tr>
									<td>TVS ELECTRONICS LTD.</a></td>
									<td>UPTREND</td>
									<td>STRONG BUY</td>
									<td>23-05-2017</td>
									<td>175.2</td>
									<td>417.9</td>
									<td style="color: rgb(0, 179, 0)"><b>+ 138.53</b></td>
								</tr>

								<tr>
									<td>THIRUMALAI CHEMICALS LTD.</a></td>
									<td>UPTREND</td>
									<td>BUY</td>
									<td>22-05-2017</td>
									<td>858.0</td>
									<td>1930.2</td>
									<td style="color: rgb(0, 179, 0)"><b>+ 124.97</b></td>
								</tr>

								<tr>
									<td>SAHYADRI INDUSTRIES LTD.</a></td>
									<td>UPTREND</td>
									<td>BUY</td>
									<td>24-05-2017</td>
									<td>110.0</td>
									<td>246.1</td>
									<td style="color: rgb(0, 179, 0)"><b>+ 123.73</b></td>
								</tr>

								<tr>
									<td>ACTION CONSTRUCTION EQUIPMENT LTD.</a></td>
									<td>UPTREND</td>
									<td>BUY</td>
									<td>23-05-2017</td>
									<td>63.2</td>
									<td>137.5</td>
									<td style="color: rgb(0, 179, 0)"><b>+ 117.56</b></td>
								</tr>

							</tbody>

						</table>
					</div>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>

			</div>
		</div>
	</div>



	<div class="modal fade" id="myModal3" role="dialog">
		<div class="modal-dialog modal-lg">

			<div class="modal-content">
				<div class="modal-header" style="text-align: center">

					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h2 class="modal-title" style="color: green">
						<center>
							Success Rate of Suggestions <span style="color: red"><b>80-100
									%</b></span>
						</center>
					</h2>
					<br>
					<h4 class="modal-title">3 Month's Algorithmic Efficacy For
						20-11-2017 To 30-11-2017</h4>
				</div>

				<div class="modal-body">

					<div class="table-responsive">
						<table class="table table-bordered table-hover table-condensed"
							style="border: 1px solid rgb(204, 204, 204); box-shadow: rgba(0, 0, 0, 0.298039) 0px 0px 10px; z-index: 2">


							<tr>
								<th rowspan="2"
									style="color: blue; text-align: center; vertical-align: middle; font-size: 18px">BSE
									SENSEX</th>

								<th>Price on 30-08-2017</th>
								<th>Current Price</th>
								<th>%Change</th>
							</tr>



							<tr>

								<td><b>31646.46</b></td>
								<td><b>33149.35</b></td>
								<td style="color: green"><b> + 4.75</b></td>
							</tr>

						</table>
					</div>

					<div class="table-responsive">
						<table class="table table-bordered table-hover table-condensed">
							<caption style="text-align: center">
								<h4>Top 10 Companies List Displayed On 1 Dec,2017</h4>
							</caption>
							<thead>
								<tr>
									<th>Company Name</th>
									<th>Pattern Name</th>
									<th>Suggestion</th>
									<th>Detected Date</th>
									<th>Detected Price</th>
									<th>Current price</th>
									<th>%Change</th>
								</tr>
							</thead>
							<tbody>

								<tr>

									<td>ELDECO HOUSING INDUSTRIES LTD.</td>
									<td>UPWARD</td>
									<td>BUY</td>
									<td>29-08-2017</td>
									<td>889.85</td>
									<td>2295.0</td>
									<td style="color: rgb(0, 179, 0)">+ 157.91</td>
								</tr>


								<tr>

									<td>SREE RAYALASEEMA ALKALIES ALLIED CHEMICALS LTD.</td>
									<td>UPTREND</td>
									<td>BUY</td>
									<td>24-08-2017</td>
									<td>30.25</td>
									<td>72.8</td>
									<td style="color: rgb(0, 179, 0)"><b>+ 140.66</b></td>
								</tr>

								<tr>

									<td>KOLTE-PATIL DEVELOPERS LTD.</td>
									<td>UPTREND</td>
									<td>BUY</td>
									<td>22-08-2017</td>
									<td>161.2</td>
									<td>368.2</td>
									<td style="color: rgb(0, 179, 0)"><b>+ 128.41</b></td>
								</tr>

								<tr>

									<td>MARATHON NEXTGEN REALTY LTD.</td>
									<td>UPTREND</td>
									<td>STRONG BUY</td>
									<td>24-08-2017</td>
									<td>276.05</td>
									<td>614.0</td>
									<td style="color: rgb(0, 179, 0)"><b>+ 122.42</b></td>
								</tr>

								<tr>

									<td>IFB INDUSTRIES LTD.</td>
									<td>UPTREND</td>
									<td>BUY</td>
									<td>30-08-2017</td>
									<td>698.0</td>
									<td>1383.0</td>
									<td style="color: rgb(0, 179, 0)"><b>+ 98.14</b></td>
								</tr>

								<tr>

									<td>ALUFLUORIDE LTD.</td>
									<td>UPTREND</td>
									<td>STRONG BUY</td>
									<td>21-08-2017</td>
									<td>66.7</td>
									<td>124.0</td>
									<td style="color: rgb(0, 179, 0)"><b>+ 85.91</b></td>
								</tr>

								<tr>

									<td>PG FOILS LTD.</td>
									<td>UPTREND</td>
									<td>BUY</td>
									<td>28-08-2017</td>
									<td>125.0</td>
									<td>227.4</td>
									<td style="color: rgb(0, 179, 0)"><b>+ 81.92</b></td>
								</tr>

								<tr>

									<td>Prozone Intu Properties Limited</td>
									<td>UPTREND</td>
									<td>BUY</td>
									<td>28-08-2017</td>
									<td>40.05</td>
									<td>70.25</td>
									<td style="color: rgb(0, 179, 0)"><b>+ 75.41</b></td>
								</tr>

								<tr>

									<td>Capri Global Capital Limited</td>
									<td>UPTREND</td>
									<td>BUY</td>
									<td>28-08-2017</td>
									<td>73.0</td>
									<td>125.8</td>
									<td style="color: rgb(0, 179, 0)"><b>+ 72.33</b></td>
								</tr>

								<tr>

									<td>Beekay Steel Industries Ltd</td>
									<td>30DMA CROSSES 100DMA UPWARD</td>
									<td>STRONG BUY</td>
									<td>30-08-2017</td>
									<td>241.3</td>
									<td>398.0</td>
									<td style="color: rgb(0, 179, 0)"><b>+ 64.94</b></td>
								</tr>


							</tbody>

						</table>
					</div>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>

			</div>
		</div>
	</div>



	<div class="modal fade" id="myModal4" role="dialog">
		<div class="modal-dialog modal-lg">

			<div class="modal-content">
				<div class="modal-header" style="text-align: center">

					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h2 class="modal-title" style="color: green">
						<center>
							Success Rate of Suggestions <span style="color: red"><b>80-100
									%</b></span>
						</center>
					</h2>
					<br>
					<h4 class="modal-title">6 Month's Algorithmic Efficacy
						For(04-12-2017 To 14-12-2017)</h4>
				</div>

				<div class="modal-body">


					<div class="table-responsive">
						<table class="table table-bordered table-hover table-condensed"
							style="border: 1px solid rgb(204, 204, 204); box-shadow: rgba(0, 0, 0, 0.298039) 0px 0px 10px; z-index: 2">


							<tr>
								<th rowspan="2"
									style="color: blue; text-align: center; vertical-align: middle; font-size: 18px">BSE
									SENSEX</th>

								<th>Price on 14-06-2017</th>
								<th>Current Price</th>
								<th>%Change</th>
							</tr>



							<tr>

								<td><b>31155.91</b></td>
								<td><b>33246.7</b></td>
								<td style="color: green"><b>+ 6.71</b></td>
							</tr>

						</table>
					</div>

					<div class="table-responsive">
						<table class="table table-bordered table-hover table-condensed">
							<caption style="text-align: center">
								<h4>Top 10 Companies List Displayed 15 Dec, 2017</h4>
							</caption>
							<thead>
								<tr>
									<th>Company Name</th>
									<th>Pattern Name</th>
									<th>Suggestion</th>
									<th>Detected Date</th>
									<th>Detected Price</th>
									<th>Current Price</th>
									<th>%Change</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>HEG LTD.</td>
									<td>UPTREND</td>
									<td>BUY</td>
									<td>03-04-2017</td>
									<td>272.95</td>
									<td>1315.0</td>
									<td style="color: rgb(0, 179, 0)">+ 381.77</td>
								</tr>

								<tr>
									<td>ITL INDUSTRIES LTD.</td>
									<td>UPTREND</td>
									<td>BUY</td>
									<td>03-04-2017</td>
									<td>66.15</td>
									<td>173.0</td>
									<td style="color: rgb(0, 179, 0)">+ 161.53</td>
								</tr>

								<tr>
									<td>RAGHUVIR SYNTHETICS LTD.</td>
									<td>30DMA CROSSES 100DMA UPWARD</td>
									<td>STRONG BUY</td>
									<td>10-04-2017</td>
									<td>50.2</td>
									<td>111.8</td>
									<td style="color: rgb(0, 179, 0)">+ 122.71</td>
								</tr>

								<tr>
									<td>INDSIL HYDRO POWER AND MANGANESE LTD.</td>
									<td>UPTREND</td>
									<td>BUY</td>
									<td>12-04-2017</td>
									<td>69.25</td>
									<td>149.0</td>
									<td style="color: rgb(0, 179, 0)">+ 115.16</td>
								</tr>
								<tr>
									<td>PG ELECTROPLAST LTD.</td>
									<td>UPTREND</td>
									<td>BUY</td>
									<td>07-04-2017</td>
									<td>185.5</td>
									<td>398.1</td>
									<td style="color: rgb(0, 179, 0)">+ 114.61</td>
								</tr>

								<tr>
									<td>STERLITE TECHNOLOGIES LTD.</td>
									<td>UPTREND</td>
									<td>BUY</td>
									<td>07-04-2017</td>
									<td>131.75</td>
									<td>269.7</td>
									<td style="color: rgb(0, 179, 0)">+ 104.71</td>
								</tr>

								<tr>
									<td>JBM AUTO LTD.</td>
									<td>UPTREND</td>
									<td>STRONG BUY</td>
									<td>12-04-2017</td>
									<td>269.3</td>
									<td>537.0</td>
									<td style="color: rgb(0, 179, 0)">+ 99.41</td>
								</tr>
								<tr>
									<td>TAINWALA CHEMICALS PLASTICS (INDIA) LTD.</td>
									<td>UPTREND</td>
									<td>BUY</td>
									<td>03-04-2017</td>
									<td>56.65</td>
									<td>111.95</td>
									<td style="color: rgb(0, 179, 0)">+ 97.62</td>
								</tr>
								<tr>
									<td>SEASONS TEXTILES LTD.</td>
									<td>30DMA CROSSES 100DMA UPWARD</td>
									<td>STRONG BUY</td>
									<td>07-04-2017</td>
									<td>7.36</td>
									<td>14.4</td>
									<td style="color: rgb(0, 179, 0)">+ 95.65</td>
								</tr>
								<tr>
									<td>INDIAN TONERS DEVELOPERS LTD.</td>
									<td>UPTREND</td>
									<td>BUY</td>
									<td>07-04-2017</td>
									<td>165.0</td>
									<td>301.0</td>
									<td style="color: rgb(0, 179, 0)">+ 82.42</td>
								</tr>

							</tbody>

						</table>
					</div>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>

			</div>
		</div>
	</div>


	<div class="modal fade" id="myModal5" role="dialog">
		<div class="modal-dialog modal-lg">

			<div class="modal-content">
				<div class="modal-header">

					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h2 class="modal-title" style="color: green">
						<center>
							Success Rate of Suggestions <span style="color: red"><b>80-100
									%</b></span>
						</center>
					</h2>
					<br>
					<h4 class="modal-title">
						<center>Three Month's Algorithmic Efficacy For(04-12-2017
							To 14-12-2017)</center>
					</h4>
				</div>

				<div class="modal-body">


					<div class="table-responsive">
						<table class="table table-bordered table-hover table-condensed"
							style="border: 1px solid rgb(204, 204, 204); box-shadow: rgba(0, 0, 0, 0.298039) 0px 0px 10px; z-index: 2">


							<tr>
								<th rowspan="2"
									style="color: blue; text-align: center; vertical-align: middle; font-size: 18px">BSE
									SENSEX</th>

								<th>Price on 14-12-2017</th>
								<th>Current Price</th>
								<th>%Change</th>
							</tr>



							<tr>

								<td><b>32241.93</b></td>
								<td><b>33246.7</b></td>
								<td style="color: green"><b>+ 3.12</b></td>
							</tr>

						</table>
					</div>



					<div class="table-responsive">
						<table class="table table-bordered table-hover table-condensed">
							<caption style="text-align: center">
								<h4>Top 10 Companies List Displayed On Dec 15 ,2017</h4>
							</caption>
							<thead>
								<tr>
									<th>Company Name</th>
									<th>Pattern Name</th>
									<th>Suggestion</th>
									<th>Detected Date</th>
									<th>Detected Price</th>
									<th>Current price</th>
									<th>%Change</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>MIRC ELECTRONICS LTD.</td>
									<td>UPTREND</td>
									<td>BUY</td>
									<td>06-09-2017</td>
									<td>16.85</td>
									<td>48.6</td>
									<td style="color: rgb(0, 179, 0)"><b>+ 188.43</b></td>
								</tr>

								<tr>
									<td>ELDECO HOUSING INDUSTRIES LTD.</td>
									<td>UPTREND</td>
									<td>BUY</td>
									<td>14-09-2017</td>
									<td>865.3</td>
									<td>2140.0</td>
									<td style="color: rgb(0, 179, 0)"><b>+ 147.31</b></td>
								</tr>

								<tr>
									<td>RAMKY INFRASTRUCTURE LTD.</td>
									<td>UPTREND</td>
									<td>BUY</td>
									<td>04-09-2017</td>
									<td>100.0</td>
									<td>218.9</td>
									<td style="color: rgb(0, 179, 0)"><b>+ 118.90</b></td>
								</tr>

								<tr>
									<td>Mangalam Organics Limited</a></td>
									<td>UPTREND</td>
									<td>BUY</td>
									<td>04-09-2017</td>
									<td>76.85</td>
									<td>166.0</td>
									<td style="color: rgb(0, 179, 0)"><b>+ 116.01</b></td>
								</tr>

								<tr>
									<td>PURAVANKARA PROJECTS LTD.</td>
									<td>UPTREND</td>
									<td>BUY</td>
									<td>05-09-2017</td>
									<td>79.95</td>
									<td>158.0</td>
									<td style="color: rgb(0, 179, 0)"><b>+ 97.62</b></td>
								</tr>

								<tr>
									<td>ACTION CONSTRUCTION EQUIPMENT LTD.</td>
									<td>UPTREND</td>
									<td>STRONG BUY</td>
									<td>04-09-2017</td>
									<td>72.5</td>
									<td>139.25</td>
									<td style="color: rgb(0, 179, 0)"><b>+ 92.07</b></td>
								</tr>

								<tr>
									<td>Prabhat Telecoms (India) Ltd</td>
									<td>30DMA CROSSES 100DMA UPWARD</td>
									<td>STRONG BUY</td>
									<td>08-09-2017</td>
									<td>100.0</td>
									<td>188.25</td>
									<td style="color: rgb(0, 179, 0)"><b>+ 88.25</b></td>
								</tr>

								<tr>
									<td>ZUARI GLOBAL LTD.</td>
									<td>UPTREND</td>
									<td>BUY</td>
									<td>06-09-2017</td>
									<td>137.7</td>
									<td>258.0</td>
									<td style="color: rgb(0, 179, 0)"><b>+ 87.36</b></td>
								</tr>

								<tr>
									<td>WEIZMANN LTD.</td>
									<td>UPTREND</td>
									<td>BUY</td>
									<td>06-09-2017</td>
									<td>41.85</td>
									<td>72.0</td>
									<td style="color: rgb(0, 179, 0)"><b>+ 72.04</b></td>
								</tr>

								<tr>
									<td>KUANTUM PAPERS LTD.</td>
									<td>UPTREND</td>
									<td>STRONG BUY</td>
									<td>04-09-2017</td>
									<td>502.0</td>
									<td>830.0</td>
									<td style="color: rgb(0, 179, 0)"><b>+ 65.34</b></td>
								</tr>

							</tbody>

						</table>
					</div>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>

			</div>
		</div>
	</div>

	<div class="modal fade" id="myModal6" role="dialog">
		<div class="modal-dialog modal-lg">

			<div class="modal-content">
				<div class="modal-header" style="text-align: center">

					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h2 class="modal-title" style="color: green">
						<center>
							Success Rate of Suggestions <span style="color: red"><b>80-100
									%</b></span>
						</center>
					</h2>
					<br>
					<h4 class="modal-title">6 Month's Algorithmic Efficacy
						For(04-11-2017 To 14-11-2017)</h4>
				</div>

				<div class="modal-body">


					<div class="table-responsive">
						<table class="table table-bordered table-hover table-condensed"
							style="border: 1px solid rgb(204, 204, 204); box-shadow: rgba(0, 0, 0, 0.298039) 0px 0px 10px; z-index: 2">


							<tr>
								<th rowspan="2"
									style="color: blue; text-align: center; vertical-align: middle; font-size: 18px">BSE
									SENSEX</th>

								<th>Price on 14-05-2017</th>
								<th>Current Price</th>
								<th>%Change</th>
							</tr>



							<tr>

								<td><b>30188.15</b></td>
								<td><b>32941.87</b></td>
								<td style="color: green"><b>+ 9.12</b></td>
							</tr>

						</table>
					</div>

					<div class="table-responsive">
						<table class="table table-bordered table-hover table-condensed">
							<caption style="text-align: center">
								<h4>Top 10 Companies List Displayed On 15-11-2017</h4>
							</caption>
							<thead>
								<tr>
									<th>Company Name</th>
									<th>Pattern Name</th>
									<th>Suggestion</th>
									<th>Detected Date</th>
									<th>Detected Price</th>
									<th>Current Price</th>
									<th>%Change</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>ABC BEARINGS LTD.</td>
									<td>UPTREND</td>
									<td>STRONG BUY</td>
									<td>10-05-2017</td>
									<td>176.05</td>
									<td>426.0</td>
									<td style="color: rgb(0, 179, 0)"><b>+ 141.98</b></td>
								</tr>

								<tr>
									<td>RattanIndia Infrastructure Limited</td>
									<td>UPTREND</td>
									<td>BUY</td>
									<td>12-05-2017</td>
									<td>4.03</td>
									<td>9.69</td>
									<td style="color: rgb(0, 179, 0)">+ 140.45</td>
								</tr>

								<tr>
									<td>PG ELECTROPLAST LTD.</td>
									<td>UPTREND</td>
									<td>BUY</td>
									<td>10-05-2017</td>
									<td>183.0</td>
									<td>398.45</td>
									<td style="color: rgb(0, 179, 0)">+ 117.73</td>
								</tr>

								<tr>
									<td>UNIVERSAL CABLES LTD.</td>
									<td>UPTREND</td>
									<td>BUY</td>
									<td>08-05-2017</td>
									<td>90.85</td>
									<td>190.0</td>
									<td style="color: rgb(0, 179, 0)">+ 109.14</td>
								</tr>
								<tr>
									<td>AMINES PLASTICIZERS LTD.</td>
									<td>UPTREND</td>
									<td>BUY</td>
									<td>09-05-2017</td>
									<td>36.3</td>
									<td>68.4</td>
									<td style="color: rgb(0, 179, 0)">+ 88.43</td>
								</tr>

								<tr>
									<td>SAHYADRI INDUSTRIES LTD.</td>
									<td>UPTREND</td>
									<td>BUY</td>
									<td>11-05-2017</td>
									<td>107.75</td>
									<td>195.9</td>
									<td style="color: rgb(0, 179, 0)">+ 81.81</td>
								</tr>

								<tr>
									<td>BHAGIRADHA CHEMICALS INDUSTRIES LTD.</td>
									<td>UPTREND</td>
									<td>BUY</td>
									<td>04-05-2017</td>
									<td>167.1</td>
									<td>300.0</td>
									<td style="color: rgb(0, 179, 0)">+ 79.53</td>
								</tr>
								<tr>
									<td>JBM AUTO LTD.</td>
									<td>UPTREND</td>
									<td>STRONG BUY</td>
									<td>11-05-2017</td>
									<td>276.9</td>
									<td>489.4</td>
									<td style="color: rgb(0, 179, 0)">+ 76.74</td>
								</tr>
								<tr>
									<td>JK Agri Genetics Ltd</td>
									<td>UPTREND</td>
									<td>BUY</td>
									<td>08-05-2017</td>
									<td>730.65</td>
									<td>1259.0</td>
									<td style="color: rgb(0, 179, 0)">+ 72.31</td>
								</tr>

								<tr>
									<td>GUJARAT ALKALIES CHEMICALS LTD.</td>
									<td>UPTREND</td>
									<td>BUY</td>
									<td>08-05-2017</td>
									<td>459.55</td>
									<td>781.15</td>
									<td style="color: rgb(0, 179, 0)">+ 69.98</td>
								</tr>

							</tbody>

						</table>
					</div>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>

			</div>
		</div>
	</div>


	<div class="modal fade" id="myModal7" role="dialog">
		<div class="modal-dialog modal-lg">

			<div class="modal-content">
				<div class="modal-header" style="text-align: center">

					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h2 class="modal-title" style="color: green">
						<center>
							Success Rate of Suggestions <span style="color: red"><b>80-100
									%</b></span>
						</center>
					</h2>
					<br>
					<h4 class="modal-title">3 Month's Algorithmic Efficacy
						For(04-11-2017 To 14-11-2017)</h4>
				</div>

				<div class="modal-body">


					<div class="table-responsive">
						<table class="table table-bordered table-hover table-condensed"
							style="border: 1px solid rgb(204, 204, 204); box-shadow: rgba(0, 0, 0, 0.298039) 0px 0px 10px; z-index: 2">


							<tr>
								<th rowspan="2"
									style="color: blue; text-align: center; vertical-align: middle; font-size: 18px">BSE
									SENSEX</th>

								<th>Price on 14-08-2017</th>
								<th>Current Price</th>
								<th>%Change</th>
							</tr>



							<tr>

								<td><b>31449.03</b></td>
								<td><b>32941.87</b></td>
								<td style="color: green"><b>+ 4.75</b></td>
							</tr>

						</table>
					</div>

					<div class="table-responsive">
						<table class="table table-bordered table-hover table-condensed">
							<caption style="text-align: center">
								<h4>Top 10 Companies List Displayed On 15-11-2017</h4>
							</caption>
							<thead>
								<tr>
									<th>Company Name</th>
									<th>Pattern Name</th>
									<th>Suggestion</th>
									<th>Detected Date</th>
									<th>Detected Price</th>
									<th>Current Price</th>
									<th>%Change</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>SREE RAYALASEEMA ALKALIES ALLIED CHEMICALS LTD.</td>
									<td>UPTREND</td>
									<td>BUY</td>
									<td>08-08-2017</td>
									<td>26.35</td>
									<td>61.6</td>
									<td style="color: rgb(0, 179, 0)"><b>+ 133.78</b></td>
								</tr>

								<tr>
									<td>Agri- Tech (India) Ltd</td>
									<td>UPTREND</td>
									<td>BUY</td>
									<td>10-08-2017</td>
									<td>63.15</td>
									<td>124.6</td>
									<td style="color: rgb(0, 179, 0)">+ 97.31</td>
								</tr>

								<tr>
									<td>SABOO SODIUM CHLORO LTD.</td>
									<td>UPTREND</td>
									<td>BUY</td>
									<td>08-08-2017</td>
									<td>13.8</td>
									<td>25.45</td>
									<td style="color: rgb(0, 179, 0)">+ 84.42</td>
								</tr>

								<tr>
									<td>ANDHRA SUGARS LTD.</td>
									<td>UPTREND</td>
									<td>STRONG BUY</td>
									<td>09-08-2017</td>
									<td>326.1</td>
									<td>592.0</td>
									<td style="color: rgb(0, 179, 0)">+ 81.54</td>
								</tr>
								<tr>
									<td>Excel Realty N Infra Ltd</td>
									<td>UPTREND</td>
									<td>BUY</td>
									<td>10-08-2017</td>
									<td>58.0</td>
									<td>105.0</td>
									<td style="color: rgb(0, 179, 0)">+ 81.03</td>
								</tr>

								<tr>
									<td>RAMKY INFRASTRUCTURE LTD.</td>
									<td>UPTREND</td>
									<td>BUY</td>
									<td>08-08-2017</td>
									<td>96.25</td>
									<td>173.0</td>
									<td style="color: rgb(0, 179, 0)">+ 79.74</td>
								</tr>

								<tr>
									<td>INDSIL HYDRO POWER AND MANGANESE LTD.</td>
									<td>UPTREND</td>
									<td>BUY</td>
									<td>10-08-2017</td>
									<td>80.2</td>
									<td>139.5</td>
									<td style="color: rgb(0, 179, 0)">+ 73.94</td>
								</tr>
								<tr>
									<td>UNIVERSAL CABLES LTD.</td>
									<td>UPTREND</td>
									<td>STRONG BUY</td>
									<td>08-08-2017</td>
									<td>109.7</td>
									<td>190.0</td>
									<td style="color: rgb(0, 179, 0)">+ 73.20</td>
								</tr>
								<tr>
									<td>KUANTUM PAPERS LTD.</td>
									<td>UPTREND</td>
									<td>STRONG BUY</td>
									<td>14-08-2017</td>
									<td>460.0</td>
									<td>779.0</td>
									<td style="color: rgb(0, 179, 0)">+ 69.35</td>
								</tr>
								<tr>
									<td>GUJARAT NARMADA VALLEY FERTILIZERS CHEMICALS LTD.</td>
									<td>UPTREND</td>
									<td>STRONG BUY</td>
									<td>07-08-2017</td>
									<td>268.0</td>
									<td>448.5</td>
									<td style="color: rgb(0, 179, 0)">+ 67.35</td>
								</tr>



							</tbody>

						</table>
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