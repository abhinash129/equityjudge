<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="myApp">
<head>
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
		<div class="box box-default col-md-6">
			<div class="box-body">

				<div class="container">
					<div class="row">
						<div class="col-md-4">
							<h4 style="color: red">${status}</h4>
							<form action="${pageContext.request.contextPath}/payment"
								class="form-horizontal" method="POST" name="form">
								<fieldset>

									<div id="legend">
										<legend style="color: green;">User Payment Details </legend>
									</div>


									<div class="control-group">
										<label class="control-label" for="username"
											style="margin-bottom: 5px; margin-top: 5px">User
											User ID: </label>
										<div class="controls">
											<input type="text" id="username" name="buyer_userId"
												value="${UserDate.userName}" readonly="readonly"
												class="form-control">
										</div>
									</div>

									<div class="control-group">
										<!--               <label class="control-label" for="lastname"></label> -->
										<div class="controls">
											<input type="hidden" id="lastname" name="lastName"
												value="${UserDate.lastName}" readonly="readonly"
												class="form-control input-lg">
										</div>
									</div>
									<div class="control-group">
										<!--               <label class="control-label" for="addressline"></label> -->
										<div class="controls">
											<input type="hidden" id="addressline" name="addressline"
												value="${UserDate.addressLine}" readonly="readonly"
												class="form-control input-lg">
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="email"
											style="margin-bottom: 5px; margin-top: 5px">E-mail:</label>
										<div class="controls">
											<input type="text" id="email" name="email"
												value="${UserDate.email}" class="form-control"
												readonly="readonly">
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="amount"
											style="margin-bottom: 5px; margin-top: 5px">Amount:</label>
										<div class="controls">
											<input type="text" id="amount" name="amount" value="${price}"
												placeholder="" class="form-control" readonly="readonly">
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="phone"
											style="margin-bottom: 5px; margin-top: 5px">Phone:</label>
										<div class="controls">
											<input type="text" id="phone" name="phone"
												value="${UserDate.mobile}" class="form-control"
												readonly="readonly">
										</div>
									</div>
									<span style="color: red"
									ng-show="form.purpose.$error.maxlength " class="help-block">Length
									less than 20</span>
									<div class="control-group">
										<label class="control-label" for="purpose"
											style="margin-bottom: 5px; margin-top: 5px">Purpose(*):</label>
										<div class="controls">
											<input type="text" id="purpose" ng-model="purpose" ng-init="purpose='Subscription'" name="purpose"
												value="Subscription" ng-maxlength="20" 
												ng-required="true" placeholder="purpose(*)" class="form-control">
										</div>
									</div>

									<div class="control-group">
										<!-- Button -->
										<br>
										<div class="controls" align="right">
											<button class="btn btn-success" ng-disabled="form.$invalid">Pay</button>
										</div>
									</div>
								</fieldset>
							</form>

						</div>
					</div>
				</div>
			</div>
		</div>
		</section>
	</div>
</body>
</html>