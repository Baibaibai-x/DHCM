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
	
	//����id����user
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
	
	//����username����user
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
	
	//����name����user
	@RequestMapping("/user_name")
	public ModelAndView selectByPrimaryKey(String name)throws Exception{
		UserQueryVo userQueryVo=new UserQueryVo();
		UserExample userExample=new UserExample();
		userExample.setName(name);
		userQueryVo.setUserExample(userExample);
		User user=userService.selectByPrimaryKey(userQueryVo);
		//����ModelAndView
		ModelAndView modelandview=new ModelAndView();
		//�൱��request��setAttribut����jspҳ����ͨ��userȡ����
		modelandview.addObject("user",user);
		//��λ����Ӧ��ҳ��
		modelandview.setViewName("items/editItemsQuery");
		return modelandview;
	}
	
	//�����û�
	@RequestMapping("/user_insert")
	public String insertUser(Model model,UserExample userExample)throws Exception{
		//System.out.println(userExample);
		userService.insertUser(userExample);
		return "success";
	}
	
	//�޸��û���Ϣ
	@RequestMapping("/user_update")
	public String updateByPrimaryKeyWithBLOBs(Model model,UserExample userExample)throws Exception{
		userExample.setAddress(null);
		System.out.println(userExample);
		userService.updateByPrimaryKeyWithBLOBs(userExample);
		return "forward:/info.action";
	}
	
	//�޸��û�����,��ַ
	@RequestMapping("/user_uppwd")
	public void updateById(Model model,UserExample userExample,HttpServletResponse response)throws Exception{
		userService.updateByPrimaryKeyWithBLOBs(userExample);
		Boolean userExsit=true;
		ObjectMapper mapper=new ObjectMapper();
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		mapper.writeValue(response.getWriter(), userExsit);
	}
	
	//��ѯ�û���ַ
	@RequestMapping("/selectaddress")
	public void queryUser(UserExample userExample,HttpServletResponse response)throws Exception{
		UserQueryVo userQueryVo=new UserQueryVo();
		userQueryVo.setUserExample(userExample);
		User user=userService.selectByPrimaryKey(userQueryVo);
		System.out.println("����û�"+user);
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
