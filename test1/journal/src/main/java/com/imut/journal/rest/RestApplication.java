package com.imut.journal.rest;

import org.glassfish.jersey.server.ResourceConfig;

import com.fasterxml.jackson.jaxrs.json.JacksonJsonProvider;

/**
 * 该类是注册jeresy中需要使用的对象
 * @author suojingjing
 */
public class RestApplication extends ResourceConfig{

	public RestApplication(){
		packages("com.imut.journal.rest");
		register(JacksonJsonProvider.class);
		//register(JWTSecurityFilter.class);
//		register(CrossDomainFilter.class);
	}
}
