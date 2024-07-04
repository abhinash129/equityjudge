<!-- Nivesh_Development -->
<%@ page import="java.text.Format"%>
<%@ page import="javax.crypto.Mac"%>
<%@ page import="javax.crypto.spec.SecretKeySpec"%>
<%@ page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html ng-app="myApp">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>

	<!-- Content Wrapper. Contains page content -->
	<div class="wrapper">

		<!-- Content Header (Page header) -->
		<div class="page-header"
			style="margin-top: -5px; margin-left: 20px; margin-bottom: -10px">
			<h3>Payment</h3>
		</div>

		<!-- Main content -->
		<section class="content">


		<div class="box box-default col-md-9">
			<div class="box-body">

				<div class="box-header with-border">
					<div class="row">
						<div class="col-md-12">
							<h4 class="box-title">Confirm Your Authentication Details</h4>
						</div>
					</div>
				</div>


				<!-- 			user login authentication -->
				<form name="form" id="form" class="form" role="form" method="POST"
					action="${pageContext.request.contextPath}/paymentAuthenticate">

					<p style="color: red; margin: 20px 0px -10px 140px" >
						<strong>${status} </strong>
					</p>
					<div class="row">
						<div class="col-md-12">
							<br>
							<div class="col-md-6">
								<div class="col-md-3" style="padding: 5px 0px 0px 25px">
									<label>Login Id</label>
								</div>
								<div class="col-md-7">
									<div class="form-group">
										<div class="inner-addon left-addon">
											<i class="glyphicon glyphicon-user"></i> <input type="text"
												class="form-control" name="userName" placeholder="Username"
												required>
										</div>
									</div>
								</div>

								<div class="col-md-3" style="padding: 5px 0px 0px 25px">
									<label>Password</label>
								</div>
								<div class="col-md-7">
									<div class="form-group">
										<div class="inner-addon left-addon">
											<i class="glyphicon glyphicon-lock"></i> <input
												type="password" class="form-control" name="password"
												placeholder="Password" required>
										</div>
									</div>
								</div>

								<div class="col-md-12">
									<div class="col-md-4 col-md-offset-6" style="margin-left: 200px">
										<div class="form-group">
											<button type="submit"
												class="btn btn-success
												 btn-block">Submit</button>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-6" style="margin-top: -15px">
							<div class="well col-md-10">
							<label style="color: navy;">Your Selected Details</label>
							
							<ul>
							<li> <font style="color: green">
									<label>Amount :</label>${ price}
								</font></li>
								<li>
								<font style="color: green">
									<label>Duration :</label>${ time}
								</font></li>
							</ul>
							
							</div>
							</div>

						</div>
					</div>

				</form>
			</div>
		</div>




		</section>
	</div>
</body>
</html>
