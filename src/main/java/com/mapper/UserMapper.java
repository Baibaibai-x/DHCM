package com.mapper;

import java.util.List;

import com.po.User;
import com.po.UserExample;
import com.po.UserQueryVo;

public interface UserMapper {

	//�û���½��֤
	User loginUser(User user) throws Exception;
	
	//����id��username��name��phone֮һ�����û�
	public User selectByPrimaryKey(UserQueryVo userQueryVo) throws Exception;
	
	//�����û�
	public void insertUser(UserExample userExample)throws Exception;
	
	//�޸��û���Ϣ
	public void updateByPrimaryKeyWithBLOBs(UserExample userExample);
	
	//��ѯ�����û�
	public List<UserExample> findUserList(UserQueryVo userQueryVo) throws Exception;
}
