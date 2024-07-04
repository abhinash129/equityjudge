<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
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

<script type="text/javascript"
	src="<c:url value="/resources/js/country&states.js"/>"></script>

<link rel="stylesheet"
	href="<c:url value="/resources/css/Regstyle.css"/>">

</head>
<body ng-controller="LoginController">
	<!-- Content Wrapper. Contains page content -->
	<div class="wrapper">
		<!-- Content Header (Page header) -->
		<div align="center" style="color: blue;"><h4>${profileMessage}</h4></div>


		<div class="col-md-9">
			<div class='panel panel-primary dialog-panel'>
				<div class='panel-heading'
					style="background-color: #7C7C7F; border-color: #101010;">
					<h5>Equityjudge - Profile Update</h5>
				</div>
				<div class='panel-body'>
					<form:form style="padding: 10px" name="form" method="POST"
						action="${pageContext.request.contextPath}/profileUpdate"
						modelAttribute="userProfileCommand">
						<div class="form-group row">
							<label class="col-md-3 form-control-label"
								style="padding-top: 5px; margin-right: -50px">User ID:</label>
							<div class="col-md-4">
								<form:input class="form-control" path="userName" id="user_Name"
									readonly="true" />
							</div>
						</div>
						<div class="form-group row">
							<label class="col-md-3 form-control-label"
								style="padding-top: 5px; margin-right: -50px">FirstName:</label>
							<div class="col-md-4">
								<form:input class="form-control" path="firstName"
									id="first_Name" placeholder="Enter First Name" required="true" />
							</div>
							<form:errors path="firstName" cssClass="error" />
						</div>
						<div class="form-group row">
							<label class="col-md-3 form-control-label"
								style="padding-top: 5px; margin-right: -50px">LastName:</label>
							<div class="col-md-4">
								<form:input class="form-control" path="lastName" id="lasst_Name"
									placeholder="Enter Last Name" required="true" />
							</div>
							<form:errors path="lastName" cssClass="error" />
						</div>

						<div class="form-group row">
							<label class="col-md-3 form-control-label"
								style="padding-top: 5px; margin-right: -50px">Occupation:</label>
							<div class="col-md-4">

								<form:select path="occupation" class='form-control'>
									<c:forEach items="${occupation}" var="var">
										<form:option value="${ var.displayname }" />
									</c:forEach>
								</form:select>
							</div>
						</div>

						<div class="form-group row">
							<label class="col-md-3 form-control-label"
								style="padding-top: 5px; margin-right: -50px">Address
								Line:</label>
							<div class="col-md-4">
								<form:textarea class="form-control" rows="3" cols="5"
									path="addressLine" id="address_Line"></form:textarea>
							</div>
							<form:errors path="addressLine" cssClass="error" />
						</div>


						<div class="form-group row">
							<label class="col-md-3 form-control-label"
								style="padding-top: 5px; margin-right: -50px">Country:</label>
							<div class="col-md-4">
								<form:select class="form-control" id="country" path="country"
									onfocus="selectCountry()">
									<form:option value="${country }">${country }</form:option>
								</form:select>
							</div>
						</div>



						<div class="form-group row">
							<label class="col-md-3 form-control-label"
								style="padding-top: 5px; margin-right: -50px">State:</label>
							<div class="col-md-4">
								<form:select class="form-control" id="state" path="state">
									<form:option value="${state }">${state }</form:option>
								</form:select>

							</div>
						</div>


						<div class="form-group row">
							<label class="col-md-3 form-control-label"
								style="padding-top: 5px; margin-right: -35px">Mobile:</label>
							<div class="input-group col-md-4">
								<form:input path="mobile" id="mobile" class="form-control"
									placeholder="Enter Phone Number" readonly="true" />
								<div class="input-group-btn">
									<button type="button" class="btn btn-default dropdown-toggle"
										href="#mobileChange" data-toggle="modal" aria-haspopup="true"
										aria-expanded="false">
										<span class="glyphicon glyphicon-pencil" aria-hidden="true"
											style="height: 20px"></span>
									</button>
								</div>
							</div>
						</div>

						<div class="form-group row">
							<label class="col-md-3 form-control-label"
								style="padding-top: 5px; margin-right: -35px">Email:</label>
							<div class="input-group col-md-4">
								<form:input path="email" id="email" class="form-control"
									readonly="true" />
								<div class="input-group-btn">
									<button type="button" class="btn btn-default dropdown-toggle"
										href="#emailChange" data-toggle="modal" aria-haspopup="true"
										aria-expanded="true">
										<span class="glyphicon glyphicon-pencil" aria-hidden="true"
											style="height: 20px"></span>
									</button>
								</div>
							</div>
						</div>
						<div class="form-group row">
							<div class="col-md-offset-2" style="padding-left: 40px">
								<button type="submit" name="submit" class="btn btn-primary">
									<span class="glyphicon glyphicon-floppy-disk"
										aria-hidden="true"></span> Save Change
								</button>
							</div>
						</div>
					</form:form>
				</div>
			</div>
		</div>

		<div class="modal fade" id="mobileChange" role="dialog"
			style="margin-top: 8%">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Mobile Number Update</h4>
					</div>
					<div class="modal-body" style="">

						<div class="row" style="margin-left: 50px">
							<p style="color: blue;">{{mobilemessage}}</p>
							<div class="col-md-12" ng-show="mobileUp"
								style="color: green; font-size: medium;">
								Please wait.. <img
									src="<c:url value="/resources/images/load.gif"/>" height="50px"
									width="50px">
							</div>
						</div>

						<div class="row">
							<form action="#" name="form3" class="col-lg-12">
								<label class="form-control-labels col-lg-2" style="">Mobile
									No.:</label>
								<div class='form-group col-lg-2' style="margin-left: -50px">
									<form:select path='countryCode' ng-model='code'
										class='form-control'>
										<c:forEach items="${countryCode}" var="var">
											<form:option value="${ var.displayname }" />
										</c:forEach>
									</form:select>


								</div>
								<div class='form-group col-lg-4' style="margin-left: -20px">
									<input type="text" name="phoneNo" id="phone_number"
										class="form-control" ng-required="true" ng-model="phoneNo"
										ng-minlength="10" ng-maxlength="10"
										ng-pattern="/^[0-9]{10,11}$/" placeholder="Phone: xxxxx xxxxx"
										phone-available="true" ng-model-options="{ updateOn: 'blur' }" />
								</div>
								<div class="col-lg-2" style="">
									<button type="button" name="submit" class="btn btn-success"
										ng-disabled="form3.$invalid" ng-click="updateMobile();">Update</button>
								</div>

								<div class="row" style="margin-top: 10px; margin-left: 60px">
									<div class="form-group col-lg-10"
										ng-class="{ 'has-error' : form3.phoneNo.$invalid && (form3.phoneNo.$dirty || submitted)}">
										<span style="color: red"
											ng-show="form3.phoneNo.$invalid &&(form3.phoneNo.$dirty || submitted)">
											<span style="color: red"
											ng-show="form3.phoneNo.$error.required " class="help-block">PhoneNo
												required.</span>
											<div ng-if="form3.$pending.phoneExists">checking....</div>
											<div ng-if="form3.$error.phoneExists">
												<span style="color: red;">Phone Number already exists</span>
											</div> <span style="color: red"
											ng-show="form3.phoneNo.$error.pattern " class="help-block">
												Only numeric value</span> <span style="color: red"
											ng-show="form3.phoneNo.$error.minlength  " class="help-block">Length
												equal to 10 digit</span> <span style="color: red"
											ng-show="form3.phoneNo.$error.maxlength " class="help-block">Length
												less than 11</span>
										</span>
									</div>
								</div>

							</form>

						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal"
							ng-click="refressPage();">Close</button>
					</div>
				</div>
			</div>
		</div>


		<div class="modal fade" id="emailChange" role="dialog"
			style="margin-top: 8%">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Email Id Update</h4>
					</div>
					<div class="modal-body">
						<p style="color: blue;">{{emailmessage}}</p>
						<div ng-show="emailUp" style="color: green; font-size: medium;">
							Please wait.. <img
								src="<c:url value="/resources/images/load.gif"/>" height="50px"
								width="50px">
						</div>

						<form action="#" name="form2">
							<label class="form-control-labels"
								style="padding-top: 25px; margin-right: -35px;">Email:</label>
							<div class='form-group'>
								<input type="text"
									style="width: 200px; margin-left: 60px; margin-top: -30px"
									name="emailAddress" id="email" ng-model="emailAddress"
									class="form-control" ng-required="true" email-available="true"
									ng-model-options="{ updateOn: 'blur' }" ng-minlength="12"
									ng-maxlength="35" placeholder="E-mail: xxxxx@domain.com(.in)"
									ng-pattern="/^[_a-z0-9]+(\.[_a-z0-9]+)*@[a-z0-9-]+(\[a-z0-9-]+)*(\.[com|in]{2,3})$/" />
							</div>
							<div style="margin-top: -48px; margin-left: 280px;">
								<button type="button" name="submit" class="btn btn-success"
									ng-disabled="form2.$invalid" ng-click="updateEmail();">Update</button>
							</div>
							<div style="margin-top: 10px; margin-left: 60px">
								<div class="form-group"
									ng-class="{ 'has-error' : form2.emailAddress.$invalid && (form2.emailAddress.$dirty || submitted)}">
									<p style="color: red"
										ng-show="form2.emailAddress.$error.required && (form2.emailAddress.$dirty || submitted)"
										class="help-block">Email required.</p>
									<div ng-if="form2.$pending.emailExists">checking....</div>
									<div ng-if="form2.$error.emailExists">
										<span style="color: red;">Email Id already exists</span>
									</div>
									<span style="color: red"
										ng-show="form2.emailAddress.$invalid && form2.emailAddress.$error.pattern && (form2.emailAddress.$dirty || submitted)"
										class="help-block">Email pattern
										like:_ab1bc2._asc@gmail.(com/in) </span> <span style="color: red"
										ng-show="form2.emailAddress.$error.minlength  "
										class="help-block">Length aleast 12 character</span> <span
										style="color: red"
										ng-show="form2.emailAddress.$error.maxlength "
										class="help-block">Length less than 35</span>
								</div>
							</div>

						</form>
					</div>
					<div class="modal-footer">
						<button type="button" ng-click="refressPage()"
							class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>

		<div class="control-sidebar-bg"></div>
		<script language="javascript">
			function selectCountry() {
				populateCountries("country", "state");
			}
		</script>
	</div>
</body>
</html>
