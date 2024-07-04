'use strict';
App.controller('PortfolioController',['$anchorScroll','$scope','PortfolioService','$window','$filter', function($anchorScroll, $scope, PortfolioService,$window,$filter) { 
 $scope.sharess = $scope.sharess;
 $scope.show1=false;
 $scope.show_1=false;
 $scope.show_2=false;
 $scope.show_3=false;
 $scope.show_4=false;
 $scope.shortterm=false;
 $scope.longterm=false;
 $scope.shortTermdataAvlbl = function shortTermdataAvlbl(){
 $scope.shortterm=true;
}
 $scope.longTermdataAvlbl = function longTermdataAvlbl(){
 $scope.longterm=true;
			 }
 $scope.bseSensex = function bseSensex(){
 alert("Please select any other stock !!!") }
 $scope.checkIfEnterKeyWasPressed = function($event){
 var keyCode = $event.which || $event.keyCode;
 if (keyCode === 13) {
 $scope.searchName(); } }
 $scope.checkDates = function checkDates() {
 var startDate = $scope.startDate;
 var date = startDate.substring( 0, 2 );
 var month = startDate.substring( 3, 5 );
 var year = startDate.substring(6);
 var finalStartDate = month+"-"+date+"-"+year;
 var fromDate = new Date(finalStartDate);	            
 var endDate = $scope.endDate;
 var date = endDate.substring( 0, 2 );
 var month = endDate.substring( 3, 5 );
 var year = endDate.substring(6);
 var finalEndDate = month+"-"+date+"-"+year;
 var toDate = new Date(finalEndDate);	            
 if (fromDate <= toDate) {
	 return false;
	 }else{
	 return true;
				 } }
 $scope.onSubmit= function(event) {
 var startDate = $scope.startDate;
 var date = startDate.substring( 0, 2 );
 var month = startDate.substring( 3, 5 );
 var year = startDate.substring(6);
 var finalStartDate = year+"-"+month+"-"+date;
 var fromDate = new Date(finalStartDate);	            
 var endDate = $scope.endDate;
 var date = endDate.substring( 0, 2 );
 var month = endDate.substring( 3, 5 );
 var year = endDate.substring(6);
 var finalEndDate =year+"-"+month+"-"+date;
 var toDate = new Date(finalEndDate);	            
 if (fromDate <= toDate)  {
 submitData();}
 else {
 alert("'To Date' must be greater than 'From Date' !!!!!")
 event.preventDefault();}}
 $scope.searchName = function() {
 var companyNameList = $scope.scname;
 $scope.errMsg="";
 if (companyNameList.length <2 ) {
 $scope.errMsg="Enter atleast 2 Character";
 $scope.show_1=false;
 } else {
 PortfolioService
 .getCompanyName(companyNameList)
 .then(
 function(response) {
 $scope.suggestions = [];
 var maxSuggestionListLength = 0;
 $scope.suggestionList = response;
 if($scope.suggestionList.length==0){
 $scope.errMsg="No Company found for this keyword";
$scope.show_1=false;
 }
for (var i = 0; i < $scope.suggestionList.length; i++) {
 var companyListSuggestions = $scope.suggestionList[i];
 $scope.suggestions
 .push(companyListSuggestions);
 maxSuggestionListLength += 1;
 if (maxSuggestionListLength == 10) {
	 break;
 }
 $scope.show_1=true;
 } },
function(errResponse) {
 console
 .error('Error while fetching company');
 });}}
 $scope.companyList=[];
 $scope.addStock = function (selectedCompany) {
 $anchorScroll("scroll");
 $scope.show_2=true;
 var status=true;	
 if($scope.companyList.length>=1){
 for(var i=0;i<$scope.companyList.length;i++){
 if($scope.companyList[i]===selectedCompany){
 status=false;
 alert("Company already added");
 } }}
 if(status){
 $scope.companyList.push(selectedCompany);
 }};
 $scope.closeSell=function closeSell(){
 $scope.show1=false;
 $scope.companyList.pop();
 }
 $scope.removeCompany = function (Company) {
 var index = $scope.companyList.indexOf(Company);
 $scope.companyList.splice(index, 1); 
 if ($scope.companyList.length==0) {
 $scope.show_2=false;
 }};
 $scope.buyDate;
			 //here i change on 18 jan add one more arg
 $scope.companyList=[];
 $scope.sellStock = function (selectedCompany,selectedpid,quantity,buyDate) {
 $scope.show1=true;
 $scope.p_id = selectedpid;
 $scope.sharess = quantity;
 $scope.buyDate= buyDate;
 var status=true;	
 if($scope.companyList.length>=1){
 for(var i=0;i<$scope.companyList.length;i++){
 if($scope.companyList[i]===selectedCompany){
 status=false;
 alert("Company already added one");
 }}}
 if(status){
 $scope.companyList.push(selectedCompany);
 }};
 $scope.checkList = function checkList() {
 if ($scope.selection.length == 0) {
 return true;	
 } else if ($scope.selection.length == 1) {
 return false;
 }else{
 return true;					
 } }
 //from here 7jan  
 $scope.selection=[];
 $scope.toggleSelection = function toggleSelection(subject) {
 var idx = $scope.selection.indexOf(subject);
 if (idx > -1) {
 $scope.selection.splice(idx, 1);
 }
 else {
 $scope.selection.push(subject);
 }
 if ($scope.selection.length >1) {
 alert("Do not select Multiple stocks at a time !!")	
 }
 $scope.flag=subject;
 };
			 //delete check box slection
 $scope.selection1=[];
 $scope.toggleSelection1 = function toggleSelection1(subject1) {
 var idx = $scope.selection1.indexOf(subject1);
 if (idx > -1) {
 $scope.selection1.splice(idx, 1);
 }
 else {
 $scope.selection1.push(subject1);
}
 };
 $scope.checkList1 = function checkList1() {
 if ($scope.selection1.length == 0) {
 return true;	
 } else if ($scope.selection1.length == 1) {
 return false;
 }else{
 return true;					
 } }
			 //delete  stock
 $scope.deleteStock=function(){
 $scope.show_3=false;
 $anchorScroll("scrolldown2");
 var companyName=$scope.selection;
 if(companyName.length==1){
 PortfolioService
 .getEditing_DeleteList(companyName)
 .then(
 function(response) {
 var listofData = response;
 $scope.ListOfEditValue = listofData;
 $scope.show_4=true;
 }); }
else if(companyName.length>1){
 alert("At a time only one company");
 }else{
 alert("Select at least one Stock");
 $scope.show_4=false;
 }};
 $scope.closeDelete=function closeDelete(){
 $scope.show_4=false;
 }
 $scope.listInfo;
 $scope.deletingStock=function(){
 var listofP_id=$scope.selection1;
 if(listofP_id.length>0){
 var deleteUser = $window.confirm('Are you sure to delete this stock ?');
 if (deleteUser) {
 window.location= path+'/companydatas/deleting?listofP_id=' + listofP_id;
 } }
 else{
 alert("Select at least one Stock");
 }};
 $scope.closeEdit=function closeEdit(){
 $scope.show_3=false;
 }
 $scope.editStock=function(){
 $scope.show_4=false;
 $anchorScroll("scrolldown1");
 var companyName=$scope.selection;
 if(companyName.length==1){
 PortfolioService
 .getEditing_DeleteList(companyName)
.then(
 function(response) {
 var listofData = response;
 $scope.ListOfEditValue = listofData;
 $scope.show_3=true;});}
 else if(companyName.length>1){
 alert("At a time only one company");
 }else{
 alert("Select at least one Stock");
 $scope.show_3=false;
}}; }]); 
App.directive('date', function (dateFilter) {
  return {
   require:'ngModel',
  link:function (scope, elm, attrs, ctrl) {
 var dateFormat = attrs['date'] || 'yyyy-MM-dd';
 ctrl.$formatters.unshift(function (modelValue) {
 return dateFilter(modelValue, dateFormat);
 });}};})
//This is for Datepicker... Added by Sunil Gauswami
App.directive('uiDate', function() {
 return {
 require: '?ngModel',
 link: function($scope, element, attrs, controller) {
 var originalRender, updateModel, usersOnSelectHandler;
 if ($scope.uiDate == null) $scope.uiDate = {};
 if (controller != null) {
 updateModel = function(value, picker) {
return $scope.$apply(function() {
 return controller.$setViewValue(element.datepicker("getDate"));
});};
if ($scope.uiDate.onSelect != null) {
 usersOnSelectHandler = $scope.uiDate.onSelect;
$scope.uiDate.onSelect = function(value, picker) {
updateModel(value);
return usersOnSelectHandler(value, picker);
};
} else {
$scope.uiDate.onSelect = updateModel;
}
 originalRender = controller.$render;
 controller.$render = function() {
 originalRender();
 return element.datepicker("setDate", controller.$viewValue);
};
}
 return element.datepicker($scope.uiDate);
}};});
