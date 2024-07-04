<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<script type="text/javascript">
	$(document).ready(function() {
		$(".trigger").click(function() {
			$(".panel1").toggle("fast");
			$(this).toggleClass("active");
			return false;
		});
	});
</script>

<style type="text/css">
#main-menu ul {
	margin: -8px auto;
	padding: 0px;
	position: relative;
}
.form-container {
	width: 360px;
	min-height: 40px;
	margin: 6px 0 10px 0;
	overflow: hidden;
	text-align: left;
	border: 1px solid #ccc;
	-moz-border-radius: 8px;
	-webkit-border-radius: 8px;
	border-radius: 8px;
	background-image: -webkit-gradient(linear, left top, left bottom, from(#f8f8f8),
		to(#eeeeee));
	background-image: -webkit-linear-gradient(top, #f8f8f8, #eeeeee);
	background-image: -moz-linear-gradient(top, #f8f8f8, #eeeeee);
	background-image: -ms-linear-gradient(top, #f8f8f8, #eeeeee);
	background-image: -o-linear-gradient(top, #f8f8f8, #eeeeee);
	background-image: linear-gradient(top, #f8f8f8, #eeeeee);
	-moz-box-shadow: 0 4px 0 #ddd, 0 6px 8px rgba(0, 0, 0, .5);
	-webkit-box-shadow: 0 4px 0 #ddd, 0 6px 8px rgba(0, 0, 0, .5);
	box-shadow: 0 4px 0 #ddd, 0 6px 8px rgba(0, 0, 0, .5);
}

.search-field {
	float: left;
	width: 300px;
	height: 30px;
	margin: 6px 0 0 6px;
	padding: 0 6px;
	font-family: 'Open Sans', Arial, sans-serif;
	font-size: 14px;
	color: #888;
	font-style: italic;
	font-weight: 200;
	background: #fff;
	border: 1px solid #ccc;
	-moz-border-radius: 8px;
	-webkit-border-radius: 8px;
	border-radius: 8px;
	background-image: -webkit-gradient(linear, left top, left bottom, from(#f5f5f5),
		to(#ffffff));
	background-image: -webkit-linear-gradient(top, #f5f5f5, #ffffff);
	background-image: -moz-linear-gradient(top, #f5f5f5, #ffffff);
	background-image: -ms-linear-gradient(top, #f5f5f5, #ffffff);
	background-image: -o-linear-gradient(top, #f5f5f5, #ffffff);
	background-image: linear-gradient(top, #f5f5f5, #ffffff);
	-moz-box-shadow: 0 1px 1px #e2e2e2 inset, 0 1px 0 #fff;
	-webkit-box-shadow: 0 1px 1px #e2e2e2 inset, 0 1px 0 #fff;
	box-shadow: 0 1px 1px #e2e2e2 inset, 0 1px 0 #fff;
}
}
</style>

<link href="<c:url value="/resources/dist/autocomplete/jquery-ui.css"/>"
	rel="stylesheet">
<script
	src="<c:url value="/resources/dist/autocomplete/jquery-ui.js" />"></script>

<script type="text/javascript"
	src="<c:url value="/resources/angular/controller/module_controller.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/angular/service/module_service.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/angular/controller/loginController.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/angular/service/loginService.js"/>"></script>

<script type="text/javascript"
	src="<c:url value="/resources/angular/controller/autoCompleteController.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/angular/service/autoCompleteService.js"/>"></script>


<!-- For Datepicker -->
<link href="<c:url value="/resources/css/datepicker.css"/>"
	rel="stylesheet" type="text/css" />	
<script src="<c:url value="/resources/js/datepicker.js"/>"></script>
<script src="<c:url value="/resources/js/init.js"/>"></script>

</head>
<body>
<noscript>
			<meta HTTP-EQUIV="REFRESH"
				content="3; url=<c:url value="/javascriptdisabled" />">
		</noscript>
	<div class="row" style="z-index: 1">
		<div class="col-sm-12 col-md-12">
			<div class="col-sm-12 col-md-4">
				<a href="<c:url value="/login_home"/>"> <img
					src="<c:url value="/resources/header/images/logo.png"/>"
					class="img-responsive" />
				</a>
			</div>

			<div class="col-sm-6 col-md-4" ng-controller="AutoCompleteController"
				style="margin-left: 0px;">
				<form class="form-container"
					action="${pageContext.request.contextPath}/graphpattern/graph/details"
					method="post" novalidate name="form">
					<input type="hidden" name="companyName1"
						ng-model="CommancompanyName" required> <input type="text"
						id="automplete-2" name="companyName" placeholder="Search company"
						class="search-field" ng-model="CommancompanyName"
						ng-change="search()"> &nbsp;
					<button style="margin-top: 7px;" ng-disabled="form.$invalid"
						type="submit" class="btn btn-primary">
						<i class="fa fa-search"></i>
					</button>
				</form>
			</div>

			<div class="col-sm-6 col-md-4" style="margin-top: 12px; ">

				<div class="col-sm-8 col-md-8" align="right">
					<div class="nav navbar-right top-nav">
						<button type="submit"
							class="dropdown-toggle btn btn-success btn-md"
							data-toggle="dropdown">
							<i class="fa fa-user"></i> ${sessionScope.sessionBO.userName} <i
								class="fa fa-chevron-down"></i>
						</button>
						<ul class="dropdown-menu">
							<li><a href="${pageContext.request.contextPath}/profile"><i
									class="fa fa-fw fa-pencil"></i>Profile</a></li>
							<li><a href="${pageContext.request.contextPath}/settings"><i
									class="fa fa-fw fa-gear"></i>Change Password</a></li>
							<%-- <li class="divider"></li>
								<li><a href="${pageContext.request.contextPath}/logout/"><i
									class="fa fa-fw fa-power-off"></i> Log Out</a></li> --%>
						</ul>
					</div>
				</div>

				<div class="col-sm-4 col-md-4" align="left">
					<form action="${pageContext.request.contextPath}/logout/"
						method="get">
						<button type="submit" class="btn btn-danger btn-md">
							<i class="fa fa-sign-out"></i> Logout
						</button>
					</form>
				</div>

			</div>
		</div>
	</div>


	<div class="row" style="background-color: #7c7c7f;z-index: 99999">
		<div id="menu-container" class="col-sm-12 col-md-11"
			ng-controller="ModuleController"
			data-ng-init="getModules('${sessionScope.sessionBO.role }')">
			<nav id="main-menu" >
				<ul class="menu" >

				<li class="menu-item-simple-parent"><a
					href="<c:url value="/dashboard/home/home"/>">Home</a></li>

				<li class="menu-item-simple-parent"
					ng-repeat="allmodules in listmodules"><a
					ng-repeat-start="(menu, value) in allmodules" href="#">{{menu}}</a>
					<ul class="sub-menu" style="z-index: 9999999">
						<li ng-repeat="(key1, value1) in value"><a
							href="${pageContext.request.contextPath}{{key1}}">
								<div ng-repeat="(submenu, value2) in value1">{{submenu}}</div>
						</a></li>
					</ul>
					<p ng-repeat-end></p></li>
                    <li class="menu-item-simple-parent"><a
					href="<c:url value="/graphpattern/latestpattern"/>">Suggestion<span class="blinking" style="font-size:16px;color:rgb(255, 0, 0)"><sup>NEW</sup></span></a></li>
				
				
				
				<li class="menu-item-simple-parent"><a
					href="<c:url value="/dashboard/aboutus/home"/>">About Us</a></li>


				<li class="menu-item-simple-parent"><a
					href="<c:url value="/dashboard/contactus/home"/>">Contact Us</a></li>

				<li class="menu-item-simple-parent"><a
					href="<c:url value="/dashboard/subscribe/home"/>">Customer Area</a></li>

                 <li class="menu-item-simple-parent">
                  <a href="#myModal2" data-toggle="modal">Algorithmic Efficacy<span class="blinking" style="font-size:16px;color:rgb(255, 0, 0)"><sup>NEW</sup></span></a>
                  
                  </li>    
                      


			</ul>
			</nav>
		</div>

		<div class="col-sm-1 col-md-1" style="z-index: 1">
			<a class="trigger" href="#" style="color: white">Feedback</a>
		</div>
		<div class="panel1" ng-controller="LoginController" style="z-index: 999999">
			<form method="post" name="form1" novalidate>
				<div>
				<div id="{{hideMe}}">	<h4>{{results}}</h4></div>
				
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
							ng-show="form1.name.$invalid && form1.name.$error.pattern && (form1.name.$dirty || submitted)"
							class="help-block">Only Alphabetics is allow... </span> <span
							style="color: red; margin-top: -10px"
							ng-show="form1.names.$error.maxlength " class="help-block">Name
							Length less than 20</span>
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
							ng-pattern="/^[a-zA-Z ]*$/" ng-init="names='${sessionScope.sessionBO.userName  }'" required>
					</div>
					
<%-- 					ng-init="{{names='${sessionScope.sessionBO.userName  }'}}" --%>
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


<div class="modal fade" id="myModal2" role="dialog">
	<div class="modal-dialog modal-md">
	
	<div class="modal-content">
	<div class="modal-header" style="text-align:center">
	
	<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title"> Algorithmic Efficacy </h4>
	</div>				
	
	<div class="modal-body">
	<form name="fome10" action="${pageContext.request.contextPath}/algoEfficacy/findTop10List" method="post">
	Enter Date:<input type="date"  name="dateofAlgo">
 	Enter No. of Month:<input type="text"  name="monthofAlgo" placeholder="1-12"><br> 
 	<br>
	<button type="submit" class="btn btn-primary">Submit</button>
	
	</form>
	</div>
	
	
	<div class="modal-footer">
	<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	</div>
	
	</div>
	</div>
	</div>
	





</body>
</html>