<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="myApp">
<head>
<script type="text/javascript">
function blinker() {
    $('.blink_me').fadeOut(500);
    $('.blink_me').fadeIn(250);
}
setInterval(blinker, 1500);


</script>
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
							<form action="${pageContext.request.contextPath}/paymentSubscription"
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
												value="${userId}" readonly="readonly"
												class="form-control">
										</div> 
									</div>
									 <div class="control-group">
										<label class="control-label" for="duration"
											style="margin-bottom: 5px; margin-top: 5px">Duration:</label>
										<div class="controls">
											<input type="text" id="duration" name="duration" value="1 Days"
												placeholder="" class="form-control" readonly="readonly">
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="amount"
											style="margin-bottom: 5px; margin-top: 5px">Amount:</label>
										<div class="controls">
											<input type="text" id="amount" name="amount" value="50"
												placeholder="" class="form-control" readonly="readonly">
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
												value="Subscription" ng-maxlength="20" readonly
												ng-required="true" placeholder="purpose(*)" class="form-control" readonly="readonly">
										</div>
									</div>
									<div class="control-group">
										<!-- <label class="control-label" for="email"
											style="margin-bottom: 5px; margin-top: 5px">E-mail:</label> -->
										<div class="controls">
											<input type="hidden" id="email" name="email" class="form-control" value="${email}" readonly="readonly"
											 pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" title="Please Eneter Your Mail Id">
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="Transaction Id"
											style="margin-bottom: 5px; margin-top: 5px">Transaction Id(*):</label>
										<div class="controls">
											
											<input type="text" id="transation"  name="payment_id"  minlenght="8"
												  placeholder="Transaction ID" class="form-control"maxlength="14" minlength="8"
											pattern="[7-9]{1}[0-9]{9}{a-z}" title="Enter Valid Trasaction Number" required >
										</div>
									</div>
									<br/>
									<div class="control-group">
										<!-- Button -->
										<div class="controls" align="right">
											<button class="btn btn-success" ng-disabled="form.$invalid">Done</button>
										</div>
									</div>
								</fieldset>
							</form>

						</div>
					</div>
				</div>
			</div>
		</div>
		<!--  account details-->
		
	<div class="box box-default col-md-6">
			<div class="box-body">
				<div class="container">
					<div class="row">
							<table>
							<th style="font-weight: bolder; color: red; font-size: 18px; font-family: monospace; ">
							<span class="blink_me">*Transfer Money For Subscription*</span></th>
							<tr>
							<td><br><b style="font-size:17px;">Account Name :</b> 
							<span style="font-size:15px; font-family:monospace;">QUALDE DIGITAL SERVICES PRIVATE LIMITED</span></td></tr>
							<tr><td><b style="font-size:17px;">Account No &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:</b>
							<span style="font-size:15px; font-family:monospace;">32796420067</td></tr>
							<tr><td><b style="font-size:17px;">IFSC Code &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:</b> 
							<span style="font-size:15px; font-family:monospace;">SBIN0015615</td></tr>
							<tr><td><b style="font-size:17px;">Swift BIC  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:</b> 
							<span style="font-size:15px; font-family:monospace;">SBININBB262</td></tr>
							<br>
							<tr>
							<td><b style="font-size:17px;">Bank Name &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:</b> 
							<span style="font-size:15px; font-family:monospace;">STATE BANK OF INDIA</td></tr>
							<tr><td><b style="font-size:17px;">Branch Name &nbsp;&nbsp;:</b> 
							<span style="font-size:15px; font-family:monospace;">DODDANEKKUNDI BANGALORE 560037</td></tr>
							<tr><br><td><br><img alt="" src="/Nivesh_Development/resources/images/paytm.jpg" width="250" height="300"></td></tr>
							</table>
							<br>
							<span style="color:red; font-size:15px; font-family:monospace;"">*Note</span>
							&nbsp;<span style="font-size:12px; font-family: monospace;">First Make Your Payment Done Then Fill The Trascation ID</span><br>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<span style="font-size:12px; font-family: monospace;">Any query mail on <a href="#" style="color: red;">info@equityjudge.com</a></span>
					</div>
				</div>
			</div>
		</div>
		
		

		
		</section>
	</div>
</body>
</html>