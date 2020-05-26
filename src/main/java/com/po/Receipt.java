package com.po;

import java.util.Date;

/**
 * 入库单实体类
 * @author Administrator
 *
 */
public class Receipt {
	private int receipt_id;
	private int product_id;
	private String product_category;
	private String receipt_img;
	private String product_name;
	private int receipt_stock;
	private double receipt_price;
	private Date receipt_date;
	private double allprice;
	private String status;
	public int getReceipt_id() {
		return receipt_id;
	}
	public void setReceipt_id(int receipt_id) {
		this.receipt_id = receipt_id;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	
	public String getProduct_category() {
		return product_category;
	}
	public void setProduct_category(String product_category) {
		this.product_category = product_category;
	}
	public String getReceipt_img() {
		return receipt_img;
	}
	public void setReceipt_img(String receipt_img) {
		this.receipt_img = receipt_img;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public int getReceipt_stock() {
		return receipt_stock;
	}
	public void setReceipt_stock(int receipt_stock) {
		this.receipt_stock = receipt_stock;
	}
	public double getReceipt_price() {
		return receipt_price;
	}
	public void setReceipt_price(double receipt_price) {
		this.receipt_price = receipt_price;
	}
	public Date getReceipt_date() {
		return receipt_date;
	}
	public void setReceipt_date(Date receipt_date) {
		this.receipt_date = receipt_date;
	}
	public double getAllprice() {
		return allprice;
	}
	public void setAllprice(double allprice) {
		this.allprice = allprice;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Receipt [receipt_id=" + receipt_id + ", product_id=" + product_id + ", product_category="
				+ product_category + ", receipt_img=" + receipt_img + ", product_name=" + product_name
				+ ", receipt_stock=" + receipt_stock + ", receipt_price=" + receipt_price + ", receipt_date="
				+ receipt_date + ", allprice=" + allprice + ", status=" + status + "]";
	}


}
