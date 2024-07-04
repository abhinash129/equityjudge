<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
			<h3>User Payment Summary</h3>
		</div>
		<!-- Main content -->
		
		<section class="content">
		<div class="box box-default col-md-10">
			<div class="box-body">
				<h4 style="color: green">
					<span class="glyphicon glyphicon-ok-circle"></span> Payment
					Successfully Done!! Please login now.... <a href="<c:url value="/graphpattern/graph/home"/>"><u>Login</u></a>
				</h4>
				<c:forEach items="${userInfo}" var="userInfo1">
					<h5>
						Check Your Mail-id :<span style="color: blue">${userInfo1.email}</span>
					</h5>
				</c:forEach>
				<div class="container">
					<div class="row">
						<div class="well col-md-9">
							<div class="row col-md-8" style="font-size: large;">
								<table>
									<c:forEach items="${userInfo}" var="userInfo1">
										<tr>
											<td><b>Buyer UserId</b></td>
											<td>:${userInfo1.buyer_userId}</td>
										</tr>
										<tr>
											<td><b>Amount</b></td>
											<td>:${userInfo1.amount}</td>
										</tr>
										<tr>
											<td><b>Payment Id</b></td>
											<td>:${userInfo1.payment_id}</td>
										</tr>
										<tr>
											<td><b>Status </b></td>
											<td>:${userInfo1.status}</td>
										</tr>
										<tr>
											<td><b>Currency </b></td>
											<td>:${userInfo1.currency}</td>
										</tr>
										<tr>
											<td><b>Email </b></td>
											<td>:${userInfo1.email}</td>
										</tr>
										<tr>
											<td><b>Phone </b></td>
											<td>:${userInfo1.phone}</td>
										</tr>
										<tr>
											<td><b>Deposit Date </b></td>
											<td>:${userInfo1.auditDateTime}</td>
										</tr>
									</c:forEach>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		</section>
	</div>
</body>
</html>