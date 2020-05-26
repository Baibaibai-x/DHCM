package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.mapper.ProductMapper;
import com.po.ProductExample;
import com.po.ProductQueryVo;
import com.po.Shoppingcart;
import com.service.ProductService;

public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductMapper productMapper;

	@Override
	public List<ProductExample> selectByPrimaryKey(ProductQueryVo productQueryVo) throws Exception {
		
		return productMapper.selectByPrimaryKey(productQueryVo);
	}

	@Override
	public void insertProduct(ProductExample productExample) throws Exception {
		
		productMapper.insertProduct(productExample);
	}

	@Override
	public void updateByPrimaryKeyWithBLOBs(ProductExample productExample) {
		
		productMapper.updateByPrimaryKeyWithBLOBs(productExample);
	}

	@Override
	public List<ProductExample> findProductList(ProductQueryVo productQueryVo) throws Exception {
		
		return productMapper.findProductList(productQueryVo);
	}

	@Override
	public ProductExample selectlist(ProductExample productExample) throws Exception {
		
		return productMapper.selectlist(productExample);
	}

	@Override
	public void insertShopping(ProductQueryVo productQueryVo) throws Exception {
		productMapper.insertShopping(productQueryVo);
	}

	@Override
	public List<Shoppingcart> selectAll(ProductQueryVo productQueryVo) throws Exception {
		
		return productMapper.selectAll(productQueryVo);
	}

	@Override
	public void deleteByPrimaryKeyWithArrays(ProductQueryVo productQueryVo) {
		productMapper.deleteByPrimaryKeyWithArrays(productQueryVo);
	}

	
}
