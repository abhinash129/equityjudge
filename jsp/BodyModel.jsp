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
				
			</div>
		</div>
		</section>
	</div>
</body>
</html>
