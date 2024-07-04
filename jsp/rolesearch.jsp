<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"
	src="<c:url value="/resources/angular/controller/role_controller.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/angular/service/role_service.js"/>"></script>
</head>
<body  ng-app="myApp" ng-controller="RoleController">
	<div class="wrapper">
		<!-- Content Header (Page header) -->
			<div class="page-header" style="margin-top: -5px; margin-left: 20px; margin-bottom: -10px">
			<h3>Role</h3>
		</div>

		<!-- Main content -->
		<section class="content">
			<form class="form-horizontal" name="form1" novalidate>
				<div class="box box-default">
					<div class="box-header with-border">
						<h3 class="box-title">Role Search</h3>
					</div>
					<div class="box-body">
						<div class="box-body">
							<div class="row">
								<div class="col-md-6">
									<div class="col-md-2">
										<label>Role Id</label>
									</div>
									<div class="col-md-3">
										<div class="form-group">
											<select class="form-control select1" ng-model="prefix_roleid"
												ng-options="prefix.value as prefix.name for prefix in prefixs"></select>
										</div>
									</div>
									<div class="col-md-4" style="margin-left: 5px">
										<div class="form-group">
											<input type="text" name="roleid" class="form-control"
												ng-model="roleid" id="inputSuccess"
												placeholder="Enter Role Id" ng-keypress="checkIfEnterKeyWasPressed($event)" required>
										</div>
									</div>
								</div>

								<div class="col-md-6">
									<div class="col-md-3">
										<label>Role Name</label>
									</div>
									<div class="col-md-3" style="margin-left: -15px">
										<div class="form-group">
											<select class="form-control select1"
												ng-model="prefix_rolename"
												ng-options="prefix.value as prefix.name for prefix in prefixs"></select>
										</div>
									</div>

									<div class="col-md-4" style="margin-left: 5px">
										<div class="form-group">
											<input type="text" class="form-control" name="rolename"
												ng-model="rolename" id="inputSuccess"
												placeholder="Enter Role Name" ng-keypress="checkIfEnterKeyWasPressed($event)" required>
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<div class="col-md-2">
										<label>Status</label>
									</div>
									<div class="col-md-3">
										<div class="form-group">
											<select class="form-control select1" ng-model="Status"
												ng-options="statuss.value as statuss.name for statuss in status"></select>
										</div>
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-md-11" style="padding-right: 35px">
									<div class="form-group">
										<button
											ng-disabled="form1.roleid.$error.required && form1.rolename.$error.required"
											type="button" ng-click="searchRole();"
											ng-click="show1 = !show1" class="btn btn-primary pull-right">Search</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</form>

			<div class="row" ng-show="show1">
				<div class="col-xs-12">
					<div class="box">
						<div class="box-header">
							<h3 class="box-title">Role Details</h3>
						</div>
						<div class="box-body">
							<table id="example2"
								class="table table-responsive table-bordered table-hover">
								<thead>
									<tr>
										<th>Role Id</th>
										<th>Role Name</th>
										<th>Comments</th>
										<th>Status</th>
										<th>Audit_Action</th>
										<th>Audit_Datetime</th>
										<th>UserId</th>
										<th>Edit</th>
										<th>View</th>
										<th>Delete</th>
									</tr>
								</thead>
								<tbody>
									<tr data-ng-repeat="data in rolelist">
										<td>{{data.roleid}}</td>
										<td>{{data.rolename}}</td>
										<td>{{data.comments}}</td>
										<td>{{data.status}}</td>
										<td>{{data.auditaction}}</td>
										<td>{{data.auditdatetime}}</td>
										<td>{{data.userid}}</td>
										<td align="center"><a href=""
											ng-click="editRecord(data);"><img
												src="<c:url value="/resources/dist/img/edit.png"/>"
												class="img-responsive" /></a></td>
										<td align="center"><a href="" ng-click="viewRole(data);"><img
												src="<c:url value="/resources/dist/img/view.png"/>"
												class="img-responsive" /></a></td>
										<td align="center"><a href=""
											ng-click="confirmClick() && deleteRecord(data);" confirm-click><img
												src="<c:url value="/resources/dist/img/delete.png"/>"
												class="img-responsive"> </a></td>
									</tr>
								</tbody>

							</table>

							<form:form method="POST"
								action="${pageContext.request.contextPath}/role/insertRole">
								<button type="submit" style="margin-top: 10px" name="submit"
									class="btn btn-primary pull-right">Create New Role</button>
							</form:form>
						</div>
					</div>
				</div>
			</div>


			<div class="row" ng-show="show3">
				<div class="col-xs-12">
					<div class="box">
						<div class="box-header">
							<h3 class="box-title">User Role View</h3>
						</div>
						<div class="box-body">
							<table id="example2"
								class="table table-responsive table-bordered table-hover">
								<thead>
									<tr>
										<th>Role Id</th>
										<th>Role Name</th>
										<th>User Role Id</th>
										<th>User Name</th>
										<th>Description</th>
										<th>Status</th>
										<th>Audit_Action</th>
										<th>Audit_Datetime</th>
										<th>UserId</th>
									<!-- 	<th>Edit</th> -->
										<th>Delete</th>
									</tr>
								</thead>
								<tbody>
									<tr data-ng-repeat="data in roleviewlist">
										<td>{{data.roleid}}</td>
										<td>{{data.rolename}}</td>
										<td>{{data.userroleid}}</td>
										<td>{{data.uname}}</td>
										<td>{{data.description}}</td>
										<td>{{data.status}}</td>
										<td>{{data.auditaction}}</td>
										<td>{{data.auditdatetime}}</td>
										<td>{{data.userid}}</td>
									<%-- 	<td align="center"><a href="" ng-click="editRoleViewRecord(data);"><img
												src="<c:url value="/resources/dist/img/edit.png"/>"
												class="img-responsive" /></a></td> --%>
										<td align="center"><a href="" ng-click="confirmClick() && deleteUserRoleRecord(data);" confirm-click><img
												src="<c:url value="/resources/dist/img/delete.png"/>"
												class="img-responsive"> </a></td>

									</tr>
								</tbody>

							</table>
						</div>
					</div>
				</div>
			</div>



		</section>
		<!-- /.content -->
	</div>
	<!-- /.content-wrapper -->
</body>
</html>