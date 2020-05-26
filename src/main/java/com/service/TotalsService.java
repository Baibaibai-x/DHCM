package com.service;

import java.util.List;

import com.po.Totals;

public interface TotalsService {
	//查询数据
	List<Totals> getAllTotals(Totals total)throws Exception;
	
	//插入数据
	void insertTotals(Totals totals)throws Exception;
	
	//修改
	void updateTotals(Totals totals)throws Exception;
}
