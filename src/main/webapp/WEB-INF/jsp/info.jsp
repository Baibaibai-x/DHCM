<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE "http://www.w3.org/TR/html5/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>大河电脑城</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/page.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/pub.css"/>
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/index.css"/>
<!-- <link rel="stylesheet" href="http://www.jq22.com/jquery/bootstrap-3.3.4.css"/> -->
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquerySession.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/index.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/distpicker.data.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/distpicker.js"></script>

<style type="text/css">
#confirm_pwd,#confirm_adr,.x_pwd,.u_pwd,table td input,#up_user,#up_pwd,#up_adr{
	display: none;
}
#set{
	position: absolute;
	top:1%;
	left:26%;
}
#set input{
	width: 120px;
	height: 50px;
	border: none;
	background-color: #88ff88;
}
#set input:HOVER{
	background-color: #44dd44;
}
#userid{
	display: none;
}
#up{
	display: inline;
}
#user_div{
	position: absolute;
	top:50%;
	left:46%;
	margin-left:-414px;
	margin-top:-241px;
    z-index: 10;
    width: 918px;
    height: auto;
    padding: 60px 0;
    background-color: #E0E0E0; 
}
#user_info{
	position: relative;
	float:left;
	left:11%;
    width: 800px;
    height: auto;
    padding: 60px 0;
    background-color: #fff;
}
table td input{
	border: none;
	width: 450px;
}
#user_info td{
	height: 50px;
	text-align: center;
}
#err_user span{
	position:relative;
	top:0;
	left:5%;
	/* border:solid 1px; */
	text-align:center;
	width: 90px;
	height: 50px;
}
.err,.wu{
	width:auto;
	border-top:1px solid  #E0E0E0;
	background-color: #E0E0E0; 
	font-size: 12px;
	color: #E0E0E0; 
} 
.u_sr,.u_sex,.u_dz{
	width: 500px;
	border: #990000 solid 1px;
}
.r_sex{
	float:left;
	display: none;
}
.r_sex input{
	width: 45px;
}
.form-inline select{
	height: 40px;
}
.form-inline,#jt_address{
	display: none;
}
.wy,.us_pwd{
	width:200px;
	border: #990000 solid 1px;
}
#up,#up_pwd,#up_adr,#confirm,#cancel,#confirm_pwd,#confirm_adr{
	border: none;
	width:180px;
	height:40px;
	font-size:18px;
	background-color: #FFFACD;
}
#up:HOVER,#up_pwd:HOVER,#up_adr:HOVER,#confirm:HOVER,#confirm_pwd:HOVER,#confirm_adr:HOVER,#cancel:HOVER {
	background-color:#B8860B;
	color: CCFF00;
}
</style>
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
			var oldusername=$('#l_username').parent().children('.old_user').text();
			if(l_username!=oldusername){
				if(l_username==null||l_username==""){
					$('#lg_username').text(cuo+"账号不能为空").css({'color':"red",'font-size':'12px'});
					$('#lg_username').show();
					return false;
				}else{
					if(regex_username.test(l_username)){				
						$.post("${pageContext.request.contextPath }/user/user_username.action"
						,{username:l_username},function(userExsit){
							if(userExsit){
								$('#lg_username').text(cuo+"此账号已经存在").css({'color':"red",'font-size':'12px'});
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
							,'display':'inline-block',
							'font-size':'12px'
							});
						$('#lg_username').show();
						return false;
					}
				}
			}else{
				$('#lg_username').text("暂无改变").css({'color':"green",'font-size':'12px'});
				$('#lg_username').show();
				return true;
			}
		});
		
		//判断性别
		$('.r_sex input').blur(function(){
			var sex=$('.r_sex input:radio:checked').val();
			var oldsex=$('.r_sex').parent().children('.old_user').text();
			if(sex==oldsex){
				$('#e_sex').text("暂无改变").css({'color':"green",'font-size':'12px'});
				$('#e_sex').show();
				return true;
			}else{
				$('#e_sex').text(dui).css({'color':"green",'font-size':'12px'});
				$('#e_sex').show();
				return true;
			}
			
		});
		
		//校验旧密码
		$('#r_password').blur(function(){
			var r_password=$('#r_password').val();
			var userid=$('#userid').val();
			if(r_password==null||r_password==""){
				$('#lg_rpassword').text(cuo+"请输入旧密码").css({'color':"red",'font-size':'12px'});
				$('#lg_rpassword').show();
				return false;
			}else{
				$.post("${pageContext.request.contextPath }/user/user_id.action",{id:userid,password:r_password},function(userExsit){
					if(userExsit){
						$('#lg_rpassword').text(dui).css({'color':"green",'font-size':'12px'});
						$('#lg_rpassword').show();
						$('.x_pwd,.x_pwd .us_pwd input').show();
						$('.x_pwd,.x_pwd .us_pwd input').val('');
						
					}else {
						$('#lg_rpassword').text(cuo+"密码错误").css({'color':"red",'font-size':'12px'});
						$('#lg_rpassword').show();
						$('.x_pwd').hide();
						$('.x_pwd,.x_pwd .us_pwd input').val('');
						
					}
				},"json");
			}
		});
		
		//校验新密码
		$('#l_password').blur(function(){
			var l_password=$('#l_password').val();
			var r_password=$('#r_password').val();
			if(l_password==null||l_password==""){
				$('#lg_password').text(cuo+"新密码不能为空").css({'color':"red",'font-size':'12px'});
				$('#lg_password').show();
				return false;
			}else{
				if(regex_password.test(l_password)){
					$('#lg_password').text(dui).css({'color':"green",'font-size':'12px'});
					$('#lg_password').show();
					console.log(r_password);
					if(r_password==l_password){
						$('#lg_password').text(cuo+"新密码不能和旧密码一致").css({'color':"red",'font-size':'12px'});
						$('#lg_password').show();
						return false;
					}
					return true;
				}else {
					$('#lg_password').text(cuo+"密码以字母、数字、特殊字符组成，至少7个字符，最多16个字符").css({'color':"red"
						,'font-size':'12px'
						});
					$('#lg_password').show();
					return false;
				}
			}
		});
		
		//姓名校验
		$('#name').blur(function(){
			var name=$('#name').val();
			var oldname=$('#name').parent().children('.old_user').text();
			if(name!=oldname){
				if(name==null||name==""){
					$('#lg_name').text(cuo+"姓名不能为空").css({'color':"red",'font-size':'12px'});
					$('#lg_name').show();
					return false;
				}else{
					$('#lg_name').text(dui).css({'color':"green",'font-size':'12px'});
					$('#lg_name').show();
					return true;
				}
			}else{
				$('#lg_name').text("暂无改变").css({'color':"green",'font-size':'12px'});
				$('#lg_name').show();
				return true;
			}
		});
		
		//手机号校验
		$('#l_phone').blur(function(){
			var l_phone=$('#l_phone').val();
			var oldphone=$('#l_phone').parent().children('.old_user').text();
			if(l_phone!=oldphone){
				if(l_phone==null||l_phone==""){
					$('#lg_phone').text(cuo+"手机号不能为空").css({'color':"red",'font-size':'12px'});
					$('#lg_phone').show();
					return false;
				}else{
					if(regex_phone.test(l_phone)){
						$('#lg_phone').text(dui).css({'color':"green",'font-size':'12px'});
						$('#lg_phone').show();
						return true;
					}else {
						$('#lg_phone').text(cuo+"手机号格式错误").css({'color':"red",'font-size':'12px'});
						$('#lg_phone').show();
						return false;
					}
				}	
			}else{
				$('#lg_phone').text("暂无改变").css({'color':"green",'font-size':'12px'});
				$('#lg_phone').show();
				return true;
			}
		});
		
		//个人信息管理
		$('#set_user').click(function(){
			$('.u_top,.u_ifo,.u_adr,#wy_up,#up,#confirm').show();
			$('.u_pwd,#up_pwd,#up_adr,#confirm_adr,#confirm_pwd').hide();
			$('#cancel').click();
		});
		
		//修改密码
		$('#set_pwd').click(function(){
			$('.u_top,.u_pwd,#wy_up,#up_pwd').show();
			$('.u_ifo,.u_adr,#up,#up_adr').hide();
			$('#cancel').click();
		});
		
		//修改收货地址
		$('#set_adr').click(function(){
			$('.u_top,.u_adr,#wy_up,#up_adr').show();
			$('.u_ifo,.u_pwd,#up,#up_pwd').hide();
			$('#cancel').click();
		});
		
		//个人信息管理点击修改
		$("#up").click(function(){
			$('.u_sr').each(function(){
				$(this).children('input').val($(this).children('.old_user').text());
			});	
			$('table .u_sr input,#up_user,.u_sex input,.r_sex,#cancel,#confirm').show();
			$('.u_sr .old_user,#o_sex,.wy_up,#confirm_pwd,#confirm_adr').hide();
			$('.wu').css("color","green");
			var oldsex = $('#o_sex').text();
			$(":radio[name='sex'][value='" + oldsex + "']").prop("checked", "checked");
		});
		
		//修改密码点击修改
		$('#up_pwd').click(function(){
			$('.u_pwd .us_pwd input,#up_user,#cancel,#confirm_pwd').show();
			$('.u_pwd .us_pwd span,.wy_up,#confirm,#confirm_adr').hide();
		});
		
		//修改地址点击修改
		$('#up_adr').click(function(){
			$('.u_adr,.u_adr .u_dz,.form-inline,#jt_address,#jt_address .u_dz input, #up_user,#cancel,#confirm_adr').show();
			$('.old_user span,.wy_up,#confirm,#confirm_pwd').hide();
		});
		
		//取消
		$('#cancel').click(function(){
			$('.u_sr').each(function(){
				$(this).children('input').val($(this).children('.old_user').text());	
			});		 
			$('table .u_sr input,#up_user,.r_sex,.us_pwd input,.form-inline,#jt_address,.x_pwd').hide();
			$('table td .old_user,.wy_up,.us_pwd span').show();
			$('.u_pwd input,.u_dz #sf_address').val('');
			$('.err span').text('');
			$('.wu').css("color","#E0E0E0");
		});
		$("#distpicker3").distpicker({
			  province: "湖南省",
			  city: "长沙市",
			  district: "开福区"
		});
		
		//个人信息管理确认
		$('#confirm').click(function(){
			
			var s_arr=new Array();
			var sp_arr=new Array();
			$('.u_sr input').each(function(){
		           s_arr.push($(this).val());//将输入的信息添加至数组
		     });
			$('.err span').each(function(){
		           sp_arr.push($(this).text());//将校验的信息添加至数组
		           console.log(sp_arr.length);
		           console.log($(this).text());
		     });
			for(var x=0;x<s_arr.length;x++){
				if(s_arr[x]==null||s_arr[x]==""){
					alert("请输入完整的信息!");
					return;
				}
			}
			var i=0;
			var j=0;
			for(var x=0;x<sp_arr.length;x++){
				
			 	if(sp_arr[x]==""||sp_arr[x]==null||sp_arr[x]=="暂无改变"){
					i=i+1;
					console.log(i);
				}else if(sp_arr[x]==dui){
					j++;
				}else{
					alert("请输入正确的信息!");
					return;
				}
			}
			if(j==0 && i==sp_arr.length){
				alert("无须修改");
				return;
			}else if(j!=0){
				if(confirm("确定修改吗?")){
					$('#upfile').submit();
				}else{
					return;
				}
			}	
		});
		
		//修改密码确认
		$('#confirm_pwd').click(function(){
			var l_password=$('#l_password').val();
			var userid=$('#userid').val();
			var pwd_arr=new Array();
			var xpwd_arr=new Array();
			$('.us_pwd input').each(function(){
				   pwd_arr.push($(this).val());//将输入的信息添加至数组
		     });
			$('.u_pwd .err span,.x_pwd .err span').each(function(){
				   xpwd_arr.push($(this).text());//将校验的信息添加至数组
				   console.log(xpwd_arr.length);
				   console.log($(this).val());
		     });
			for(var x=0;x<pwd_arr.length;x++){
				if(pwd_arr[x]==null||pwd_arr[x]==""){
					alert("请输入完整的信息!");
					return;
				}
			}
			for(var x=0;x<xpwd_arr.length;x++){
				if(xpwd_arr[x]!=dui){
					alert("请输入正确的信息!");
					return;
				}
			}
			$.post("${pageContext.request.contextPath }/user/user_uppwd.action",{id:userid,password:l_password},function(userExsit){
				alert("修改密码成功，请重新登陆");
				$.session.clear();
				$(location).attr('href',"/DHCM/loginindex.action");
			},"json");
		});
		
		//修改地址确认
		$('#confirm_adr').click(function(){
			var s_address=[];
			var userid=$('#userid').val();
			$("#distpicker3 select").each(function(){
				s_address.push($(this).val());
			});
			var jt_address=$('#sf_address').val();
			s_address.push(jt_address);
			var newaddress=s_address.join('');
			$.post("${pageContext.request.contextPath }/user/user_uppwd.action",{id:userid,address:newaddress},function(userExsit){
				$('#m-info').click();
			},"json");
			
		});
	});
