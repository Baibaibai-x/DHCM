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
		height: 650px;
	}
	#putpd{
		width:300px;
		height:30px;
		top:8px;		
		position:relative;
		left:25%;
	}
	#putpdbut{
		font-size:16px;
		width:80px;
		height:35px;
		top:10px;
		left:25%;
		position:relative;
		color:#FFF;
		background-color:#F00;
		border:#FFF;
	}
	.completed,.undone{
		width:80px;
		height:35px;
		top:10px;
		left:28%;
		position:relative;
		background-color:#FFDDAA;
		border:none;
	}
	.completed:hover,.undone:hover{
		background-color:#EEEE00;
		color: #FFF;
	}
	
	#u_tab{
		position: relative;
		top: 5%;	
	}
	table{
		position:relative;
		left:10%;
		text-align: center;
	}
	table tr{
		height: 60px;
	}
	table td{
		border:solid 1px;
		width: 90px;
	}
	.re_img{
		width: 100px;
	}
	.re_img img{
		width: 100px;
		height: 60px;
	}
	.pd_name{
		width: 200px;
	}
	#page_some{
		position: relative;
		top:8%;	
		left: 42%
	}
	.cz{
		width: 170px;
	}
	.cz input{
		height: 35px;
		width: 80px;
		border: none;
		
	}
	.d_re,.a_re{
		background-color: #FFDDAA;
	}
	.d_re:HOVER {
		background-color: #00CCCC;
		color: #CCFF33;
	}
	.a_re:hover{
		background-color: #FF7744;
		color: #FFf;
	}
	.none{
		top:15%;
		left: 5%;
	}
</style>
<script type="text/javascript">
	$(function(){
		
		//退货,删除入库单
		$('.d_re').click(function(){
			var id=$(this).parent().parent().find('.re_id').text();
			$(location).attr('href',"${pageContext.request.contextPath }/manager/delete_receipt.action?receipt_id="+id);
			
		});
		
		//同意,商品库存增加
		$('.a_re').click(function(){
			var id=$(this).parent().parent().find('.re_id').text();
			var stock=$(this).parent().parent().find('.re_stock').text();
			var p_id=$(this).parent().parent().find('.pd_id').text();
			var all_price=$(this).parent().parent().find('.allprice').text();
			Href=window.location.href;	
			var href=$.href.showWindowHref(Href);	
			if(href['page.start']!=null && href['page.start']!=""){
				$(location).attr('href',"${pageContext.request.contextPath }/manager/agree_receipt.action?receipt_id="+id+"&product_id="+p_id+"&receipt_stock="+stock+"&allprice="+all_price+"&start="+href['page.start']);
			}else{
				$(location).attr('href',"${pageContext.request.contextPath }/manager/agree_receipt.action?receipt_id="+id+"&product_id="+p_id+"&receipt_stock="+stock+"&allprice="+all_price+"&start="+0);
			}
		});
		
		//查看已完成的入库单
		$('.completed').click(function(){
			var status="已完成"
			$(location).attr('href',"${pageContext.request.contextPath }/manager/show_receipt.action?status="+status+"&rj="+"nc");
		});
		
		//查看未完成的入库单
		$('.undone').click(function(){
			var status="准备入库"
			$(location).attr('href',"${pageContext.request.contextPath }/manager/show_receipt.action?status="+status+"&rj="+"nc");
		});
		
		//搜索商品入库单
		$('#putpdbut').click(function(){
			var p_name=$('#putpd').val();
			$(location).attr('href',"${pageContext.request.contextPath }/manager/show_receipt.action?product_name="+p_name+"&rj="+"pc");
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

	<input type="text" id="putpd" placeholder="搜索 商品名" />
    <input type="button" id="putpdbut" value="搜索" />
	<input type="button" class="completed" value="已完成">
	<input type="button" class="undone" value="未完成">
	
   	<c:if test="${recelist.size()==0}">
		<span class="none">入库单空空如也!</span>
	</c:if>
	<c:if test="${recelist.size()!=0}">
    <div id="u_tab">
   
    <table>
    	<tr>
    		<td class="re_id">入库单id</td>
    		<td class="pd_id">商品id</td>
    		<td class="pd_name">商品名</td>
    		<td class="pd_cate">商品类别</td>
    		<td class="re_img">图片</td>
    		<td class="re_stock">数量</td>
    		<td class="re_price">单价</td>
    		<td class="allprice">总价</td>
    		<td class="re_date">日期</td>	
    		<td class="re_status">日期</td>	
    		<td class="cz">操作</td>
    	</tr>
    	<c:forEach items="${recelist }" var="relist">
    		<tr>
    			<td class="re_id">${relist.receipt_id }</td>
	    		<td class="pd_id">${relist.product_id}</td>
	    		<td class="pd_name">${relist.product_name }</td>
	    		<td class="pd_cate">${relist.product_category }</td>
    			<td class="re_img"><img src="/pic/${relist.receipt_img }" id="pd_p"/></td>
	    		<td class="re_stock">${relist.receipt_stock }</td>
	    		<td class="re_price">${relist.receipt_price }</td>
	    		<td class="allprice">${relist.allprice }</td>
	    		<td class="re_date"><fmt:formatDate value="${relist.receipt_date }" pattern="yyyy-MM-dd"/></td>	
	    		<td class="re_status">${relist.status }</td>	
	    		<td class="cz">
	    		<c:if test="${relist.status=='准备入库' }">
	    			<input type="button" class="a_re" value="同意" />
	    			<input type="button" class="d_re" value="退货" />
	    		</c:if>
	    		<c:if test="${relist.status!='准备入库' }">
	    			<input type="button" class="dd" value="..." />
	    			<input type="button" class="dd" value="..." />
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