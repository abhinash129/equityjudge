'use strict'

App.factory('RoleServices', [ '$http', '$q', 
                                function($http, $q) 
    {
	return {
		ViewRole : function(roleid,rolename) 
		{
	return $http.post(path+'/role/viewrole?id='+roleid+'&&name='+rolename).then(
		function(response) 
					{
		var data = response.data;
		return data;
		});
		},
		getuserrolList : function(userename) 
		{
		return $http.post(path+'/role/searchuser?username=' + userename).then(
					function(response) 
					{
						var data = response.data;
						return data;
					});
		},
		getrolename : function() 
		{
		return $http.post(path+'/role/getrolename').then(
		function(response) 
		{
		var data = response.data;
		return data;
		});
		},deleteData : function(role_id) 
		{
		return $http.post(path+'/role/delete?id=' + role_id).then
			(
					function(response) 
					{	
						var data = response.data;
						return data;
					});},
		deleteUserRoleData : function(userrole_id) 
		{
		return $http.post(path+'/role/deleteroleview?id=' + userrole_id).then
			(
					function(response) 
					{	
						var data = response.data;
						return data;
					}
			);
		},
		getRoleName : function(searchData) 
		{
			return $http.post(path+'/role/search?searchData=' + searchData).then(
					function(response) 
					{
						var data = response.data;
						return data;
					});
		},
		updateData : function(editData) 
		{
			return $http.post(path+'/role/edit?editData=' + editData).then
			(
					function(response) 
					{	
						alert("In Response Services");
						var data = response.data;
						return data;
					}
			);
		}
	}
    }]);


