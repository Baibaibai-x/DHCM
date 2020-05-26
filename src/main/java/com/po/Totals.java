package com.po;
/**
 * 数据统计实体类
 * @author Administrator
 *
 */
public class Totals{
	
	private int product_id;
	private String product_name;
	private String product_category;
	private String product_img;
	private int ord_stock;
	private Double ord_price;
	private int rec_stock;
	private Double rec_price;
	private Double total_price;
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
	public int getOrd_stock() {
		return ord_stock;
	}
	public void setOrd_stock(int ord_stock) {
		this.ord_stock = ord_stock;
	}
	public Double getOrd_price() {
		return ord_price;
	}
	public void setOrd_price(Double ord_price) {
		this.ord_price = ord_price;
	}
	public int getRec_stock() {
		return rec_stock;
	}
	public void setRec_stock(int rec_stock) {
		this.rec_stock = rec_stock;
	}
	public Double getRec_price() {
		return rec_price;
	}
	public void setRec_price(Double rec_price) {
		this.rec_price = rec_price;
	}
	public Double getTotal_price() {
		return total_price;
	}
	public void setTotal_price(Double total_price) {
		this.total_price = total_price;
	}
	@Override
	public String toString() {
		return "Totals [product_id=" + product_id + ", product_name=" + product_name + ", product_category="
				+ product_category + ", product_img=" + product_img + ", ord_stock=" + ord_stock + ", ord_price="
				+ ord_price + ", rec_stock=" + rec_stock + ", rec_price=" + rec_price + ", total_price=" + total_price
				+ "]";
	}
	
	
	
	
	
}
