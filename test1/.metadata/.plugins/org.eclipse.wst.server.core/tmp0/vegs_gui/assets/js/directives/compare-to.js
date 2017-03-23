'use strict';
/** 
  * Password-check directive.
*/
app.directive('compareTo', function () {
    return {
        require: "ngModel",
        scope: {
            otherModelValue: "=compareTo"
        },
        link: function (scope, element, attributes, ngModel) {

            ngModel.$validators.compareTo = function (modelValue) {
                return modelValue == scope.otherModelValue;
            };

            scope.$watch("otherModelValue", function () {
                ngModel.$validate();
            });
        }
    };
});

app.directive('checkPass', function ($http,$window) {
    return {
        require: "ngModel",
        scope: {
            otherModelValue: "=compareTo"
        },
        link: function (scope, element, attributes, ngModel) {

            ngModel.$validators.compareTo = function (modelValue) {
            	var formDataPass = {uuid:$window.localStorage.uuid_user,loginPasswd:modelValue};
	    		$http.defaults.headers.post["Content-Type"] = "application/x-www-form-urlencoded";
	    		$http({url:webBaseURL+"/cloudops/rest/user/check_pass",method: 'POST', data:$.param(formDataPass)
				}).success(function (response) {
					if(response.error_code==1){
						var flag = false;
						//alert("密码错误");
					}else if(response.error_code==0){
						var flag = true;
					}
			    }); 
                return flag;
            };

            scope.$watch("otherModelValue", function () {
                ngModel.$validate();
            });
        }
    };
});