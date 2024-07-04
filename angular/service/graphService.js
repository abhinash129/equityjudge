'use strict'

App.factory('GraphService', ['$http','$q',
                             function($http, $q) {
	return {

		insertUserReview : function(user_review) {
			return $http.post(
					path+'/userreview?userreview='
					+ user_review).then( function(response) {
						var int = response.data;
						return int;
					}); },  
					//Add Stock to portfolio
					addToPortfolio : function(stockListFromTrendToPorfolio) {
						return $http.post(
								path+'/companydata/directAddStocks?stockListFromTrendToPorfolio='
								+ stockListFromTrendToPorfolio).then( function(response) {
									var int = response.data;
									return int;
								}); },
								//Get suggestion about pattern
								getPatternSuggestion : function(CompanyName) {
									return $http.post(
											path+'/graphpattern/suggestion?companyName='+ CompanyName).then(
													function(response) {
														var suggestion = response.data;
														return suggestion; });
								},
								//Get data for plotting graph
								getValue : function(compnyList, year, average) {
									return $http.post(
											path+'/graphpattern/wholecompanydetails?compnyList='
											+ compnyList
											+ '&year='
											+ year
											+ '&average='+ average).then( function(response) {
												var wholeData = response.data;
												return wholeData;
											});
								},
								//Get data for Quotes Table
								getQuotesValue : function(companyname, year, average) {
									return $http.post(path+'/graphpattern/companydetailsQuotes?compnyList='
											+ companyname
											+ '&year='
											+ year
											+ '&average='
											+ average).then(
													function(response) {
														var wholeData = response.data;
														return wholeData;});
								},
								getCompanyName : function(companyNameList) {
									return $http.post(path+'/graphpattern/?companyName=' + companyNameList).then(
											function(response) {
												var data = response.data;
												return data;
											});
								},
								addToWatchlist : function(companyName,companyCode){
									return $http.post(path+'/graphpattern/watchlist?companyName='
											+companyName
											+'&companyCode='
											+companyCode).then(
													function (response){
														var data = response.data;
														return data;
													});
								}
	};} ]);
