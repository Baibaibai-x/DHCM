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
	.fh{
		position:relative;
		float: left;
		left: 1%;
		margin: 10px 0 0 0;
		font-size: 18px;
	}
	#show img{
		border:inset #FFEE99 5px;
		position: relative;
		left: -8%;
		float: left;
		width: 600px;
		height: 450px;
		margin: 20px 0 0 0;
	}
	#pro_tab{
		position:relative;
		left:-3%;
		border: solid 1px;
		width: 400px;
		margin-top: 3%;
		text-align: center;
	}
	#pro_tab tr{
		width:400px; 
		border:solid 1px;
		height: 50px;
	}
	#pro_tab .bm{
		width: 80px;
		border: solid 1px;
	}
	#pro_tab .pro{
	
	}
	#add_car{
		border:none;
		background-color: #FFC8B4;
		width: 100px;
		height: 40px;
		color: #fff;
	}
	#add_car:HOVER {
		background-color: #E63F00;
		color: #FFFFBB;
	}
</style>
<script type="text/javascript">
	$(function(){
		$('#add_car').click(function(){
			var id=$.session.get("user_id");
			if(id==null||id==""){
				alert("请登陆");
				$(location).attr('href',"/DHCM/loginindex.action");
				return;
			}
			var pro_id=$('#proid').val();
			var pro=new Array();
			$('.pro').each(function(){
				pro.push($(this).text());
			});
			var pro_name=pro[0];
			var pro_category=pro[1];
			var pro_brand=pro[2];
			var pro_price=pro[4];
			var pro_itd=pro[5];
			var pro_img=$('#pd_p').val();
			
			//判断是否已加入购物车
			 $.post("${pageContext.request.contextPath}/product/selectcar.action",{id:id,product_id:pro_id},function(date){
				if(date.productExsit==true){
					alert("此商品已加入购物车,请勿重复加入!");
					return false;
				}else{
					$.post("${pageContext.request.contextPath}/product/insertcar.action",
							{id:id,product_id:pro_id,product_name:pro_name,product_category:pro_category,product_img:pro_img,
							product_price:pro_price,product_itd:pro_itd,product_brand:pro_brand},function(productExsit){
								if(productExsit){
									alert("加入成功");
									return;
								}
					},"json");	 
				}
			},"json"); 
			 
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
<div id="b-left">
<div id="tab">
    
   	<div class="t-pc">
       	<a href="javascript:void(0)">电脑整机</a>
       	<ul id="pc">
       	<c:forEach items="${pclist }" var="item">
           	<li><a href="javascript:void(0)">${item.product_category}</a></li>    
 		</c:forEach>
           </ul>  
        </div>
       
       <div class="t-ca">
       	<a href="javascript:void(0)" >配件</a>
       	<ul id="ca">
          	<c:forEach items="${calist }" var="item1">
           	<li><a href="javascript:void(0)">${item1.product_category}</a></li>
       		</c:forEach>
        </ul>  
       </div>
    
                
          
        
    </div>
</div>

<div id="b-right">
	<div id="show">
		<input type="text" id="proid" value="${product.id }" style="display: none;"/> 
		<input type="text" id="pd_p" value="${product.product_img }" style="display: none;"/> 
		<a class="fh" href="javascript:history.back(-1)">返回</a>
		<br>
		<img src="/pic/${product.product_img }"  width=120 height=80/>
		<table id="pro_tab">
			<tr>
				<td class="bm">商品名</td>
				<td class="pro">${product.product_name }</td>
			</tr>
			<tr>
				<td class="bm">类别</td>
				<td class="pro">${product.product_category }</td>
			</tr>
			<tr>
				<td class="bm">品牌</td>
				<td class="pro">${product.product_brand }</td>
			</tr>
			<tr>
				<td class="bm">库存</td>
				<td class="pro">${product.product_stock }</td>
			</tr>
			<tr>
				<td class="bm">价格(元)</td>
				<td class="pro">${product.product_price }</td>
			</tr>
			<tr>
				<td class="bm">介绍/配置</td>
				<td class="pro">${product.product_itd }</td>
			</tr>
			<tr>
				<td class="bm">发布日期</td>
				<td class="pro"><fmt:formatDate value="${product.product_date }" pattern="yyyy-MM-dd"/></td>
			</tr>
			<tr>
				<td colspan="2"><input type="button" id="add_car" value="加入购物车"/></td>
			</tr>
		</table>
	</div>
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
<!-- 遮罩层 -->
<div id="j_mask" class="mask"></div>
<!--添加数据的表单-->
<div id="j_formlogin" class="form-login">
	<div class="form-login-title">
    	<span>用户登陆</span>
        <div id="j_hideFormLogin">x</div>
    </div>
    <div class="form-item">
    	<label class="lb" for="j_txtLesson">账号:</label>
        <input class="txt" name="username" id="j_username" placeholder="请输入账号" />
    </div>
    <div class="form-item">
    	<label class="lb" for="j_txtBelSch">密码:</label>
        <input class="txt" name="password" type="password" id="j_password" placeholder="请输入密码" />
    </div>
    <div class="form-submit">
    	<input type="reset" value="清空" id="j_btnreset"/>
    	<input type="button" value="登陆" id="j_btnlogin"/>
    	<input type="button" value="注册" class="j_btnregit">
    </div>
</div>


</body>
</html>