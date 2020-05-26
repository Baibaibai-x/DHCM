<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE "http://www.w3.org/TR/html5/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>大河电脑城</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/page.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/pub.css"/>
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/mgindex.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquerySession.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/mgindex.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/href.js"></script>
<style type="text/css">
	#body{
		height: 950px;
	}
	#b-left{
		float:left;
		width:12%;
		height:900px;
		border: solid;
	}
	#b-right{
		float:left;
		width:86%;
		height:900px;
		border: solid;
		margin-left: 10px;
	}
	#show{
		position: relative;
		margin-top:20px;
		border: solid 1px; 
		text-align: center;
		min-width: 920px;
	}
	#sp_cart{
		position: relative;
		top: 5%;
		text-align: center;
	}
	#sp_cart tr{
		height: 60px;
		border: solid 1px;
	}
	td{
		border: solid 1px;
	}
	.img,.uname{
		width: 100px;
	}
	.name,.sprc{
		width: 80px;
	}
	.img img{
		width: 100px;
		height: 60px;
	}
	.stk,.oid{
		width: 60px;
	}
	.phone,.sbrd{
		width: 110px;
	}
	.address{
		width: 180px;
	}
	.sname{
		width: 160px;
	}
	.sctg,.status{
		width: 90px;
	}
	.cz{
		width: 76px;
	}
	.cz input{
		border: none;
		width: 75px;
		height: 35px;
	}
	.ship{
		background-color: #CCFFFF;
	}
	.ship:hover{
		background-color: #FF99CC;
		color: #FFF;
	}
	.agree{
		background-color: #DDDDDD;
	}
	.agree:HOVER{
		background-color: #FF3333;
		color: #FFf;
	}
	#page_some{
		position: relative;
		top:20px;
	}
	#putpd{
		width:300px;
		height:30px;
		position:relative;
		left:22%;
	}
	#putpdbut{
		font-size:16px;
		width:80px;
		height:35px;
		left:22%;
		position:relative;
		color:#FFF;
		background-color:#F00;
		border:#FFF;
	}
	#allline,#offline,#shipped,#retun,#comple{
		position: relative;
		left: 17%;
		width: 100px;
		height: 35px;
		top: 75px;
		border: none;
		background-color: #99FFFF;
		margin-bottom: 2%;
	}
	#shipped:hover,#offline:hover,#allline:hover,#retun:hover,#comple:hover{
		background-color: #FFC0CB;
		color: #FFF;
	}
	

</style>
<script type="text/javascript">
	$(function(){
		//搜索商品
		$('#putpdbut').click(function(){
			var pd_name=$('#putpd').val();
			$(location).attr('href',"${pageContext.request.contextPath }/manager/show_orders.action?product_name="+pd_name+"&oj="+"sc");
		});
			
		//取消修改
		$('.mp_cancel').click(function(){
			$('#j_hideFormLogin').click();
		});
		
		//发货
		$('.ship').click(function(){
			var id=$(this).parent().parent().find('.oid').text();
			var status="已发货";
			Href=window.location.href;	
			var href=$.href.showWindowHref(Href);	
			if(href['page.start']!=null && href['page.start']!=""){
				$(location).attr('href',"${pageContext.request.contextPath }/manager/ship_order.action?or_id="+id+"&start="+href['page.start']);
			}else{
				$(location).attr('href',"${pageContext.request.contextPath }/manager/ship_order.action?or_id="+id+"&start="+0);
			}
		});
		
		//同意退货
		$('.agree').click(function(){
			var id=$(this).parent().parent().find('.oid').text();
			var stk=$(this).parent().parent().find('.stk').text();
			var pid=$(this).parent().parent().find('.p_id').val();
			Href=window.location.href;	
			var href=$.href.showWindowHref(Href);
			if(href['page.start']!=null && href['page.start']!=""){
				$(location).attr('href',"${pageContext.request.contextPath }/manager/agree_retun.action?order_id="+id+"&product_id="+pid+"&order_stock="+stk+"&start="+href['page.start']);
			}else{
				$(location).attr('href',"${pageContext.request.contextPath }/manager/agree_retun.action?order_id="+id+"&product_id="+pid+"&order_stock="+stk+"&start="+0);
			}
			
		});
		
		//显示所有订单
		$('#allline').click(function(){
			$('#mg_order').click();
		});
		
		//显示未发货订单
		$('#offline').click(function(){
			var status="未发货";
			$(location).attr('href',"${pageContext.request.contextPath }/manager/show_orders.action?product_status="+status+"&oj="+"sc");
		});
		
		//显示已发货的订单
		$('#shipped').click(function(){
			var status="已发货";
			$(location).attr('href',"${pageContext.request.contextPath }/manager/show_orders.action?product_status="+status+"&oj="+"sc");
		});	
		
		//显示申请退款的订单
		$('#retun').click(function(){
			var status="申请退货";
			$(location).attr('href',"${pageContext.request.contextPath }/manager/show_orders.action?product_status="+status+"&oj="+"sc");
		});	
		
		//显示已完成的订单
		$('#comple').click(function(){
			var status="已完成";
			$(location).attr('href',"${pageContext.request.contextPath }/manager/show_orders.action?product_status="+status+"&oj="+"sc");
		});	
	});
</script>

