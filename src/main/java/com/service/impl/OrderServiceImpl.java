package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.mapper.OrderMapper;
import com.po.OrdersExample;
import com.po.OrdersQueryVo;
import com.service.OrderService;

public class OrderServiceImpl implements OrderService {
	
	@Autowired
	private OrderMapper orderMapper;

	@Override
	public List<OrdersExample> selectByPrimaryKey(OrdersQueryVo ordersQueryVo) throws Exception {
		
		return orderMapper.selectByPrimaryKey(ordersQueryVo);
	}

	@Override
	public void insertOrder(OrdersExample ordersExample) throws Exception {
		
		orderMapper.insertOrder(ordersExample);
	}

	@Override
	public void updateByPrimaryKeyWithBLOBs(OrdersExample ordersExample) {
		
		orderMapper.updateByPrimaryKeyWithBLOBs(ordersExample);
	}

	@Override
	public List<OrdersExample> findOredeList(OrdersQueryVo ordersQueryVo) throws Exception {
		
		return orderMapper.findOredeList(ordersQueryVo);
	}

	@Override
	public void deleteorder(OrdersExample ordersExample) throws Exception {
		orderMapper.deleteorder(ordersExample);
	}



}
