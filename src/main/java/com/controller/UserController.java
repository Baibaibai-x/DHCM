package com.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.po.User;
import com.po.UserExample;
import com.po.UserQueryVo;
import com.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	//根据id查找user
	@RequestMapping("/user_id")
	public void selectByPrimaryKey(Model model,int id,String password,HttpServletResponse response)throws Exception{
		UserQueryVo userQueryVo=new UserQueryVo();
		UserExample userExample=new UserExample();
		userExample.setId(id);
		userQueryVo.setUserExample(userExample);
		User user=userService.selectByPrimaryKey(userQueryVo);
		System.out.println(password);
		Boolean userExsit;
		if(password.equals(user.getPassword())){
			userExsit=true;
		}else {
			userExsit=false;
		}
		ObjectMapper mapper=new ObjectMapper();
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		mapper.writeValue(response.getWriter(), userExsit);
	}
	
	//根据username查找user
	@RequestMapping("/user_username")
	public void selectByPrimaryKey(Model model,String username,HttpServletResponse response)throws Exception{
		UserQueryVo userQueryVo=new UserQueryVo();
		UserExample userExample=new UserExample();
		userExample.setUsername(username);
		userQueryVo.setUserExample(userExample);
		User user=userService.selectByPrimaryKey(userQueryVo);
		Boolean userExsit;
		if(user!=null){
			userExsit=true;
		}else {
			userExsit=false;
		}
		ObjectMapper mapper=new ObjectMapper();
		mapper.writeValue(response.getWriter(), userExsit);
	}
	
	//根据name查找user
	@RequestMapping("/user_name")
	public ModelAndView selectByPrimaryKey(String name)throws Exception{
		UserQueryVo userQueryVo=new UserQueryVo();
		UserExample userExample=new UserExample();
		userExample.setName(name);
		userQueryVo.setUserExample(userExample);
		User user=userService.selectByPrimaryKey(userQueryVo);
		//返回ModelAndView
		ModelAndView modelandview=new ModelAndView();
		//相当于request的setAttribut，在jsp页面中通过user取数据
		modelandview.addObject("user",user);
		//定位到相应的页面
		modelandview.setViewName("items/editItemsQuery");
		return modelandview;
	}
	
	//新增用户
	@RequestMapping("/user_insert")
	public String insertUser(Model model,UserExample userExample)throws Exception{
		//System.out.println(userExample);
		userService.insertUser(userExample);
		return "success";
	}
	
	//修改用户信息
	@RequestMapping("/user_update")
	public String updateByPrimaryKeyWithBLOBs(Model model,UserExample userExample)throws Exception{
		userExample.setAddress(null);
		System.out.println(userExample);
		userService.updateByPrimaryKeyWithBLOBs(userExample);
		return "forward:/info.action";
	}
	
	//修改用户密码,地址
	@RequestMapping("/user_uppwd")
	public void updateById(Model model,UserExample userExample,HttpServletResponse response)throws Exception{
		userService.updateByPrimaryKeyWithBLOBs(userExample);
		Boolean userExsit=true;
		ObjectMapper mapper=new ObjectMapper();
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		mapper.writeValue(response.getWriter(), userExsit);
	}
	
	//查询用户地址
	@RequestMapping("/selectaddress")
	public void queryUser(UserExample userExample,HttpServletResponse response)throws Exception{
		UserQueryVo userQueryVo=new UserQueryVo();
		userQueryVo.setUserExample(userExample);
		User user=userService.selectByPrimaryKey(userQueryVo);
		System.out.println("这个用户"+user);
		Boolean userExsit;
		if(user.getAddress()!=null){
			userExsit=true;
		}else {
			userExsit=false;
		}
		ObjectMapper mapper=new ObjectMapper();
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		mapper.writeValue(response.getWriter(), userExsit);
		
	}

}
