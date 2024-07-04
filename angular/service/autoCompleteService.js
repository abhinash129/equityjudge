'use strict'
App.factory('AutoCompleteService', ['$http','$q',
    function($http, $q) {
    return { getCompanyName : function(companyNameList) {
    return $http.post(path+'/graphpattern/?companyName=' + companyNameList).then(
    function(response) { var data = response.data;
    return data;
       });
    } }; } ]);
