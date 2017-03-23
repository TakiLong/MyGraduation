package com.imut.journal.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.imut.journal.base.BaseDao;
import com.imut.journal.dao.UserMapper;
import com.imut.journal.entity.User;

@Repository("userMapper")
public class UsersMapperImpl extends BaseDao implements UserMapper {

	@Override
	public int deleteByPrimaryKey(String uuid) {
		// TODO Auto-generated method stub
		return this.getSqlSession().delete("com.imut.journal.dao.UserMapper.deleteByPrimaryKey",uuid);
	}

	@Override
	public int insert(User record) {
		// TODO Auto-generated method stub
		return this.getSqlSession().insert("com.imut.journal.dao.UserMapper.insert",record);
	}

	@Override
	public int insertSelective(User record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public User selectByPrimaryKey(String uuid) {
		// TODO Auto-generated method stub
		return this.getSqlSession().selectOne("com.imut.journal.dao.UserMapper.selectByPrimaryKey",uuid);
	}

	@Override
	public int updateByPrimaryKeySelective(User record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByPrimaryKey(User record) {
		// TODO Auto-generated method stub
		return this.getSqlSession().update("com.imut.journal.dao.UserMapper.updateByPrimaryKey", record);
	}

	@Override
	public List<User> selectAll() {
		// TODO Auto-generated method stub
		return this.getSqlSession().selectList("com.imut.journal.dao.UserMapper.selectAll");
	}

	@Override
	public User checkLogin(User user) {
		// TODO Auto-generated method stub
		return this.getSqlSession().selectOne("com.imut.journal.dao.UserMapper.checkLogin",user);
	}

	

}
