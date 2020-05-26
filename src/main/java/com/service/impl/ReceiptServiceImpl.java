package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.mapper.ReceiptMapper;
import com.po.Receipt;
import com.service.ReceiptService;

public class ReceiptServiceImpl implements ReceiptService {
	
	@Autowired
	private ReceiptMapper receiptMapper;
	
	@Override
	public void insertreceipt(Receipt receipt) throws Exception {
		receiptMapper.insertreceipt(receipt);
	}
	
	@Override
	public List<Receipt> selectAlllist(Receipt receipt) throws Exception {
		
		return receiptMapper.selectAlllist(receipt);
	}

	@Override
	public void deletereceipt(Receipt receipt) throws Exception {
		receiptMapper.deletereceipt(receipt);
	}

	@Override
	public void updatereceipt(Receipt receipt) throws Exception {
		receiptMapper.updatereceipt(receipt);
	}


}
