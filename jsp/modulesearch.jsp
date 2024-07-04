<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html ng-app="myApp">
<head>
<script type="text/javascript"
	src="<c:url value="/resources/angular/controller/module_controller.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/angular/service/module_service.js"/>"></script>
</head>
<body>
	<div class="wrapper" ng-controller="ModuleController">
		<!-- Content Header (Page header) -->
		<div class="page-header" style="margin-top: -5px; margin-left: 20px; margin-bottom: -10px">
			<h3>Module</h3>
		</div>

		<!-- Main content -->
		<section class="content">
			<form class="form-horizontal" name="form1" novalidate >
				<div class="box box-default">
					<div class="box-header with-border">
						<h3 class="box-title">Module Search</h3>
					</div>
					<div class="box-body">
						<div class="box-body">
							<div class="row">
								<div class="col-md-6">
									<div class="col-md-3">
										<label>Module Id</label>
									</div>
									<div class="col-md-3">
										<div class="form-group">
											<select class="form-control select1" ng-model="prefix_moduleId"
												ng-options="prefix.value as prefix.name for prefix in prefixs"></select>
										</div>
									</div>
									<div class="col-md-4" style="margin-left: 5px">
										<div class="form-group">
											<input type="text" name="module_Id" class="form-control"
												ng-model="module_Id" id="inputSuccess"
												placeholder="Enter Module Id" ng-keypress="checkIfEnterKeyWasPressed($event)" required>
										</div>
									</div>
								</div>

								<div class="col-md-6">
									<div class="col-md-4">
										<label>Module Name</label>
									</div>
									<div class="col-md-3" style="margin-left: -15px">
										<div class="form-group">
										<select class="form-control select1" ng-model="prefix_moduleName"
												ng-options="prefix.value as prefix.name for prefix in prefixs"></select>
											</div>
									</div>

									<div class="col-md-4" style="margin-left: 5px">
										<div class="form-group">
											<input type="text" class="form-control" name="module_Name"
												ng-model="module_Name" id="inputSuccess"
												placeholder="Enter Module Name" ng-keypress="checkIfEnterKeyWasPressed($event)" required>
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
												ng-options="statuss.value as statuss.name for statuss in status"
												></select>
										</div>
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-md-11">
									<div class="form-group">
										<button
											ng-disabled="form1.module_Id.$error.required && form1.module_Name.$error.required"
											type="button" ng-click="searchModule()"
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
							<h3 class="box-title">Module Details</h3>
						</div>
						<div class="box-body">
							<table id="example2" class="table table-responsive table-bordered table-hover">
								<thead>
									<tr>
										<th>Module Id</th>
										<th>Module Name</th>
										<th>Description</th>
										<th>Status</th>
										<th>Audit_Action</th>
										<th>Audit_Datetime</th>
										<th>UserId</th>
										<th>Edit</th>
										<th>Delete</th>
									</tr>
								</thead>
								<tbody>
									<tr data-ng-repeat="data in modulelist">
										<td>{{data.module_id}}</td>
										<td>{{data.module_name}}</td>
										<td>{{data.description}}</td>
										<td>{{data.status}}</td>
										<td>{{data.auditaction}}</td>
										<td>{{data.auditDatetime}}</td>
										<td>{{data.userid}}</td>
										<td align="center">
										<a href="" ng-click="editRecord(data);" ><img src="<c:url value="/resources/dist/img/edit.png"/>" class="img-responsive" /></a>
										</td>
								<td align="center">
										 <a href="" ng-click="confirmClick() && deleteRecord(data);" confirm-click><img src="<c:url value="/resources/dist/img/delete.png"/>" class="img-responsive" > </a>
								</td>
							</tr>
						</tbody>
								
							</table>
							
							<form:form method="POST"
					action="${pageContext.request.contextPath}/module/createModule">
							<button type="submit" style="margin-top: 10px" name="submit"
								class="btn btn-primary pull-right">Create New Module</button>
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