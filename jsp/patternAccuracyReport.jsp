<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="myApp">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body class="skin-blue sidebar-mini" ng-controller="LoginController">
	<!-- Content Wrapper. Contains page content -->
	<div class="wrapper">
		<!-- Content Header (Page header) -->
		<div class="page-header"
			style="margin-top: -5px; margin-left: 20px; margin-bottom: -10px">
			<h3>Pattern Accuracy</h3><h3>${accDate}</h3>
		</div>
		<section class="content"> <!-- Main content -->
		<div class="col-md-10">
		<table class="table table-bordered table-hover">
			<thead>
				<tr>
					<th>Pattern Name</th>
					<th>Suggestion</th>
					<th>Weeks</th>
					<th>Total Companies
					<th>Accuracy Percentage</th>
					<th>15 Day Cumulative Accuracy</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${Accuracy_List}" var="data">
					<tr>
						<td><c:out value="${data.patternName}" /></td>
						<td><c:out value="${data.suggestion}" /></td>
						<td><c:out value="${data.weeks}" /></td>
						<td><c:out value="${data.totalCompanies}" /></td>
						<td><c:out value="${data.accuracy}%" /></td>
						<td><c:out value="${data.commulative_accuracy_15Days}%" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		</div>
		</section>
	</div>
</body>
</html>
