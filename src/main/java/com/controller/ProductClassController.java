package com.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import com.po.ProductClassesExample;
import com.service.ProductClassService;

@RequestMapping("/productClass")
public class ProductClassController {
	
	@Autowired
	private ProductClassService productClassService;
	
	//��ȡ�������
	@RequestMapping("/getpc")
	public List<ProductClassesExample> getProductClassList(HttpServletResponse response) throws Exception{
		ProductClassesExample productClassesExample=new ProductClassesExample();
		productClassesExample.setProduct_kind("��������");
		List<ProductClassesExample> list1=productClassService.selectByPrimaryKey(productClassesExample);
		return list1;
	}
}
