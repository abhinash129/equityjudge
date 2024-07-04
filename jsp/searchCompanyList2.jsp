<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.nv-legend {
	transform: translate(-80px, 370px);
}
</style>

<script type="text/javascript"
	src="<c:url value="/resources/angular/controller/graphController.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/angular/service/graphService.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/angular/service/watchlist_Service.js"/>"></script>
</head>
<body ng-app="myApp" ng-controller="GraphController">
	<div class="wrapper">
		<!-- Main content -->
		<section class="content">
			<div class="row">
					<div class="col-md-12">
					<form
							action="${pageContext.request.contextPath}/graphpattern/graph/detailsList"
							method="post" novalidate name="form">
							<div class="col-md-4" style="margin-bottom: 10px">
								<input type="text" name="companyName"
									placeholder="Search company" class="form-control"
									ng-model="companyName" ng-change="search()" required>
							</div>
							<div class="col-md-1" style="margin-left: -25px;">
								<button type="submit" ng-disabled="form.$invalid" class="btn btn-primary">GO</button>
							</div>
						</form>
				</div>

				<div class="col-xs-12">
					<div class="box">
						<div class="box-header">
							<h1 style="color: blue;">Select Stock</h1>
							<h5>Your search criteria ${companyName } gave ${size }
								results.</h5 >
						</div>
						<div class="box-body">
							<c:if test="${size gt 0}">
							<div class="table-responsive col-md-8">
								<table class="table table-striped table-bordered table-hover">
									<thead>
									<tr>
										<th>Company Name</th>
									</tr>
									</thead>
									<tbody>
										<c:forEach items="${companyNameList }" var="CompnyList">
										<tr>
											<td><a href="${pageContext.request.contextPath}/graphpattern/graph/selectCompnyDemo?companyName=${CompnyList.companyName }"><u>${CompnyList.companyName }</u></a></td>
										</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							</c:if>
						</div>
						<!-- /.box-body -->
					</div>
					<!-- /.box -->
				</div>
			</div>
		</section>
		<!-- /.content -->
	</div>
	<!-- /.wrapper -->
</body>
</html>