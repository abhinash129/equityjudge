'use strict'

App.factory('CompanyService', ['$http','$q',
 function($http, $q) {
 return {getPrice : function(duration) {
 return $http.post(path+'/dashboard/subscription?duration=' + duration).then(
 function(response) {var data = response.data;
 return data;
     });}
    };} ]);
