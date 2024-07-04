<%@page import="com.nivesh.command.signup.SignupCommand"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html>
<html>
<head>
<style>
.button {
    background-color: lime; /* Green */
    border: none;
    color: d3d3d3;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
}

.button1 {border-radius: 8px;
}

.error {
	color: red;
}
</style>
<link rel="stylesheet"
	href="<c:url value="/resources/css/Regstyle.css"/>">

<script type="text/javascript"
	src="<c:url value="/resources/angular/controller/loginController.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/angular/service/loginService.js"/>"></script>


</head>
<body ng-app="myApp">

	<div class="wrapper" ng-controller="LoginController">
		<div class='container' style="margin-top: 30px;">

			<div class="row">
				<div class="col-sm-4 col-md-5" style="margin-top: 0px" align="center">
					<img alt=""
						src='<c:url value="/resources/images/register-icon.png" />'
						class="img-square img-responsive" height="200px" width="200px">
						<img alt=""
						src='<c:url value="/resources/images/registration.jpg" />'
						class="img-square img-responsive">
				</div>
			

			<div class="col-sm-8 col-md-7">
				<div class='panel dialog-panel'>
					<div class='panel-body'
						style="background-color: rgba(22, 121, 6, 0.33);">
						<div align="center">
							<h2>Equityjudge Guest Registration</h2>
							<hr>
						</div>

						<form:form name='form' class='form-horizontal' role='form'
							action="${pageContext.request.contextPath}/guestSignup"
							novalidate="true" modelAttribute="signupCommand"
							onsubmit="if(document.getElementById('agree').checked) { return true; } else { alert('Please indicate that you have read and agree to the Terms and Conditions and Privacy Policy'); return false; }">
							<div style="margin-left: 70px">
								<div class='form-group' style="margin-top: 20px">
									<!-- 								<label class='control-label col-md-2' for='id_title'>Name(*)</label> -->

								</div>

								<div class='form-group' style="margin-top: -20px">
									<!-- 								<label class='control-label col-md-2' for='id_email'>Contact(*)</label> -->

									<div class='row col-sm-9 col-md-6'>
										<div class='form-group'>
											<div class='col-sm-11 col-md-11'>
												<form:input path="emailAddress" id="email"
													ng-model="emailAddress" class="form-control"
													ng-init="emailAddress='${signupCommand.emailAddress}'"
													ng-required="true" tabindex="3" email-available="true"
													ng-model-options="{ updateOn: 'blur' }" ng-minlength="9"
													ng-maxlength="35"
													placeholder="E-mail: xxxxx@domain.com(.in)"
													ng-pattern="/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/" />
											</div>
										</div>
										<div style="margin-top: -20px; margin-bottom: -25px"
											class="col-sm-12 col-md-12">
											<div class="form-group"
												ng-class="{ 'has-error' : form.emailAddress.$invalid && (form.emailAddress.$dirty || submitted)}">
												<form:errors path="emailAddress" cssClass="error" />
												<p style="color: red"
													ng-show="form.emailAddress.$error.required && (form.emailAddress.$dirty || submitted)"
													class="help-block">Email required.</p>
												<div ng-if="form.$pending.emailExists">checking....</div>
												<div ng-if="form.$error.emailExists">
													<span style="color: red;">Email Id already exists</span>
												</div>
												<span style="color: red"
													ng-show="form.emailAddress.$invalid && form.emailAddress.$error.pattern && (form.emailAddress.$dirty || submitted)"
													class="help-block">Email pattern
													like:_ab1bc2._asc@gmail.(com/in) </span> <span style="color: red"
													ng-show="form.emailAddress.$error.minlength  "
													class="help-block">Length aleast 9 character</span> <span
													style="color: red"
													ng-show="form.emailAddress.$error.maxlength "
													class="help-block">Length less than 35</span>
											</div>
										</div>
									</div>
								</div>

								<div class='form-group'>
									<!-- 								<label class='control-label col-md-2'>User ID(*)</label> -->

									<div class='row col-sm-11 col-md-10' style="margin-left: -30px">
									<div class='col-sm-10 col-md-7'>
											<form:input path="userName" ng-model="userName"
												ng-init="userName='${signupCommand.userName}'"
												ng-required="true" class="form-control" ng-maxlength="30"
												ng-minlength="5" ng-pattern="/^[A-Za-z0-9_@./#&+-]*$/"
												username-available="true" placeholder="Unique User ID"
												tabindex="6" ng-model-options="{ debounce : 100 }" />
										</div>

										<div class='col-sm-12 col-md-7' style="margin-top: 10px">
											<form:errors path="userName" cssClass="error" />
											<span style="color: red"
												ng-show="form.userName.$error.maxlength " class="help-block">Length
												less than 30</span>
												<span style="color: red"
												ng-show="form.userName.$error.minlength " class="help-block">Length
												more than 5</span>
												 <span style="color: red;"
												ng-show="form.userName.$error.required && (form.userName.$dirty || submitted)"
												class="help-block">User ID required.</span> <span
												ng-if="form.$pending.usernameExists"> <i>Validating....</i>
											</span> <span ng-if="form.$error.usernameExists"> <span
												style="color: red;">User ID already exists</span>
											</span> <span style="color: red;"
												ng-show="form.userName.$invalid && form.userName.$error.pattern && (form.userName.$dirty || submitted)"
												class="help-block">Use Only A-Z,a-z,0-9,_,@,.,/
												,#,&,+,- Characters...Space not allowed </span> <span
												class="form-group"
												ng-class="{ 'has-error' : form.userName.$invalid && (form.userName.$dirty || submitted)}">
											</span>
										</div>
									</div>
								</div>


								<div class='form-group'>
									<!-- 								<label class='control-label col-md-2'>Password(*)</label> -->
									<div class='row col-sm-11 col-md-6'>
										<div class='form-group'>
											<div class='col-sm-9 col-md-11'>
												<form:input path="password" type="password" name="password"
													class="form-control" ng-model="password" ng-minlength="6"
													ng-maxlength="20" placeholder="Your Password"
													ng-required="true" tabindex="7" />
											</div>
										</div>
										<div class="col-sm-12 col-md-12"
											style="margin-top: -20px; margin-bottom: -15px">
											<div class="form-group"
												ng-class="{ 'has-error' : form.password.$invalid  && (form.password.$dirty || submitted) }">
												<form:errors path="password" cssClass="error" />
												<span style="color: red"
													ng-show="form.password.$error.required  && (form.password.$dirty || submitted) "
													class="help-block">password required.</span> <span
													style="color: red"
													ng-show="form.password.$error.minlength  "
													class="help-block">Length aleast 6 character</span> <span
													style="color: red"
													ng-show="form.password.$error.maxlength "
													class="help-block">Length less than 20</span>
											</div>
										</div>



										<div class='form-group'>
											<div class='col-sm-9 col-md-11'>
												<form:input path="confirmPassword" type="password"
													name="confirmPassword" class="form-control"
													ng-model="confirmPassword" ng-required="true"
													placeholder="Confirm Your Password" ng-compare="password"
													tabindex="8" />
											</div>
											<div class="col-sm-12 col-md-12"
												style="margin-top: 0px; margin-bottom: -15px; margin-left: 10px">
												<div class="form-group"
													ng-class="{ 'has-error' : form.confirmPassword.$invalid  && (form.confirmPassword.$dirty || submitted) }">

													<form:errors path="confirmPassword" cssClass="error" />
													<span style="color: red;"
														ng-show="form.confirmPassword.$error.required  && (form.confirmPassword.$dirty || submitted)"
														class="help-block">Confirm password required.</span> <span
														style="color: red;"
														ng-show="form.confirmPassword.$error.compare  && (form.confirmPassword.$dirty || submitted)"
														class="help-block">Confirm password does not match.</span>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class='form-group'>
									<div class='row col-sm-12  col-md-12'>
										<input type="checkbox" name="checkbox" value="check"
											id="agree" tabindex="10" /> I have read and agree to the <a
											href="${pageContext.request.contextPath}/terms-and-conditions"
											onclick="window.open('${pageContext.request.contextPath}/terms-and-conditions', 'newwindow', 'width=600, height=500'); return false;"><u>Terms
												and Conditions</u></a>, <a
											href="${pageContext.request.contextPath}/disclaimer"
											onclick="window.open('${pageContext.request.contextPath}/disclaimer', 'newwindow', 'width=600, height=500'); return false;"><u>Disclaimer</u></a>
										and <a
											href="${pageContext.request.contextPath}/terms-and-conditions"
											onclick="window.open('${pageContext.request.contextPath}/terms-and-conditions', 'newwindow', 'width=600, height=500'); return false;"><u>Privacy
												Policy</u></a>.
									</div>
								</div>


								<div class='form-group'>
									<div class='row col-sm-3 col-md-3'>
										<button class='btn btn-primary' ng-disabled="form.$invalid"
											type='submit'>Register</button>
									</div>
									<button type="button" class="btn btn-primary"   onclick="window.location.href='${pageContext.request.contextPath}/suscribe?time=1%20Days&price=50'">Already Register</button>	
								</div>
							</div>
						</form:form>
					</div>
				</div>
			</div>


</div>


		</div>
	</div>
</body>
</html>