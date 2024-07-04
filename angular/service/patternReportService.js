'use strict'

App.factory('ReportService', ['$http','$q',
	function($http, $q) {
			return {
	getlatestReport : function() {
	return $http.post(path+'/graphpattern/getlatestpattern').then(
	function(response) {
	var data = response.data;
	return data;
	});
	}
	};
} ]);
