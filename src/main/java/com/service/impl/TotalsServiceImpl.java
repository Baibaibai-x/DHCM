package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.mapper.TotalsMapper;
import com.po.Totals;
import com.service.TotalsService;

public class TotalsServiceImpl implements TotalsService {
	
	@Autowired
	private TotalsMapper totalMapper;
	
	@Override
	public List<Totals> getAllTotals(Totals total) throws Exception {

		return totalMapper.getAllTotals(total);
	}

	@Override
	public void insertTotals(Totals totals) throws Exception {
		totalMapper.insertTotals(totals);
	}

	@Override
	public void updateTotals(Totals totals) throws Exception {
		totalMapper.updateTotals(totals);
	}

}
