package com.mapper;

import java.util.List;

import com.po.Receipt;

public interface ReceiptMapper {

	//������ⵥ
	void insertreceipt(Receipt receipt)throws Exception;
	
	//�鿴���е���ⵥ
	List<Receipt> selectAlllist(Receipt receipt)throws Exception;
	
	//ɾ����ⵥ
	void deletereceipt(Receipt receipt)throws Exception;
	
	//�޸���ⵥ
	void updatereceipt(Receipt receipt)throws Exception;
	
	/*//��ⵥ����ͳ��
	List<Receipt> getcomplete()throws Exception;*/
}
