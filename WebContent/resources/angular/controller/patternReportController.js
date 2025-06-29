'use strict';

App.controller('ReportController', ['$scope', 'ReportService', function($scope, ReportService) {
    $scope.sortType = 'Sr_No'; // Set the default sort type
    $scope.sortReverse = false; // Set the default sort order
    $scope.searchCompany = ''; // Set the default search/filter term
    $scope.latestReportData = []; // This will hold the final formatted report data

    // Function to load the latest suggestion report
    $scope.LoadSuggestionReport = function() {
        ReportService.getlatestReport().then(function(response) {
            // Assuming 'response' contains the necessary fields including CLOSE_PRICE
            $scope.latestReport = response;
            
            // Transform the data from the response into the desired format
            var allRowData = [];
            for (var i = 0; i < $scope.latestReport.length; i++) {
                var BO = $scope.latestReport[i];
                var rowData = {
                    Sr_No: i + 1,  // Indexing the rows starting from 1
                    COMPANYNAME: BO.companyName,
                    PATTERN_NAME: BO.pattern_Name,
                    SUGGESTION: BO.suggestion,
                    VALUE: BO.value,
                    CLOSE_PRICE: BO.close_price, // Ensure 'close_price' is coming from the backend
                    FORMING_DATE: BO.forming_Date  // Assuming 'forming_Date' exists
                };
                allRowData.push(rowData);
            }
            $scope.latestReportData = allRowData;  // Update the $scope with the transformed data
        }).catch(function(error) {
            console.error('Error loading report data:', error);
        });
    };

    // Optionally, you can load the report on page load (if required)
    $scope.LoadSuggestionReport();
}]);


//
//'use strict';
//App.controller('ReportController', [ '$scope', 'ReportService',
//		function($scope, ReportService) {
//			$scope.sortType = 'Sr_No'; // set the default sort type
//			$scope.sortReverse = false; // set the default sort order
//			$scope.searchCompany = ''; // set the default search/filter term
//			$scope.latestReportData = [];
//
//			$scope.LoadSuggestionReport = function() {
//				ReportService.getlatestReport().then(function(response) {
//
//					$scope.latestReport = response;
//					var allRowData = [];
//					for (var i = 0; i < $scope.latestReport.length; i++) {
//						var BO = $scope.latestReport[i];
//						var rowData = {
//							Sr_No : i + 1,
//							COMPANYNAME : BO.companyName,
//							PATTERN_NAME : BO.pattern_Name,
//							SUGGESTION : BO.suggestion,
//							VALUE : BO.value,
//							CLOSE_PRICE:BO.close_price,
//							FORMING_DATE : BO.forming_Date
//						};
//						allRowData.push(rowData)
//					}
//					$scope.latestReportData = allRowData;
//				});
//			};
//		} ]);




/*'use strict';
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
 FORMING_DATE:  BO.forming_Date,
 //CLOSE_PRICE: BO.closePrice
 };
 allRowData.push(rowData)
 }
 $scope.latestReportData = allRowData;
 console.log($scope.latestReportData);
 }); };} ]);*/

//
//'use strict';
//App.controller('ReportController', [ '$scope', 'ReportService',
//		function($scope, ReportService) {
//			$scope.sortType = 'Sr_No'; // set the default sort type
//			$scope.sortReverse = false; // set the default sort order
//			$scope.searchCompany = ''; // set the default search/filter term
//			$scope.latestReportData = [];
//
//			$scope.LoadSuggestionReport = function() {
//				ReportService.getlatestReport().then(function(response) {
//
//					$scope.latestReport = response;
//					var allRowData = [];
//					for (var i = 0; i < $scope.latestReport.length; i++) {
//						var BO = $scope.latestReport[i];
//						var rowData = {
//							Sr_No : i + 1,
//							COMPANYNAME : BO.companyName,
//							PATTERN_NAME : BO.pattern_Name,
//							SUGGESTION : BO.suggestion,
//							VALUE : BO.value,
//							CLOSE_PRICE:BO.close_price,
//							FORMING_DATE : BO.forming_Date
//						};
//						allRowData.push(rowData)
//					}
//					$scope.latestReportData = allRowData;
//				});
//			};
//		} ]);
