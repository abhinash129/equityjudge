<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<style>
	.error { 
		color: red; 
	}
</style>

</head>
<body ng-app="myApp">
	<div class="wrapper">
		<!-- Content Header (Page header) -->
			<div class="page-header" style="margin-top: -5px; margin-left: 20px; margin-bottom: -10px">
			<h3>Module</h3>
		</div>


		<!-- Main content -->
		<section class="content">

			<!-- Thats for create module Form -->
			
				<form:form method="POST" name="form"
					action="${pageContext.request.contextPath}/module/create" modelAttribute="moduleInsertCommand">
					<div class="box box-default">

						<div class="box-header with-border">
							<h3 class="box-title">Create Module</h3>
						</div>
						<!-- /.box-header -->
						<div class="box-body">
							<div class="form-group row">
								<label class="col-sm-2 form-control-label"
									style="padding-top: 5px; margin-right: -50px">Module
									Name:</label>
								<div class="col-sm-3">
									<form:input path="modulename" class="form-control" placeholder="Enter Module Name" />
									</div>
									<div><form:errors path="modulename" cssClass="error"/>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2 form-control-label"
									style="padding-top: 5px; margin-right: -50px">Description:</label>
								<div class="col-sm-3">
									<form:textarea  path="description" class="form-control" 
									rows="3" cols="4" placeholder="Enter Module Description"  />
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2 form-control-label"
									style="padding-top: 5px; margin-right: -50px">Status:</label>
								<div class="col-sm-3">
									<form:select path="status" class="form-control select1">
										<form:option value="Y" label="Active"  />
										<form:option value="N" label="InActive" />										
									</form:select>
								</div>
							</div>

							<div class="form-group row" style="margin-left: 265px">
								<div class="col-sm-8">
									<button
										style="" type="submit"
										name="submit" class="btn btn-primary">Create</button>
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
							<c:if test="${not empty moduleId }">
							 Successfully Insert Module And Your Module Id is: ${moduleId }
 							</c:if>
						</span>
					</div>
				</div>
			</div>
		</section>
		<!-- /.content -->
	</div>
	<!-- /.wrapper -->
</body>
</html>