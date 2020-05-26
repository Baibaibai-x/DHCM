package com.mapper;

import java.util.List;

import com.mysql.cj.x.protobuf.MysqlxCrud.Insert;
import com.po.Orders;
import com.po.OrdersExample;
import com.po.OrdersQueryVo;



public interface OrderMapper {

	//根据order_id、id、product_name、product_itd、product_category、name之一查找商品
	public List<OrdersExample> selectByPrimaryKey(OrdersQueryVo ordersQueryVo) throws Exception;
	
	//新增订单
	public void insertOrder(OrdersExample ordersExample)throws Exception;
	
	//修改订单信息
	public void updateByPrimaryKeyWithBLOBs(OrdersExample ordersExample);
	
	//查询所有订单
	public List<OrdersExample> findOredeList(OrdersQueryVo ordersQueryVo) throws Exception;
	
	//删除订单
	void deleteorder(OrdersExample ordersExample)throws Exception;
	
}
