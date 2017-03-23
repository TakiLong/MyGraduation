'use strict';

/**
 * Config for the router
 */
app.config(['$stateProvider', '$urlRouterProvider', '$controllerProvider', '$compileProvider', '$filterProvider', '$provide', '$ocLazyLoadProvider', 'JS_REQUIRES',
function ($stateProvider, $urlRouterProvider, $controllerProvider, $compileProvider, $filterProvider, $provide, $ocLazyLoadProvider, jsRequires) {

    app.controller = $controllerProvider.register;
    app.directive = $compileProvider.directive;
    app.filter = $filterProvider.register;
    app.factory = $provide.factory;
    app.service = $provide.service;
    app.constant = $provide.constant;
    app.value = $provide.value;

    // LAZY MODULES

    $ocLazyLoadProvider.config({
        debug: false,
        events: true,
        modules: jsRequires.modules
    });

    // APPLICATION ROUTES
    // -----------------------------------
    // For any unmatched url, redirect to /app/dashboard
    $urlRouterProvider.otherwise("/login/signin");
    //
    // Set up the states
    $stateProvider.state('app', {
        url: "/app",
        templateUrl: "assets/views/app.html",
        resolve: loadSequence('truncate', 'htmlToPlaintext','modernizr', 'moment', 'angularMoment', 'uiSwitch', 'perfect-scrollbar-plugin', 'toaster', 'ngAside', 'vAccordion', 'sweet-alert', 'chartjs', 'tc.chartjs', 'oitozero.ngSweetAlert'),
        abstract: true

    //用户列表接口
    }).state('app.user_list', {
        url: "/user_list",
        templateUrl: "assets/views/user_list.html",
        resolve: loadSequence('userCtrl','ngTable'),
        title: '用户列表',
        requiredLogin: false,
        ncyBreadcrumb: {
            label: '用户列表'
        }
    
    
	// Login routes

    }).state('login', {
	    url: '/login',
	    template: '<div ui-view class="fade-in-right-big smooth"></div>',
	    abstract: true
	}).state('login.signin', {
	    url: '/signin',
	    cache:'false',  
	    templateUrl: "assets/views/login_login.html",
	    resolve: loadSequence('loginCtrl','toaster','login-bg'),
	    requiredLogin: false,
	    title: "登录"
	}).state('login.forgot', {
	    url: '/forgot',
	    templateUrl: "assets/views/login_forgot.html"
	}).state('login.registration', {
	    url: '/registration',
	    templateUrl: "assets/views/login_registration.html"
	}).state('login.lockscreen', {
	    url: '/lock',
	    templateUrl: "assets/views/login_lock_screen.html"
	});

    // Generates a resolve object previously configured in constant.JS_REQUIRES (config.constant.js)
    function loadSequence() {
        var _args = arguments;
        return {
            deps: ['$ocLazyLoad', '$q',
			function ($ocLL, $q) {
			    var promise = $q.when(1);
			    for (var i = 0, len = _args.length; i < len; i++) {
			        promise = promiseThen(_args[i]);
			    }
			    return promise;

			    function promiseThen(_arg) {
			        if (typeof _arg == 'function')
			            return promise.then(_arg);
			        else
			            return promise.then(function () {
			                var nowLoad = requiredData(_arg);
			                if (!nowLoad)
			                    return $.error('Route resolve: Bad resource name [' + _arg + ']');
			                return $ocLL.load(nowLoad);
			            });
			    }

			    function requiredData(name) {
			        if (jsRequires.modules)
			            for (var m in jsRequires.modules)
			                if (jsRequires.modules[m].name && jsRequires.modules[m].name === name)
			                    return jsRequires.modules[m];
			        return jsRequires.scripts && jsRequires.scripts[name];
			    }
			}]
        };
    }
}]);
app.run(function($window,$state,$rootScope, $location, AuthenticationService) {
  /*  $rootScope.$on("$locationChangeSuccess", function(event, nextRoute, currentRoute) {
        if (($state.current.requiredLogin||$state.current.requiredLogin==null)&&!AuthenticationService.isLogged&&$window.localStorage.token==null) {
        	$state.go("login.signin",{}, {reload: true});
        }
    });
    $rootScope.$on('$stateChangeStart',function(event, toState, toParams, fromState, fromParams){
    	if(toState.name=='login.signin')return;// 如果是进入登录界面则允许
    	// 如果用户不存在
    	if($window.localStorage.role_user!="81"){ //只有管理员能访问的
    		if(toState.name=='app.source_list' || toState.name=='app.source_add' || toState.name=='app.source_details'
        		|| toState.name=='app.modules_list' || toState.name=='app.modules_add' || toState.name=='app.modules_update' || toState.name=='app.user_list' 
            		|| toState.name=='app.user_add' || toState.name=='app.user_update' || toState.name=='app.task_list' || toState.name=='app.all_myApply'
            			|| toState.name=='app.sourceReport'|| toState.name=='app.allReport'|| toState.name=='app.selfReport' || toState.name=='app.addReport'
            				|| toState.name=='app.Table'){
    			event.preventDefault();// 取消默认跳转行为
        		$state.go("app.dashboard",{});//跳转到主界面
    		}
    		
    	}else if($window.localStorage.role_user!="82"){//只有普通用户能访问的
    		if(toState.name=='app.myTask_list' || toState.name=='app.project_list' || toState.name=='app.apply' || toState.name=='app.myTask_list' 
    			|| toState.name=='app.myApply_list'  || toState.name=='app.myTags_list' || toState.name=='app.myTags_add'
              ){
    			event.preventDefault();// 取消默认跳转行为
            	$state.go("app.dashboard",{});//跳转到主界面
    		}
        	
        }
    });*/
});
