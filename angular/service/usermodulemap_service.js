'use strict'
App.factory('ModuleMapServices', [ '$http', '$q', 
     function($http, $q) 
      {
	return {getmodulename : function() 
		{
	return $http.post(path+'/userrolemodule/getmodulename').then(
	function(response) 
	{
	var data = response.data;
	return data;
	});},
	getfeaturename : function() 
		{
	return $http.post(path+'/userrolemodule/getfeaturename').then(
		function(response) 
		{
	var data = response.data;
	return data;
	});},
		getuserroleidlist : function(userroleidlist) 
		{
return $http.post(path+'/userrolemodule/searchuserrole?userroleid=' + userroleidlist).then(
	function(response) 
	{var data = response.data;
		return data;
		});
		},
		deleteData : function(usermodule_id) 
		{
			return $http.post(path+'/userrolemodule/delete?id=' + usermodule_id).then
			(
					function(response) 
			{	
			var data = response.data;
			return data;
		}
	);
		},
		getRoleUserModuleMap : function(searchData) 
		{
			return $http.post(path+'/userrolemodule/search?searchData=' + searchData).then(
		function(response) 
	{
	var data = response.data;
	return data;
	});
	}
	} }]);

