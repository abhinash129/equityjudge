'use strict'

App.factory('LoginService', ['$http','$q',
                             function($http, $q) {
	return {
		updateEmailServices : function(email) 
		{
			return $http.post(path+'/updateEmail?email=' + email).then
			(
					function(response) 
					{	
						var data = response.data;
						return data;
					} ); },
					changePasswordServices : function(oldPassword,newPassword) 
					{
						return $http.post(path+'/dashboard/changePassword?old_password=' +oldPassword+"&new_password="+newPassword).then
						(
								function(response) 
								{	
									var data = response.data;
									return data;
								});
					},
					updateMobileServices : function(mobile) 
					{
						return $http.post(path+'/updateMobile?mobile=' + mobile).then
						(
								function(response) 
								{	
									var data = response.data;
									return data;
								}
						);
					},
					feedbackSubmit : function(name,Email,category,message) 
					{
						return $http.post(path+'/dashboard/feedbackSubmit?name=' +name+"&email="+Email+"&category="+category+"&message="+message).then
						(
								function(response) 
								{	
									var data = response.data;
									return data;
								}
						);
					},
					forgotServices : function(username,email) 
					{
						return $http.post(path+'/dashboard/forgotPassword?email=' +email+"&username="+username).then
						(
								function(response) 
								{	
									var data = response.data;
									return data;
								}
						);
					}
	}; } ]);
