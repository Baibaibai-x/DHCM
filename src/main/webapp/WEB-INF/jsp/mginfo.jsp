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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/mgindex.css"/>
<!-- <link rel="stylesheet" href="http://www.jq22.com/jquery/bootstrap-3.3.4.css"/> -->
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquerySession.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/mgindex.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/distpicker.data.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/distpicker.js"></script>

<style type="text/css">
#confirm_pwd,.x_pwd,.u_pwd,table td input,#up_user,#up_pwd{
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
#mgid{
	display: none;
}
#up{
	display: inline;
}
#mg_div{
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
#mg_info{
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
#mg_info td{
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
#up,#up_pwd,#confirm,#cancel,#confirm_pwd{
	border: none;
	width:180px;
	height:40px;
	font-size:18px;
	background-color: #FFFACD;
}
#up:HOVER,#up_pwd:HOVER,#confirm:HOVER,#confirm_pwd:HOVER,#cancel:HOVER {
	background-color:#B8860B;
	color: CCFF00;
}
</style>
<script type="text/javascript">
	$(function(){
		var dui="✅";
		var cuo="❌"
		
		var regex_password=/^[\x21-\x7eA-Za-z0-9]{7,16}$/;
		var regex_phone=/^1(3|4|5|7|8)\d{9}$/;
		
		//判断性别
		$('.r_sex input').blur(function(){
			var sex=$('.r_sex input:radio:checked').val();
			var oldsex=$('.r_sex').parent().children('.old_mg').text();
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
			var mgid=$('#mgid').val();
			if(r_password==null||r_password==""){
				$('#lg_rpassword').text(cuo+"请输入旧密码").css({'color':"red",'font-size':'12px'});
				$('#lg_rpassword').show();
				return false;
			}else{
				$.post("${pageContext.request.contextPath }/manager/mg_id.action",{mg_id:mgid,password:r_password},function(mgExsit){
					if(mgExsit){
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
			var oldname=$('#name').parent().children('.old_mg').text();
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
			var oldphone=$('#l_phone').parent().children('.old_mg').text();
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
		$('#set_mg').click(function(){
			$('.u_top,.u_ifo,.u_adr,#wy_up,#up,#confirm').show();
			$('.u_pwd,#up_pwd,#confirm_pwd').hide();
			$('#cancel').click();
		});
		
		//修改密码
		$('#set_pwd').click(function(){
			$('.u_top,.u_pwd,#wy_up,#up_pwd').show();
			$('.u_ifo,.u_adr,#up').hide();
			$('#cancel').click();
		});
		
		//个人信息管理点击修改
		$("#up").click(function(){
			$('.u_sr').each(function(){
				$(this).children('input').val($(this).children('.old_mg').text());
			});	
			$('table .u_sr input,#up_user,.u_sex input,.r_sex,#cancel,#confirm').show();
			$('.u_sr .old_mg,#o_sex,.wy_up,#confirm_pwd').hide();
			$('.wu').css("color","green");
			var oldsex = $('#o_sex').text();
			$(":radio[name='mg_sex'][value='" + oldsex + "']").prop("checked", "checked");
		});
		
		//修改密码点击修改
		$('#up_pwd').click(function(){
			$('.u_pwd .us_pwd input,#up_user,#cancel,#confirm_pwd').show();
			$('.u_pwd .us_pwd span,.wy_up,#confirm').hide();
		});
		
		
		
		//取消
		$('#cancel').click(function(){
			$('.u_sr').each(function(){
				$(this).children('input').val($(this).children('.old_mg').text());	
			});		 
			$('table .u_sr input,#up_user,.r_sex,.us_pwd input,.form-inline,#jt_address,.x_pwd').hide();
			$('table td .old_mg,.wy_up,.us_pwd span').show();
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
			var mgid=$('#mgid').val();
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
			$.post("${pageContext.request.contextPath }/manager/manager_uppwd.action",{mg_id:mgid,mg_password:l_password},function(mgExsit){
				alert("修改密码成功，请重新登陆");
				$.session.clear();
				$(location).attr('href',"/DHCM/gomg.action");
			},"json");
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
	<div id="set">
		<input type="button" id="set_mg" value="个人信息管理">
		<input type="button" id="set_pwd" value="修改密码"/>
	</div>
		<div id="mg_div">
		<form action="${pageContext.request.contextPath }/manager/managerupdateinfo.action" method="post" id="upfile">
			<input id="mgid" name="mg_id" value="${manager.mg_id }"/>
			<table id="mg_info">
				<tr class="u_top">
					<td class="wy">账号</td>
					<td class="u_sr">
					<span>${manager.mg_id }</span>
					</td>
					<td class="err"></td>
				</tr>
				<tr class="u_pwd">
					<td class="wy">旧密码</td>
					<td class="us_pwd"><input type="password" id="r_password" placeholder="请输入旧密码"
						><span class="old_mg">********</span>
					</td>
					<td class="err"><span id="lg_rpassword"></span></td>
				</tr>
				<tr class="x_pwd">
					<td class="wy">新密码</td>
					<td class="us_pwd"><input type="password" id="l_password" name="mg_password" placeholder="请输入新密码">
					</td>
					<td class="err"><span id="lg_password"></span></td>
				</tr>
				<tr class="u_ifo">
					<td class="wy">姓名</td>
					<td class="u_sr"><input type="text" id="name" name="mg_name" maxlength="20">
					<span class="old_mg">${manager.mg_name }</span>
					</td>
					<td class="err"><span id="lg_name"></span></td>
				</tr>
				<tr class="u_ifo">
					<td class="wy">性别</td>
					<td class="u_sex">
					<span class="r_sex">
						<input type="radio" name="mg_sex"  value="男"/>男
	    				<input type="radio" name="mg_sex"  value="女"/>女
    				</span>
					<span class="old_mg" id="o_sex">${manager.mg_sex }</span></td>
					<td class="err"><span id="e_sex"></span></td>
				</tr>
				<tr class="u_ifo">
					<td class="wy">联系电话</td>
					<td class="u_sr"><input type="text" id="l_phone" name="mg_phone" >
					<span class="old_mg">${manager.mg_phone }</span></td>
					<td class="err"><span id="lg_phone"></span></td>
				</tr>
				<tr class="u_ifo">
					<td class="wy">状态</td>
					<td class="u_sr">
					<span>${manager.mg_status }</span>
					</td>
					<td class="err"></td>
				</tr>
				<tr class="u_ifo">
					<td class="wy">级别</td>
					<td class="u_sr">
					<span>${manager.mg_level }</span>
					</td>
					<td class="err"></td>
				</tr>
				<tr class="wy_up">
					<td colspan="2">
					<input type="button" id="up" value="修改"/>
					<input type="button" id="up_pwd" value="修改"/>
					</td>	
					<td class="wu"></td>				
				</tr>
				<tr id="up_user">
					<td colspan="2" class="rg">
						<input type="button" id="confirm" value="确认"/>
						<input type="button" id="confirm_pwd" value="确认"/>
						
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