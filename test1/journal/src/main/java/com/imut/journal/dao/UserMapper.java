package com.imut.journal.dao;

import java.util.List;

import com.imut.journal.entity.User;

public interface UserMapper {
    int deleteByPrimaryKey(String userId);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(String userId);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    
    //非自动生成
    public List<User> selectAll();
    
    public User checkLogin(User user);
}