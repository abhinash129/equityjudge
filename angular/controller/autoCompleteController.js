'use strict'
App.controller('AutoCompleteController',[ '$scope','AutoCompleteService',function($scope,AutoCompleteService) {
 $scope.search = function() {
 var companyNameList = $scope.CommancompanyName;
 if (companyNameList.length >= 2) {
 AutoCompleteService .getCompanyName(companyNameList) .then(function(response) {
 $scope.suggestions = [];
 var maxSuggestionListLength = 0;
 $scope.suggestionList = response;
 if ($scope.suggestionList.length == 0) {} else {
 for (var i = 0; i < $scope.suggestionList.length; i++) {
 var companyListSuggestions = $scope.suggestionList[i];
 $scope.suggestions
 .push(companyListSuggestions.companyName+"("+companyListSuggestions.companyId+")");
 maxSuggestionListLength += 1;
 if (maxSuggestionListLength == 6) {
 break;
 }}}
 $( "#automplete-2" ).autocomplete({
 source: $scope.suggestions,
 select: function( event , ui ) {
 $scope.companyNamewithBrc = ui.item.label;
 var cmpny = $scope.companyNamewithBrc;
 cmpny = cmpny.substring(0, cmpny.lastIndexOf('('));
 if (cmpny.indexOf("&") != -1) {
 $scope.CommancompanyName= cmpny.replace(/&/g,"%26");
 }else{
 $scope.CommancompanyName = cmpny;
 }
 var FinalCompanyName = $scope.CommancompanyName;
 window.location=path+'/graphpattern/graph/selectCompny?companyName=' + FinalCompanyName;
 }}); },
 function(errResponse) {
  console.error('Error while fetching company');
 }); }}
  $scope.search2 = function() {
 var companyNameList = $scope.CommancompanyName;
 if (companyNameList.length >= 2) {
 AutoCompleteService.getCompanyName(companyNameList).then(function(response) {
 $scope.suggestions = [];
 var maxSuggestionListLength = 0;
 $scope.suggestionList = response;
 if ($scope.suggestionList.length == 0) {} else {
 for (var i = 0; i < $scope.suggestionList.length; i++) {
 var companyListSuggestions = $scope.suggestionList[i];
 $scope.suggestions.push(companyListSuggestions.companyName+"("+companyListSuggestions.companyId+")");
 maxSuggestionListLength += 1;
 if (maxSuggestionListLength == 6) {
 break;
 }}}
 $( "#automplete-2" ).autocomplete({
 source: $scope.suggestions,
 select: function( event , ui ) {
 $scope.companyNamewithBrc = ui.item.label;
 var cmpny = $scope.companyNamewithBrc;
 cmpny = cmpny.substring(0, cmpny.lastIndexOf('('));
 if (cmpny.indexOf("&") != -1) {
 $scope.CommancompanyName= cmpny.replace(/&/g,"%26");
 }else{
 $scope.CommancompanyName = cmpny;
 }
 var FinalCompanyName = $scope.CommancompanyName;
 window.location=path+'/graphpattern/graph/selectCompnyDemo?companyName=' + FinalCompanyName;
 }});},
 function(errResponse) {
 console.error('Error while fetching company');
 });} }}]);