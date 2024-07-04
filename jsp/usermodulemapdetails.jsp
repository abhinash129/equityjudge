<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"
	src="<c:url value="/resources/angular/controller/usermodulemap_controller.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/angular/service/usermodulemap_service.js"/>"></script>
</head>
<body  ng-app="myApp">
	<div class="wrapper" ng-controller="ModuleMapController">
		<!-- Content Header (Page header) -->
	<div class="page-header" style="margin-top: -5px; margin-left: 20px; margin-bottom: -10px">
			<h3>User Role Module Map</h3>
		</div>


		<!-- Main content -->
		<section class="content">
			<div class="box box-default">
				<div class="box-header with-border">
					<h3 class="box-title">User Role Module Map</h3>
				</div>
				<!-- /.box-header -->
				<div class="box-body">
					<div>
						<label class="col-sm-2 form-control-label "
							style="padding-top: 5px; margin-right: -50px">User Role
							Id:</label>
						<div class="col-sm-3" style="margin-left: -10px">
							<input name="userroleid" ng-model="userroleid"
								class="form-control" placeholder="Enter User Role Id"  ng-keypress="checkIfEnterKeyWasPressed($event)" />
						</div>
						<button type="submit" name="submit"
							ng-click="search_userroleid();" ng-click="show2 = !show2"
							class="btn btn-primary">Search</button>

					</div>



					<div ng-show="show2">
						<hr>
						<table id="example2"
							class="table table-responsive table-bordered table-hover">
							<thead>
								<tr>
									<th>UserRole Id</th>
									<th>User Name</th>
									<th>Role Id</th>
									<th>Description</th>
									<th>Status</th>
									<th>Audit_Action</th>
									<th>AuditDatetime</th>
									<th>User Id</th>
									<th>Add</th>
								</tr>
							</thead>
							<tbody>
								<tr data-ng-repeat="data in userrolelist">
									<td>{{data.userroleid}}</td>
									<td>{{data.uname}}</td>
									<td>{{data.roleid}}</td>
									<td>{{data.description}}</td>
									<td>{{data.status}}</td>
									<td>{{data.auditaction}}</td>
									<td>{{data.auditdatetime}}</td>
									<td>{{data.userid}}</td>
									<td align="center"><a href="" ng-click="adduser(data)">
											<img src="<c:url value="/resources/dist/img/add.png"/>"
											class="img-responsive" />
									</a></td>
								</tr>
							</tbody>

						</table>

					</div>
					<!-- /Table-body -->



					<div class="form-horizontal" ng-show="show3">
						<hr>
						<div class="row">
							<div class="col-xs-12">
								<div>
									<span class="lead">Add User Role Module Map </span>
								</div>
								<div class="box-body">
									<form method="post"
										action="${pageContext.request.contextPath}/userrolemodule/insertuserrole" modelAttribute="userRoleModuleInsertCommand">
										<fieldset data-ng-repeat="userlists in list">
											<hr>
											<div class="row">
												<div class="form-group col-md-12">
													<label class="col-md-1 control-lable"
														style="margin-top: 7px">UserRoleId</label>
													<div class="col-md-2">
														<input value="{{userlists.userroleid}}" name="userroleid"
															class=" form-control input-sm" disabled="disabled"/>
															<input type="hidden" value="{{userlists.userroleid}}" name="userroleid"
															class=" form-control input-sm"/>
													</div>
													<label class="col-md-1 control-lable"
														style="margin-top: 7px">RoleId</label>
													<div class="col-md-2" style="margin-left: -30px">
														<input value="{{userlists.roleid}}" name="roleid"
															class=" form-control input-sm" disabled="disabled"/>
															<input value="{{userlists.roleid}}" type="hidden" name="roleid"
															class=" form-control input-sm" />
													</div>
													<label class="col-md-1 control-lable"
														style="margin-top: 7px">UserName</label>
													<div class="col-md-2" style="margin-left: -9px">
														<input value="{{userlists.uname}}" name="uname"
															class=" form-control input-sm" disabled="disabled"/>
																<input value="{{userlists.uname}}" type="hidden" name="uname"
															class=" form-control input-sm" />
													</div>
													<label class="col-md-1 control-lable"
														style="margin-top: 7px">Comments</label>
													<div class="col-md-2">
														<input type="text" name="comments"
															class="form-control input-sm"
															placeholder="Enetr Comments" />
													</div>
												</div>
												<div class="form-group col-md-12">
													<label class="col-md-2 control-lable"
														style="margin-top: 7px">Module Name</label>
													<div class="col-md-2" style="margin-left: -60px">
														<select class=" form-control input-sm" name="moduleid">
															<option ng-repeat='(key, value) in modules'
																value="{{key}}">{{value}}</option>
														</select>
													</div>
													<label class="col-md-2 control-lable"
														style="margin-top: 7px">Feature Name</label>
													<div class="col-md-2" style="margin-left: -60px">
														<select class=" form-control input-sm" name="featureid">
															<option ng-repeat='(key, value) in features'
																value="{{key}}">{{value}}</option>
														</select>
													</div>

													<label class="col-md-2 control-lable"
														style="margin-top: 7px">Status</label>
													<div class="col-md-2" style="margin-left: -110px">
														<select name="Status" class="form-control input-sm">
															<option value="Y" label="Active" />
															<option value="N" label="InActive" />
														</select>
													</div>
												</div>
											</div>
										</fieldset>
										<button type="submit"
											class="btn btn-primary pull-right col-md-1">Save</button>
									</form>
								</div>
							</div>
						</div>
					</div>
					<!-- /.col -->
				</div>
				<!-- /.box-body -->
				<!-- <div class="box-footer"> -->
			</div>
			<!-- /.box -->
			<font size="3px" color="green"> ${userrolemoduleid} </font>

		</section>
		<!-- /.content -->
	</div>
	<!-- /.content-wrapper -->
</body>
</html>