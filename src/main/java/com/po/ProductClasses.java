package com.po;
//商品分类表实体类
public class ProductClasses {
	private int product_id;
	private String product_category;
	private String product_kind;
	
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
	public String getProduct_kind() {
		return product_kind;
	}
	public void setProduct_kind(String product_kind) {
		this.product_kind = product_kind;
	}
	@Override
	public String toString() {
		return "ProductClasses [product_id=" + product_id + ", product_category=" + product_category + ", product_kind="
				+ product_kind + "]";
	}
	
	
}
