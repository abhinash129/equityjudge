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
			<h3>User Role</h3>
		</div>


		<!-- Main content -->
		<section class="content">



			<form:form method="POST" name="form"
				action="${pageContext.request.contextPath}/role/updateuserrole"
				modelAttribute="userRoleEditCommand">
				<div class="box box-default">

					<div class="box-header with-border">
						<h3 class="box-title">Edit User Role</h3>
					</div>
					<!-- /.box-header -->
					<div class="box-body">
						<div class="form-group row">
							<label class="col-sm-2 form-control-label"
								style="padding-top: 5px; margin-right: -50px">Role Name:</label>
							<div class="col-sm-3">
								<form:hidden path="userroleid" class="form-control"
									placeholder="Enter Role Name" />
								<form:select path="roleid" class="form-control">
									<form:options items="${roles}" />
								</form:select>


							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-2 form-control-label"
								style="padding-top: 5px; margin-right: -50px">Description:</label>
							<div class="col-sm-3">
								<form:textarea path="description" class="form-control" rows="3"
									cols="4" placeholder="Enter Comment for this Role" />
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-2 form-control-label"
								style="padding-top: 5px; margin-right: -50px">Status:</label>
							<div class="col-sm-3">
								<form:select path="status" class="form-control">
									<form:option value="Y" label="Active" />
									<form:option value="N" label="InActive" />
								</form:select>
							</div>
						</div>

						<div class="form-group row" style="margin-left: 200px">
							<div class="col-sm-8">
								<button style="" type="submit" name="submit"
									class="btn btn-primary">Update User Role</button>
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
						<c:if test="${not empty roleviewupdate }">
							${roleviewupdate }
 							</c:if>
						</span>
					</div>
				</div>
			</div>

		</section>
		<!-- /.content -->
	</div>
	<!-- /.content-wrapper -->
</body>
</html>