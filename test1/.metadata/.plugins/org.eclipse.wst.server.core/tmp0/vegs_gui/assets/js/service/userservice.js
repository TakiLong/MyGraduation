/**
 * declare 'UserService'
 */
'use strict';
app.factory('AuthenticationService', function() {
	var auth = {
		isLogged : false
	}

	return auth;
});
//userservice接口中的一些方法
app.factory('UserService', function($http) {

	return {
		//登录service
		logIn : function(data) {
            alert("service");
            alert("login data:"+data);
			return $http({
				headers : {
					'Content-Type' : 'application/x-www-form-urlencoded'
				},
				url : webBaseURL + '/vagetables/rest/user/login',
				method : 'POST',
				data : data
			});
			
		},
		//注销
		logOut : function() {

		},
		//添加一个客户service,data为页面的adData
		insert : function(data){
			alert("insert service ...");
			return $http({
				headers : {
					'Content-Type' : 'application/x-www-form-urlencoded'
				},
				//请求服务器url地址
				url : webBaseURL + '/vagetables/rest/user/add_users',
				//提交方式
				method : 'POST',
				
				data : data,
			});
		},
		//删除
		del : function(data){
			alert("delete service ...");
			return $http({
				headers : {
					'Content-Type' : 'application/x-www-form-urlencoded'
				},
				//请求服务器url地址
				url : webBaseURL + '/vagetables/rest/user/delete_users',
				//提交方式
				method : 'POST',
				
				data : data,
			});
		},
		//修改
		update : function(data){
			alert("delete service ...");
			return $http({
				headers : {
					'Content-Type' : 'application/x-www-form-urlencoded'
				},
				//请求服务器url地址
				url : webBaseURL + '/vagetables/rest/user/update_users',
				//提交方式
				method : 'POST',
				
				data : data,
			});
		}
		
	};
});
app.factory('TokenInterceptor', function($q, $window, AuthenticationService) {
	return {
		request : function(config) {
			config.headers = config.headers || {};
			if ($window.localStorage.token) {
				config.headers.Authorization = 'Bearer '
						+ $window.localStorage.token;
			}
			return config;
		},

		response : function(response) {
			return response || $q.when(response);
		},
		responseError : function(response) { 
			console.log("error:"+response.status==401);
	        return $q.reject(response); 
	    }
	};
});
app.config(function($httpProvider) {
	$httpProvider.interceptors.push('TokenInterceptor');
});