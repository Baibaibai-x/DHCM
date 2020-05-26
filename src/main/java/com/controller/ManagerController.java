package com.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.po.Manager;
import com.po.OrdersExample;
import com.po.OrdersQueryVo;
import com.po.Page;
import com.po.ProductClassesExample;
import com.po.ProductExample;
import com.po.ProductQueryVo;
import com.po.Receipt;
import com.po.Totals;
import com.po.UserExample;
import com.po.UserQueryVo;
import com.service.ManagerService;
import com.service.OrderService;
import com.service.ProductClassService;
import com.service.ProductService;
import com.service.ReceiptService;
import com.service.TotalsService;
import com.service.UserService;

@Controller
@RequestMapping("/manager")
public class ManagerController {
	
	@Autowired
	private ManagerService managerService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private ProductClassService productClassService;
	
	@Autowired
	private ReceiptService receiptService;
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private TotalsService totalsService;
	
	//����Ա��½
	@RequestMapping("/mglog")
	public void mglogin(Manager manager,HttpServletResponse response,HttpSession session)throws Exception{
		Manager manager2=managerService.mglogin(manager);
		Map<String, Object> map=new HashMap<String, Object>();
		if(manager2!=null){
			String level=manager2.getMg_level();
			String id=manager2.getMg_id();
			map.put("status", true); 
			map.put("mg_id", id);
			map.put("mg_level", level);
			map.put("mg_status", manager2.getMg_status());
		}else {
			map.put("status", false); 
		}
		ObjectMapper mapper=new ObjectMapper();
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		mapper.writeValue(response.getWriter(), map);
	}
	
	//�������Աҳ�棬�����û���Ϣ
	@RequestMapping("mgindex")
	public String gomgindex(Model model,UserExample userExample,HttpServletRequest request,
			HttpServletResponse response,HttpSession session)throws Exception{
		
		
		//��ȡ��ҳ����
		int start=0;
		int count=7;
		try {
			start=Integer.parseInt(request.getParameter("page.start"));			
			count=Integer.parseInt(request.getParameter("page.count"));
		} catch (Exception e) {			
		}		
		Page page=new Page(start,count);
		UserQueryVo userQueryVo=new UserQueryVo();
		if(userExample.getUsername()!=null){
			session.setAttribute("username", userExample.getUsername());
		}else {
			userExample.setUsername((String)session.getAttribute("username"));
		}
		userQueryVo.setUserExample(userExample);
		
		//ʹ��PageHelper�����÷�ҳ

		PageHelper.offsetPage(page.getStart(),  page.getCount(), true);
		List<UserExample> userlist=userService.findUserList(userQueryVo);
		//ʹ��PageHelper����ȡ����
		int total=(int)new PageInfo<UserExample>(userlist).getTotal();
		
	
		page.setTotal(total);
		request.setAttribute("userlist", userlist);
		request.setAttribute("page", page);

				
		return "mgindex";
	}
	
	//����û�
	@RequestMapping("/ban")
	public String goban(UserExample userExample,HttpSession session,Page page)throws Exception{
		userService.updateByPrimaryKeyWithBLOBs(userExample);
		userExample=null;
		session.setAttribute("username", null);
		
		return "redirect:/manager/mgindex.action?page.start="+page.getStart();
	}
	
	//�������Ա��Ϣ�����Ȩ�޹���Ա����ʹ��
	@RequestMapping("mgment")
	public String gomg(Model model,Manager manager,HttpServletRequest request,
			HttpServletResponse response,HttpSession session)throws Exception{
		
		
		//��ȡ��ҳ����
		int start=0;
		int count=7;
		try {
			start=Integer.parseInt(request.getParameter("page.start"));			
			count=Integer.parseInt(request.getParameter("page.count"));
		} catch (Exception e) {			
		}		
		Page page=new Page(start,count);
		
		if(manager.getMg_name()!=null){
			session.setAttribute("mgname", manager.getMg_name());
		}else {
			manager.setMg_name((String)session.getAttribute("mgname"));
		}
	
		//ʹ��PageHelper�����÷�ҳ
		PageHelper.offsetPage(page.getStart(),  page.getCount(), true);
		List<Manager> mgList=managerService.selectAllmanager(manager);
		//ʹ��PageHelper����ȡ����
		int total=(int)new PageInfo<Manager>(mgList).getTotal();
		page.setTotal(total);
		request.setAttribute("mglist", mgList);
		request.setAttribute("page", page);		
		return "manager";
	}
	
