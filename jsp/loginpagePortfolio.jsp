<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link id="default-css" rel="stylesheet"
	href="<c:url value="/resources/css/loginPage.css"/>" type="text/css"
	media="all" />

</head>
<body ng-app="myApp">
	<div class="wrapper">
		<div class="container">
			<div class="row">
			<c:if test="${empty successs}">
				<div class="col-sm-12 col-md-12">
					<h4 class="col-md-offset-4" style="color: red; font-style: italic;padding-top: 10px;">Login/Register
						to  get full access .......</h4>
				</div>
			</c:if>
			</div>
			<p align="center"
				style="font-size: x-large; color: green; margin-top: 10px">
				${successs }</p>
			<div class="row" style="margin-top: 0px;">

				<div class="col-sm-6 col-md-7">
					<h2 style="color: lightblue; font-family: fantasy;">
						<i class="fa fa-cubes" aria-hidden="true"></i> <u><font
							color="">Equityjudge</font> Portfolio</u>
					</h2>
					<p style="font-size: medium; color: graytext; font-weight: bold;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&#10097;&#10097;&#10097; Your Financial Reflection</p>

					<div class="col-sm-12 col-md-12" align="left" style="margin-bottom: 20px">
						<div class="col-sm-5 col-md-7">
							<img class="img-responsive" src="<c:url value="/resources/images/portfolio.jpg"/>" />
						</div>

						<div class="col-sm-7 col-md-5">
							<p style="font-size: medium; color: graytext;" align="justify">
								<i class="fa fa-hand-o-right" aria-hidden="true"></i>
								Equityjudge portfolio gives easy access and analyze your
								portfolio, up-to-date performance and tracks its movements at
								any time from any where in the world.
							</p>
						</div>
					</div>
					<p style="color: graytext; font-size: medium;">
						<i class="fa fa-hand-o-right" aria-hidden="true"></i> Portfolio
						tracker provides information like share purchased/sell details ,
						long/short term GAINS, current profit/loss of holdings.
					</p>
				</div>
				<div class="col-sm-6 col-md-5" style="margin-top: 20px">
					<div class="container1" align="right">
						<section id="content">
							<form name="form" id="form" class="form" role="form"
								method="POST"
								action="${pageContext.request.contextPath}/loginPage"
								id="login-nav">
								<h1>Login Form</h1>
								<div>
									<p style="color: red;">
										<strong>${userUNSuccessResult} </strong>
									</p>
								</div>
								<div class="inner-addon left-addon">
									<i class="glyphicon glyphicon-user"></i> <input type="text"
										name="userName" class="form-control" placeholder="UserID"
										required>
								</div>
								<div class="inner-addon left-addon">
									<i class="glyphicon glyphicon-lock"></i><input type="password"
										class="form-control" name="password" placeholder="Password"
										required>
								</div>
								<div>
									<input type="submit" value="Log in" /> <a href="#myModal1"
										data-toggle="modal">Forgot password?</a> <a
										href="${pageContext.request.contextPath}/signuphome">Register</a>
								</div>
							</form>
						</section>
						<!-- content -->
					</div>
				</div>
				<!-- container1 -->
			</div>

			<div class="row" style="margin-top: 0px;">
				<h4>
					<i class="fa fa-th-list" aria-hidden="true"></i> Here what
					Equityjudge Portfolio offers to you:
				</h4>
				<ul type="disc">

					<li><p style="font-size: 14px">
							<u>Investment Growth</u>: Equityjudge's portfolio will help you
							to analyze growth of your stock holdings.
						</p></li>

					<li><p style="font-size: 14px">
							<u>Simple and User-friendly Environment</u>: Equityjudge's main
							motive is to make investment easy. From making portfolio,
							Buying/Selling or analyzing your current status. Equityjudge's
							portfolio handle it for you at click of button.
						</p></li>
				</ul>
			</div>


			<!-- row -->
		</div>
	</div>
</body>
</html>