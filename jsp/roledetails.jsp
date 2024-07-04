<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<style>
	.error { 
		color: red; 
	}
</style>

<script type="text/javascript"
	src="<c:url value="/resources/angular/controller/role_controller.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/angular/service/role_service.js"/>"></script>
</head>
<body  ng-app="myApp" ng-controller="RoleController">
	<div class="wrapper">
		<div class="page-header" style="margin-top: -5px; margin-left: 20px; margin-bottom: -10px">
			<h3>Role</h3>
		</div>

		<!-- Main content -->
		<section class="content">

			<!-- Thats for create role Form -->

			<form:form method="POST" name="form"
				action="${pageContext.request.contextPath}/role/insert"
				modelAttribute="roleInsertCommand">
				<div class="box box-default">

					<div class="box-header with-border">
						<h3 class="box-title">Insert Role</h3>
					</div>
					<!-- /.box-header -->
					<div class="box-body">
						<div class="form-group row">
							<label class="col-sm-2 form-control-label"
								style="padding-top: 5px; margin-right: -50px">Role Name:</label>
							<div class="col-sm-3">
								<form:input path="rolename" class="form-control"
									placeholder="Enter Role Name" />
									</div>
									<div>
									<form:errors path="rolename" cssClass="error"/>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-2 form-control-label"
								style="padding-top: 5px; margin-right: -50px">Comments:</label>
							<div class="col-sm-3">
								<form:textarea path="comments" class="form-control" rows="3"
									cols="4" placeholder="Enter Comment for this Role" />
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-2 form-control-label"
								style="padding-top: 5px; margin-right: -50px">Status:</label>
							<div class="col-sm-3">
								<form:select path="status" class="form-control select1">
									<form:option value="Y" label="Active" />
									<form:option value="N" label="InActive" />
								</form:select>
							</div>
						</div>

						<div class="form-group row" style="margin-left: 240px">
							<div class="col-sm-8">
								<button style="" type="submit" name="submit"
									class="btn btn-primary">Insert Role</button>
							</div>
						</div>
					</div>
					<!-- /.box-body -->
					<!-- <div class="box-footer"> -->
				</div>
				<!-- /.box -->
			</form:form>
			<div class="row" style="padding: 0px;">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12"
					style="padding: 0px;">
					<div class="example1">
						<span class="col-sm-12 from-control-label"
							style="color: green; font-size: medium; margin-bottom: 10px">
							<c:if test="${not empty roleId }">
							Successfully Insert Role And Your Role Id is : ${roleId }
 							</c:if>
						</span>
					</div>
				</div>
			</div>

			<!--    -->

			<div class="box box-default">

				<div class="box-header with-border">
					<h3 class="box-title">User Role Map</h3>
				</div>
				<!-- /.box-header -->
				<div class="box-body">
					<div>
						<label class="col-sm-2 form-control-label "
							style="padding-top: 5px; margin-right: -50px">User Name:</label>
						<div class="col-sm-3" style="margin-left: -10px">
							<input name="username" ng-model="username" class="form-control"
								placeholder="Enter User Name" ng-keypress="checkIfEnterKeyWasPressed($event)" />
						</div>
						<button type="submit" name="submit" ng-click="search_user();"
							ng-click="show2 = !show2" class="btn btn-primary">Search</button>

					</div>



					<div ng-show="show2">
						<hr>
						<table id="example2"
							class="table table-responsive table-bordered table-hover">
							<thead>
								<tr>
									<th>User Name</th>
									<th>Full Name</th>
									<th>Ph.No.</th>
									<th>Email_Id</th>
									<th>Add</th>
									<!-- <th>Delete</th> -->
								</tr>
							</thead>
							<tbody>
								<tr data-ng-repeat="data in userlist">
									<td>{{data.uname}}</td>
									<td>{{data.firstname}} {{data.lastname}}</td>
									<td>{{data.ph_no}}</td>
									<td>{{data.email_id}}</td>
									<td align="center"><a href=""
										ng-click="adduser(data.uname)"> <img
											src="<c:url value="/resources/dist/img/add.png"/>"
											class="img-responsive" /></a></td>
									<%-- <td align="center">
										 <a href="${pageContext.request.contextPath}/role/deleteuser?uname={{data.uname}}"><img
											src="<c:url value="/resources/dist/img/delete.png"/>"
											class="img-responsive"> </a>
									</td> --%>
								</tr>
							</tbody>

						</table>

					</div>
					<!-- /Table-body -->



					<div class="form-horizontal" ng-show="show3">
						<hr>
						<div class="row" id="myModal">
							<div class="col-xs-12">
								<div>
									<span class="lead">Add User Roll </span>
								</div>
								<div class="box-body">
									<form method="post"
										action="${pageContext.request.contextPath}/role/userrolemap"
										modelAttribute="userRoleInsertCommand">
										<fieldset data-ng-repeat="username in userlists">
											<div class="row">
												<div class="form-group col-md-12">
													<label class="col-md-1 control-lable"
														style="margin-top: 7px">UserName</label>
													<div class="col-md-2">
													
														<input type="hidden" value="{{username}}" name="uname"
															class=" form-control input-sm" />
														<input value="{{username}}" name="uname"
															class=" form-control input-sm" disabled="disabled"/>
													</div>
													<label class="col-md-2 control-lable"
														style="margin-top: 7px; margin-right: -60px">Role
														Name</label>
													<div class="col-md-1" style="padding: 0px">
														<select class=" form-control input-sm" name="roleid">
															<option ng-repeat='(key, value) in roles' value="{{key}}">{{value}}</option>
														</select>
													</div>
													<label class="col-md-1 control-lable"
														style="margin-top: 7px; margin-left: 30px; margin-right: -10px">Status</label>
													<div class="col-md-1" style="padding: 0px">
														<select name="Status" class="form-control input-sm">
															<option value="Y" label="Active" />
															<option value="N" label="InActive" />
														</select>
													</div>
													<label class="col-md-2 control-lable"
														style="margin-top: 7px; margin-left: 30px; margin-right: -50px">Description</label>
													<div class="col-md-2" style="padding: 0px">
														<input type="text" name="description"
															class="form-control input-sm"
															placeholder="Enetr description" />
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
			<font size="3px" color="green"> ${userroleids} </font>
		</section>
		<!-- /.content -->
	</div>
	<!-- /.content-wrapper -->
</body>
</html>