	//���/�������Ա
	@RequestMapping("/banmanager")
	public String banmanager(Manager manager,HttpSession session,Page page)throws Exception{
		managerService.updatemanager(manager);
		session.setAttribute("mgname", null);
		return "redirect:/manager/mgment.action?page.start="+page.getStart();
	}
	
	//��������Ϣ����
	@RequestMapping("/mginfo")
	public String mginfo(Model model,Manager manager)throws Exception{

		Manager manager2=managerService.selectByPrimaryKey(manager);
		model.addAttribute("manager",manager2);
		return "mginfo";
	}
	
	//�޸Ĺ���Ա������Ϣ
	@RequestMapping("/managerupdateinfo")
	public String managerupdateinfo(Manager manager)throws Exception{
		managerService.updatemanager(manager);
		return "forward:/manager/mginfo.action";
	}
	
	//У�����Ա������
	@RequestMapping("/mg_id")
	public void regitpassword(Manager manager,String password,HttpServletResponse response)throws Exception{
		Manager manager2=managerService.selectByPrimaryKey(manager);
		Boolean mgExsit;
		if(manager2.getMg_password().equals(password)){
			mgExsit=true;
		}else{
			mgExsit=false;
		}
		ObjectMapper mapper=new ObjectMapper();
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		mapper.writeValue(response.getWriter(), mgExsit);
	}
	
	//����Ա�޸ı�������
	@RequestMapping("/manager_uppwd")
	public void managerupdatepwd(Manager manager,HttpServletResponse response)throws Exception{
		managerService.updatemanager(manager);
		Boolean mgExsit=true;
		ObjectMapper mapper=new ObjectMapper();
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		mapper.writeValue(response.getWriter(), mgExsit);
	}
	
	//�޸Ĺ���Ա��Ϣ
	@RequestMapping("/updatemanager")
	public String updatemanager(Manager manager,HttpSession session,Page page)throws Exception{
		managerService.updatemanager(manager);
		session.setAttribute("mgname", null);
		return "redirect:/manager/mgment.action?page.start="+page.getStart();
	}
	
	//�޸��û���Ϣ
	@RequestMapping("/updateuser")
	public String updateuser(UserExample userExample,HttpSession session,Page page)throws Exception{
		userService.updateByPrimaryKeyWithBLOBs(userExample);
		userExample=null;
		session.setAttribute("username", null);
		return "redirect:/manager/mgindex.action?page.start="+page.getStart();
	}
	
	//��������ԱУ���˺�
	@RequestMapping("/checkid")
	public void checkid(Manager manager,HttpServletResponse response)throws Exception{
		List<Manager> mgList=managerService.selectAllmanager(manager);
		Boolean mgExsit;
		if(mgList!=null&&!mgList.isEmpty()){
			mgExsit=true;
		}else {
			mgExsit=false;
		}
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		ObjectMapper mapper=new ObjectMapper();
		mapper.writeValue(response.getWriter(), mgExsit);
	}
	
	//��������Ա
	@RequestMapping("/insertmg")
	public String insertmg(Manager manager,HttpSession session)throws Exception{
		managerService.insertmg(manager);
		manager=null;
		session.setAttribute("mgname", null);
		return "redirect:/manager/mgment.action";
	}
	
	//������Ʒ����
	@RequestMapping("product_mg")
	public String managerproduct(HttpSession session)throws Exception{
		session.removeAttribute("status");
		session.removeAttribute("product_category");
		session.removeAttribute("product_name");
		return "forward:/manager/commodity_show.action";
	}
	
	//��Ʒ�����Ϣ
	@RequestMapping("/category_show")
	public String Godetail(Model model,HttpSession session) throws Exception{
		ProductClassesExample productClassesExample=new ProductClassesExample();
		productClassesExample.setProduct_kind("��������");
		List<ProductClassesExample> pclist=productClassService.selectByPrimaryKey(productClassesExample);
		ProductClassesExample productClassesExample2=new ProductClassesExample();
		productClassesExample2.setProduct_kind("���");
		List<ProductClassesExample> calist=productClassService.selectByPrimaryKey(productClassesExample2);
		
		List<ProductClassesExample> alList=productClassService.findProductClassList();
		model.addAttribute("pclist",pclist);
		model.addAttribute("calist",calist);
		model.addAttribute("allist",alList);
		return "commodity";
	}
	
