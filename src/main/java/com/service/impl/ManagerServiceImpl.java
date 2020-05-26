package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.mapper.ManagerMapper;
import com.po.Manager;
import com.service.ManagerService;

public class ManagerServiceImpl implements ManagerService {
	
	@Autowired
	private ManagerMapper managerMapper;
	
	@Override
	public Manager mglogin(Manager manager) throws Exception {

		return managerMapper.mglogin(manager);
	}

	@Override
	public List<Manager> selectAllmanager(Manager manager) throws Exception {
		
		return managerMapper.selectAllmanager(manager);
	}

	@Override
	public void updatemanager(Manager manager) throws Exception {
		managerMapper.updatemanager(manager);
	}

	@Override
	public void insertmg(Manager manager) throws Exception {
		managerMapper.insertmg(manager);
	}

	@Override
	public Manager selectByPrimaryKey(Manager manager) throws Exception {
		
		return managerMapper.selectByPrimaryKey(manager);
	}

}
