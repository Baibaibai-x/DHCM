package com.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.po.ProductClassesExample;
import com.po.User;
import com.po.UserExample;
import com.po.UserQueryVo;
import com.service.ProductClassService;
import com.service.UserService;

@Controller
public class LoginController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private ProductClassService productClassService;
	
	@RequestMapping("/index")
	public String Goindex(HttpSession session){
		session.removeAttribute("product_category");
		session.removeAttribute("product_name");
		return "forward:/loginindex.action";
	}
	
	@RequestMapping("/search")
	public String Gosearch(Model model,HttpSession session,String product_name) throws Exception{
		ProductClassesExample productClassesExample=new ProductClassesExample();
		productClassesExample.setProduct_kind("电脑整机");
		List<ProductClassesExample> pclist=productClassService.selectByPrimaryKey(productClassesExample);
		ProductClassesExample productClassesExample2=new ProductClassesExample();
		productClassesExample2.setProduct_kind("配件");
		List<ProductClassesExample> calist=productClassService.selectByPrimaryKey(productClassesExample2);
		
		model.addAttribute("pclist",pclist);
		model.addAttribute("calist",calist);
		return "forward:/product/getSome.action";
	}
	
	@RequestMapping("/detail")
	public String Godetail(Model model,HttpSession session) throws Exception{
		ProductClassesExample productClassesExample=new ProductClassesExample();
		productClassesExample.setProduct_kind("电脑整机");
		List<ProductClassesExample> pclist=productClassService.selectByPrimaryKey(productClassesExample);
		ProductClassesExample productClassesExample2=new ProductClassesExample();
		productClassesExample2.setProduct_kind("配件");
		List<ProductClassesExample> calist=productClassService.selectByPrimaryKey(productClassesExample2);
		
		model.addAttribute("pclist",pclist);
		model.addAttribute("calist",calist);
		return "prodetail";
	}
	
	@RequestMapping("/info")
	public String Goinfo(HttpSession session,Model model,String username) throws Exception{
		
		
		UserQueryVo userQueryVo=new UserQueryVo();
		UserExample userExample=new UserExample();
		userExample.setUsername(username);
		userQueryVo.setUserExample(userExample);
		User user=userService.selectByPrimaryKey(userQueryVo);
		model.addAttribute("user",user);
		return "info";
	}
	
	
	@RequestMapping("/loginindex")
	public String Index(Model model,String product_category,HttpServletRequest
			 request,HttpSession session)throws Exception{
		ProductClassesExample productClassesExample=new ProductClassesExample();
		productClassesExample.setProduct_kind("电脑整机");
		List<ProductClassesExample> pclist=productClassService.selectByPrimaryKey(productClassesExample);
		ProductClassesExample productClassesExample2=new ProductClassesExample();
		productClassesExample2.setProduct_kind("配件");
		List<ProductClassesExample> calist=productClassService.selectByPrimaryKey(productClassesExample2);
		
		model.addAttribute("pclist",pclist);
		model.addAttribute("calist",calist);
		
		return "forward:/product/getAll.action";
		
	}
	
	@RequestMapping("/regitindex")
	public String Regit()throws Exception{
		return "regit";
	}
	
	//用户登陆验证
	@RequestMapping("/login")
	public void loginUser(Model model,String username,String password,HttpSession session,HttpServletResponse response,HttpServletRequest request)throws Exception {
		User user=new User();
		user.setUsername(username);
		user.setPassword(password);
		
		User user2=	userService.loginUser(user);
		int login;
		if(user2!=null){
			login=user2.getId();
		}else {
			login=0;
		}
		Map<String, Object> map=new HashMap<String,Object>();
		
		if(login>=1){
			map.put("userExsit", true);
			map.put("L_username", username);
			map.put("user_id", login);
			map.put("u_status", user2.getStatus());
			session.setAttribute("L_username", username);
		}else {
			map.put("userExsit", false);
			map.put("L_username", null);
		}
		ObjectMapper mapper=new ObjectMapper();
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		mapper.writeValue(response.getWriter(), map);
	}
	
	//退出
	@RequestMapping("/logout")
	public String logout(HttpSession session) throws Exception{
		
		//清除session
		session.invalidate();
		return "forward:/loginindex.action";
	}
	
	//进入管理员界面
	@RequestMapping("/gomg")
	public String gomgdl(HttpSession session)throws Exception{
		
		//清除session
		session.invalidate();
		return "mglogin";
	}
}
