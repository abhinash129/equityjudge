'use strict';
App.controller('ModuleController',['$scope','ModuleServices',function($scope,ModuleServices) { 
			 $scope.checkIfEnterKeyWasPressed = function($event){
				 var keyCode = $event.which || $event.keyCode;
				 if (keyCode === 13) {
					 var moduleId = $scope.module_Id;
					 var moduleName = $scope.module_Name;
					 if(moduleId!=null || moduleName!=null ){
						 $scope.searchModule();	
					 } }}
			 $scope.prefixs = [{name:'Starts With',value:"sw"} ,
			                   {name:'Ends With',value:'ew'},
			                   {name:'Consist Of',value:'co'}];
			 $scope.prefix_moduleId = $scope.prefixs[0].value;
			 $scope.prefix_moduleName = $scope.prefixs[0].value;
			 $scope.status = [{name:'Active',value:"Y"},{name:'InActive',value:'N'}];
			 $scope.Status = $scope.status[0].value;
			 $scope.show1=false;
			 $scope.getModules= function(rolename){
				 $scope.rolename = rolename;
				 var role = $scope.rolename;
				 ModuleServices
				 .getModules(role)
				 .then(
						 function(response) {	
							 $scope.listmodules = response;
						 } );}
			 $scope.getFirstModules= function(rolename){
				 ModuleServices
				 .getFirstModules()
				 .then(
						 function(response) {	
							 $scope.homelistmodules = response;
						 });}
			 //FOR DELETE  MODULE WITH MODULEID
			 $scope.deleteRecord = function(modulelist){
				 $scope.RowData = modulelist;
				 $scope.moduleId=$scope.RowData.module_id;
				 var module_id = $scope.moduleId;
				  ModuleServices
				 .deleteData(module_id)
				 .then(
						 function(response) {	
							 if (response) {
								 window.location.reload();
								 alert("Your Module is delete Successfully");
							 } else {
								 alert("Module is not Deleted");
							 } });}
			 //FOR EDIT PARTICULAR MODULE
			 $scope.editRecord = function(modulelist){
				 $scope.RowData = modulelist;
				 $scope.listData=[];
				 $scope.listData.push($scope.RowData.module_id,$scope.RowData.module_name,$scope.RowData.description,$scope.RowData.status);
				 var listofData = $scope.listData;
				 window.location=path+'/module/edit?editData=' + listofData;
			 }
			 //FOR SEARCH MODULE IN MAIN PAGE
			 $scope.searchModule = function() {
				 var prefix_moduleid = $scope.prefix_moduleId;
				 var moduleId = $scope.module_Id;
				 var prefix_modulename = $scope.prefix_moduleName;
				 var moduleName = $scope.module_Name;
				 var status = $scope.Status;
				 $scope.serachData = [];
				 $scope.serachData.push(prefix_moduleid,moduleId,prefix_modulename,moduleName,status);
				 var searchModule= $scope.serachData;
				 ModuleServices
				 .getModuleName(searchModule)
				 .then(
						 function(response) {
							 $scope.modules = response;
							 $scope.modulelist=[];
							 if($scope.modules.length==0) {
								 // alert("No Modules Found!!!!!");
								 $scope.show1=true;
							 }
							 else {
								 for (var i = 0; i < $scope.modules.length; i++) {
									 var module = $scope.modules[i];
									 $scope.modulelist
									 .push(module);
								 }	
								 $scope.show1=true;
							 }  }); } }]);

App.directive('confirmClick', function() {
    return {
        link: function (scope, element, attrs) {
            scope.confirmClick = function(msg) {
                msg = msg || attrs.confirmClick || 'Are you sure?';
                return confirm(msg);
            } }}})
 
