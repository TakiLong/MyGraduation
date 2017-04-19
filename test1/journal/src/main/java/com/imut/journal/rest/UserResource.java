package com.imut.journal.rest;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.ws.rs.Consumes;
import javax.ws.rs.FormParam;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.springframework.stereotype.Component;

import com.imut.journal.entity.Result;
import com.imut.journal.entity.User;
import com.imut.journal.service.UserService;

@Component
@Path("/user") 
public class UserResource {
	
	@Resource(name="userService")
	private UserService userService;

	@POST
	@Path("/login")  
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	@Produces(MediaType.APPLICATION_JSON)
	public Result login(@FormParam(value="loginname") String loginName,@FormParam(value="password") String loginPasswd) {
		//验证用户名和密码
		System.out.println(loginName+" === "+loginPasswd);
		User u = new User();
		u.setUserLoginname(loginName);
		u.setUserPasswd(loginPasswd);
		User user = userService.loginCheck(u);
		List<Object> list = new ArrayList<Object>();
		Result r=new Result();
		if(user!=null){
			list.add(user);
			r.setError_code("0");
		}else{
			r.setError_code("1");
		}
		r.setData(list);
		System.out.println(list+"==="+list.size());
		return r;
	}
	
	
	@POST
	@Path("all_list")  
	@Produces(MediaType.APPLICATION_JSON)
	public Result getAll() throws Exception {
		System.out.println("list");
		List<User> user = userService.selectAll();
		List<Object> list = new ArrayList<Object>(); 
		list.addAll(user);		
		Result r=new Result();
		r.setError_code("0");
		r.setData(list);
		System.out.println("===users :"+r.getData());
		return r;
	}
	
	
	/*@POST
	@Path("add_users")  
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	@Produces(MediaType.APPLICATION_JSON)
	public Result addUser(@FormParam(value="loginName") String loginName,@FormParam(value="loginPasswd") String loginPasswd,
			@FormParam(value="userNameCn") String userNameCn,@FormParam(value="userRoleUuid") String userRoleUuid,
			@FormParam(value="userMobile") String userMobile,@FormParam(value="userWeixin") String userWeixin,
			@FormParam(value="userEmail") String userEmail,@FormParam(value="userAddressOne") String userAddressOne,
			@FormParam(value="userAddressTwo") String userAddressTwo,@FormParam(value="userLevel") String userLevel,
			@FormParam(value="userChannel") String userChannel,@FormParam(value="totalPrice") String totalPrice,
			@FormParam(value="remainPrice") String remainPrice,@FormParam(value="userRole") Integer userRole) throws Exception {
		User user = new User();
		
		user.setLoginName(loginName);
		user.setLoginPasswd(loginPasswd);
		user.setRemainPrice(remainPrice);
		user.setTotalPrice(totalPrice);
		user.setUserAddressOne(userAddressOne);
		user.setUserAddressTwo(userAddressTwo);
		user.setUserChannel(userChannel);
		user.setUserEmail(userEmail);
		user.setUserMobile(userMobile);
		user.setUserLevel(userLevel);
		user.setUserNameCn(userNameCn);
		user.setUserRole(userRole);
		user.setUserWeixin(userWeixin);
		

		userService.insert(user);
		List<Object> list = new ArrayList<Object>();
		list.add("Successful add");
		Result r=new Result();
		r.setError_code("0");
		r.setData(list);
		return r;
	}
	
	@POST
	@Path("get_users")  
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	@Produces(MediaType.APPLICATION_JSON)
	public Result getUser(@FormParam(value="uuid") String uuid) throws Exception {
		User user = userService.selectByPrimaryKey(uuid);
		List<Object> list = new ArrayList<Object>();
		list.add(user);
		Result r=new Result();
		r.setError_code("0");
		r.setData(list);
		return r;
	}
	
	
	@POST
	@Path("update_users")  
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	@Produces(MediaType.APPLICATION_JSON)
	public Result updateUser(@FormParam(value="uuid") String uuid,
			@FormParam(value="loginName") String loginName,@FormParam(value="loginPasswd") String loginPasswd,
			@FormParam(value="userNameCn") String userNameCn,@FormParam(value="userRoleUuid") String userRoleUuid,
			@FormParam(value="userMobile") String userMobile,@FormParam(value="userWeixin") String userWeixin,
			@FormParam(value="userEmail") String userEmail,@FormParam(value="userAddressOne") String userAddressOne,
			@FormParam(value="userAddressTwo") String userAddressTwo,@FormParam(value="userLevel") String userLevel,
			@FormParam(value="userChannel") String userChannel,@FormParam(value="totalPrice") String totalPrice,
			@FormParam(value="remainPrice") String remainPrice,@FormParam(value="userRole") Integer userRole) throws Exception {
		User user = userService.selectByPrimaryKey(uuid);
		user.setLoginName(loginName);
		user.setLoginPasswd(loginPasswd);
		user.setRemainPrice(remainPrice);
		user.setTotalPrice(totalPrice);
		user.setUserAddressOne(userAddressOne);
		user.setUserAddressTwo(userAddressTwo);
		user.setUserChannel(userChannel);
		user.setUserEmail(userEmail);
		user.setUserMobile(userMobile);
		user.setUserLevel(userLevel);
		user.setUserNameCn(userNameCn);
		user.setUserRole(userRole);
		user.setUserWeixin(userWeixin);
		
		userService.updateByPrimaryKey(user);
		List<Object> list = new ArrayList<Object>();
		list.add("Successful update");
		Result r=new Result();
		r.setError_code("0");
		r.setData(list);
		return r;
	}*/
	
	/*@POST
	@Path("del_users")  
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	@Produces(MediaType.APPLICATION_JSON)
	public Integer delUser(@FormParam(value="array[]") String[] uuid) throws Exception {
		System.out.println(uuid+"delete []");
		int delKey = userService.deleteByPrimaryKey(Arrays.toString(uuid));
		return delKey;
	}*/
}
