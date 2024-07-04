'use strict';
App.controller('ReportController',['$scope','ReportService', function($scope,ReportService) {
 $scope.sortType     = 'Sr_No'; // set the default sort type
 $scope.sortReverse  = false;  // set the default sort order
 $scope.searchCompany   = '';     // set the default search/filter term
 $scope.latestReportData = [];
 $scope.LoadSuggestionReport = function() {
 ReportService
 .getlatestReport()
.then(
 function(response) {
 $scope.latestReport = response;
 var allRowData = [];
 for (var i=0; i<$scope.latestReport.length; i++) {
 var BO = $scope.latestReport[i];
 var rowData =  {
 Sr_No: i+1,
 COMPANYNAME:  BO.companyName,
 PATTERN_NAME: BO.pattern_Name,
 SUGGESTION:  BO.suggestion,
 FORMING_DATE:  BO.forming_Date
 };
 allRowData.push(rowData)
 }
 $scope.latestReportData = allRowData;
 }); };} ]);



