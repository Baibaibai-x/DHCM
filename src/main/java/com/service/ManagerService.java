package com.service;

import java.util.List;

import com.po.Manager;

public interface ManagerService {
	//管理员登陆
	Manager mglogin(Manager manager)throws Exception; 
	
	//查找管理员
	List<Manager> selectAllmanager(Manager manager)throws Exception;
	
	//修改管理员信息
	void updatemanager(Manager manager)throws Exception;
	
	//新增管理员
	void insertmg(Manager manager)throws Exception;
	
	//根据id等查找管理员
	Manager selectByPrimaryKey(Manager manager) throws Exception;
}
