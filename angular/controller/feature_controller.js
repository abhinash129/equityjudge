'use strict'
App.controller('FeatureController',['$scope','FeatureServices',function($scope,FeatureServices){ 
 $scope.checkIfEnterKeyWasPressed = function($event){
  var keyCode = $event.which || $event.keyCode;
  if (keyCode === 13) {
 var featureID = $scope.featureID;
 var featureName = $scope.featureName;
 if(featureID!=null || featureName!=null ){
 $scope.searchFeature();	
}}}
 $scope.prefixs = [{name:'Starts With',value:"sw"} ,
 {name:'Ends With',value:'ew'},
  {name:'Consist Of',value:'co'}];
 $scope.prefix_featureId = $scope.prefixs[0].value;
 $scope.prefix_featureName = $scope.prefixs[0].value;
 $scope.status = [{name:'Active',value:"Y"},{name:'InActive',value:'N'}];
 $scope.Status = $scope.status[0].value;
 $scope.show1=false;
 //FOR OPEN EDIT PAGE WITH TABLE PARTICULAR ROW DATA
 $scope.editRecord = function(modulelist){
 $scope.RowData = modulelist;
 $scope.listData=[];
 $scope.listData.push($scope.RowData.featureid,$scope.RowData.featurename,$scope.RowData.description,$scope.RowData.path,$scope.RowData.status);
 var listofData = $scope.listData;
 window.location=path+'/feature/edit?editData=' + listofData;
 }
			 //FOR DELETE RECORD
 $scope.deleteRecord = function(featurelist){
 $scope.RowData = featurelist;
 $scope.featureid=$scope.RowData.featureid;
 var featureid = $scope.featureid;
 FeatureServices.deleteData(featureid).then(
 function(response) {	
 if (response) {
 window.location.reload();
 alert("Your Feature is delete Successfully");
 } else {
 alert("Feature is not Deleted");
 } } );}
			 //FOR SEARCH FEATURES IN SEARCH PAGE
 $scope.searchFeature = function() {
 var prefix_featureId = $scope.prefix_featureId;
 var featureID = $scope.featureID;
 var prefix_featureName = $scope.prefix_featureName;
 var featureName = $scope.featureName;
 var status = $scope.Status;
 $scope.serachData = [];
 $scope.serachData.push(prefix_featureId,featureID,prefix_featureName,featureName,status);
 var searchFeature= $scope.serachData;
 FeatureServices.getFeatureName(searchFeature).then(
 function(response) {
 $scope.features = response;
 $scope.featurelist=[];
 if($scope.features.length==0) {
// alert("No Features Found!!!!!");
 $scope.show1=true;
 }
	 else {
 for (var i = 0; i < $scope.features.length; i++) {
 var feature = $scope.features[i];
 $scope.featurelist
.push(feature);
	 }	
 $scope.show1=true;
 } 
 }); }}]); 
App.directive('confirmClick', function() {
  return {
  link: function (scope, element, attrs) {
  scope.confirmClick = function(msg) {
  msg = msg || attrs.confirmClick || 'Are you sure?';
  return confirm(msg);
  }} }})
 