package com.service;

import java.util.List;

import com.po.ProductClasses;
import com.po.ProductClassesExample;

public interface ProductClassService {
	
	
	//根据product_id、product_category之一查找商品类别
	public List<ProductClassesExample> selectByPrimaryKey(ProductClassesExample productClassesExample) throws Exception;
	
	//新增商品类别
	public void insertProductClass(ProductClassesExample productClassesExample)throws Exception;
	
	//修改商品信息类别
	public void updateByPrimaryKeyWithBLOBs(ProductClassesExample productClassesExample);
	
	//查询所有商品类别
	public List<ProductClassesExample> findProductClassList() throws Exception;
}
