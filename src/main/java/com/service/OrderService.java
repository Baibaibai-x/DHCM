package com.service;

import java.util.List;

import com.po.OrdersExample;
import com.po.OrdersQueryVo;

public interface OrderService {

	//����order_id��id��product_name��product_itd��product_category��name֮һ������Ʒ
	public List<OrdersExample> selectByPrimaryKey(OrdersQueryVo ordersQueryVo) throws Exception;
	
	//��������
	public void insertOrder(OrdersExample ordersExample)throws Exception;
	
	//�޸Ķ�����Ϣ
	public void updateByPrimaryKeyWithBLOBs(OrdersExample ordersExample);
	
	//��ѯ���ж���
	public List<OrdersExample> findOredeList(OrdersQueryVo ordersQueryVo) throws Exception;
	
	//ɾ������
	void deleteorder(OrdersExample ordersExample)throws Exception;

}
