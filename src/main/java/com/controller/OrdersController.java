package com.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.po.OrdersExample;
import com.po.OrdersQueryVo;
import com.po.Page;
import com.po.Totals;
import com.service.OrderService;
import com.service.TotalsService;

@Controller
@RequestMapping("/order")
public class OrdersController {
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private TotalsService totalsService;
	
	@RequestMapping("/show_all_order")
	public String showallorder(OrdersExample ordersExample,HttpServletRequest request,HttpServletResponse response,
			HttpSession session)throws Exception{
		//��ȡ��ҳ����
		int start=0;
		int count=7;
		try {
			start=Integer.parseInt(request.getParameter("page.start"));			
			count=Integer.parseInt(request.getParameter("page.count"));
		
		} catch (Exception e) {			
		}		
		Page page=new Page(start,count);
		OrdersQueryVo ordersQueryVo=new OrdersQueryVo();
		if(ordersExample.getId()!=0){
			session.setAttribute("o_id",ordersExample.getId());
			int pc=(int) session.getAttribute("o_id");
			ordersExample.setId(pc);
			
		}else {
			int pc=(int) session.getAttribute("o_id");
			ordersExample.setId(pc);	
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
		return "orders";
	}
	
	//�û�ȷ���ջ�
	@RequestMapping("comple_order")
	public String compleorders(int o_id,Page page)throws Exception{
		//�޸Ķ���״̬Ϊ�����
		OrdersExample ordersExample=new OrdersExample();
		ordersExample.setOrder_id(o_id);
		ordersExample.setProduct_status("�����");
		orderService.updateByPrimaryKeyWithBLOBs(ordersExample);
		//��ѯ�ö�������Ϣ
		OrdersQueryVo ordersQueryVo=new OrdersQueryVo();
		ordersExample.setProduct_status(null);
		ordersQueryVo.setOrdersExample(ordersExample);
		List<OrdersExample> ordersExamples=orderService.selectByPrimaryKey(ordersQueryVo);
		
		//����ͳ�Ʊ�����޸�
		Totals totals=new Totals();
		totals.setProduct_id(ordersExamples.get(0).getProduct_id());
		List<Totals> toal=totalsService.getAllTotals(totals);
		totals.setRec_price(0.0);
		totals.setOrd_stock(ordersExamples.get(0).getOrder_stock());
		totals.setOrd_price(ordersExamples.get(0).getOrder_price());
		totals.setTotal_price(totals.getOrd_price()-totals.getRec_price());	
		if(toal==null||toal.size()==0){
			//�������ͳ����û�д���Ʒ�������������
			totalsService.insertTotals(totals);
		}else{
			//�������ͳ�������д���Ʒ�������޸�����
			totalsService.updateTotals(totals);		
		}
		
		return "redirect:/order/show_all_order.action?page.start="+page.getStart();
	}
	
	//�û������˻�
	@RequestMapping("retun_order")
	public String retunorders(int o_id,Page page)throws Exception{
		OrdersExample ordersExample=new OrdersExample();
		ordersExample.setOrder_id(o_id);
		ordersExample.setProduct_status("�����˻�");
		orderService.updateByPrimaryKeyWithBLOBs(ordersExample);
		return "redirect:/order/show_all_order.action?page.start="+page.getStart();
	}
	
	//�û�ȡ���˻�����
	@RequestMapping("retun_canel")
	public String retuncanel(int o_id,Page page)throws Exception{
		OrdersExample ordersExample=new OrdersExample();
		ordersExample.setOrder_id(o_id);
		ordersExample.setProduct_status("δ����");
		orderService.updateByPrimaryKeyWithBLOBs(ordersExample);
		return "redirect:/order/show_all_order.action?page.start="+page.getStart();
	}
}
