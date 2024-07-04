'use strict'
App.controller('WatchListController',['$anchorScroll','$scope','WatchListService','$window',
  function($anchorScroll,$scope,WatchListService,$window){
    $scope.addWatchlistFlag=false;
    $scope.addWatchlist=function(){
	$scope.addWatchlistFlag=true;
	}	 
	$scope.search=function(){
	var companyNameList=$scope.CommancompanyName;
    if (companyNameList.length>=2){
	WatchListService.getCompanyName(companyNameList).then(function(response){
	$scope.dropDown=[];
    var maxdropDownListLength=0;
    $scope.dropDownList=response;
    if ($scope.dropDownList.length==0){}
    else{
	for (var i=0;i<$scope.dropDownList.length;i++) {
    var companyListSuggestions=$scope.dropDownList[i];
	$scope.dropDown.push(companyListSuggestions.companyName+"("+companyListSuggestions.companyCode+")");
	maxdropDownListLength += 1;
    if(maxdropDownListLength==6){
    break;}}}
	$( "#automplete-3" ).autocomplete({source: $scope.dropDown,select: function(event,ui){
	$scope.companyNamewithBrc=ui.item.label;
	var cmpny =$scope.companyNamewithBrc;
	$scope.companyCode=cmpny.substring(cmpny.lastIndexOf('('),cmpny.length);
	var CompanyCode=$scope.companyCode;
	CompanyCode=CompanyCode.replace(/[()]/g, '');
	cmpny=cmpny.substring(0, cmpny.lastIndexOf('('));
	if(cmpny.indexOf("&")!=-1){
	$scope.CommancompanyName=cmpny.replace(/&/g,"%26");
	}else{
	$scope.CommancompanyName=cmpny;
	}
	var CompanyName=$scope.CommancompanyName;
	WatchListService.addToWatchList(CompanyName,CompanyCode).then(function(response){
	var resp=response;
	if(resp!=0){
	window.location.reload();
	alert("Successfully Added To Watchlist");
	}else{
	alert("Company Already Existing In Watchlist");
	}})}});
	},function(errResponse) {
	console.error('Error while fetching company');
	});
	}}

    $scope.deleteStock=function(companyCodeFromWatchList){
	var companyCode=companyCodeFromWatchList;
	var deleteUser=$window.confirm('Are you sure to delete this stock ?');
	if(deleteUser){
	WatchListService.deleteWatchList(companyCode).then(function(response) {
	if(response==1){
	window.location.reload();
	alert("Your stock deleted Successfully");
	}else{
	alert("Stock deletion failed");
	}});
	}}}]);
