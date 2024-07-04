<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="myApp">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="wrapper">
		<!-- Content Header (Page header) -->
		<div class="page-header"
			style="margin-top: -5px; margin-left: 20px; margin-bottom: -10px">
			<h3>User Refund Process</h3>
		</div>
		<!-- Main content -->
		<section class="content">
		<div class="box box-default col-md-9">
			<div class="box-body">

				<div class="box-header with-border">
					<div class="row">
						<div class="col-md-12">
							<h4 class="box-title">Fill User Details</h4>
						</div>
					</div>
				</div>


				<!-- 			user login authentication -->
				<form name="form" id="form" class="form" role="form" method="POST"
					action="${pageContext.request.contextPath}/refundInfoFrmDb">

					<p style="color: red; margin: 20px 0px -10px 140px">
						<strong>${status} </strong>
					</p>
					<div class="row">
						<div class="col-md-12">
							<br>
							<div class="col-md-6">
								<div class="col-md-5" style="padding: 5px 0px 0px 25px">
									<label>Buyer Login Id</label>
								</div>
								<div class="col-md-7">
									<div class="form-group">
										<div class="inner-addon left-addon"><input type="text" class="form-control" name="buyer_userId"
										placeholder="User ID" required>
										</div>
									</div>
								</div>

								<div class="col-md-5" style="padding: 5px 0px 0px 25px">
									<label>Buyer Payment ID</label>
								</div>
								<div class="col-md-7">
									<div class="form-group">
										<div class="inner-addon left-addon">
											<input type="text" class="form-control" name="payment_id"
										placeholder="Payment Id" required>
										</div>
									</div>
								</div>

								<div class="col-md-12">
									<div class="col-md-4"
										style="margin-left: 260px">
										<div class="form-group">
											<button type="submit" class="btn btn-primary btn-block">Submit</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
		</section>


	</div>
</body>
</html>