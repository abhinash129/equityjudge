<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="myApp">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<!-- Content Wrapper. Contains page content -->
	<div class="wrapper">
		<!-- Content Header (Page header) -->
		<div class="page-header"
			style="margin-top: -5px; margin-left: 20px; margin-bottom: -10px">
			<h3>User Refund Process</h3>
		</div>
		<!-- Main content -->
		<section class="content">
		<div class="box box-default col-md-8">
			<div class="box-body">

				<div class="container">
					<div class="row">
						<div class="col-md-4">

							<form action="${pageContext.request.contextPath}/refund/amount"
								class="form-horizontal" method="POST">
								<fieldset>
									<div id="legend">
										<legend class="">User Refund Details </legend>
									</div>
									<div class="control-group">
										<label class="control-label" for="buyer_name" style="margin-bottom: 5px; margin-top: 5px">User
											Login Id:</label>
										<div class="controls">
											<input type="text" id="buyer_name" name="buyer_userId"
												value="${userList.buyer_userId}" readonly="readonly"
												class="form-control">
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="paymentid" style="margin-bottom: 5px; margin-top: 5px">PaymentId:</label>
										<div class="controls">
											<input type="text" id="paymentid" name="payment_id"
												value="${userList.payment_id}" readonly="readonly"
												class="form-control">
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="amount" style="margin-bottom: 5px; margin-top: 5px">Amount:</label>
										<div class="controls">
											<input type="text" id="amount" name="amount"
												value="${userList.amount}" required placeholder=""
												class="form-control">
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="email" style="margin-bottom: 5px; margin-top: 5px">E-mail:</label>
										<div class="controls">
											<input type="email" id="email" name="email"
												value="${userList.email}" class="form-control"
												readonly="readonly">
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="phone" style="margin-bottom: 5px; margin-top: 5px">Phone:</label>
										<div class="controls">
											<input type="text" id="phone" name="phone"
												value="${userList.phone}" class="form-control"
												readonly="readonly">
										</div>
									</div>

									<div class="control-group">
										<label class="control-label" for="reason" style="margin-bottom: 5px; margin-top: 5px">Reason Of
											Refund:</label>
										<div class="controls">
											<input type="text" id="reason" placeholder="Reason of refund" name="reason_of_refund"
												class="form-control">
										</div>
									</div>


									<div class="control-group">
										<!--           <label class="control-label" for="phone">Purpose:</label> -->
										<label class=" form-control-label"
											style="padding-top: 5px; margin-right: -50px" style="margin-bottom: 5px; margin-top: 5px">Purpose:</label>
										<!-- 						<div class="col-sm-4"> col-sm-3-->
										<div class='control'>
											<select name="purpose" class="form-control">
												<option value="choose purpose" selected>choose
													purpose</option>
												<option value="RFD">Duplicate/delayed payment</option>
												<option value="TNR">Product/service no longer
													available</option>
												<option value="QFL">Customer not satisfied</option>
												<option value="QNR">Product lost/damaged</option>
												<option value="EWN">Digital download issue</option>
												<option value="TAN">Event was canceled/changed</option>
												<option value="PTH">Problem not described above</option>
											</select>
										</div>
										<!-- 						</div> -->
									</div>


									<div class="control-group">
										<!-- Button -->
										<br>
										<div class="controls" align="right">
											<button class="btn btn-primary">Refund</button>
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