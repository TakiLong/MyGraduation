package com.imut.journal.filter;

import java.io.IOException;
import java.security.Key;

import javax.annotation.Priority;
import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.ws.rs.Priorities;
import javax.ws.rs.WebApplicationException;
import javax.ws.rs.container.ContainerRequestContext;
import javax.ws.rs.container.ContainerRequestFilter;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.UriInfo;
import javax.ws.rs.ext.Provider;

import org.glassfish.jersey.server.ContainerRequest;
import org.springframework.stereotype.Component;

import com.imut.journal.service.UserService;
import com.imut.journal.util.KeyUtil;
import com.imut.journal.util.TokenUtil;



/**
 * @author suojingjing
 */
@Component
@Provider
@Priority(Priorities.AUTHENTICATION)//优先级最高
//实现该拦截器借口
//@Provider可以自动注册
public class JWTSecurityFilter implements ContainerRequestFilter{
	
	@Resource
    UserService userService;
//    @Context
//    Key key;
    @Context
    ServletContext context;
    @Inject
    javax.inject.Provider<UriInfo> uriInfo;
    public static String extractJwtTokenFromAuthorizationHeader(String auth) {
        //Replacing "Bearer Token" to "Token" directly
        return auth.replaceFirst("[B|b][E|e][A|a][R|r][E|e][R|r] ", "").replace(" ", "");
    }
  //重写验证过滤器
    @Override
    public void filter(ContainerRequestContext containerRequestContext) throws IOException {
        //获取本地的私钥
        Key key= KeyUtil.getKey(context);
        //得到访问的方法 例如GET,POST
        String method = containerRequestContext.getMethod().toLowerCase();
        //得到访问路径
        String path = ((ContainerRequest) containerRequestContext).getPath(true).toLowerCase();
        //get application.wadl和application.wadl/xsd0.xsd不需要验证，post验证过滤,注册过滤。
        if ("post".equals(method) &&( "authentication".equals(path)||"regist".equals(path))) {
            // pass through the filter.
        	System.out.println("in post");
            containerRequestContext.setSecurityContext(new SecurityContextAuthorizer(uriInfo,new AuthorPricinple("pass"), new String[]{"pass"}));
            return;
        }
//        else if("options".equals(method)){
//        	throw new WebApplicationException(Response.Status.NO_CONTENT);
//        }
        //获取头信息中的token
        String authorizationHeader = ((ContainerRequest) containerRequestContext).getHeaderString("Authorization");
        //如果token为空抛出
        if (authorizationHeader == null) {

            throw new WebApplicationException(Response.Status.UNAUTHORIZED);//抛出未认证的错误
        }
        //把Bear Token换成Token
        String strToken=extractJwtTokenFromAuthorizationHeader(authorizationHeader);
        if (TokenUtil.isValid(strToken,key)){
            String name=TokenUtil.getName(strToken,key);//反解出Name
            String[] roles=TokenUtil.getRoles(strToken,key);//反解出角色
            int version=TokenUtil.getVersion(strToken,key);//得到版本
            if(name !=null&&roles.length!=0&&version!=-1){
//            	Users user=userService.findUserByName(name);
//            	System.out.println(user==null);
//                if(user!=null){
//                    containerRequestContext.setSecurityContext(new SecurityContextAuthorizer(uriInfo,new AuthorPricinple(name), new String[]{"user"}));
//                    return;
//                }
//                else{
//                    System.out.println("User not found " + name);
//                }
            }
            else {
            	System.out.println("name, roles or version missing from token");
            }
        }
        else {
        	System.out.println("token is invalid");

        }
        throw new WebApplicationException(Response.Status.UNAUTHORIZED);
    }
}
