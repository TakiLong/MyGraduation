/**
 * declare 'LogService'
 */
'use strict';

app.factory('LogService', function($http,$window) {
	return {
		getGroup : function(logUserUuid,logUserNameCn,operateDetail,operateType) {
			return $http({
				headers : {
					'Content-Type' : 'application/x-www-form-urlencoded'
				},
				url : webBaseURL + '/cloudops/rest/log/insert_log',
				method : 'POST',
				data : $.param({logUserUuid:logUserUuid,logUserNameCn:logUserNameCn,operateDetail:operateDetail,operateType:operateType})
			});
		},

	}
});
