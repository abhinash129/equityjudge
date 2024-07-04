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
			<h3>User Refund Summary</h3>
		</div>
		<!-- Main content -->
		<section class="content">
		<div class="box box-default col-md-9">
			<div class="box-body">
				<div class="container">
					<div class="row">
						<div class="col-md-6">
								<c:if test="${empty userInfo1}">
									<h3>${status}</h3>
								</c:if>
								<c:if test="${not empty userInfo1}">
									<h3>Refund Successfully</h3>
									<div class="row">
										<div class="box-body">
											<div class="well col-md-11">
												<div class="row col-md-12" style="font-size: large;">
													<table>
														<c:forEach items="${userInfo1}" var="userInfo1">
															<tr>
																<td><b>Buyer UserId</b></td>
																<td>:${userInfo1.buyer_userId}</td>
															</tr>
															<tr>
																<td><b>Payment Id</b></td>
																<td>:${userInfo1.payment_id}</td>
															</tr>
															<tr>
																<td><b>Refund Id</b></td>
																<td>:${userInfo1.refund_id}</td>
															</tr>
															<tr>
																<td><b>Status </b></td>
																<td>:${userInfo1.status}</td>
															</tr>
															<tr>
																<td><b>Type </b></td>
																<td>:${userInfo1.type}</td>
															</tr>
															<tr>
																<td><b>Body/Comment </b></td>
																<td>:${userInfo1.body}</td>
															</tr>
															<tr>
																<td><b>Refund Amount</b></td>
																<td>:${userInfo1.refund_amount}</td>
															</tr>
															<tr>
																<td><b>Total Amount</b></td>
																<td>:${userInfo1.total_amount}</td>
															</tr>
															<tr>
																<td><b>Refund Date </b></td>
																<td>:${userInfo1.refund_date}</td>
															</tr>
														</c:forEach>
													</table>
												</div>
											</div>
										</div>
									</div>
								</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
		</section>
	</div>
</body>
</html>