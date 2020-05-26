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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/index.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquerySession.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/index.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/href.js"></script>
<style type="text/css">
	#body{
		height: 700px;
	}
	
	#show #sp{
		height: 520px;
	}
	#sp_cart{
		position: relative;
		top: 5%;
		
		text-align: center;
	}
	.pageDIV{
		margin-top: 20px;
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
	.tb_but input{
		border: none;
		background-color: #FFFFCC;
		height: 40px;
		width: 100px;
	}
	
	.tb_but input:HOVER {
		color: #FFF;
		background-color: #FF3366;
	}
	
	.cz input{
		border: none;
		width: 80px;
		height: 35px;
	}
	.canel{
		background-color: #99CCCC;
	}
	.comple{
		background-color: #FFFF77;
	}
	.retun{
		background-color: #CCBBFF;
	}
	.canel:hover{
		background-color: #FF3333;
		color: #FFF;
	}
	.comple:HOVER {
		background-color: #FF3333;
		color: #fff;
	}
	.retun:hover{
		background-color: #000000;
		color: #fff;
	}
</style>
<script type="text/javascript">
	$(function(){
		//确认收货
		$('.comple').click(function(){
			var id=$(this).parent().parent().find('.oid').text();
			var status=$(this).parent().parent().find('.status').text();
			if(status=="未发货"){
				alert("商品暂未发货");
				return;
			}else if(status=="已发货"){
				Href=window.location.href;	
				var href=$.href.showWindowHref(Href);
				if(href['page.start']!=null && href['page.start']!=""){
					$(location).attr('href',"${pageContext.request.contextPath}/order/comple_order.action?o_id="+id+"&start="+href['page.start']);
				}else{
					$(location).attr('href',"${pageContext.request.contextPath}/order/comple_order.action?o_id="+id+"&start="+0);
				}
			}
		});
		
		//退货
		$('.retun').click(function(){
			var id=$(this).parent().parent().find('.oid').text();
			var status=$(this).parent().parent().find('.status').text();
			if(status=="已完成"){
				alert("订单已完成，无法退货");
			}else if(status=="申请退货"){
				alert("退货申请正在处理中，请勿重复申请");
			}else{
				Href=window.location.href;	
				var href=$.href.showWindowHref(Href);	
				
				if(href['page.start']!=null && href['page.start']!=""){
					$(location).attr('href',"${pageContext.request.contextPath}/order/retun_order.action?o_id="+id+"&start="+href['page.start']);
				}else{
					$(location).attr('href',"${pageContext.request.contextPath}/order/retun_order.action?o_id="+id+"&start="+0);
				}
			}
		});
		
		//取消退货，卖家重新发货
		$('.canel').click(function(){
			var id=$(this).parent().parent().find('.oid').text();
			var status=$(this).parent().parent().find('.status').text();
			
			Href=window.location.href;	
			var href=$.href.showWindowHref(Href);	
			if(href['page.start']!=null && href['page.start']!=""){
				$(location).attr('href',"${pageContext.request.contextPath}/order/retun_canel.action?o_id="+id+"&start="+href['page.start']);
			}else{
				$(location).attr('href',"${pageContext.request.contextPath}/order/retun_canel.action?o_id="+id+"&start="+0);
			}
		});
	});
</script>
</head>
<body>
<div id="top">
<label>欢迎来到大河网上电脑城</label>


<span id="l_user">
</span>
<span id="u_esc">
	<a href="javascript:void(0)" id="esc">退出</a>
	<input type="button" id="m-info"value="信息管理" />
</span>

<span id="login">
	<a href="javascript:void(0)" id="u_login">登陆</a>
</span>
<span id="regit">
	<a href="javascript:void(0)" class="j_btnregit">注册</a>
</span>
</div>
<div id="menu">
	<input type="button" id="index"value="首页" />
	<input type="text" id="putseh" placeholder="搜索 笔记本/配件" />
    <input type="button" id="putbut" value="搜索" />
    <input type="button" id="m-car"value="购物车" />
    <input type="button" id="m-order"value="订单" />
</div>
<div id="body">
<div id="show">
	<c:if test="${orderlist.size()==0}">
		<span class="none">订单空空如也!</span>
	</c:if>
	<c:if test="${orderlist.size()!=0}">
	<div id="sp">
	
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
				<td class="oid">${order.order_id }</td>
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
				<c:if test="${order.product_status=='已发货'or order.product_status=='未发货' }">
					<input type="button" class="comple" value="确认收货"/>
					<input type="button" class="retun" value="退货"/>
				</c:if>
				<c:if test="${order.product_status=='申请退货' }">
					<input type="button" class="retun" value="退货"/>
					<input type="button" class="canel" value="取消"/>
				</c:if>	
				<c:if test="${order.product_status=='已完成' }">
					<input type="button" class="ding" value="。。。"/>
					<input type="button" class="ding" value="。。。"/>
				</c:if>	
				</td>
			</tr>
		</c:forEach>			
	</table>
	
	</div>
	<nav class="pageDIV" id="page_some">
		 <ul	class="pagination">
			<li <c:if test="${!page.hasPreviouse}">class="disabled"</c:if>>
				<a href="?page.start=0&page.count=7">
					<span>«</span>
				</a>
			</li>
			<li <c:if test="${!page.hasPreviouse}">class="disabled"</c:if>>
				<a href="?page.start=${page.start-7 }&page.count=7">
					<span>‹</span>
				</a>
			</li>
			<c:forEach begin="0" end="${page.totalPage-1 }" varStatus="status">
				<c:if test="${status.count*page.count-page.start<=35 && 
				status.count*page.count-page.start>=-21 }">
					<li <c:if test="${status.index*page.count==page.start }"> class="disabled"</c:if>>
						<a href="?page.start=${status.index*page.count }&page.count=7"
						>${status.count }</a>
					</li>
				</c:if>
			</c:forEach>
			
			<li <c:if test="${!page.hasNext}">class="disabled"</c:if>>
				<a href="?page.start=${page.start+page.count}&page.count=7">
				<span>›</span>
				</a>
			</li>
			<li <c:if test="${page.start==(page.totalPage-1)*7}">class="disabled"</c:if>>
				<a href="?page.start=${(page.totalPage-1)*7}&page.count=7">
					<span>»</span>
				</a>
			</li>
		</ul>
	</nav>
	</c:if>
	</div>
	
</div>



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