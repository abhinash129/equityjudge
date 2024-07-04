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
<body  ng-app="myApp" ng-controller="ModuleMapController">
	<div class="wrapper">
		<!-- Content Header (Page header) -->
		<div class="page-header" style="margin-top: -5px; margin-left: 20px; margin-bottom: -10px">
			<h3>User Role Module Map</h3>
		</div>


		<!-- Main content -->
		<section class="content">



			<form:form method="POST" name="form"
				action="${pageContext.request.contextPath}/userrolemodule/updateuserrolemodule"
				modelAttribute="userRoleModuleEditCommand">
				<div class="box box-default">

					<div class="box-header with-border">
						<h3 class="box-title">Edit User Role Module</h3>
					</div>
					<!-- /.box-header -->
					<div class="box-body">
						<div class="form-group row">
							<label class="col-sm-2 form-control-label"
								style="padding-top: 5px; margin-right: -50px">Module
								Name:</label>
							<div class="col-sm-3">
								<form:hidden path="usermoduleid" class="form-control"
									placeholder="Enter Role Name" />

								<form:select class=" form-control" path="moduleid">
									<form:options items="${modules }"/>
								</form:select>


							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-2 form-control-label"
								style="padding-top: 5px; margin-right: -50px">Feature
								Name:</label>
							<div class="col-sm-3">
								<form:select class=" form-control" path="featureid">
									<form:options items="${features}"/>
								</form:select>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-2 form-control-label"
								style="padding-top: 5px; margin-right: -50px">Comments:</label>
							<div class="col-sm-3">
								<form:textarea path="comments" class="form-control" rows="3"
									cols="4" placeholder="Enter Comment for this User Role Module" />
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

						<div class="form-group row" style="margin-left: 150px">
							<div class="col-sm-8">
								<button style="" type="submit" name="submit"
									class="btn btn-primary">Update User Role Module</button>
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
							<c:if test="${not empty userroleviewupdate }">
							${userroleviewupdate }
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