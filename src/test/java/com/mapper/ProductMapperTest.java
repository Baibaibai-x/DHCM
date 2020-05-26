package com.mapper;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.po.ProductExample;
import com.po.ProductQueryVo;

public class ProductMapperTest {

	private ApplicationContext applicationContext;
	//在setUp这个方法得到spring容器
	@Before
	public void setUp() throws Exception {
		applicationContext=new ClassPathXmlApplicationContext("classpath:/spring/applicationContext.xml");
	}

	@Test
	public void testFindProductList() throws Exception {
		ProductMapper productMapper=(ProductMapper) applicationContext.getBean("productMapper");
		List<ProductExample> list=productMapper.findProductList(null);
		System.out.println(list);
	}

}
