package com.service;

import java.util.List;

import com.po.Totals;

public interface TotalsService {
	//��ѯ����
	List<Totals> getAllTotals(Totals total)throws Exception;
	
	//��������
	void insertTotals(Totals totals)throws Exception;
	
	//�޸�
	void updateTotals(Totals totals)throws Exception;
}