	//��Ʒ��Ϣ��ҳ
	@RequestMapping("/commodity_show")
	public  String getAllCommodity(HttpServletRequest request,
			HttpServletResponse response,String pj,ProductExample productExample,HttpSession session)throws Exception{
		//��ȡ��ҳ����
		int start=0;
		int count=10;
		try {
			start=Integer.parseInt(request.getParameter("page.start"));						
			count=Integer.parseInt(request.getParameter("page.count"));		
		} catch (Exception e) {			
		}		
		Page page=new Page(start,count);
		ProductQueryVo productQueryVo=new ProductQueryVo();
		
		if(pj!=null&&pj.equals("sc")){
			session.removeAttribute("product_category");
		}
		if(productExample.getProduct_category()!=null &&productExample.getProduct_category() !=""){
			session.setAttribute("product_category", productExample.getProduct_category());
		}else {
			productExample.setProduct_category((String)session.getAttribute("product_category"));
		}
		if(productExample.getProduct_status()!=null&&productExample.getProduct_status()!=""){
			session.setAttribute("status", productExample.getProduct_status());
		}else{
			productExample.setProduct_status((String)session.getAttribute("status"));
		}
		productQueryVo.setProductExample(productExample);
		
		//ʹ��PageHelper�����÷�ҳ

		PageHelper.offsetPage(page.getStart(),  page.getCount(), true);
		List<ProductExample> productlist=productService.findProductList(productQueryVo);
		//ʹ��PageHelper����ȡ����
		int total=(int)new PageInfo<ProductExample>(productlist).getTotal();
		
	
		page.setTotal(total);
		request.setAttribute("productlist", productlist);
		request.setAttribute("page", page);

		return "forward:/manager/category_show.action";
	}
	
	//���¼���Ʒ
	@RequestMapping("ban_pd")
	public String productban(ProductExample productExample,HttpSession session,Page page)throws Exception{
		productService.updateByPrimaryKeyWithBLOBs(productExample);		
		return "redirect:/manager/commodity_show.action?page.start="+page.getStart();
	}
	
	//����Ա�����ض���Ʒ
	@RequestMapping("search_pd_mg")
	public String searchproduct(ProductExample productExample,HttpSession session,HttpServletRequest request)throws Exception{
		//��ȡ��ҳ����
		int start=0;
		int count=10;
		try {
			start=Integer.parseInt(request.getParameter("page.start"));						
			count=Integer.parseInt(request.getParameter("page.count"));		
		} catch (Exception e) {			
		}		
		Page page=new Page(start,count);
		ProductQueryVo productQueryVo=new ProductQueryVo();

		if(productExample.getProduct_name()!=null &&productExample.getProduct_name() !=""){
			session.setAttribute("product_name", productExample.getProduct_category());
		}else {
			productExample.setProduct_category((String)session.getAttribute("product_name"));
		}
		productQueryVo.setProductExample(productExample);
		
		//ʹ��PageHelper�����÷�ҳ

		PageHelper.offsetPage(page.getStart(),  page.getCount(), true);
		List<ProductExample> productlist=productService.findProductList(productQueryVo);
		//ʹ��PageHelper����ȡ����
		int total=(int)new PageInfo<ProductExample>(productlist).getTotal();

		page.setTotal(total);
		request.setAttribute("productlist", productlist);
		request.setAttribute("page", page);

		return "forward:/manager/category_show.action";
	}
	
