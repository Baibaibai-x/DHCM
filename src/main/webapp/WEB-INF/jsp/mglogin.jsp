<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE  "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员登陆</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquerySession.js"></script>
<style type="text/css">
	body{
		background-image: url("./img/dl1.jpg");
		background-size: cover;
		text-align: center;
	}
	#mglogin{
		position: absolute;
		top: 35%;
		left: 38%;
		background-image: none;
		background-color: #f0f0f0;
	
	}
	table {
		
		border: solid 1px;
		font-size: 18px;
	}
	table tr{
		height: 50px;
	}
	table td{
		text-align:center;
		width: 80px;
		border: solid 1px;
	}
	.ipt input{
		height: 40px;
		width: 200px;
	}
	.btn input{
		width: 60px;
		height: 35px;
		margin: 0 13px;
		background-color: #789ccc;
	}
	.btn input:HOVER {
		background-color: #FF3333; 
		color: #FFF;	
	}
</style>
<script type="text/javascript">
	$(function(){
		//重置
		$('#reset').click(function(){
			$('.ipt input').val('');
		});
		
		//登陆
		$('#log').click(function(){
			var id=$('#id').val();
			var password=$('#password').val();
			if(id==null ||id==""){
				alert("请输入账号!!");
				return;
			}else if(password==null || password==""){
				alert("请输入密码!!");
			}else{
				$.post("${pageContext.request.contextPath}/manager/mglog.action",{mg_id:id,mg_password:password},function(date){
					if(date.status){
						if(date.mg_status=="封禁"){
							alert("此账号已被封禁!!");
							$('#id').val("");
							$('#password').val("");
						}else{
							$.session.set("mgid",date.mg_id);
							$.session.set("level",date.mg_level);
							$(location).attr('href',"${pageContext.request.contextPath}/manager/mgindex.action");
						}
					}else{
						alert("输入信息有误,登陆失败!");
						$('#id').val("");
						$('#password').val("");
					}
				},"json")
			}
		});
		
		//首页
		$('#idx').click(function(){
			$(location).attr('href',"${pageContext.request.contextPath}/loginindex.action");
		});
	});
</script>
</head>
<body>
<h1>欢迎来到大河电脑商城后台管理系统</h1>
<div id="mglogin">


<table>
	<tr>
		<td>账号:</td>
		<td class="ipt"><input type="text" name="mg_id" id="id" placeholder="请输入账号"/></td>
	</tr>
	<tr>
		<td>密码:</td>
		<td class="ipt"><input type="password" name="mg_password" id="password" placeholder="请输入密码"/></td>
	</tr>
	<tr>
		<td colspan="2" class="btn"><input type="button" id="reset" value="重置"/><input type="button" id="log" value="登陆"/>
		<input type="button" id="idx" value="首页"/>
		</td>
	</tr>
</table>
</div>		
</body>
</html>