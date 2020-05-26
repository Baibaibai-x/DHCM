package com.service;

import java.util.List;

import com.po.ProductClasses;
import com.po.ProductClassesExample;

public interface ProductClassService {
	
	
	//����product_id��product_category֮һ������Ʒ���
	public List<ProductClassesExample> selectByPrimaryKey(ProductClassesExample productClassesExample) throws Exception;
	
	//������Ʒ���
	public void insertProductClass(ProductClassesExample productClassesExample)throws Exception;
	
	//�޸���Ʒ��Ϣ���
	public void updateByPrimaryKeyWithBLOBs(ProductClassesExample productClassesExample);
	
	//��ѯ������Ʒ���
	public List<ProductClassesExample> findProductClassList() throws Exception;
}