	//����Ա�޸���Ʒ��Ϣ
	@RequestMapping("/update_product")
	public String updateproduct(ProductExample productExample,String product_date,Page page,
			@ModelAttribute("pds_img") MultipartFile pds_img//������ƷͼƬ
			)throws Exception{
		//ԭʼ����
		String originalFilename= pds_img.getOriginalFilename();
		//�ϴ�ͼƬ

		if(pds_img!=null && originalFilename!=null && originalFilename.length()>0){
			//�洢ͼƬ������·��
			String  img_path="C:\\Users\\Administrator\\Desktop\\img\\";
			//�µ�ͼƬ����
			String newFileName=UUID.randomUUID()+originalFilename.substring(originalFilename.lastIndexOf("."));
			//��ͼƬ
			File newFile=new File(img_path+newFileName);
			//���ڴ��е�����д�����
			pds_img.transferTo(newFile);
			//����ͼƬ����д��itemsCustom��			
			productExample.setProduct_img(newFileName);			
		}

		productService.updateByPrimaryKeyWithBLOBs(productExample);
		return "redirect:/manager/commodity_show.action?page.start="+page.getStart();
	}
	
	//У����Ʒ���Ƿ����
	@RequestMapping("/check_pdname")
	public void checkproductname(ProductExample productExample,HttpServletResponse response)throws Exception{
		Boolean mgExsit;
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		if(productExample.getId()>0){
			ProductExample productExample2=productService.selectlist(productExample);
			String p_name=productExample2.getProduct_name();
			ObjectMapper mapper=new ObjectMapper();
			mapper.writeValue(response.getWriter(), p_name);
		}else if(productExample.getProduct_name()!=null &&productExample.getProduct_name()!=""){
			ProductExample productExample2=productService.selectlist(productExample);
			if(productExample2!=null){	
				mgExsit=false;
				ObjectMapper mapper=new ObjectMapper();
				mapper.writeValue(response.getWriter(), mgExsit);
			}else {
				mgExsit=true;
				ObjectMapper mapper=new ObjectMapper();
				mapper.writeValue(response.getWriter(), mgExsit);
			}
			
		}

	}
	
	//У������
	@RequestMapping("/check_date")
	public void checkdate(String product_date,
			@Validated ProductExample productExample,BindingResult bindingResult,HttpServletResponse response)throws Exception{
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
	
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String timeFormat = sdf.format(productExample.getProduct_date());
        Map<String, Object> map=new HashMap<String,Object>();
		if(!timeFormat.equals(product_date)){
			map.put("dtExsit", false);
			map.put("message", "���ڸ�ʽ����");
			ObjectMapper mapper=new ObjectMapper();
			mapper.writeValue(response.getWriter(), map);
		}else if(bindingResult.hasErrors()){
			//���������Ϣ
			List<ObjectError> allErrors=bindingResult.getAllErrors();
			for(ObjectError objectError:allErrors){
				//���������Ϣ
				String message= objectError.getDefaultMessage();
				map.put("dtExsit", false);
				map.put("message", message);
			}
			
			ObjectMapper mapper=new ObjectMapper();
			mapper.writeValue(response.getWriter(), map);
		}else {
			map.put("dtExsit", true);
			ObjectMapper mapper=new ObjectMapper();
			mapper.writeValue(response.getWriter(), map);
		}
	}
	
	//��Ʒ���
	@RequestMapping("/insert_receipt")
	public String insertreceipt(Receipt receipt,Page page)throws Exception{
		ProductExample productExample=new ProductExample();
		productExample.setId(receipt.getProduct_id());
		ProductExample productExample2=productService.selectlist(productExample);
		receipt.setProduct_category(productExample2.getProduct_category());
		receipt.setReceipt_img(productExample2.getProduct_img());
		receipt.setAllprice(receipt.getReceipt_stock()*receipt.getReceipt_price());
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");  
		
		receipt.setReceipt_date(java.sql.Date.valueOf(formatter.format(calendar.getTime())));
		receipt.setStatus("׼�����");

		receiptService.insertreceipt(receipt);
		return "redirect:/manager/commodity_show.action?page.start="+page.getStart();
	}
	
	//ɾ����ⵥ
	@RequestMapping("/delete_receipt")
	public String deletereceipt(Receipt receipt)throws Exception{
		receiptService.deletereceipt(receipt);
		return "redirect:/manager/show_receipt.action";
	}
	
