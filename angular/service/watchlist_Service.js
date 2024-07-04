'use strict'

App.service('WatchListService',
		['$http',
		 '$q',
		 function($http,$q){
			return {
				getCompanyName : function(companyName) {
					return $http.post(path+'/watchlist/dropdown?companyName=' + companyName).then(
				function(response) {
				var data = response.data;
				return data;
				});
				},
				addToWatchList : function(companyName,companyCode){
      			  return $http.post(path+'/watchlist/addwatchlist?companyName='
      			 +companyName
      			 +'&companyCode='
      			+companyCode).then(
      		function (response){
      		 var data = response.data;
      		 return data;
      		});
      		  },
			deleteWatchList : function(companyCode){
			return $http.post(path+'/watchlist/delete?companyCode='
				+ companyCode).then(
			function(response) {
			var data = response.data;
			return data; 
		});
		}
			}
		}
		 ]);