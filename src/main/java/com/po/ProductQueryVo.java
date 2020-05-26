package com.po;

public class ProductQueryVo {

	private Product product;
	
	private ProductExample productExample;
	
	private Shoppingcart  shoppingcart;
	
	private int[] products_id;

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public ProductExample getProductExample() {
		return productExample;
	}

	public void setProductExample(ProductExample productExample) {
		this.productExample = productExample;
	}

	public Shoppingcart getShoppingcart() {
		return shoppingcart;
	}

	public void setShoppingcart(Shoppingcart shoppingcart) {
		this.shoppingcart = shoppingcart;
	}

	public int[] getProducts_id() {
		return products_id;
	}

	public void setProducts_id(int[] products_id) {
		this.products_id = products_id;
	}
	
	
}
