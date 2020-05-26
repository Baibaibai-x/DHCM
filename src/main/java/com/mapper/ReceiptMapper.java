package com.mapper;

import java.util.List;

import com.po.Receipt;

public interface ReceiptMapper {

	//新增入库单
	void insertreceipt(Receipt receipt)throws Exception;
	
	//查看所有的入库单
	List<Receipt> selectAlllist(Receipt receipt)throws Exception;
	
	//删除入库单
	void deletereceipt(Receipt receipt)throws Exception;
	
	//修改入库单
	void updatereceipt(Receipt receipt)throws Exception;
	
	/*//入库单数据统计
	List<Receipt> getcomplete()throws Exception;*/
}
