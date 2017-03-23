package com.imut.journal.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.imut.journal.dao.UserMapper;
import com.imut.journal.entity.User;
import com.imut.journal.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService {
	
	@Resource(name="userMapper")
	private UserMapper userMapper;

	@Override
	public List<User> selectAll() {
		// TODO Auto-generated method stub
		return userMapper.selectAll();
	}

	@Override
	public User selectByPrimaryKey(String uuid) {
		// TODO Auto-generated method stub
		return userMapper.selectByPrimaryKey(uuid);
	}

	@Override
	public int deleteByPrimaryKey(String uuid) {
		// TODO Auto-generated method stub
		return userMapper.deleteByPrimaryKey(uuid);
	}

	@Override
	public int insert(User record) {
		// TODO Auto-generated method stub
		return userMapper.insert(record);
	}

	@Override
	public int insertSelective(User record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByPrimaryKeySelective(User record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByPrimaryKey(User record) {
		// TODO Auto-generated method stub
		return userMapper.updateByPrimaryKey(record);
	}

	@Override
	public User loginCheck(User user) {
		// TODO Auto-generated method stub
		return userMapper.checkLogin(user);
	}

    
}
