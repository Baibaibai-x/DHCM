package com.mapper;

import java.util.List;

import com.github.pagehelper.Page;
import com.po.ProductExample;
import com.po.ProductQueryVo;
import com.po.Shoppingcart;



public interface ProductMapper {
	
	 //根据id、product_name、product_itd、product_category之一查找商品
	 List<ProductExample> selectByPrimaryKey(ProductQueryVo productQueryVo) throws Exception;
	
	 //新增商品
	 void insertProduct(ProductExample productExample)throws Exception;
	
	 //修改商品信息
	 void updateByPrimaryKeyWithBLOBs(ProductExample productExample);
	
	 //查询所有商品
	 List<ProductExample> findProductList(ProductQueryVo productQueryVo) throws Exception;
	 
	 //商品详情
	 ProductExample selectlist(ProductExample productExample)throws Exception;
	 
	 //加入购物车
	 void insertShopping(ProductQueryVo productQueryVo)throws Exception;
	 
	 //查看购物车
	 List<Shoppingcart> selectAll(ProductQueryVo productQueryVo)throws Exception;
	 
	 //批量删除购物车
	 void deleteByPrimaryKeyWithArrays(ProductQueryVo productQueryVo);
}
