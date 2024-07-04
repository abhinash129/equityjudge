'use strict';
App.controller('RoleController',['$scope','RoleServices',function($scope,RoleServices){ 
	$scope.checkIfEnterKeyWasPressed=function($event){
	var keyCode = $event.which || $event.keyCode;
	if (keyCode === 13) {
	var roleId = $scope.roleid;
	var roleName = $scope.rolename;
	if(roleId!=null || roleName!=null ){
	$scope.searchRole();	
	}
	var username = $scope.username;
	if(username!=null){
	$scope.search_user();	
	}}}
	$scope.prefixs = [{name:'Starts With',value:"sw"},{name:'Ends With',value:'ew'},{name:'Consist Of',value:'co'}];
	$scope.prefix_roleid = $scope.prefixs[0].value;
	$scope.prefix_rolename = $scope.prefixs[0].value;
	$scope.status = [{name:'Active',value:"Y"},{name:'InActive',value:'N'}];
	$scope.Status = $scope.status[0].value;
	$scope.show1=false;
	$scope.show2=false;
	$scope.show3=false;
	$scope.show3=false;		 

	//FOR VIEW ROLE FOR PARTICULAR ROLE
	$scope.viewRole= function(list) {
	$scope.RowData = list;
	$scope.roleId=$scope.RowData.roleid;
	$scope.roleName=$scope.RowData.rolename;
	var roleid = $scope.roleId;
	var rolename = $scope.roleName;
	RoleServices.ViewRole(roleid,rolename).then(function(response) {
	$scope.roleviews = response;
	$scope.roleviewlist=[];
	if($scope.roleviews.length==0) {
	alert("No RolesView  Found for this Role!!!!!");
	$scope.show3=false;
	}else {
	for (var i = 0; i < $scope.roleviews.length; i++) {
	var role = $scope.roleviews[i];
	$scope.roleviewlist.push(role);
	}	
	$scope.show3=true;
	}});
	}

	//FOR USER FROM TABLE FOR ASSIGN A PARTICULAR ROLE TO USER
	$scope.userlists = [];
	$scope.adduser  = function(username){
	var status=true;	
	if($scope.userlists.length>=1){
	for(var i=0;i<$scope.userlists.length;i++){
	if($scope.userlists[i]===username){
	status=false;
	alert("User already added");
	}}}
	if(status){
	$scope.userlists.push(username);
	$scope.show3=true;
	}}


	//FOR SEARCH USER FOR USERMSTR TABLE FOR ASSIGNING ROLE
	$scope.search_user = function(){
	var username = $scope.username;
	RoleServices.getuserrolList(username).then(function(response) {
	$scope.users = response;
	$scope.userlist=[];
	if($scope.users.length==0) {
	alert("No User Found!!!!!");
	$scope.show2=false;
	}else {
	for (var i = 0; i < $scope.users.length; i++) {
	var user = $scope.users[i];
	$scope.userlist.push(user);
	}
	$scope.show2=true;
	}});

	//FOR GET ALL ROLE NAME AND ID FOR LOADING IN COMBOBOX
	RoleServices.getrolename().then(function(response) {
	$scope.roles = response;
	});
	}

	//FOR SEARCH A ROLE IN MAIN PAGE
	$scope.searchRole = function() {
	var prefix_roleid = $scope.prefix_roleid;
	var roleId = $scope.roleid;
	var prefix_rolename = $scope.prefix_rolename;
	var roleName = $scope.rolename;
	var status = $scope.Status;
	$scope.serachData = [];
	$scope.serachData.push(prefix_roleid,roleId,prefix_rolename,roleName,status);
	var searchrole= $scope.serachData;
	RoleServices.getRoleName(searchrole).then(function(response) {
	$scope.roles = response;
	$scope.rolelist=[];
	if($scope.roles.length==0) {
	$scope.show1=true;
	}else {
	for (var i = 0; i < $scope.roles.length; i++) {
	var role = $scope.roles[i];
	$scope.rolelist.push(role);
	}	
	$scope.show1=true;
	}});
	}

	//FOR DELETE A ROLE USING ROLEID
	$scope.deleteRecord = function(rolelist){
	$scope.RowData = rolelist;
	$scope.roleId=$scope.RowData.roleid;
	var role_id = $scope.roleId;
	RoleServices.deleteData(role_id).then(function(response) {	
	if (response) {
	window.location.reload();
	alert("Your role is delete Successfully");
	} else {
	alert("role is not Deleted");
	}});
	}

	//FOR DELETE A USER ROLE USING USERROLEID
	$scope.deleteUserRoleRecord = function(userrolelist){
	$scope.RowData = userrolelist;
	$scope.userroleid=$scope.RowData.userroleid;
	var userrole_id = $scope.userroleid;
	RoleServices.deleteUserRoleData(userrole_id).then(function(response) {	
	if (response) {
	window.location.reload();
	alert("Your User role is delete Successfully");
	} else {
	alert("User role is not Deleted");
	}});
	}

	//FOR EDIT ROLE WITH TABLE PARITCULAR ROW INFORMATION 
	$scope.editRecord = function(rolelist){
	$scope.RowData = rolelist;
	$scope.listData=[];
	$scope.listData.push($scope.RowData.roleid,$scope.RowData.rolename,$scope.RowData.comments,$scope.RowData.status);
	var listofData = $scope.listData;
	window.location=path+'/role/edit?editData=' + listofData;
	}

	//FOR EDIT USERROLEVIEW RECORD WITH TABLE PARTICULAR ROW INFORMATION
	$scope.editRoleViewRecord = function(roleviewlist){
	$scope.RowData = roleviewlist;
	$scope.listData=[];
	$scope.listData.push($scope.RowData.userroleid,$scope.RowData.roleid,$scope.RowData.uname,$scope.RowData.description,$scope.RowData.status);
	var listofData = $scope.listData;
	window.location=path+'/role/edituserrole?editData=' + listofData;
	}}]);



