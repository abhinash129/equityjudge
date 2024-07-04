'use strict'

App.factory('ModuleServices', [ '$http', '$q', 
 function($http, $q) 
  {
	return {
	getModules : function(role) 
	{
	return $http.post(path+'/getmodules/getmodule?role=' + role).then
	(
	function(response) 
	{	
	var data = response.data;
	return data;
	}
	);
	},
	getFirstModules : function() 
		{
		return $http.post(path+'/getmodules/getFirstModules').then
			(
		function(response) 
		{	
		var data = response.data;
		return data;
		}
		);
		},
		deleteData : function(module_id) 
		{
		return $http.post(path+'/module/delete?id=' + module_id).then
		(
		function(response) 
		{	
		var data = response.data;
		return data;
		}
		);
		},
		getModuleName : function(searchData) 
		{
	return $http.post(path+'/module/search?searchData=' + searchData).then(
		function(response) 
		{
			var data = response.data;
						return data;
					});
		}} }]);


