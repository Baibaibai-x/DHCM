package com.mapper;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.po.ProductClassesExample;

public class ProductClassMapperTest {

	private ApplicationContext applicationContext;
	//在setUp这个方法得到spring容器
	@Before
	public void setUp() throws Exception {
		applicationContext=new ClassPathXmlApplicationContext("classpath:/spring/applicationContext.xml");
	}

	@Test
	public void testSelectByPrimaryKey() throws Exception {
		ProductClassMapper productClassMapper=(ProductClassMapper) applicationContext.getBean("productClassMapper");
		ProductClassesExample  productClassesExample=new ProductClassesExample();
		productClassesExample.setProduct_kind("配件");
		List<ProductClassesExample> list=productClassMapper.selectByPrimaryKey(productClassesExample);
		System.out.println(list);
		
	}

}
