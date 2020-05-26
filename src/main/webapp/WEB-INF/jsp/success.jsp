<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>操作成功</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/pub.css"/>
<style type="text/css">
	#top{
		height:100px;
		background-color: #FFF;
		border-bottom:ridge 10px; 
		border-color: #FFFFFF #6c6c6c;
		
	}
	#top h1{
		float: left;
		position:relative;	
		left: 20%;
		font-size:80px;
		color:green;
	}
	#top h2{
		font-family: "宋体";
		color: #F80000;
		float: left;
		position:relative;
		left: 20%;
		top:57px;
		font-size:30px;
		color:red;
	}
	#top span{
		position: relative;
		left: 50%;
		font-size: 16px;
		opacity:0.5;
		top: 50px;
	}
	body {
		background-color: #eaeaea;	
	}
	.as_register{
		position:absolute;
		top:50%;
		left:50%;
		margin-left:-454px;
		margin-top:-171px;
	    z-index: 10;
	    width: 818px;
	    height: auto;
	    
	    background: #ffffff; 
	}
	img{
		border:#FFF double 1px;
		width:816px;
		height:408px;
	}	
</style>
</head>
<body>
<div id="top">
<h1>✔</h1>
<h2>操作成功</h2>
<span>
欢迎来到大河商城
<a href="${pageContext.request.contextPath }/loginindex.action">去登陆</a>
</span>
</div>
<div id="body">
<div class="as_register">
<img src="${pageContext.request.contextPath }/img/login.png"/>
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