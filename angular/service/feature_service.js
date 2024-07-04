'use strict'

App.factory('FeatureServices', [ '$http', '$q', 
     function($http, $q) 
 { return {
   deleteData : function(featureid) 
		{return $http.post(path+'/feature/delete?id=' + featureid).then
			(function(response) 
 {var data = response.data;
						return data;});},
  getFeatureName : function(searchFeature) 
 {return $http.post(path+'/feature/searchfeature?searchFeature=' + searchFeature).then(
  function(response) 
 { var data = response.data;
  return data;});}
    }}]);
