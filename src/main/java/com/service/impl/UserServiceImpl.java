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
	//�û���½��֤
	public User loginUser(User user) throws Exception {
		
		return userMapper.loginUser(user);
	}

	@Override
	//����id��username��name֮һ�����û�
	public User selectByPrimaryKey(UserQueryVo userQueryVo) throws Exception {
		
		return userMapper.selectByPrimaryKey(userQueryVo);
	}

	@Override
	//�����û�
	public void insertUser(UserExample userExample) throws Exception {
		userMapper.insertUser(userExample);
	}

	@Override
	//�޸��û���Ϣ
	public void updateByPrimaryKeyWithBLOBs(UserExample userExample) {
		userMapper.updateByPrimaryKeyWithBLOBs(userExample);
	}

	
	//��ѯ�����û�
	public List<UserExample> findUserList(UserQueryVo userQueryVo) throws Exception {
		
		return userMapper.findUserList(userQueryVo);
	}



}
