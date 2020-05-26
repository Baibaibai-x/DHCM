package com.po;
/**
 * 购物车实体类
 * @author Administrator
 *
 */
public class Shoppingcart {
	private int car_id;
	private int id;
	private int product_id;
	private String product_name;
	private String product_category;
	private String product_img;
	private int product_stock;
	private Double product_price;
	private String product_itd;
	private String product_brand;
	public int getCar_id() {
		return car_id;
	}
	public void setCar_id(int car_id) {
		this.car_id = car_id;
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
	@Override
	public String toString() {
		return "Shoppingcart [car_id=" + car_id + ", id=" + id + ", product_id=" + product_id + ", product_name="
				+ product_name + ", product_category=" + product_category + ", product_img=" + product_img
				+ ", product_stock=" + product_stock + ", product_price=" + product_price + ", product_itd="
				+ product_itd + ", product_brand=" + product_brand + "]";
	}
	
	
}
