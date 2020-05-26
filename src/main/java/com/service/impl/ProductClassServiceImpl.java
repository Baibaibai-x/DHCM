package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.mapper.ProductClassMapper;
import com.po.ProductClasses;
import com.po.ProductClassesExample;
import com.service.ProductClassService;

public class ProductClassServiceImpl implements ProductClassService {
	
	@Autowired
	private ProductClassMapper productClassMapper;

	@Override
	public List<ProductClassesExample> selectByPrimaryKey(ProductClassesExample productClassesExample) throws Exception {
		
		return productClassMapper.selectByPrimaryKey(productClassesExample);
	}

	@Override
	public void insertProductClass(ProductClassesExample productClassesExample) throws Exception {
		
		productClassMapper.insertProductClass(productClassesExample);
	}

	@Override
	public void updateByPrimaryKeyWithBLOBs(ProductClassesExample productClassesExample) {
		
		productClassMapper.updateByPrimaryKeyWithBLOBs(productClassesExample);
	}

	@Override
	public List<ProductClassesExample> findProductClassList() throws Exception {
		
		return productClassMapper.findProductClassList();
	}

}