</script>
</head>
<body>
	<div id="top">
		<label>欢迎来到大河网上电脑城</label> <span id="l_user"> </span> <span id="u_esc">
			<a href="javascript:void(0)" id="esc">退出</a> <input type="button"
			id="m-info" value="信息管理" />
		</span> <span id="login"> <a href="javascript:void(0)" id="u_login">登陆</a>
		</span> <span id="regit"> <a href="javascript:void(0)"
			class="j_btnregit">注册</a>
		</span>
	</div>
	<div id="menu">
		<input type="button" id="index" value="首页" /> <input type="text"
			id="putseh" placeholder="搜索 笔记本/配件" /> <input type="button"
			id="putbut" value="搜索" /> <input type="button" id="m-car"
			value="购物车" /> <input type="button" id="m-order" value="订单" />
	</div>
	<div id="body">
	<div id="set">
		<input type="button" id="set_user" value="个人信息管理">
		<input type="button" id="set_pwd" value="修改密码"/>
		<input type="button" id="set_adr" value="修改收获地址">
	</div>
		<div id="user_div">
		<form action="${pageContext.request.contextPath }/user/user_update.action" method="post" id="upfile">
			<input id="userid" name="id" value="${user.id }"/>
			<table id="user_info">
				<tr class="u_top">
					<td class="wy">账号</td>
					<td class="u_sr"><input type="text" id="l_username" name="username">
					<span class="old_user">${user.username }</span>
					</td>
					<td class="err"><span id="lg_username"></span></td>
				</tr>
				<tr class="u_pwd">
					<td class="wy">旧密码</td>
					<td class="us_pwd"><input type="password" id="r_password" placeholder="请输入旧密码"
						><span class="old_user">********</span>
					</td>
					<td class="err"><span id="lg_rpassword"></span></td>
				</tr>
				<tr class="x_pwd">
					<td class="wy">新密码</td>
					<td class="us_pwd"><input type="password" id="l_password" name="password" placeholder="请输入新密码">
					</td>
					<td class="err"><span id="lg_password"></span></td>
				</tr>
				<tr class="u_ifo">
					<td class="wy">姓名</td>
					<td class="u_sr"><input type="text" id="name" name="name" maxlength="20">
					<span class="old_user">${user.name }</span>
					</td>
					<td class="err"><span id="lg_name"></span></td>
				</tr>
				<tr class="u_ifo">
					<td class="wy">性别</td>
					<td class="u_sex">
					<span class="r_sex">
						<input type="radio" name="sex"  value="男"/>男
	    				<input type="radio" name="sex"  value="女"/>女
    				</span>
					<span class="old_user" id="o_sex">${user.sex }</span></td>
					<td class="err"><span id="e_sex"></span></td>
				</tr>
				<tr class="u_ifo">
					<td class="wy">联系电话</td>
					<td class="u_sr"><input type="text" id="l_phone" name="phone" >
					<span class="old_user">${user.phone }</span></td>
					<td class="err"><span id="lg_phone"></span></td>
				</tr>
				<tr class="u_adr">
					<td class="wy">地址</td>
					<td class="u_dz"><input type="text" id="address" name="address" value="${user.address }">
					<nav class="form-inline">
				      <div id="distpicker3">
						  <select></select>
						  <select></select>
						  <select></select>
					  </div>
				    </nav>
					<span class="old_user">${user.address }</span></td>
					<td class="wu">不可修改</td>
				</tr>
				<tr id="jt_address">
					<td class="wy">具体地址</td>
					<td class="u_dz"><input type="text" id="sf_address" name="someaddress"/></td>
					<td class="wu"></td>
				</tr>
				<tr class="wy_up">
					<td colspan="2">
					<input type="button" id="up" value="修改"/>
					<input type="button" id="up_pwd" value="修改"/>
					<input type="button" id="up_adr" value="修改"/>
					</td>	
					<td class="wu"></td>				
				</tr>
				<tr id="up_user">
					<td colspan="2" class="rg">
						<input type="button" id="confirm" value="确认"/>
						<input type="button" id="confirm_pwd" value="确认"/>
						<input type="button" id="confirm_adr" value="确认"/>
						<input type="button" id="cancel" value="取消"/>
					</td>
					<td class="wu"></td>
				</tr>
			</table>
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