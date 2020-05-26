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
    <input type="button" id="m-car" value="购物车" />
    <input type="button" id="m-order" value="订单" />
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
	<div id="sp">
		<div id="show-tb">
			<c:forEach items="${productlist}" var="item">
				<ul	class="sp-ul">
					<li class="sp-img"><img src="/pic/${item.product_img }" id="pd_p" width=120 height=80/></li>
					<li class="sp-a"><a href="javascript:void(0)">${item.product_name}</a></li>
				</ul>
			</c:forEach>
		</div>
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
				<c:if test="${status.count*page.count-page.start<=30 && 
				status.count*page.count-page.start>=-20 }">
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
					<span>»+1</span>
				</a>
			</li>
		</ul>
	</nav>
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
		<a href="${pageContext.request.contextPath }/gomg.action" class="manager">管理员登陆</a>
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