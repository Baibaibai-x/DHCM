package com.po;

import java.util.List;

public class UserQueryVo {
	//�û�ʵ����
	private User user;
	
	//�û�����չ��
	private UserExample userExample;
	
	//�����û���Ϣ
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
