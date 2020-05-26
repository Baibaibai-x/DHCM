package com.mapper;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.po.User;
import com.po.UserExample;

public class UserMapperTest {
	
	private ApplicationContext applicationContext;
	//在setUp这个方法得到spring容器
	@Before
	public void setUp() throws Exception {
		applicationContext=new ClassPathXmlApplicationContext("classpath:/spring/applicationContext.xml");
	}

	@Test
	public void test() throws Exception {
		UserMapper userMapper=(UserMapper) applicationContext.getBean("userMapper");
		User us=new User();
		us.setUsername("xiao1");
		us.setPassword("xiao123456");
		User a=userMapper.loginUser(us);
		System.out.println(a);
	}
	
	@Test
	public void testUpdateByPrimaryKeyWithBLOBs()throws Exception{
		UserMapper userMapper=(UserMapper) applicationContext.getBean("userMapper");
		UserExample userExample=new UserExample();
		userExample.setId(1);
		userExample.setStatus("正常");
		userMapper.updateByPrimaryKeyWithBLOBs(userExample);
	}
}
