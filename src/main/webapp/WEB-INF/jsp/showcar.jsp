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
<style type="text/css">
	#body{
		height: 700px;
	}
	#sp_cart{
		position: relative;
		top: 5%;
		left: 5%;
		text-align: center;
	}
	#show #sp{
		height: 600px;
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
	#sp_cart .sel{
		width: 50px;
	}
	.img{
		width: 100px;
	}
	.img img{
		width: 100px;
		height: 60px;
	}
	.stk{
		width: 200px;
	}
	.stk span{
		display: none;
	}
	.stk input{
		
		height: 30px;
		border: none;
	} 
	.sname{
		width: 180px;
	}
	.sbrd,.sctg{
		width: 120px;
	}
	.sitd{
		width: 500px;
	}
	.sprc{
		width: 100px;
	}
	.tb_but input{
		border: none;
		background-color: #FFFFCC;
		height: 40px;
		width: 100px;
	}
	#s_all{
		height: 20px;
		width: 5px;
	}
	.tb_but input:HOVER {
		color: #FFF;
		background-color: #FF3366;
	}
	#getall{
		left: -20%;
		position: relative;
	}
</style>
<script type="text/javascript">
	$(function(){
		var dui="✅";
		var cuo="❌"
		//全选
		$('#s_all').click(function(){
			$('.sel input:checkbox').prop("checked",this.checked); 
			$('#getall').click();
			var flage = $(this).is(":checked");
			if(flage){
				$('.stk input').blur();	
			}else{
				$('.stk span').hide();
			}
		});
		
		//选择
		$('.sel input').click(function(){
			$('#getall').click();
			var flage = $(this).is(":checked");
			if(flage){
				$(this).parent().parent().find('.stk input').blur();	
			}else{
				$(this).parent().parent().find('.stk span').hide();
			}
			
		});
		
		//删除所选的商品
		$('#dlt').click(function(){
			var carid=$.session.get("user_id");
			var pros_id=new Array();
			//获取所有被选中的checkbox的值
			$('.sel input:checked').each(function(){
				pros_id.push($(this).val());
			});
			if(pros_id!=null&&pros_id!=""){
				$(location).attr('href',"${pageContext.request.contextPath}/product/deletecars.action?products_id="+pros_id+"&car_id="+carid);
			}else{
				alert("请选择要删除的商品");
			}
		});
		
		//判断输入数量合法性
		$('.stk input').blur(function(){
			var stock=$(this).val();
	        var $stk = $(this);
			var pro_id=$(this).parent().parent().find("[name='products_id']").val();
			console.log(pro_id);
			var regex_num=/^\d+$/;
			if(stock==null||stock==""||stock==0){
				$(this).val(1);
				return;
			}
			if(regex_num.test(stock)){
				$.post("${pageContext.request.contextPath}/product/shopbyid.action",{id:pro_id},function(date){
					if(date<stock){
						alert("库存没有这么多,只有"+date+"!");
						$stk.parent().find("[class='ssp']").text(cuo).css({'color':"red",'font-size':'12px'});						
						$stk.parent().find("[class='ssp']").show();
						$stk.val('1');
						$('#getall').click();
						return;
					}else{
						$stk.parent().find("[class='ssp']").text(dui).css({'color':"green",'font-size':'12px'});
						$stk.parent().find("[class='ssp']").show();
					}
				},"json");
			}else{
				alert("请输入正确的数量!");
				$(this).val('1');
				return;
			}
			
			var pros_id=new Array();
			//获取所有被选中的checkbox的值
			$('.sel input:checked').each(function(){
				pros_id.push($(this).val());
			});
			for(var i=0;i<pros_id.length;i++){
				if(pros_id[i]==pro_id){
					$('#getall').click();
				}
			}
			
		});
		
		//获取所选商品的总价格
		$('#getall').click(function(){
			var s_stk=new Array();
			var s_price=new Array();
			var sum=0;
			$('.sel input:checked').each(function(){
				s_stk.push($(this).parent().parent().find("[class='iptstk']").val());
				s_price.push($(this).parent().parent().find("[class='sprc']").text());
			});
			for(var i=0;i<s_stk.length;i++){
				sum+=s_stk[i]*s_price[i];
			}
			$(this).parent().children('span').text(sum);
		});
		
		//结账
		$('#pay').click(function(){
			var pros_id=new Array();
			var stocks=new Array();
			var sp_list=new Array();
			//获取所有被选中的checkbox的值和输入的数量
			$('.sel input:checked').each(function(){
				pros_id.push($(this).val());
				stocks.push($(this).parent().parent().find('.iptstk').val())
				sp_list.push($(this).parent().parent().find('.ssp').text());
			});

			for(var x=0;x<sp_list.length;x++){
				if(sp_list[x]!=dui){
					alert("商品库存不足!")
					return;
				}
			}
			var userid=$.session.get("user_id");
			var aprice=$('#getall').parent().children('span').text()
			if(pros_id.length>0 && aprice!=null &&aprice!=""){
				$.post("${pageContext.request.contextPath}/user/selectaddress.action",{id:userid},function(date){
					console.log(date);
					console.log(date.userExsit);
					if(date){
						$(location).attr('href',"${pageContext.request.contextPath}/product/pay.action?products_id="+pros_id+"&stocks="+stocks+"&id="+userid);
					}else{
						alert("请填写收货地址!");
						return;
					}
				});
			}else{
				alert("请选择需要结账的商品");
				return;
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
	<c:if test="${splist.size()==0}">
		<span class="none">购物车空空如也!</span>
	</c:if>
	<c:if test="${splist.size()!=0}">
	<div id="sp">
	<table id="sp_cart">
		<tr>
			<td class="sel">选择</td>
			<td class="img">图片</td>
			<td class="sname">商品名</td>
			<td class="sctg">类别</td>
			<td class="sbrd">品牌</td>
			<td class="sitd">配置</td>
			<td class="sprc">价格(元)</td>
			<td class="stk">数量</td>
		</tr>
		<c:forEach items="${splist}" var="spcar">
			<tr>
				<td class="sel"><input type="checkbox" name="products_id" value="${spcar.product_id }"></td>
				<td class="img"><img src="/pic/${spcar.product_img }" id="pd_p"/></td>
				<td class="sname">${spcar.product_name }</td>
				<td class="sctg">${spcar.product_category }</td>
				<td class="sbrd">${spcar.product_brand }</td>
				<td class="sitd">${spcar.product_itd }</td>
				<td class="sprc">${spcar.product_price }</td>
				<td class="stk"><input type="text" class="iptstk" value="${spcar.product_stock }"/><span class="ssp">s</span></td>
			</tr>
		</c:forEach>
			<tr class="tb_but">
				<td><input type="checkbox" name="all" id="s_all"/><br/>全选</td>
				<td colspan="2"><input type="button" value="删除" id="dlt"/></td>
				<td colspan="3"><input type="button" value="总计" id="getall"/><span></span>(元)</td>
				<td colspan="2"><input type="button" value="支付" id="pay"/></td>
			</tr>
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