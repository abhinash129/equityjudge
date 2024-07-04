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
							<h2>Equityjudge Registration</h2>
							<hr>
						</div>

						<form:form name='form' class='form-horizontal' role='form'
							action="${pageContext.request.contextPath}/signup"
							novalidate="true" modelAttribute="signupCommand"
							onsubmit="if(document.getElementById('agree').checked) { return true; } else { alert('Please indicate that you have read and agree to the Terms and Conditions and Privacy Policy'); return false; }">
							<div style="margin-left: 70px">
								<div class='form-group' style="margin-top: 20px">
									<!-- 								<label class='control-label col-md-2' for='id_title'>Name(*)</label> -->

									<div class='row col-sm-12 col-md-10 '>
										<div class='col-sm-3 col-md-2'>
											<div class='form-group internal'>

												<form:select path="title" class='form-control'>
													<c:forEach items="${title}" var="var">
														<form:option value="${ var.displayname }" />
													</c:forEach>
												</form:select>
											</div>
										</div>

										<div class='col-sm-5 col-md-4'>
											<div class='form-group internal'>
												<form:input path="firstName" id="first_name"
													ng-model="firstName" ng-maxlength="16" ng-required="true"
													ng-init="firstName='${signupCommand.firstName}'"
													class="form-control" placeholder="First Name"
													ng-pattern="/^[a-zA-Z ]*$/" tabindex="1" />
											</div>


										</div>


										<div class='col-sm-4 col-md-4'>
											<div class='form-group internal'>
												<form:input path="lastName" id="last_name"
													ng-model="lastName" ng-required="true"
													ng-init="lastName='${signupCommand.lastName}'"
													class="form-control" ng-maxlength="20"
													placeholder="Last Name" ng-pattern="/^[a-zA-Z ]*$/"
													tabindex="2" />
											</div>
										</div>
									</div>

									<div class='row col-sm-12  col-md-12 col-md-offset-1'>
										<div class='col-sm-7 col-md-4'>
											<div class="form-group" style="margin-left: 0px"
												ng-class="{ 'has-error' : form.firstName.$invalid && (form.firstName.$dirty || submitted)}">
												<form:errors path="firstName" cssClass="error" />
												<span style="color: red"
													ng-show="form.firstName.$error.maxlength "
													class="help-block">Length less than 16</span>

												<p style="color: red;"
													ng-show="form.firstName.$error.required && (form.firstName.$dirty || submitted)"
													class="help-block">firstName required.</p>
												<span style="color: red;"
													ng-show="form.firstName.$invalid && form.firstName.$error.pattern && (form.firstName.$dirty || submitted)"
													class="help-block">Only Alphabetics is allow... </span>
											</div>
										</div>
										<div class='col-sm-5 col-md-8'>
											<div class="form-group"
												ng-class="{ 'has-error' : form.lastName.$invalid && (form.lastName.$dirty || submitted)}">
												<span style="color: red"
													ng-show="form.lastName.$error.maxlength "
													class="help-block">Length less than 20</span>

												<form:errors path="lastName" cssClass="error" />
												<p style="color: red;"
													ng-show="form.lastName.$error.required && (form.lastName.$dirty || submitted)"
													class="help-block">lastName required.</p>
												<span style="color: red;"
													ng-show="form.lastName.$invalid && form.lastName.$error.pattern && (form.lastName.$dirty || submitted)"
													class="help-block">Only Alphabetics is allow... </span>
											</div>
										</div>
									</div>

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
													ng-model-options="{ updateOn: 'blur' }" ng-minlength="12"
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
													class="help-block">Length aleast 12 character</span> <span
													style="color: red"
													ng-show="form.emailAddress.$error.maxlength "
													class="help-block">Length less than 35</span>
											</div>
										</div>

										<div class='col-sm-4 col-md-4'>
											<div class='form-group'>
												<form:select path="code" class='form-control' tabindex="4">
													<c:forEach items="${countryCode}" var="var">
														<form:option value="${ var.displayname }" />
													</c:forEach>
												</form:select>
											</div>
										</div>
										<div class='col-sm-7 col-md-7'>
											<div class='form-group'>
												<form:input path="phoneNo" id="phone_number"
													class="form-control" ng-required="true"
													ng-init="phoneNo='${signupCommand.phoneNo}'"
													ng-model="phoneNo" ng-minlength="10" ng-maxlength="10"
													ng-pattern="/^[0-9]{10,11}$/"
													placeholder="Phone: xxxxx xxxxx" phone-available="true"
													ng-model-options="{ updateOn: 'blur' }" tabindex="5" />
											</div>
										</div>
										<div style="margin-top: -20px; margin-bottom: -30px"
											class="col-sm-12 col-md-12">
											<div class="form-group"
												ng-class="{ 'has-error' : form.phoneNo.$invalid && (form.phoneNo.$dirty || submitted)}">
												<form:errors path="phoneNo" cssClass="error" />
												<span style="color: red"
													ng-show="form.phoneNo.$invalid &&(form.phoneNo.$dirty || submitted)">
													<span style="color: red"
													ng-show="form.phoneNo.$error.required " class="help-block">PhoneNo
														required.</span>
													<div ng-if="form.$pending.phoneExists">checking....</div>
													<div ng-if="form.$error.phoneExists">
														<span style="color: red;">Phone Number already
															exists</span>
													</div> <span style="color: red"
													ng-show="form.phoneNo.$error.pattern " class="help-block">
														Only numeric value</span> <span style="color: red"
													ng-show="form.phoneNo.$error.minlength  "
													class="help-block">Length equal to 10 digit</span> <span
													style="color: red" ng-show="form.phoneNo.$error.maxlength "
													class="help-block">Length less than 11</span>
												</span>
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
									<label class='control-label' style="padding-bottom: 10px;">How
										you get to know about Equityjudge ??(*)</label>

									<div class='row'>
										<div class="col-sm-12 col-md-7">
											<div class='form-group col-sm-10 col-md-10'>
												<form:select path="reachUs" class='form-control'
													tabindex='9'>
													<c:forEach items="${reachUsList}" var="var">
														<form:option value="${ var.displayname }" />
													</c:forEach>
												</form:select>
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