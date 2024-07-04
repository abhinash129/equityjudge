<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
 <head>  
<script type="text/javascript"
	src="<c:url value="/resources/angular/controller/companyController.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/angular/service/companyService.js"/>"></script>

<style type="text/css">
	.floatRight{
	float:right;
	margin-right: 18px;
	}
	</style>

  </head>
<body  ng-app="myApp">
<div class="wrapper" ng-controller="CompanyController">
        <!-- Content Header (Page header) -->
       
       	<div class="page-header"==style="margin-top: -5px; margin-left: 20px; margin-bottom: -10px">
				<h3>Parameter</h3>
			</div>
        <!-- Main content -->
        <section class="content">
        <div class="box box-default col-md-9">
            <div class="box-header with-border">
              <h3 class="box-title">Parameter Data</h3>
             </div>
            <div class="box-body">
              <h4 align="center" style="color: green;">${result}</h4>
   				 <div class="row">
              	  <div class="col-md-8">
						<div class="col-md-2">
                    		<label>FieldName</label>
                 		</div>
								<div class="col-md-6">
									<div class="form-group">
										<input type="text" class="form-control" ng-model="parameter">
									</div>
								</div>
							</div>
   				 </div>   
   				 <div style="margin-left: 300px">
            <button type="button" class="btn btn-primary" ng-click="addParameter(parameter)">Add</button>
            </div>
        </div>
           </div>
          
     <form:form method="POST" action="${pageContext.request.contextPath}/parameter/parameterdata" modelAttribute="parameterform">
				<div class="form-horizontal" ng-show="parameters">
					<div class="row" id="myModal">
						<div class="col-xs-12">
							 <div class="panel panel-default">
              					<div class="panel-heading"><span class="lead">Add Parameter </span>
              					</div>
								<div class="box-body">
								<fieldset  data-ng-repeat="parameter in parameterList">
      								<div class="row">
      								<br>
                             			 <label class="col-md-1 control-lable" for="file" style="margin-top:7px">FieldName</label>
                              				<div class="col-md-1" style="padding : -10px">
                                 				 <input type="text" value="{{parameter.field}}" name="FieldName" class=" form-control input-sm" />
                              				</div>
                              				<label class="col-md-2 control-lable" for="file" style="margin-top:7px">DisplayName</label>
                              				<div class="col-md-2" style="margin-left:  -70px">
                                 				 <input type="text" name="DisplayName" class=" form-control input-sm" placeholder="Enter logical name"/>
                              				</div>
                              				
                              				<label class="col-md-2 control-lable" for="file" style="margin-top:7px">LogicalValue</label>
                              				<div class="col-md-2" style="margin-left:  -70px">
                                 				 <input type="text" name="LogicalValue" class="form-control input-sm" placeholder="Enter logical value" />
                                 					
                              				</div>
                              				<label class="col-md-1 control-lable" for="file" style="margin-top:7px">Order</label>
                              				<div class="col-md-2" style="margin-left:  -40px">
                                 				 <input type="text" name="ParameterOrder" class=" form-control input-sm" placeholder="Parameter order">
                              				</div>
                          			</div>
                          			</fieldset>
                          			<br>
                          			<div style="padding-right: 50px">
                          			<button type="submit" 
										class="btn btn-primary pull-right">Submit</button>
										</div>
                      			</div>
								</div>
							</div>
						</div>
					</div>
			</form:form>
          
			
		</section><!-- /.content -->
      </div><!-- /.content-wrapper -->
      

</body>
</html>