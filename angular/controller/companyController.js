'use strict'; App.controller('CompanyController',['$scope','CompanyService',function($scope, CompanyService) {
	$scope.rs=false;
	$scope.week="0";
	$scope.month="0";
	
	$scope.subscription = function(){
		alert("Now you are on free Subscription Period")
	}
	
	$scope.calculate = function calculate() {
		$scope.duration=[];
		$scope.duration.push($scope.month);
		$scope.duration.push($scope.week);
		var duration = $scope.duration; 
		CompanyService .getPrice(duration).then(
				function(response) {
					$scope.total=response;
					var total = $scope.total;
					if (total!=0) {
						$scope.rs=true;
					} }) };
					$scope.parameters=false;
					$scope.parameterList=[];
					$scope.addParameter = function (parameter) {
						var selectedParameter=parameter;
						$scope.parameterList.push({"id":"$scope.parameterList.length","field":selectedParameter});
						$scope.parameters=true;
					};}]);



