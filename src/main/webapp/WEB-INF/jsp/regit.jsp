<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE  "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>这是注册页面</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/pub.css"/>
<style type="text/css">
	#top{
		height:100px;
		background-color: #FFF;
		border-bottom:ridge 10px; 
		border-color: #FFFFFF #6c6c6c;
	}
	#top h1{
		font-family: "宋体";
		color: #F80000;
		float: left;
		position:relative;
		top: 20px;
		left: 20%;
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
		left:46%;
		margin-left:-354px;
		margin-top:-171px;
	    z-index: 10;
	    width: 818px;
	    height: auto;
	    padding: 60px 0;
	    background: #ffffff; 
	}
	.form-user input{
		border-color: #dbdbdb;
		font-size: 14px;
		color: #666666;
		font-family: "Microsoft Yahei";
		box-shadow: none;
		padding: 7px 0;
		margin-bottom:10px;
    	vertical-align: top;
    	line-height: normal;
    	position: relative;
    	width:400px;
    	left: 25%;
	}
	.form-user span {	    
		display:none;
		font-family:"Microsoft Yahei";
		font-size:9px;
		top:4px;
	    position: relative;
   	 	padding: 0 0 0 5px;
    	left: 25%;  	
	}
	.form-rd{
		border-color: #dbdbdb;
		font-size: 18px;
		color: #666666;
		font-family: "Microsoft Yahei";
		box-shadow: none;
		margin-bottom:10px;
    	vertical-align: top;
    	line-height: normal;
    	position: relative;
    	left: 25%;
	}
	.form-rd input{
		width:50px;
	}
	.form-submit #j_reset{
		margin-top:5px;
		font-size: 18px;
		font-family: "Microsoft Yahei";
		height:40px;
		width:150px;
		bottom:2px;
		position: relative;
		left: 25%;
		background-color: blue;
		border: none;
		color: #FFFFFF;
	}
	.form-submit .j_regit{
		font-family: "Microsoft Yahei";
		margin-top:5px;
		font-size: 18px;
		height:40px;
		width:240px;
		bottom:2px;
		position: relative;
		left: 25%;
		background-color : red;
		border: none;
		color: #FFFFFF;
	}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquerySession.js"></script>
