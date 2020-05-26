package com.po;

public class OrdersQueryVo {
	private Orders orders;
	
	private OrdersExample ordersExample;
	
	public Orders getOrders() {
		return orders;
	}
	public void setOrders(Orders orders) {
		this.orders = orders;
	}
	public OrdersExample getOrdersExample() {
		return ordersExample;
	}
	public void setOrdersExample(OrdersExample ordersExample) {
		this.ordersExample = ordersExample;
	}
	
	
}
