<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html ng-app="myApp">
<head>
<script type="text/javascript"
	src="<c:url value="/resources/angular/controller/usermodulemap_controller.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/angular/service/usermodulemap_service.js"/>"></script>
</head>
<body>
	<div class="wrapper" ng-controller="ModuleMapController">
		<!-- Content Header (Page header) -->
	<div class="page-header" style="margin-top: -5px; margin-left: 20px; margin-bottom: -10px">
			<h3>User Role Module Map</h3>
		</div>

		<!-- Main content -->
		<section class="content">
			<form class="form-horizontal" name="form1" novalidate>
				<div class="box box-default">
					<div class="box-header with-border">
						<h3 class="box-title">User Role Module Map Search</h3>
					</div>
					<div class="box-body">
						<div class="box-body">
							<div class="row">
								<div class="col-md-6">
									<div class="col-md-3">
										<label>User Role Module Id</label>
									</div>
									<div class="col-md-3">
										<div class="form-group">
											<select class="form-control select1"
												ng-model="prefix_userrolemoduleId"
												ng-options="prefix.value as prefix.name for prefix in prefixs"></select>
										</div>
									</div>
									<div class="col-md-4" style="margin-left: 5px">
										<div class="form-group">
											<input type="text" name="userrolemoduleId"
												class="form-control" ng-model="userrolemoduleId"
												id="inputSuccess" placeholder="Enter User Role Module Id"  ng-keypress="checkIfEnterKeyWasPressed($event)"
												required>
										</div>
									</div>
								</div>

								<div class="col-md-6">
									<div class="col-md-3">
										<label>User Role Id</label>
									</div>
									<div class="col-md-3">
										<div class="form-group">
											<select class="form-control select1"
												ng-model="prefix_userroleId"
												ng-options="prefix.value as prefix.name for prefix in prefixs"></select>
										</div>
									</div>
									<div class="col-md-4" style="margin-left: 5px">
										<div class="form-group">
											<input type="text" name="userroleId" class="form-control"
												ng-model="userroleId" id="inputSuccess"
												placeholder="Enter User Role Id"  ng-keypress="checkIfEnterKeyWasPressed($event)" required>
										</div>
									</div>
								</div>
							</div>


							<div class="row">
								<div class="col-md-6">
									<div class="col-md-3">
										<label>Module Id</label>
									</div>
									<div class="col-md-3">
										<div class="form-group">
											<select class="form-control select1"
												ng-model="prefix_moduleId"
												ng-options="prefix.value as prefix.name for prefix in prefixs"></select>
										</div>
									</div>
									<div class="col-md-4" style="margin-left: 5px">
										<div class="form-group">
											<input type="text" name="module_Id" class="form-control"
												ng-model="module_Id" id="inputSuccess"
												placeholder="Enter Module Id"  ng-keypress="checkIfEnterKeyWasPressed($event)" required>
										</div>
									</div>
								</div>

								<div class="col-md-6">
									<div class="col-md-3">
										<label>Feature Id</label>
									</div>
									<div class="col-md-3">
										<div class="form-group">
											<select class="form-control select1"
												ng-model="prefix_featureId"
												ng-options="prefix.value as prefix.name for prefix in prefixs"></select>
										</div>
									</div>
									<div class="col-md-4" style="margin-left: 5px">
										<div class="form-group">
											<input type="text" name="featureID" class="form-control"
												ng-model="featureID" id="inputSuccess"
												placeholder="Enter Feature Id"  ng-keypress="checkIfEnterKeyWasPressed($event)" required>
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<div class="col-md-3">
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
								<div class="col-md-11">
									<div class="form-group">
										<button
											ng-disabled="form1.module_Id.$error.required && form1.featureID.$error.required && form1.userroleId.$error.required && form1.userrolemoduleId.$error.required"
											type="button" ng-click="searchUserModule()"
											ng-click="show1 = !show1" class="btn btn-primary pull-right">Search</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</form>

			<div class="row"  ng-show="show1">
				<div class="col-xs-12">
					<div class="box">
						<div class="box-header">
							<h3 class="box-title">User Role Module Map Details</h3>
						</div>
						<div class="box-body">
							<table id="example2"
								class="table table-responsive table-bordered table-hover">
								<thead>
									<tr>
										<th>RoleModule Id</th>
										<th>UName</th>
										<th>UserRole Id</th>
										<th>Module Id</th>
										<th>Feature Id</th>
										<th>Comments</th>
										<th>Status</th>
										<th>Audit_Action</th>
										<th>Audit_Datetime</th>
										<th>UserId</th>
										<th>Edit</th>
										<th>Delete</th>
									</tr>
								</thead>
								<tbody>
									<tr data-ng-repeat="data in userrolemoduleslist">
										<td>{{data.usermoduleid}}</td>
										<td>{{data.uname}}</td>
										<td>{{data.userroleid}}</td>
										<td>{{data.moduleid}}</td>
										<td>{{data.featureid}}</td>
										<td>{{data.comments}}</td>
										<td>{{data.status}}</td>
										<td>{{data.auditaction}}</td>
										<td>{{data.auditdatetime}}</td>
										<td>{{data.userid}}</td>
										<td><a href="" ng-click="editRecord(data);"><img
												src="<c:url value="/resources/dist/img/edit.png"/>"
												class="img-responsive" /></a>
										</td>
										<td>
											 <a href="" ng-click="confirmClick() && deleteRecord(data);" confirm-click><img
												src="<c:url value="/resources/dist/img/delete.png"/>"
												class="img-responsive"> </a>
										</td>
									</tr>
								</tbody>

							</table>

							<form:form method="POST"
								action="${pageContext.request.contextPath}/userrolemodule/createRoleModule">
								<button type="submit" style="margin-top: 10px" name="submit"
									class="btn btn-primary pull-right">Create New User
									Role Module</button>
							</form:form>
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