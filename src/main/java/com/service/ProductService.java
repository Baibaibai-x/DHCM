package com.service;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.po.ProductExample;
import com.po.ProductQueryVo;
import com.po.Shoppingcart;

public interface ProductService {
	
	//����id��product_name��product_itd��product_category֮һ������Ʒ
	public List<ProductExample> selectByPrimaryKey(ProductQueryVo productQueryVo) throws Exception;
	
	//������Ʒ
	public void insertProduct(ProductExample productExample)throws Exception;
	
	//�޸���Ʒ��Ϣ
	public void updateByPrimaryKeyWithBLOBs(ProductExample productExample);
	
	//��ѯ������Ʒ
	public List<ProductExample> findProductList(ProductQueryVo productQueryVo) throws Exception;
	
	//��Ʒ����
	ProductExample selectlist(ProductExample productExample)throws Exception;
	
	//���빺�ﳵ
	void insertShopping(ProductQueryVo productQueryVo)throws Exception;
	
	//�鿴���ﳵ
	List<Shoppingcart> selectAll(ProductQueryVo productQueryVo)throws Exception;
	
	//����ɾ�����ﳵ
	void deleteByPrimaryKeyWithArrays(ProductQueryVo productQueryVo);
}
