'use strict';
/** 
  * controller for User Profile Example
*/

app.controller('user_listCtrl', function($scope, $http,$location,$state,$stateParams,uiGridConstants,i18nService,PropertyService,
	UserService,$window,$modal) {
	$http.defaults.headers.post["Content-Type"] = "application/x-www-form-urlencoded";
	console.log("in userCtrl.....");
	i18nService.setCurrentLang("zh-cn");

	$scope.gridOptions1 = {
        enableSorting: true,
        useExternalSorting: false, //是否使用自定义排序规则
        enableGridMenu: false, //是否显示grid 菜单
        //showGridFooter: true, //是否显示grid footer
        enableHorizontalScrollbar :  0, //grid水平滚动条是否显示, 0-不显示  1-显示
            enableVerticalScrollbar : 0, //grid垂直滚动条是否显示, 0-不显示  1-显示
            
            //-------- 分页属性 ----------------
            //enablePaginationControls: true, //使用默认的底部分页
            paginationPageSizes: [10, 15, 20], //每页显示个数可选项
            //paginationCurrentPage:1, //当前页码
            paginationPageSize: 10, //每页显示个数
            //paginationTemplate:"<div></div>", //自定义底部分页代码
            useExternalPagination: false,//是否使用分页按钮
            
            
		    data:[],
		    columnDefs: [
                  {field: 'loginName', displayName: '用户名'},
                  {field: 'userNameCn', displayName: '中文名'},
                  {field: 'userMobile', displayName: '手机号'},
                  {field: 'userWeixin', displayName: '微信号'},
                  {field: 'userAddressOne', displayName: '地址1'},
                  {field: 'userAddressTwo', displayName: '地址2'},
                  {field: 'totalPrice', displayName: '总金额'},
                  {field: 'remainPrice', displayName: '余额'},
                  //下面的field:''里面需要添加参数，否则无法显示数据
                  //uuid,loginName,userNameCn,loginPasswd,userMobile,userWeixin,userEmail,
                  //userAddressOne,userAddressTwo,userLevel,userChannel,totalPrice,remainPrice,remarks
                  
                  {field:'editUser',displayName: '修改信息', 
                   cellTemplate:'<div align="center"><button type="button" class="btn btn-primary btn-xs" ng-click="edit()">修改</button></div> '}
                  
                  
		    ],
		    onRegisterApi: function( gridApi ) {
		      $scope.grid1Api = gridApi;
		      
		    }
			
		  };
		  
		  
			$scope.addColumn = function (field) {
			    $scope.columnDefs.push({
			        field: field,
			        displayName: field,
			        width: 100
			    });
			},
			
			
    $http.post(webBaseURL+"/vegetables/rest/user/all_list")
    .success(function (response) {
    	console.log(response.data);
    	 $scope.gridOptions1.data = response.data;
	});
	
	//弹出用户增加模态框
	$scope.add = function add(){
		console.log("user add ...");
		$("#myModal_add").modal("show");	
	}
	$scope.save = function save(){
		//用$scope.addData直接取页面输入的用户信息，其实相当于user对象
   		alert("添加成功=====登录名："+$scope.addData.loginName+"...");
   		//隐藏模态框
   		$("#myModal_add").modal("hide");
   		
		//注意此处调用userService时，需要在app.controller()中定义userService
   		UserService.insert($.param($scope.addData)).success(function(data) {
   			alert("insert success ...");
   			//刷新bootstrap table
   			$http.post(webBaseURL+"/vegetables/rest/user/all_list")
   			.success(function (response) {
   				//用新数据替换旧数据
   				$scope.gridOptions1.data = response.data;
   			});
   		});
   		
	}

	//删除用户
	$scope.del = function del(){
		//获取所选用户id
		$http.post(webBaseURL+"/vegetables/rest/user/all_list")
	    .success(function (data) {
	    	alert("用户个数:"+data.data.length+"三号用户id："+data.data[2].uuid);
			alert("user delete ...");
			$("#delcfmModel").modal("show");
			
	    	
		});
			
	}
	$scope.delSubmit = function delSubmit(){  
		//UserService.del($.param(data.uuid)).success(function(data) {
		$("#delcfmModel").modal("hide");
		//});
	}
	
	
	
	//修改
	function edit(loginName){
		console.log("user edit ...");
		alert(loginName);
	    //var param = new param(uuid,loginName,userNameCn,loginPasswd,userMobile,userWeixin,userEmail,userAddressOne,userAddressTwo,userLevel,userChannel,totalPrice,remainPrice,remarks);
		//$scope.editData = param;
		
 		$("#delcfmModel").modal("show");	
	}
	//保存修改信息
	$scope.update = function update(){
		//用$scope.addData直接取页面输入的用户信息，其实相当于user对象
   		alert("修改成功=====登录名："+$scope.editData.loginName+"...");
   		//隐藏模态框
   		$("#myModal_edit").modal("hide");

		//调用userservice
   		/*UserService.update($.param($scope.editData)).success(function(data) {
   			alert("update success ...");
   			//刷新bootstrap table
   			$http.post(webBaseURL+"/vegetables/rest/user/all_list")
   			.success(function (response) {
   				//用新数据替换旧数据
   				$scope.gridOptions1.data = response.data;
   			});
   		});*/
   		
	}
	
	
});








