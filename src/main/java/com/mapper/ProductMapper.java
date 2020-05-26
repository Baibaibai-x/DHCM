package com.mapper;

import java.util.List;

import com.github.pagehelper.Page;
import com.po.ProductExample;
import com.po.ProductQueryVo;
import com.po.Shoppingcart;



public interface ProductMapper {
	
	 //����id��product_name��product_itd��product_category֮һ������Ʒ
	 List<ProductExample> selectByPrimaryKey(ProductQueryVo productQueryVo) throws Exception;
	
	 //������Ʒ
	 void insertProduct(ProductExample productExample)throws Exception;
	
	 //�޸���Ʒ��Ϣ
	 void updateByPrimaryKeyWithBLOBs(ProductExample productExample);
	
	 //��ѯ������Ʒ
	 List<ProductExample> findProductList(ProductQueryVo productQueryVo) throws Exception;
	 
	 //��Ʒ����
	 ProductExample selectlist(ProductExample productExample)throws Exception;
	 
	 //���빺�ﳵ
	 void insertShopping(ProductQueryVo productQueryVo)throws Exception;
	 
	 //�鿴���ﳵ
	 List<Shoppingcart> selectAll(ProductQueryVo productQueryVo)throws Exception;
	 
	 //����ɾ�����ﳵ
	 void deleteByPrimaryKeyWithArrays(ProductQueryVo productQueryVo);
}
