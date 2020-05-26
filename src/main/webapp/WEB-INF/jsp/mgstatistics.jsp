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
		width:20%;
		height:900px;
		
	}
	#b-right{
		float:left;
		width:78%;
		height:900px;
		margin-left: 10px;
	}
	#show{
		position: relative;
		margin-top:20px;
		
		text-align: center;
		min-width: 920px;
	}
	.sp_cart{
		position: relative;
		left:10%;
		top: 5%;
		text-align: center;
	}
	.sp_cart tr{
		height: 66px;
		border: solid 1px;
	}
	td{
		border: solid 1px;
	}
	.img{
		width: 120px;
	}
	
	.img img{
		width: 120px;
		height: 66px;
	}
	.pdname{
		width: 180px;
	}
	.rec,.stk,.sctg{
		width: 80px;
	}
	.pay,.sprc{
		width: 110px;
	}
	.total{
		width: 120px;
	}
	.alldate{
		font-size: 22px;
		position: relative;
		left: -15%;
	}
	.alldate span{
		margin-right: 20px;
		color: #FFCC33;
	}
	#u_tab span{
		margin-right: 20px;
		font-size: 16px;
		position: relative;
		left: -22%;
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
	#cate_sale,#prod_sale,#profit,#loss,#suggestion{
		position: relative;
		left: 28%;
		width: 100px;
		height: 35px;
		top: 16%;
		border: none;
		background-color: #99FFFF;
		margin-bottom: 2%;
	}
	#profit:hover,#prod_sale:hover,#cate_sale:hover,#loss:hover,#suggestion:hover{
		background-color: #FFC0CB;
		color: #FFF;
	}

