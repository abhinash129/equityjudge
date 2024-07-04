'use strict';
App.controller('ModuleMapController',['$scope','ModuleMapServices',function($scope,ModuleMapServices){ 
	$scope.checkIfEnterKeyWasPressed=function($event){
	var keyCode=$event.which||$event.keyCode;
	if(keyCode===13){
	var userrolemoduleid=$scope.userrolemoduleId;
	var userroleid=$scope.userroleId;
	var featureid=$scope.featureID;
	var moduleid=$scope.module_Id;
	if(userrolemoduleid!=null||userroleid!=null||featureid!=null||moduleid!=null){
	$scope.searchUserModule();	
	}
	var userroleid=$scope.userroleid;
	if(userroleid!=null ){
	$scope.search_userroleid();	
	}}}
	$scope.prefixs = [{name:'Starts With',value:"sw"},{name:'Ends With',value:'ew'},{name:'Consist Of',value:'co'}];
	$scope.prefix_moduleId=$scope.prefixs[0].value;
	$scope.prefix_featureId=$scope.prefixs[0].value;
	$scope.prefix_userrolemoduleId=$scope.prefixs[0].value;
	$scope.prefix_userroleId=$scope.prefixs[0].value;
	$scope.status=[{name:'Active',value:"Y"},{name:'InActive',value:'N'}];
	$scope.Status=$scope.status[0].value;
	$scope.show1=false;		

	//FOR OPEN EDIT PAGE WITH TABLE PARTICULAR ROW DATA
	$scope.editRecord=function(userrolemodulelist){
	$scope.RowData = userrolemodulelist;
	$scope.listData=[];
	$scope.listData.push($scope.RowData.usermoduleid,$scope.RowData.moduleid,$scope.RowData.featureid,$scope.RowData.comments,$scope.RowData.status);
	var listofData=$scope.listData;
	window.location=path+'/userrolemodule/edit?editData=' + listofData;
	}
	
	//FOR SEARCH USER ROLE ID 
	$scope.search_userroleid=function(){
	var userroleid=$scope.userroleid;
	ModuleMapServices.getuserroleidlist(userroleid).then(function(response){
	$scope.userroles=response;
	$scope.userrolelist=[];
	if($scope.userroles.length==0){
	$scope.show2=true;
	}else{
	for (var i=0;i<$scope.userroles.length;i++){
	var user=$scope.userroles[i];
	$scope.userrolelist.push(user);
	}
	$scope.show2=true;
	}});

	//FOR GETTING ALL MODULE NAME AND ID FOR LOADING IN COMBOBOX
	ModuleMapServices.getmodulename().then(function(response){
	$scope.modules=response;
	});

	//FOR GETTING ALL FEATURENAME AND ID FOR LOADING IN COMBOBOX
	ModuleMapServices.getfeaturename().then(function(response){
	$scope.features=response;
	});
	}

	//FOR ADD USER IN LIST AND FORM FROM TABLE FOR ADD NEW USER ROLE
	$scope.list=[];
	$scope.adduser=function(userroellist){
	var status=true;
	$scope.RowData=userroellist;
	$scope.show3=true;
	$scope.userroleid=$scope.RowData.userroleid;
	$scope.roleid=$scope.RowData.roleid;
	$scope.uname=$scope.RowData.uname;
	if(status){
	$scope.list.push({userroleid:$scope.userroleid,roleid:$scope.roleid,uname:$scope.uname});
	}}

	//FOR DELETE A ROLE USING ROLEID
	$scope.deleteRecord=function(modulemaplist){
	$scope.RowData = modulemaplist;
	$scope.usermoduleid=$scope.RowData.usermoduleid;
	var usermodule_id=$scope.usermoduleid;
	ModuleMapServices.deleteData(usermodule_id).then(function(response){	
	if(response){
	window.location.reload();
	alert("Your User role Module is delete Successfully");
	}else{
	alert("User role Module is not Deleted");
	}});
	}

	//FOR SEARCH USERMODULE IN MAIN PAGE FROM DATABASE
	$scope.searchUserModule=function(){
	var prefix_userrolemoduleid=$scope.prefix_userrolemoduleId;
	var prefix_userroleid=$scope.prefix_userroleId;
	var prefix_moduleid=$scope.prefix_moduleId;
	var prefix_featureid=$scope.prefix_featureId;
	var userrolemoduleid=$scope.userrolemoduleId;
	var userroleid=$scope.userroleId;
    var featureid=$scope.featureID;
	var moduleid=$scope.module_Id;
	var status=$scope.Status;
	$scope.serachData=[];
	$scope.serachData.push(prefix_userrolemoduleid,userrolemoduleid,prefix_userroleid,userroleid,prefix_moduleid,moduleid, prefix_featureid, featureid, status);
	var searchrole=$scope.serachData;
    ModuleMapServices.getRoleUserModuleMap(searchrole).then(function(response){
	$scope.userrolemodules=response;
	$scope.userrolemoduleslist=[];
	if($scope.userrolemodules.length==0){
	$scope.show1=true;
	}else{
	for(var i=0;i<$scope.userrolemodules.length;i++){
	var role=$scope.userrolemodules[i];
	$scope.userrolemoduleslist.push(role);
	}	
	$scope.show1=true;
	}});
	}}]);

App.directive('confirmClick',function(){
    return{
    link:function (scope,element,attrs){
    scope.confirmClick=function(msg){
    msg=msg||attrs.confirmClick||'Are you sure?';
    return confirm(msg);
    }}}})
 
