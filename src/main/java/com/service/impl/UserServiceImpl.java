package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.mapper.UserMapper;
import com.po.User;
import com.po.UserExample;
import com.po.UserQueryVo;
import com.service.UserService;

public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserMapper userMapper;
	
	@Override
	//用户登陆验证
	public User loginUser(User user) throws Exception {
		
		return userMapper.loginUser(user);
	}

	@Override
	//根据id、username、name之一查找用户
	public User selectByPrimaryKey(UserQueryVo userQueryVo) throws Exception {
		
		return userMapper.selectByPrimaryKey(userQueryVo);
	}

	@Override
	//新增用户
	public void insertUser(UserExample userExample) throws Exception {
		userMapper.insertUser(userExample);
	}

	@Override
	//修改用户信息
	public void updateByPrimaryKeyWithBLOBs(UserExample userExample) {
		userMapper.updateByPrimaryKeyWithBLOBs(userExample);
	}

	
	//查询所有用户
	public List<UserExample> findUserList(UserQueryVo userQueryVo) throws Exception {
		
		return userMapper.findUserList(userQueryVo);
	}



}
