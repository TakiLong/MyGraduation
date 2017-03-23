package com.imut.journal.service;

import java.util.List;

import com.imut.journal.entity.User;



public interface UserService {
	
	
	int deleteByPrimaryKey(String uuid);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(String uuid);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    
    List<User> selectAll();

	User loginCheck(User user);
	
}
