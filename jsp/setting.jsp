<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html ng-app="myApp">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<script type="text/javascript"
	src="<c:url value="/resources/angular/controller/loginController.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/angular/service/loginService.js"/>"></script>
</head>
<body class="skin-blue sidebar-mini" ng-controller="LoginController">
	<!-- Content Wrapper. Contains page content -->
	<div class="wrapper">
		<!-- Content Header (Page header) -->
		<div class="page-header"
			style="margin-top: -5px; margin-left: 20px; margin-bottom: -10px">
			<h3>Setting</h3>
		</div>



		<!-- Main content -->
		<section class="content">
		<div class="box box-default col-md-9">
			<div class="box-header with-border">
				<h3 class="box-title">Change Password</h3>
			</div>
			<div class="box-body">
			<form action="#" name="form">
			<h4 style="color: green;" align="center">{{successMsg}}</h4>
			<h4 style="color: red;" align="center">{{ErrorMsg}}</h4>
			
					<p ng-show="changePass" style="color: green; font-size: medium;" align="center">
						Please wait.. <img
							src="<c:url value="/resources/images/load.gif"/>" height="50px"
							width="50px">
					</p>
				<div class='form-group col-md-9' style="margin-top: 10px">
					<label class='control-label col-md-3 col-md-offset-2'
						for='id_email'>Old Password</label>
					<div class='col-md-6'>
						<div class='col-md-12'>
							<input name="old_password" type="password"
								class="form-control" ng-model="old_password" placeholder="Enter Your Old Password" ng-required="true" />
						</div>
						<div class="col-md-12">
							<div class="form-group"
								ng-class="{ 'has-error' : form.old_password.$invalid  && (form.old_password.$dirty || submitted) }">
								<p style="color: red;"
									ng-show="form.old_password.$error.required  && (form.old_password.$dirty || submitted)"
									class="help-block">Old password required.</p>
							</div>
						</div>
					</div>

					<label class='control-label col-md-3 col-md-offset-2'
						for='id_email'>New Password</label>
					<div class='col-md-6'>
						<div class='col-md-12'>
							<input name="password" type="password"
								class="form-control" ng-model="password" ng-minlength="6"
								ng-maxlength="20" placeholder="Enter your New Password" ng-required="true" />
						</div>
						<div class="col-md-12" style="margin-top: 0px">
							<div class="form-group"
								ng-class="{ 'has-error' : form.password.$invalid  && (form.password.$dirty || submitted) }">
								<p style="color: red"
									ng-show="form.password.$error.required  && (form.password.$dirty || submitted) "
									class="help-block">New password required.</p>
								<span style="color: red"
									ng-show="form.password.$error.minlength  " class="help-block">Length
									aleast 6 character</span> <span style="color: red"
									ng-show="form.password.$error.maxlength " class="help-block">Length
									less than 20</span>
							</div>
						</div>
					</div>

					<label class='control-label col-md-4 col-md-offset-2'
						for='id_email'>Confirm New Password</label>
					<div class='col-md-6'>
						<div class='col-md-12' style="margin-left: -50px">
							<input name="confirmPassword" type="password" class="form-control"
								ng-model="confirmPassword" ng-required="true"
								placeholder="Confirm Your Password" ng-compare="password"/>
						</div>
						<div class="col-md-12" style="margin-left: -50px">
							<div class="form-group"
								ng-class="{ 'has-error' : form.confirmPassword.$invalid  && (form.confirmPassword.$dirty || submitted) }">
								<p style="color: red;"
									ng-show="form.confirmPassword.$error.required  && (form.confirmPassword.$dirty || submitted)"
									class="help-block">Confirm password required.</p>
								<p style="color: red;"
									ng-show="form.confirmPassword.$error.compare  && (form.confirmPassword.$dirty || submitted)"
									class="help-block">Confirm password does not match.</p>
							</div>
						</div>
					</div>


					<div class='form-group'>
						<div class='col-md-offset-7 col-md-3' style="margin-left: 62%">
							<button class='btn btn-primary' ng-disabled="form.$invalid"
								type="button" ng-click="changePassword();">Change Password</button>
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