<script type="text/javascript">
	$(function(){
		var dui="✅";
		var cuo="❌"
		var regex_username=/^[a-zA-Z][\w]{5,14}$/;
		var regex_password=/^[\x21-\x7eA-Za-z0-9]{7,16}$/;
		var regex_phone=/^1(3|4|5|7|8)\d{9}$/;
		//校验账号
		$('#l_username').blur(function(){
			var l_username=$('#l_username').val();
			if(l_username==null||l_username==""){
				$('#lg_username').text(cuo+"账号不能为空").css({'color':"red"});
				$('#lg_username').show();
				return false;
			}else{
				if(regex_username.test(l_username)){				
					$.post("${pageContext.request.contextPath }/user/user_username.action"
					,{username:l_username},function(userExsit){
						if(userExsit){
							$('#lg_username').text(cuo+"此账号已经存在").css({'color':"red"});
							$('#lg_username').show();
							return false;
						}else {
							$('#lg_username').text(dui).css({'color':"green",'font-size':'12px'});
							$('#lg_username').show();
							return true;
						}
					},'json');
				}else{
					$('#lg_username').text(cuo+"必须以字母开头,由'字母''_''数字'组成,长度在6~15").css({'color':"red"
						,'display':'inline-block'
						,'width':'200px'
						,'height':'25px'
						});
					$('#lg_username').show();
					return false;
				}
		
			}
		});
		
		//校验密码
		$('#l_password').blur(function(){
			var l_password=$('#l_password').val();
			var r_password=$('#r_password').val();
			if(l_password==null||l_password==""){
				$('#lg_password').text(cuo+"密码不能为空").css({'color':"red"});
				$('#lg_password').show();
				return false;
			}else{
				if(regex_password.test(l_password)){
					$('#lg_password').text(dui).css({'color':"green",'font-size':'12px'});
					$('#lg_password').show();
					console.log(r_password);
					if(r_password!=null&&r_password!=""){
						$('#r_password').blur();
					}
					return true;
				}else {
					$('#lg_password').text(cuo+"密码以字母、数字、特殊字符组成，至少7个字符，最多16个字符").css({'color':"red"
						,'display':'inline-block'
						,'width':'200px'
						,'height':'25px'
						});
					$('#lg_password').show();
					return false;  
				}
			}
		});
		
		//重复密码校验
		$('#r_password').blur(function(){
			var l_password=$('#l_password').val();
			var r_password=$('#r_password').val();
			if(r_password==null||r_password==""){
				$('#lg_repassword').text(cuo+"重复密码不能为空").css({'color':"red"});
				$('#lg_repassword').show();
				return false;
			}else{
				if(r_password==l_password){
					$('#lg_repassword').text(dui).css({'color':"green",'font-size':'12px'});
					$('#lg_repassword').show();
					return true;
				}else {
					$('#lg_repassword').text(cuo+"两次密码要一致").css({'color':"red"});
					$('#lg_repassword').show();
					return false;
				}
			}
		});
		
		//姓名校验
		$('#name').blur(function(){
			var name=$('#name').val();
			if(name==null||name==""){
				$('#lg_name').text(cuo+"姓名不能为空").css({'color':"red"});
				$('#lg_name').show();
				return false;
			}else{
				$('#lg_name').text(dui).css({'color':"green",'font-size':'12px'});
				$('#lg_name').show();
				return true;
			}
		});
		
		//手机号校验
		$('#l_phone').blur(function(){
			var l_phone=$('#l_phone').val();
			if(l_phone==null||l_phone==""){
				$('#lg_phone').text(cuo+"手机号不能为空").css({'color':"red"});
				$('#lg_phone').show();
				return false;
			}else{
				if(regex_phone.test(l_phone)){
					$('#lg_phone').text(dui).css({'color':"green",'font-size':'12px'});
					$('#lg_phone').show();
					return true;
				}else {
					$('#lg_phone').text(cuo+"手机号格式错误").css({'color':"red"});
					$('#lg_phone').show();
					return false;
				}
			}
		});
		
		//清空
		$('#j_reset').click(function(){
			$('.as_register span').hide();
		});
		
		//注册
		$('.j_regit').click(function(){
			var s_arr=new Array();
			var sp_arr=new Array();
			$('.form-user input').each(function(){
		           s_arr.push($(this).val());//将输入的信息添加至数组
		     });
			$('.form-user span').each(function(){
		           sp_arr.push($(this).text());//将校验的信息添加至数组
		     });
			for(var x=0;x<s_arr.length;x++){
				if(s_arr[x]==null||s_arr[x]==""){
					alert("请输入完整的信息!");
					return;
				}
			}
			for(var x=0;x<sp_arr.length;x++){
				if(sp_arr[x]!=dui){
					alert("请输入正确的信息!");
					return;
				}
			}
			$('#loginfile').submit();
		});
		
	});
</script>
</head>
<body>
<div id="top">
<h1>大河 欢迎注册</h1>
<span>
已有账号?
<a href="${pageContext.request.contextPath }/loginindex.action">去登陆</a>
</span>
</div>
<div id="body">
<div class="as_register">
<form action="${pageContext.request.contextPath }/user/user_insert.action" method="post" id="loginfile">
	<div class="form-user">
        <input class="txt" name="username" id="l_username" placeholder="请输入账号"/>
        <span id="lg_username"></span>
    </div>
    <div class="form-user">   	
        <input class="txt" name="password" type="password" id="l_password" placeholder="请输入密码" />
        <span id="lg_password"></span>
    </div>
    <div class="form-user">
        <input class="txt" name="r_password" type="password" id="r_password" placeholder="重复密码" />
        <span id="lg_repassword"></span>
    </div>
    <div class="form-user">
        <input class="txt" name="name" type="text" id="name" placeholder="姓名" />
        <span id="lg_name"></span>
    </div>
    <div class="form-user">
    	<input class="txt" name="phone" type="text" id="l_phone" placeholder="手机号" />
        <span id="lg_phone"></span>
    </div>
    <div class="form-rd">
    	<input type="radio" name="sex" value="男" checked="checked"/>男
    	<input type="radio" name="sex" value="女"/>女
    </div>
    <div class="form-submit">
    	<input type="reset" value="清空" id="j_reset"/>
    	<input type="button" value="注册" class="j_regit">
    </div>
</form>
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