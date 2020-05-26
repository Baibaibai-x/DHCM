package com.po;
//订单的实体类

import java.util.Date;

public class Orders {
	private int order_id;
	private int id;
	private int product_id;
	private String product_name;
	private String product_category;
	private String product_brand;
	private int order_stock;
	private Double product_price;
	private Double order_price;
	private String username;
	private String name;
	private String phone;
	private String address;
	private String product_status;
	private Date order_date;
	private String order_img;
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_category() {
		return product_category;
	}
	public void setProduct_category(String product_category) {
		this.product_category = product_category;
	}
	public String getProduct_brand() {
		return product_brand;
	}
	public void setProduct_brand(String product_brand) {
		this.product_brand = product_brand;
	}
	public int getOrder_stock() {
		return order_stock;
	}
	public void setOrder_stock(int order_stock) {
		this.order_stock = order_stock;
	}
	public Double getProduct_price() {
		return product_price;
	}
	public void setProduct_price(Double product_price) {
		this.product_price = product_price;
	}
	public Double getOrder_price() {
		return order_price;
	}
	public void setOrder_price(Double order_price) {
		this.order_price = order_price;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getProduct_status() {
		return product_status;
	}
	public void setProduct_status(String product_status) {
		this.product_status = product_status;
	}
	public Date getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}
	public String getOrder_img() {
		return order_img;
	}
	public void setOrder_img(String order_img) {
		this.order_img = order_img;
	}
	@Override
	public String toString() {
		return "Orders [order_id=" + order_id + ", id=" + id + ", product_id=" + product_id + ", product_name="
				+ product_name + ", product_category=" + product_category + ", product_brand=" + product_brand
				+ ", order_stock=" + order_stock + ", product_price=" + product_price + ", order_price=" + order_price
				+ ", username=" + username + ", name=" + name + ", phone=" + phone + ", address=" + address
				+ ", product_status=" + product_status + ", order_date=" + order_date + ", order_img=" + order_img
				+ "]";
	}
	
}
