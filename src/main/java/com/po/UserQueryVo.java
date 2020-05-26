package com.po;

import java.util.List;

public class UserQueryVo {
	//用户实体类
	private User user;
	
	//用户的扩展类
	private UserExample userExample;
	
	//批量用户信息
	private List<UserExample> userList;
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public UserExample getUserExample() {
		return userExample;
	}
	public void setUserExample(UserExample userExample) {
		this.userExample = userExample;
	}
	public List<UserExample> getUserList() {
		return userList;
	}
	public void setUserList(List<UserExample> userList) {
		this.userList = userList;
	}
	
	
}