	//ͬ����⣬��Ʒ�������
	@RequestMapping("/agree_receipt")
	public String agreereceipt(Receipt receipt,Page page)throws Exception{
		
		//����Ʒ���ӿ��
		ProductExample productExample=new ProductExample();
		productExample.setId(receipt.getProduct_id());
		productExample.setProduct_stock(receipt.getReceipt_stock());
		productService.updateByPrimaryKeyWithBLOBs(productExample);
		//��ⵥ״̬�ı�
		receipt.setStatus("�����");
		receiptService.updatereceipt(receipt);
		
		//����ͳ�Ʊ�����޸�
		Totals totals=new Totals();
		totals.setProduct_id(receipt.getProduct_id());
		List<Totals> toal=totalsService.getAllTotals(totals);
		if(toal==null||toal.size()==0){
			//�������ͳ����û�д���Ʒ�������������
			//�Ȳ�ѯ��Ʒ��Ϣ
			ProductExample productExample2=productService.selectlist(productExample);	
			totals.setProduct_name(productExample2.getProduct_name());
			totals.setProduct_category(productExample2.getProduct_category());
			totals.setProduct_img(productExample2.getProduct_img());
			totals.setOrd_price(0.0);
			totals.setRec_stock(receipt.getReceipt_stock());
			totals.setRec_price(receipt.getAllprice());
			totals.setTotal_price(totals.getOrd_price()-totals.getRec_price());
			totalsService.insertTotals(totals);
		}else{
			totals.setOrd_price(0.0);
			totals.setRec_stock(receipt.getReceipt_stock());
			totals.setRec_price(receipt.getAllprice());
			totals.setTotal_price(totals.getOrd_price()-totals.getRec_price());	
			//�������ͳ�������д���Ʒ�������޸�����
			totalsService.updateTotals(totals);		
		}
		
		return "redirect:/manager/show_receipt.action?page.start="+page.getStart();
	}
	
	//�鿴��ⵥ
	@RequestMapping("/show_receipt")
	public String showreceipt(Receipt receipt,String rj,HttpServletRequest request,HttpServletResponse response,
			HttpSession session)throws Exception{
		int start=0;
		int count=7;
		try {
			start=Integer.parseInt(request.getParameter("page.start"));			
			count=Integer.parseInt(request.getParameter("page.count"));	
		} catch (Exception e) {			
		}		
		Page page=new Page(start,count);
		if(rj!=null &&rj.equals("sc")){
			session.removeAttribute("rep_name");
			session.removeAttribute("rep_status");
		}
		if(rj!=null &&rj.equals("nc")){
			session.removeAttribute("rep_name");
		}
		if(rj!=null &&rj.equals("pc")){
			session.removeAttribute("rep_status");
		}
		if (receipt.getProduct_name()!=null &&receipt.getProduct_name()!="") {
			session.setAttribute("rep_name",receipt.getProduct_name());
		}else {
			receipt.setProduct_name((String)session.getAttribute("rep_name"));
		}
		if(receipt.getStatus()!=null &&receipt.getStatus()!=""){
			session.setAttribute("rep_status",receipt.getStatus());
		}else {
			receipt.setStatus((String)session.getAttribute("rep_status"));
		}
		
		//ʹ��PageHelper�����÷�ҳ
		PageHelper.offsetPage(page.getStart(),  page.getCount(), true);
		List<Receipt> receiptlist=receiptService.selectAlllist(receipt);
		//ʹ��PageHelper����ȡ����
		int total=(int)new PageInfo<Receipt>(receiptlist).getTotal();
			
		page.setTotal(total);
		request.setAttribute("recelist", receiptlist);
		request.setAttribute("page", page);
		
		return "mgreceipt";
	}
	
	//����Ա������Ʒ
	@RequestMapping("/insert_product")
	public String insertproduct(ProductExample productExample,
			@ModelAttribute("pds_img") MultipartFile pds_img//������ƷͼƬ
			)throws Exception{
		//ԭʼ����
		String originalFilename= pds_img.getOriginalFilename();
		//�ϴ�ͼƬ
		if(pds_img!=null && originalFilename!=null && originalFilename.length()>0){
			//�洢ͼƬ������·��
			String  img_path="C:\\Users\\Administrator\\Desktop\\img\\";
			//�µ�ͼƬ����
			String newFileName=UUID.randomUUID()+originalFilename.substring(originalFilename.lastIndexOf("."));
			//��ͼƬ
			File newFile=new File(img_path+newFileName);
			//���ڴ��е�����д�����
			pds_img.transferTo(newFile);
			//����ͼƬ����д��itemsCustom��			
			productExample.setProduct_img(newFileName);			
		}
		ProductClassesExample productClassesExample=new ProductClassesExample();
		productClassesExample.setProduct_category(productExample.getProduct_category());
		List<ProductClassesExample> kList=productClassService.selectByPrimaryKey(productClassesExample);
		productExample.setProduct_kind(kList.get(0).getProduct_kind());
		productService.insertProduct(productExample);
		return "redirect:/manager/commodity_show.action";
	}
	
