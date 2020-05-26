package com.po;

import java.util.Date;

import javax.validation.constraints.Past;

//商品信息的实体类
public class Product {
	private int id;
	private String product_name;
	private String product_category;
	private String product_kind;
	private String product_img;
	private int product_stock;
	private Double product_price;
	private String product_itd;
	private String product_brand;
	@Past(message="{products.createtime.error}")
	private Date product_date;
	private String product_status;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public String getProduct_kind() {
		return product_kind;
	}
	public void setProduct_kind(String product_kind) {
		this.product_kind = product_kind;
	}
	public String getProduct_img() {
		return product_img;
	}
	public void setProduct_img(String product_img) {
		this.product_img = product_img;
	}
	public int getProduct_stock() {
		return product_stock;
	}
	public void setProduct_stock(int product_stock) {
		this.product_stock = product_stock;
	}
	public Double getProduct_price() {
		return product_price;
	}
	public void setProduct_price(Double product_price) {
		this.product_price = product_price;
	}
	public String getProduct_itd() {
		return product_itd;
	}
	public void setProduct_itd(String product_itd) {
		this.product_itd = product_itd;
	}
	public String getProduct_brand() {
		return product_brand;
	}
	public void setProduct_brand(String product_brand) {
		this.product_brand = product_brand;
	}
	public Date getProduct_date() {
		return product_date;
	}
	public void setProduct_date(Date product_date) {
		this.product_date = product_date;
	}
	public String getProduct_status() {
		return product_status;
	}
	public void setProduct_status(String product_status) {
		this.product_status = product_status;
	}
	@Override
	public String toString() {
		return "Product [id=" + id + ", product_name=" + product_name + ", product_category=" + product_category
				+ ", product_kind=" + product_kind + ", product_img=" + product_img + ", product_stock=" + product_stock
				+ ", product_price=" + product_price + ", product_itd=" + product_itd + ", product_brand="
				+ product_brand + ", product_date=" + product_date + ", product_status=" + product_status + "]";
	}
	
}
