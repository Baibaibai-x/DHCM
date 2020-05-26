package com.service;

import java.util.List;

import com.po.Manager;

public interface ManagerService {
	//����Ա��½
	Manager mglogin(Manager manager)throws Exception; 
	
	//���ҹ���Ա
	List<Manager> selectAllmanager(Manager manager)throws Exception;
	
	//�޸Ĺ���Ա��Ϣ
	void updatemanager(Manager manager)throws Exception;
	
	//��������Ա
	void insertmg(Manager manager)throws Exception;
	
	//����id�Ȳ��ҹ���Ա
	Manager selectByPrimaryKey(Manager manager) throws Exception;
}