	//����鿴����
	@RequestMapping("/show_orders")
	public String getshoworders(OrdersExample ordersExample,String oj,HttpServletRequest request,HttpServletResponse response,
			HttpSession session)throws Exception{
		//��ȡ��ҳ����
		int start=0;
		int count=10;
		try {
			start=Integer.parseInt(request.getParameter("page.start"));			
			count=Integer.parseInt(request.getParameter("page.count"));	
		} catch (Exception e) {			
		}		
		Page page=new Page(start,count);
		OrdersQueryVo ordersQueryVo=new OrdersQueryVo();
		
		if(oj!=null &&oj.equals("sc")){
			session.removeAttribute("p_name");
			session.removeAttribute("o_status");
		}
		if(ordersExample.getProduct_name()!=null){
			session.setAttribute("p_name",ordersExample.getProduct_name());	
		}else {
			String pc=(String) session.getAttribute("p_name");
			ordersExample.setProduct_name(pc);	
		}
		if(ordersExample.getProduct_status()!=null){
			session.setAttribute("o_status",ordersExample.getProduct_status());	
		}else {
			ordersExample.setProduct_status((String)session.getAttribute("o_status"));
		}
		ordersQueryVo.setOrdersExample(ordersExample);
		//ʹ��PageHelper�����÷�ҳ

		PageHelper.offsetPage(page.getStart(),  page.getCount(), true);
		List<OrdersExample> orderlist=orderService.selectByPrimaryKey(ordersQueryVo);
		//ʹ��PageHelper����ȡ����
		int total=(int)new PageInfo<OrdersExample>(orderlist).getTotal();
			
		page.setTotal(total);
		request.setAttribute("orderlist", orderlist);
		request.setAttribute("page", page);
		return "mgorder";
	}
	
	//����
	@RequestMapping("/ship_order")
	public String ordership(int or_id,Page page)throws Exception{
		OrdersExample ordersExample=new OrdersExample();
		ordersExample.setOrder_id(or_id);
		ordersExample.setProduct_status("�ѷ���");
		orderService.updateByPrimaryKeyWithBLOBs(ordersExample);
		return  "redirect:/manager/show_orders.action?page.start="+page.getStart();
	}
	
	//ͬ���˻���ɾ�������������Դ
	@RequestMapping("/agree_retun")
	public String agreeretun(OrdersExample ordersExample,Page page)throws Exception{
		ProductExample productExample=new ProductExample();
		productExample.setId(ordersExample.getProduct_id());
		productExample.setProduct_stock(ordersExample.getOrder_stock());
		productService.updateByPrimaryKeyWithBLOBs(productExample);
		orderService.deleteorder(ordersExample);
		return  "redirect:/manager/show_orders.action?page.start="+page.getStart();
	}
	
