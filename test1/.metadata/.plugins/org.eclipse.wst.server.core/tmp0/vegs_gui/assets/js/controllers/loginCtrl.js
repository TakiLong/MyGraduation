'use strict';
/**
 * controllers used for the login
 * 
 */
app.controller("loginCtrl", function($state,$http,$scope, $location, $window, UserService, LogService,AuthenticationService,PropertyService,toaster) {
	$window.particlesJS('particles-js',
			  {
			    "particles": {
			      "number": {
			        "value": 40,
			        "density": {
			          "enable": true,
			          "value_area": 1000
			        }
			      },
			      "color": {
			        "value": "#A71E32"
			      },
			      "shape": {
			        "type": "circle",
			        "stroke": {
			          "width": 0,
			          "color": "#000000"
			        },
			        "polygon": {
			          "nb_sides": 5
			        },
			        "image": {
			          "src": "img/github.svg",
			          "width": 100,
			          "height": 100
			        }
			      },
			      "opacity": {
			        "value": 0.5,
			        "random": false,
			        "anim": {
			          "enable": false,
			          "speed": 1,
			          "opacity_min": 0.1,
			          "sync": false
			        }
			      },
			      "size": {
			        "value": 10,
			        "random": true,
			        "anim": {
			          "enable": false,
			          "speed": 40,
			          "size_min": 0.1,
			          "sync": false
			        }
			      },
			      "line_linked": {
			        "enable": true,
			        "distance": 150,
			        "color": "#A71E32",
			        "opacity": 0.4,
			        "width": 2
			      },
			      "move": {
			        "enable": true,
			        "speed": 3,
			        "direction": "none",
			        "random": false,
			        "straight": false,
			        "out_mode": "out",
			        "attract": {
			          "enable": false,
			          "rotateX": 600,
			          "rotateY": 1200
			        }
			      }
			    },
			    "interactivity": {
			      "detect_on": "canvas",
			      "events": {
			        "onhover": {
			          "enable": true,
			          "mode": "repulse"
			        },
			        "onclick": {
			          "enable": true,
			          "mode": "push"
			        },
			        "resize": true
			      },
			      "modes": {
			        "grab": {
			          "distance": 400,
			          "line_linked": {
			            "opacity": 1
			          }
			        },
			        "bubble": {
			          "distance": 400,
			          "size": 40,
			          "duration": 2,
			          "opacity": 8,
			          "speed": 3
			        },
			        "repulse": {
			          "distance": 200
			        },
			        "push": {
			          "particles_nb": 4
			        },
			        "remove": {
			          "particles_nb": 2
			        }
			      }
			    },
			    "retina_detect": true,
			    "config_demo": {
			      "hide_card": false,
			      "background_color": "#b61924",
			      "background_image": "",
			      "background_position": "50% 50%",
			      "background_repeat": "no-repeat",
			      "background_size": "cover"
			    }
			  }

			);

	
	$scope.formData = {};
	//读取所有的property
	
	$scope.logIn = function logIn(){
		PropertyService.getAll();
		$http.defaults.headers.post["Content-Type"] = "application/x-www-form-urlencoded";

		 if ($scope.formData.username !== undefined && $scope.formData.password !== undefined) {
             alert($scope.formData.username);
             UserService.logIn($.param($scope.formData)).success(function(data) {
            	 
            	 //alert(data.error_code+"====="+data.data[0].loginName);
            	 //后台传过来的错误代码为0是无错
                 if (data.error_code == '0') {
                	alert("欢迎您,"+data.data[0].loginName);
                    //$window.localStorage.uuid = data.data[0].loginName;
                	//跳转到用户列表页面
					$state.go("app.user_list");
     			} else {
     				alert('用户名或密码错误，请重新登录！');
     				$scope.message = '用户名或密码错误，请重新登录！';
     				$state.go("login.signin");
     				
     			}
             }).error(function(status, data) {
                 console.log(status);
                 console.log(data);
                 	toaster.pop('error', 'Error', '用户名或密码错误，请重新登录！');
     				$scope.message = '用户名或密码错误，请重新登录！';
     				$state.go("login.signin");
             });
         }
	}
});
