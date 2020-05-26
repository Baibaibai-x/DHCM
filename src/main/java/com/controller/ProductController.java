package com.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.po.OrdersExample;
import com.po.Page;
import com.po.ProductExample;
import com.po.ProductQueryVo;
import com.po.Shoppingcart;
import com.po.User;
import com.po.UserExample;
import com.po.UserQueryVo;
import com.service.OrderService;
import com.service.ProductService;
import com.service.UserService;

@Controller
@RequestMapping("/product")
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private UserService UserService;
	
	@Autowired
	private OrderService orderService;
	
	//查看所有商品
	@RequestMapping("/getAll")
	public  String getAllCommodity(HttpServletRequest request,
			HttpServletResponse response,String product_category,ProductExample productExample,HttpSession session)throws Exception{
		//获取分页参数
		int start=0;
		int count=10;
		try {
			start=Integer.parseInt(request.getParameter("page.start"));			
			
			count=Integer.parseInt(request.getParameter("page.count"));
		
		} catch (Exception e) {			
		}		
		Page page=new Page(start,count);
		ProductQueryVo productQueryVo=new ProductQueryVo();
		
		if(product_category!=null &&product_category !=""){
			session.setAttribute("product_category", product_category);
			String pc=(String) session.getAttribute("product_category");
			productExample.setProduct_category(pc);
		}else {
			productExample.setProduct_category((String)session.getAttribute("product_category"));
		}
		session.setAttribute("u_status", "在售");
		productExample.setProduct_status((String)session.getAttribute("u_status"));
		
		productQueryVo.setProductExample(productExample);
		System.out.println(productExample);
		//使用PageHelper来设置分页

		PageHelper.offsetPage(page.getStart(),  page.getCount(), true);
		List<ProductExample> productlist=productService.findProductList(productQueryVo);
		//使用PageHelper来获取总数
		int total=(int)new PageInfo<ProductExample>(productlist).getTotal();
		
	
		page.setTotal(total);
		request.setAttribute("productlist", productlist);
		request.setAttribute("page", page);
		return "index";
		
	}
	
	//按类别查看商品
	@RequestMapping("/getSome")
	public  String getsomeCommodity(HttpServletRequest request,
			HttpServletResponse response,String product_name,ProductExample productExample,HttpSession session)throws Exception{
		//获取分页参数
		int start=0;
		int count=10;
		try {
			start=Integer.parseInt(request.getParameter("page.start"));			
			
			count=Integer.parseInt(request.getParameter("page.count"));
				
		} catch (Exception e) {			
		}	
		
		Page page=new Page(start,count);
		System.out.println(productExample);
		ProductQueryVo productQueryVo=new ProductQueryVo();
		
		if(product_name!=null &&product_name !=""){
			session.setAttribute("product_category", product_name);
			String pc=(String) session.getAttribute("product_category");
			productExample.setProduct_name(pc);
		}else {
			productExample.setProduct_name((String)session.getAttribute("product_category"));
		}
		session.setAttribute("u_status", "在售");
		productExample.setProduct_status((String)session.getAttribute("u_status"));
		
		
		productQueryVo.setProductExample(productExample);
		
		//使用PageHelper来设置分页

		PageHelper.offsetPage(page.getStart(),  page.getCount(), true);
		List<ProductExample> productlist=productService.findProductList(productQueryVo);
		//使用PageHelper来获取总数
		int total=(int)new PageInfo<ProductExample>(productlist).getTotal();
		
		page.setTotal(total);
		request.setAttribute("productlist", productlist);
		request.setAttribute("page", page);

		return "index";
	}
	
	//用户查看该商品具体信息
	@RequestMapping("/getOne")
	public String getSomeCommodity(HttpServletRequest request,
			HttpServletResponse response,HttpSession session,ProductExample productExample)throws Exception{

	
		ProductExample productExample2=productService.selectlist(productExample);
		
		request.setAttribute("product", productExample2);

		return "forward:/detail.action";
	}
	
	//用户添加商品到购物车
	@RequestMapping("/insertcar")
	public void Insertcar(HttpServletResponse response,Shoppingcart shoppingcart) throws Exception{
		ProductQueryVo productQueryVo=new ProductQueryVo();
		productQueryVo.setShoppingcart(shoppingcart);
		
		productService.insertShopping(productQueryVo);
		Boolean productExsit=true;
		ObjectMapper mapper=new ObjectMapper();
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		mapper.writeValue(response.getWriter(), productExsit);
	}
	
	//用户加入购物车时，查看购物车是否有该商品
	@RequestMapping("/selectcar")
	public void selectshoppingcar(HttpServletResponse response,Shoppingcart shoppingcart) throws Exception{
		ProductQueryVo productQueryVo=new ProductQueryVo();
		productQueryVo.setShoppingcart(shoppingcart);
		List<Shoppingcart> splist=productService.selectAll(productQueryVo);
		Map<String, Object> map=new HashMap<String, Object>();
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		if (splist!=null&& !splist.isEmpty()) {
			map.put("productExsit", true);
			map.put("splist", splist);
		}else {
			map.put("productExsit", false);
		}
		ObjectMapper mapper=new ObjectMapper();
		mapper.writeValue(response.getWriter(), map);
	}
	
	//用户查看购物车
	@RequestMapping("/allcar")
	public String allshopping(Shoppingcart shoppingcart,HttpServletRequest request,
			HttpServletResponse response,String car_id,HttpSession session)throws Exception{
		//获取分页参数
		int start=0;
		int count=7;
		try {
			start=Integer.parseInt(request.getParameter("page.start"));			
			count=Integer.parseInt(request.getParameter("page.count"));
			car_id=request.getParameter("carid");
			if (session.getAttribute("car_id")!=null && session.getAttribute("car_id")!="") {
				car_id= (String) session.getAttribute("car_id");
			}
			session.setAttribute("car_id", car_id);
		
		} catch (Exception e) {			
		}		
		Page page=new Page(start,count);
		ProductQueryVo productQueryVo=new ProductQueryVo();

		if(shoppingcart.getCar_id()!=0){
			session.setAttribute("car_id", shoppingcart.getCar_id());
			int pc=(int) session.getAttribute("car_id");
			shoppingcart.setCar_id(pc);	
			
		}else {
			int pc=(int) session.getAttribute("car_id");
			shoppingcart.setCar_id(pc);	
		}
		
		productQueryVo.setShoppingcart(shoppingcart);
	
		
		//使用PageHelper来设置分页

		PageHelper.offsetPage(page.getStart(),  page.getCount(), true);
		List<Shoppingcart> splist=productService.selectAll(productQueryVo);
		//使用PageHelper来获取总数
		int total=(int)new PageInfo<Shoppingcart>(splist).getTotal();
		
	
		page.setTotal(total);
		request.setAttribute("splist", splist);
		request.setAttribute("page", page);

		return "showcar";
	}
	
	//删除购物车商品
	@RequestMapping("/deletecars")
	public String deleteshoppingcart(ProductQueryVo productQueryVo,UserExample userExample,Shoppingcart shoppingcart,int[] products_id,HttpServletRequest request)throws Exception{
		if(userExample.getId()!=0 ){
			shoppingcart.setCar_id(userExample.getId());
		}
		
		productQueryVo.setShoppingcart(shoppingcart);
		productService.deleteByPrimaryKeyWithArrays(productQueryVo);
		return "redirect:/product/allcar.action";
	}
	
	//获取商品数量，校验用户输入数量是否超过商品数量
	@RequestMapping("/shopbyid")
	public void Getshopbyid(ProductExample productExample,HttpServletResponse response)throws Exception{
		
		ProductExample productExample2=productService.selectlist(productExample);
		int pro_stock=productExample2.getProduct_stock();
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		ObjectMapper mapper=new ObjectMapper();
		mapper.writeValue(response.getWriter(), pro_stock);
	}
	
	//用户在购物进行支付
	@RequestMapping("/pay")
	public String paymoney(int[] products_id,int[] stocks,Shoppingcart shoppingcart,UserExample userExample,HttpServletResponse response)throws Exception{
		for (int i = 0; i < products_id.length; i++) {
			shoppingcart.setProduct_id(products_id[i]);
			
			ProductExample productExample=new ProductExample();
			productExample.setId(products_id[i]);
			productExample.setProduct_stock(-stocks[i]);
			productService.updateByPrimaryKeyWithBLOBs(productExample);
			ProductExample productExample2=productService.selectlist(productExample);
			UserQueryVo userQueryVo=new UserQueryVo();
			userQueryVo.setUserExample(userExample);
			User user=UserService.selectByPrimaryKey(userQueryVo);
			
			Calendar calendar = Calendar.getInstance();
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");  
			
			OrdersExample ordersExample=new OrdersExample();
			ordersExample.setProduct_id(products_id[i]);
			ordersExample.setProduct_name(productExample2.getProduct_name());
			ordersExample.setProduct_category(productExample2.getProduct_category());
			ordersExample.setProduct_brand(productExample2.getProduct_brand());
			ordersExample.setProduct_price(productExample2.getProduct_price());
			ordersExample.setOrder_img(productExample2.getProduct_img());
			ordersExample.setOrder_price(productExample2.getProduct_price()*stocks[i]);
			ordersExample.setOrder_stock(stocks[i]);
			ordersExample.setId(userExample.getId());
			ordersExample.setUsername(user.getUsername());
			ordersExample.setName(user.getName());
			ordersExample.setPhone(user.getPhone());
			ordersExample.setAddress(user.getAddress());
			ordersExample.setProduct_status("未发货");
			ordersExample.setOrder_date(java.sql.Date.valueOf(formatter.format(calendar.getTime())));
			orderService.insertOrder(ordersExample);
		}
		return "forward:/product/deletecars.action";
	}
}
