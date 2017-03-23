/**
 * declare 'PropertyService'
 */
'use strict';

app.factory('PropertyService', function($http,$window) {
	return {
		getGroup : function(data) {
			return $http({
				headers : {
					'Content-Type' : 'application/x-www-form-urlencoded'
				},
				url : webBaseURL + '/cloudops/rest/property/prop_list_group',
				method : 'POST',
				data : $.param({ppe_group:data})
			});
		},

		getOne : function() {

		},
		
		getAll : function() {
			$http({
				headers : {
					'Content-Type' : 'application/x-www-form-urlencoded'
				},
				url : webBaseURL + '/cloudops/rest/property/prop_list',
				method : 'POST'
			}).success(function (response){
				$window.localStorage.property = JSON.stringify(response.data);
				//$window.localStorage.property = response.data;
			});
		},
		
		getGroupFromLocal : function(data) {
			if($window.localStorage.property==""){
				
			}else{
				var property = JSON.parse($window.localStorage.property || '{}');
			}
			var result = new Array();
			for (var j = 0; j < property.length; j++) {
                if(data==property[j].ppeGroup){
                	result.push(property[j]);
                }	            
			}
			return result;
		}
	}
});
