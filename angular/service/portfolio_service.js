'use strict'

App.factory('PortfolioService', [
		'$http',
		'$q',
		function($http, $q) {
			return {
				getCompanyName : function(companyNameList) {
					return $http.post(path+'/companydata/data?companyName=' + companyNameList).then(
							function(response) {
								var data = response.data;
								return data;
							});
				},
				getSellingList : function(companyName) {
					return $http.post(path+'/companydatas/selling?companyName=' + companyName).then(
							function(response) {
							});
				},
				getEditing_DeleteList : function(companyName) {
					return $http.post(path+'/companydatas/editing?companyName=' + companyName).then(
							function(response) {
								var data = response.data;
								return data; 
							});
				}
			};
		} ]);

