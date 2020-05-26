package com.mapper;

import java.util.List;

import com.po.User;
import com.po.UserExample;
import com.po.UserQueryVo;

public interface UserMapper {

	//用户登陆验证
	User loginUser(User user) throws Exception;
	
	//根据id、username、name、phone之一查找用户
	public User selectByPrimaryKey(UserQueryVo userQueryVo) throws Exception;
	
	//新增用户
	public void insertUser(UserExample userExample)throws Exception;
	
	//修改用户信息
	public void updateByPrimaryKeyWithBLOBs(UserExample userExample);
	
	//查询所有用户
	public List<UserExample> findUserList(UserQueryVo userQueryVo) throws Exception;
}