	//��������ͳ��
	@RequestMapping("/statistics")
	public String statistics(HttpServletRequest request,Totals totals,String tc,HttpSession session)throws Exception{
		
		int start=0;
		int count=10;
		try {
			start=Integer.parseInt(request.getParameter("page.start"));			
			count=Integer.parseInt(request.getParameter("page.count"));	
		} catch (Exception e) {			
		}		
		Page page=new Page(start,count);
		
		if(tc !=null &&tc.equals("all")){
			session.removeAttribute("tal_price");
			session.removeAttribute("pd_category");
			session.removeAttribute("pro_name");
		}
		if(tc!=null&&tc.equals("t_price")){
			session.removeAttribute("pd_category");
			session.removeAttribute("pro_name");
		}
		if(tc!=null&&tc.equals("pd_category")){
			session.removeAttribute("tal_price");
			session.removeAttribute("pro_name");
		}
		if(tc!=null&&tc.equals("pd_name")){
			session.removeAttribute("tal_price");
			session.removeAttribute("pd_category");
		}
		if(totals.getTotal_price()!=null){
			session.setAttribute("tal_price",totals.getTotal_price());
		}else{
			totals.setTotal_price((Double)session.getAttribute("tal_price"));
		}
		if(totals.getProduct_category()!=null){
			session.setAttribute("pd_category",totals.getProduct_category());	
		}else{
			totals.setProduct_category((String)session.getAttribute("pd_category"));
		}
		if(totals.getProduct_name()!=null){
			session.setAttribute("pro_name", totals.getProduct_name());
		}else{
			totals.setProduct_name((String)session.getAttribute("pro_name"));
		}
		//ʹ��PageHelper�����÷�ҳ
		PageHelper.offsetPage(page.getStart(),  page.getCount(), true);
		List<Totals> totalList=totalsService.getAllTotals(totals);
		//ʹ��PageHelper����ȡ����
		int total=(int)new PageInfo<Totals>(totalList).getTotal();
			
		page.setTotal(total);
		Totals totals2=new Totals();
		List<Totals> alltotalList=totalsService.getAllTotals(totals);
		Double o_price=0.0,r_price=0.0,t_price=0.0;
		
		for(Totals totals3:alltotalList){
			o_price+=totals3.getOrd_price();
			r_price+=totals3.getRec_price();
			t_price+=totals3.getTotal_price();
		}
		totals2.setOrd_price(o_price);
		totals2.setRec_price(r_price);
		totals2.setTotal_price(t_price);

		request.setAttribute("totalList", totalList);
		request.setAttribute("page", page);
		request.setAttribute("alltotal", totals2);
		return "mgstatistics";
	}
	
	//�������ʾ��������
	@RequestMapping("/suggestion_sales")
	public String categorysales(HttpServletRequest request)throws Exception{
		
		//��ȡ������Ʒ���롢֧��֮��
		Totals totals=new Totals();
		List<Totals> alltotalList=totalsService.getAllTotals(totals);
		Double o_price=0.0,r_price=0.0,t_price=0.0;
		
		for(Totals totals2:alltotalList){
			o_price+=totals2.getOrd_price();
			r_price+=totals2.getRec_price();
			t_price+=totals2.getTotal_price();
		}
		totals.setOrd_price(o_price);
		totals.setRec_price(r_price);
		totals.setTotal_price(t_price);
		
		//�����������Ʒ����
		Collections.sort(alltotalList, new Comparator<Totals>(){  
            /*  
             * int compare(Totals o1, Totals o2) ����һ���������͵����ͣ�  
             * ���ظ�����ʾ��t1 С��t2��  
             * ����0 ��ʾ��t1��t2��ȣ�  
             * ����������ʾ��t1����t2��  
             */  
            public int compare(Totals t1, Totals t2) {  
                //���ս���С���н�������  
                if(t1.getTotal_price() < t2.getTotal_price()){  
                    return 1;  
                }  
                if(t1.getTotal_price() == t2.getTotal_price()){  
                    return 0;  
                }  
                return -1;  
            }  
        });
		//��ȡ������ǰ������Ʒ����
		List<Totals> firelist = alltotalList.subList(0,3);
		
		//��ȡ����ǰ������Ʒ����
		List<Totals> losslist = alltotalList.subList(alltotalList.size()-3,alltotalList.size());
		//����
		Collections.reverse(losslist);
		
		//��ȡ�����������Ʒ������Ϣ
		totals.setProduct_category("product_category");
		List<Totals> allcateList=totalsService.getAllTotals(totals);
		Collections.sort(allcateList,new Comparator<Totals>() {
			public int compare(Totals t1, Totals t2) {  
                //���ս���С���н�������  
                if(t1.getTotal_price() < t2.getTotal_price()){  
                    return 1;  
                }  
                if(t1.getTotal_price() == t2.getTotal_price()){  
                    return 0;  
                }  
                return -1;  
            }  
		});
		//������ߵ����
		Totals firecate=allcateList.get(0);
		//������͵����
		Totals losscate=allcateList.get(allcateList.size()-1);
		
		request.setAttribute("sugList", firelist);
		request.setAttribute("lossList", losslist);
		request.setAttribute("alltotal", totals);
		request.setAttribute("firecate", firecate);
		request.setAttribute("losscate", losscate);
		return "mgstatistics";
	}
}
