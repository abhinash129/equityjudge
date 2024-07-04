<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<html ng-app="myApp">
<head>
<title>Nivesh</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
	href="<c:url value="/resources/css/bootstrap.min.css"/>">
	<link rel="stylesheet"
	href="<c:url value="/resources/css/bootstrap.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/layout.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap-theme.css"/>">
<script type="text/javascript"
	src="<c:url value="/resources/js/jquery-2.1.4.min.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/angular.min.js"/>"></script>
	<script type="text/javascript"
	src="<c:url value="/resources/js/canvasjs.min.js"/>"></script>
	<!-- --- -->
	<!-- --- -->
<script type="text/javascript"
	src="<c:url value="/resources/angular/app.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/angular/controller/companyController.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/angular/service/companyService.js"/>"></script>
</head>
<body>
<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">

				<button type="button" class="close" data-dismiss="modal">&times;</button>


				<div class="modal-body" style="border: none; padding: 0px;">

					    <div class="col-xs-12 col-sm-12 col-md-12 ">
		<form name="form"  role="form" method="POST"  action="${pageContext.request.contextPath}/signup">
			<h2 style="color:#000000;">Please Sign Up <small>It's free and always will be.</small></h2>
			<hr class="colorgraph">
			<div class="row">
				<div class="col-xs-12 col-sm-6 col-md-6">
				<div ng-if="form.$pending.usernameExists">checking....</div>
					<div ng-if="form.$error.usernameExists" ><span style="color: red;">User ID already exists</span></div>
					
					<div class="form-group">
						<input type="text"
								class="form-control  input-lg " name="userName" ng-model=userName
								username-available required placeholder="Unique User ID"
								ng-model-options="{ updateOn: 'blur' }">
							
					</div>
					
				</div>
				
				<div class="col-xs-12 col-sm-6 col-md-6">
					<div class="form-group">
                        <input type="text" name="firstName" id="first_name" class="form-control input-lg" placeholder="First Name" tabindex="2" >
					</div>
				</div>
				
			</div>
			<div class="row">
				<div class="col-xs-12 col-sm-6 col-md-6">
					<div class="form-group">
						<input type="text" name="lastName" id="last_name" class="form-control input-lg" placeholder="Last Name" tabindex="3" >
					</div>
				</div>
				<div class="col-xs-12 col-sm-6 col-md-6">
					<div class="form-group">
						<input type="text" name="phoneNo" id="phone_number" class="form-control input-lg"  ng-model="phoneNo" ng-minlength="10" ng-maxlength="13" placeholder="Phone Number" tabindex="4" >
				           <span ng-show="form.phoneNo.$error.required">phone required only numeric</span>  
                                <span ng-show="form.phoneNo.$error.minlength">Length  equal to 10 digit</span>
                                 <span ng-show="form.phoneNo.$error.maxlength">Length less than 13</span>
					</div> 
				</div>
			</div>
			<div class="form-group">
				<input type="email" name="emailAddress" id="email" ng-model="emailAddress" class="form-control input-lg" placeholder="Email Address" tabindex="5" required  pattern="^[a-z0-9._%+-]+@[a-z0-9.-]+\.(com|in|abc)$">
			                  <span ng-show="form.emailAddress.$error.required">Email Required</span>
                             <span ng-show="form.emailAddress.$error.email">provide email like: abc@gmail.com</span>
			</div>
			<div class="row">
				<div class="col-xs-12 col-sm-6 col-md-6">
			    <div class="form-group" ng-class="{ 'has-error' : form.password.$invalid  && (form.password.$dirty) }" >
			          <input type="Password" name="password" class="form-control input-lg" ng-model="password" placeholder="Your Password" ng-required="true">
			    	<p ng-show="form.password.$error.required  && (form.password.$dirty) " class="help-block">Your password is required.</p>
				</div>
				</div>
				
				<div class="col-xs-12 col-sm-6 col-md-6"> 
                <div  ng-class="{ 'has-error' : form.confirmPassword.$invalid  && (form.password.$dirty) }" >
		              <input type="Password" name="confirmPassword" class="form-control input-lg" ng-model="confirmPassword" placeholder="Confirm Your Password" ng-compare="password" ng-required="true">
		              <p ng-show="form.confirmPassword.$error.required  && (form.confirmPassword.$dirty)" class="help-block">Your confirm password is required.</p>
		               <p ng-show="form.confirmPassword.$error.compare  && (form.confirmPassword.$dirty)" class="help-block">Confirm password does not match.</p>
		         </div>

				</div> 
			</div>
			
			
			<hr class="colorgraph">
			<div class="row">
				<div class="col-xs-12 col-md-6 pull-right"><input type="submit" value="Register"  onclick= return validate(); class="btn btn-primary btn-block btn-lg" tabindex="7"></div>
				
			</div>
		</form>
	</div>				
	
		</div>


				<div class="modal-footer"></div>
			</div>

		</div>
	</div>
</body>
</html>