</head>
<body>
<div id="top">
<label>欢迎,</label>

<span id="l_user">

</span>
<span id="u_esc">
	<a href="javascript:void(0)" id="esc">退出</a>
	<input type="button" id="m_info"value="信息管理" />
</span>
<h1>大河电脑商城后台管理系统</h1>
</div>
<div id="menu">
	<input type="button" id="index"value="首页" />
	<input type="button" id="mg_mg" value="管理员管理">
    <input type="button" id="mg_user"value="用户管理" />
    <input type="button" id="mg_product"value="商品管理" />
    <input type="button" id="mg_warehouse"value="入库管理" />
    <input type="button" id="mg_order"value="订单管理" />
    <input type="button" id="mg_statistics"value="数据统计" />
</div>
<div id="body">
	<input type="text" id="putpd" placeholder="搜索 商品名/品牌/用户姓名" />
    <input type="button" id="putpdbut" value="搜索" />
 
  	<div id="b-left">
  	<input type="button" id="allline" value="所有订单"/><br/>
   	<input type="button" id="offline" value="未发货"><br/>
    <input type="button" id="shipped" value="已发货"/><br/>
    <input type="button" id="retun" value="退货申请"/><br/>
    <input type="button" id="comple" value="已完成"/>
</div>
<div id="b-right">
<div id="show">
	<c:if test="${orderlist.size()==0}">
	<span class="none">订单空空如也!</span>
	</c:if>
	<c:if test="${orderlist.size()!=0}">
    <div id="u_tab">
    <table id="sp_cart">
    	<tr>
			<td class="oid">订单id</td>
			<td class="img">图片</td>
			<td class="sname">商品名</td>
			<td class="sctg">类别</td>
			<td class="sbrd">品牌</td>
			<td class="sprc">单价(元)</td>
			<td class="stk">数量</td>
			<td class="sprc">总价(元)</td>
			<td class="status">订单状态</td>
			<td class="uname">购买账号</td>
			<td class="name">姓名</td>
			<td class="phone">联系电话</td>
			<td class="address">收货地址</td>
			<td class="cz">操作</td>
		</tr>
    	<c:forEach items="${orderlist}" var="order">
			<tr>
				<td class="oid">${order.order_id }<input class="p_id" value="${order.product_id }" style="display: none;"/></td>
				<td class="img"><img src="/pic/${order.order_img }" id="pd_p"/></td>
				<td class="sname">${order.product_name }</td>
				<td class="sctg">${order.product_category }</td>
				<td class="sbrd">${order.product_brand }</td>
				<td class="sprc">${order.product_price }</td>
				<td class="stk">${order.order_stock }</td>
				<td class="sparc">${order.order_price }</td>
				<td class="status">${order.product_status }</td>
				<td class="uname">${order.username }</td>
				<td class="name">${order.name }</td>
				<td class="phone">${order.phone }</td>
				<td class="address">${order.address }</td>
				<td class="cz">
				<c:if test="${order.product_status=='未发货' }">
					<input type="button" class="ship" value="发货"/>
				</c:if>
				<c:if test="${order.product_status=='申请退货' }">
					<input type="button" class="agree" value="同意"/>
				</c:if>
				<c:if test="${order.product_status!='申请退货' && order.product_status!='未发货'}">
					<input type="button" class="ddd" value="。。。"/>
				</c:if>
				</td>
			</tr>
		</c:forEach>
			<tr class="tb_but">
				
			</tr>
    </table>
    </div>
	<nav class="pageDIV" id="page_some">
		 <ul	class="pagination">
			<li <c:if test="${!page.hasPreviouse}">class="disabled"</c:if>>
				<a href="?page.start=0&page.count=10">
					<span>«</span>
				</a>
			</li>
			<li <c:if test="${!page.hasPreviouse}">class="disabled"</c:if>>
				<a href="?page.start=${page.start-10 }&page.count=10">
					<span>‹</span>
				</a>
			</li>
			<c:forEach begin="0" end="${page.totalPage-1 }" varStatus="status">
				<c:if test="${status.count*page.count-page.start<=50 && 
				status.count*page.count-page.start>=-30 }">
					<li <c:if test="${status.index*page.count==page.start }"> class="disabled"</c:if>>
						<a href="?page.start=${status.index*page.count }&page.count=10"
						>${status.count }</a>
					</li>
				</c:if>
			</c:forEach>
			
			<li <c:if test="${!page.hasNext}">class="disabled"</c:if>>
				<a href="?page.start=${page.start+page.count}&page.count=10">
				<span>›</span>
				</a>
			</li>
			<li <c:if test="${page.start==(page.totalPage-1)*10}">class="disabled"</c:if>>
				<a href="?page.start=${(page.totalPage-1)*10}&page.count=10">
					<span>»</span>
				</a>
			</li>
		</ul>
	</nav>
	</c:if>
	</div>

</div></div>


<div id="footer">
	<div>
		<span>增值电信业务经营许可证:xxxxxxxx</span>  
		<span>市场名称登记证:工商网市字8888888号</span>
		<span>出版物网络交易平台服务经营备案证:*********</span><br/><br/>
		<span>最终解释权归大河有限公司所有</span>
		<span>© 2003-2020 DHALL.COM 版权所有</span>
	</div>
</div>

</body>
</html>