</style>
<script type="text/javascript">
	$(function(){
		//搜索商品
		$('#putpdbut').click(function(){
			var pd_name=$('#putpd').val();
			$(location).attr('href',"${pageContext.request.contextPath }/manager/statistics.action?product_name="+pd_name+"&tc="+"pd_name");
		});
		
		//按商品销售
		$('#prod_sale').click(function(){
			$('#mg_statistics').click();
		});
		
		//按类别销售
		$('#cate_sale').click(function(){			
			$(location).attr('href',"${pageContext.request.contextPath }/manager/statistics.action?product_category="+"category"+"&tc="+"pd_category");
		});
		
		//查看盈利商品
		$('#profit').click(function(){
			$(location).attr('href',"${pageContext.request.contextPath }/manager/statistics.action?total_price="+1+"&tc="+"t_price");
		});
		
		//查看亏损商品
		$('#loss').click(function(){
			$(location).attr('href',"${pageContext.request.contextPath }/manager/statistics.action?total_price="+-1+"&tc="+"t_price");
		});
		
		//销售建议
		$('#suggestion').click(function(){
			$(location).attr('href',"${pageContext.request.contextPath }/manager/suggestion_sales.action");
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
	<input type="text" id="putpd" placeholder="搜索 商品名/品牌" />
    <input type="button" id="putpdbut" value="搜索" />
 
  	<div id="b-left">
  	<input type="button" id="cate_sale" value="类别销售"/><br/>
   	<input type="button" id="prod_sale" value="商品销售"><br/>
    <input type="button" id="profit" value="盈利商品"/><br/>
    <input type="button" id="loss" value="亏损商品"/><br/>
    <input type="button" id="suggestion" value="销售建议"/>
</div>
<div id="b-right">
<div id="show">
	<div class="alldate">
		收入(元):<span>${alltotal.ord_price }</span>
		支出(元):<span>${alltotal.rec_price }</span>
		总收入(元):<span>${alltotal.total_price }</span><br/>
	</div>
	<br/>
	<c:if test="${sugList.size()!=0 && totalList==null}">
		 <div id="u_tab">
		 <span>总收入前三的商品如下(建议主售如下商品，加大宣传力度):</span><br/>
	     <table class="sp_cart">
	    	<tr>
	    		<td class="img">图片</td>
				<td class="pdname">商品名</td>
				<td class="sctg">类别</td>
				<td class="stk">销售量</td>
				<td class="sprc">收入(元)</td>
				<td class="rec">入库量</td>
				<td class="pay">支出(元)</td>
				<td class="total">总收入(元)</td>
			</tr>
	    	<c:forEach items="${sugList}" var="sug">
				<tr>				
					<td class="img"><img src="/pic/${sug.product_img }" id="pd_p"/></td>
					<td class="pdname">${sug.product_name }</td>
					<td class="sctg">${sug.product_category }</td>
					<td class="stk">${sug.ord_stock }</td>
					<td class="sparc">${sug.ord_price }</td>
					<td class="rec">${sug.rec_stock }</td>
					<td class="pay">${sug.rec_price }</td>
					<td class="total">${sug.total_price }</td>		
				</tr>
			</c:forEach>	
			<tr style="height: 10px; border: none;">
			</tr>
			<tr>
				<td>收入最高的类别</td>
				<td>${firecate.product_category }</td>
				<td>收入</td>
				<td>${firecate.ord_price }</td>
				<td>支出</td>
				<td>${firecate.rec_price }</td>
				<td>总收入</td>
				<td>${firecate.total_price }</td>
			</tr>
	    </table>
	    
	    <br/>
	    <span>最低总收入前三的商品如下(建议减少如下商品宣传力度):</span><br/>
	     <table class="sp_cart">
	    	<tr>
	    		<td class="img">图片</td>
				<td class="pdname">商品名</td>
				<td class="sctg">类别</td>
				<td class="stk">销售量</td>
				<td class="sprc">收入(元)</td>
				<td class="rec">入库量</td>
				<td class="pay">支出(元)</td>
				<td class="total">总收入(元)</td>
			</tr>
	    	<c:forEach items="${lossList}" var="loss">
				<tr>				
					<td class="img"><img src="/pic/${loss.product_img }" id="pd_p"/></td>
					<td class="pdname">${loss.product_name }</td>
					<td class="sctg">${loss.product_category }</td>
					<td class="stk">${loss.ord_stock }</td>
					<td class="sparc">${loss.ord_price }</td>
					<td class="rec">${loss.rec_stock }</td>
					<td class="pay">${loss.rec_price }</td>
					<td class="total">${loss.total_price }</td>		
				</tr>
			</c:forEach>
			<tr style="height: 10px; border: none;">
			</tr>
			<tr>
				<td>收入最低的类别</td>
				<td>${losscate.product_category }</td>
				<td>收入</td>
				<td>${losscate.ord_price }</td>
				<td>支出</td>
				<td>${losscate.rec_price }</td>
				<td>总收入</td>
				<td>${losscate.total_price }</td>
			</tr>	
	    </table>
	   
 		</div>
	</c:if>
	<c:if test="${totalList.size()==0 && sugList.size()==0}">
	<span class="none">销售数据空空如也!</span>
	</c:if>
	<c:if test="${totalList.size()!=0 && sugList==null}">
    <div id="u_tab">
    <table class="sp_cart">
    	<tr>
    	<c:if test="${totalList.get(0).product_name !=null && totalList.get(0).product_name!=''}">
    		<td class="img">图片</td>
			<td class="pdname">商品名</td>
    	</c:if>
			<td class="sctg">类别</td>
			<td class="stk">销售量</td>
			<td class="sprc">收入(元)</td>
			<td class="rec">入库量</td>
			<td class="pay">支出(元)</td>
			<td class="total">总收入(元)</td>
		</tr>
    	<c:forEach items="${totalList}" var="total">
			<tr>
			<c:if test="${total.product_name!=null &&total.product_name!='' }">
				<td class="img"><img src="/pic/${total.product_img }" id="pd_p"/></td>
				<td class="pdname">${total.product_name }</td>
			</c:if>
				
				<td class="sctg">${total.product_category }</td>
				<td class="stk">${total.ord_stock }</td>
				<td class="sparc">${total.ord_price }</td>
				<td class="rec">${total.rec_stock }</td>
				<td class="pay">${total.rec_price }</td>
				<td class="total">${total.total_price }</td>		
			</tr>
		</c:forEach>
		
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