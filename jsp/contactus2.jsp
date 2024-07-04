<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body ng-app="myApp">
	<div class="wrapper">

		<div class="container">

			<div class="page-header">
				<h2 style="color:red">Contact Us</h2>
			</div>
			<font style="color: green; font-size: x-large; margin-left: 15px;">${msgSuccess }</font>
			<font style="color: red; font-size: x-large; margin-left: 15px;">${msgError }</font>

			<!-- Contact with Map - START -->
			<div class="container">
				<div class="row col-sm-12 col-md-12">
					<div class="col-sm-6 col-md-6">

						<div class="panel panel-default">
							<div class="text-center headers">Our Office</div>
							<div class="panel-body text-center">
								<h4>Address</h4>
								<div>
									Qualde Digital Services Pvt. Ltd.<br>Unit - D, Ground
									Floor, <br> C - Block, Nester Raga Apts, <br> Outer Ring Road,
									Mahadevapura,<br> Bengaluru, Karnataka 560048<br> Email -
									info@equityjudge.com<br> chairman@qualde.com <br>
									</div>
								<hr />
								<iframe
									src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3887.758818016292!2d77.68861200000002!3d12.987272000000008!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bae1171e7f3bf41%3A0x69aa2b3eb2653235!2sQUALDE+PROJECT+SERVICES+PVT+LTD.%2C+Nester+Raga+Apts%2C+Unit+-+4%2C+C+-+Block%2C+Ground+Floor!5e0!3m2!1sen!2sin!4v1421659184103"
									width="90%" height="280" frameborder="1" style="border: 0"></iframe>

							</div>
						</div>



					</div>
					<div class="col-sm-6 col-md-6">
						<div class="well well-sm">
							<form class="form-horizontal" method="post"
								action="${pageContext.request.contextPath}/dashboard/contactus2"
								name="form" novalidate>
								<fieldset>
									<legend class="text-center headers">Send Mail</legend>
									<div class="form-group">
										<div class="col-md-10 col-md-offset-1">
											<input id="fname" name="fname" ng-model="fname" type="text"
												placeholder="First Name(*)" ng-maxlength="12"
												class="form-control" ng-pattern="/^[a-zA-Z ]*$/" required>
										</div>
									</div>
									<div class="col-md-8 col-md-offset-1"
										ng-class="{ 'has-error' : form.fname.$invalid && (form.fname.$dirty || submitted)}">
										<span style="color: red"
											ng-show="form.fname.$error.maxlength " class="help-block">Length
											less than 12</span>
										<p style="color: red; margin-top: -10px"
											ng-show="form.fname.$error.required && (form.fname.$dirty || submitted)"
											class="help-block">FirstName required...</p>
										<span style="color: red; margin-top: -10px"
											ng-show="form.fname.$invalid && form.fname.$error.pattern && (form.fname.$dirty || submitted)"
											class="help-block">Only Alphabetics are allowed... </span>
									</div>



									<div class="form-group">
										<div class="col-md-10 col-md-offset-1">
											<input id="lname" name="lname" ng-model="lname" type="text"
												placeholder="Last Name(*)" ng-maxlength="12"
												class="form-control" ng-pattern="/^[a-zA-Z ]*$/" required>
										</div>
									</div>
									<div class="col-md-8 col-md-offset-1"
										ng-class="{ 'has-error' : form.lname.$invalid && (form.lname.$dirty || submitted)}">
										<span style="color: red"
											ng-show="form.lname.$error.maxlength " class="help-block">Length
											less than 12</span>

										<p style="color: red; margin-top: -10px"
											ng-show="form.lname.$error.required && (form.lname.$dirty || submitted)"
											class="help-block">LastName required...</p>
										<span style="color: red; margin-top: -10px"
											ng-show="form.lname.$invalid && form.lname.$error.pattern && (form.lname.$dirty || submitted)"
											class="help-block">Only Alphabetics are allowed... </span>
									</div>



									<div class="form-group">
										<div class="col-md-10 col-md-offset-1">
											<input id="email" name="email" ng-maxlength="40"
												ng-model="email" type="text" placeholder="Email Address(*)"
												class="form-control"
												ng-pattern="/^[_a-z0-9]+(\.[_a-z0-9]+)*@[a-z0-9-]+(\[a-z0-9-]+)*(\.[com|in]{2,3})$/"
												required>
										</div>
									</div>
									<div class="col-md-8 col-md-offset-1"
										ng-class="{ 'has-error' : form.email.$invalid && (form.email.$dirty || submitted)}">
										<span style="color: red"
											ng-show="form.email.$error.maxlength " class="help-block">Length
											less than 40</span>

										<p style="color: red; margin-top: -10px"
											ng-show="form.email.$error.required && (form.email.$dirty || submitted)"
											class="help-block">Email Id required...</p>
										<span style="color: red; margin-top: -10px"
											ng-show="form.email.$invalid && form.email.$error.pattern && (form.email.$dirty || submitted)"
											class="help-block">Email pattern
											like:_ab1bc2._asc@gmail.(com/in) </span>
									</div>


									<div class="form-group">
										<div class="col-md-10 col-md-offset-1">
											<input id="phone" name="phone" ng-model="phone" type="text"
												placeholder="Phone" ng-maxlength="15" class="form-control">
										</div>
									</div>
									<div class="col-md-10 col-md-offset-1">
										<span style="color: red"
											ng-show="form.phone.$error.maxlength " class="help-block">Length
											less than 12</span>
									</div>
									<div class="form-group">
										<div class="col-md-10 col-md-offset-1">
											<textarea class="form-control" id="message" name="message"
												ng-model="message" ng-maxlength="200"
												placeholder="Enter your message for us here. We will get back to you within as soon as possible.."
												rows="7" required></textarea>
										</div>
									</div>
									<div class="col-md-8 col-md-offset-1"
										ng-class="{ 'has-error' : form.message.$invalid && (form.message.$dirty || submitted)}">
										<span style="color: red"
											ng-show="form.message.$error.maxlength " class="help-block">Length
											less than 200</span>
										<p style="color: red; margin-top: -10px"
											ng-show="form.message.$error.required && (form.message.$dirty || submitted)"
											class="help-block">Message is required...</p>
									</div>


									<div class="form-group">
										<div class="col-md-12 text-center">
											<button type="submit" class="btn btn-primary btn-lg"
												ng-disabled="form.$invalid">Submit</button>
										</div>
									</div>
									<div align="center">
										<u style="color:red">Note</u> : (*) fields are mandatory.
									</div>
								</fieldset>
							</form>
						</div>
					</div>
				</div>
			</div>

			<style>
.headers {
	background-color: blue;
	color: black;
	height: 70px;
	font-size: 27px;
	padding: 10px;
}
</style>
		</div>


	</div>
</body>
</html>