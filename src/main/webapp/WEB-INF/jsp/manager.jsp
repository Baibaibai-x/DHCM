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
	#putmg{
		width:300px;
		height:30px;
		top:8px;		
		position:relative;
		left:25%;
	}
	#putmgbut{
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
	#insert_mg,#infomg{
		width: 100px;
		height: 35px;
		font-size: 16px;
		position: relative;
		left: 25%;
		top: 10px;
		border: none;
		background-color: #d0d0d0;
		color: #ffffff;
	}
	#insert_mg:hover,#infomg:hover{
		background-color: #5500ff;
		color: #FFFF33;
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
		width: 200px;
	}
	
	.mg_name,.mg_phone,.mg_password,.mg_id{
		width: 160px;
	}
	.mg_status,.mg_sex,.mg_level{
		width: 120px;
	}
	#page_some{
		position: relative;
		top:40px;
		left: 39%;
	}
	.mg_ban,.mg_up,.mg_cancel,.mg_crm{
		border: none;
		background-color: #EEEEEE;
		width: 80px;
		height: 40px;
	}
	.mg_unblock{
		border: none;
		background-color: #9999FF;
		width: 80px;
		height: 40px;
	}
	.mg_ban:hover{
		background-color: #333333;
		color: #FFFFFF;
	}
	.mg_unblock:hover{
		background-color: #00DD00;
		color: #FFFFFF;
	}
	.mg_up:HOVER,.mg_crm:hover{
		background-color: #66CCCC;
		color: #FFFFFF;
	}
	.mg_cancel:hover{
		background-color: #FFFFCC;
		color: #FF99FF;
	}
	.mg_name input,.mg_sex input,.mg_phone input,.mg_cancel,.mg_crm,.m_sex,nav,#infomg,#mg_insert{
		display: none;
	}
	#mg_insert{
		position: relative;	
		border: solid;
		top:30px;
	}
	#form_mg{
		width:600px;
		position: relative;
		left: 30%; 
		border: solid;
	}
	#form_mg tr{
		height: 50px;
	}
	.gd{
		width: 100px;
	}
	.sp{
		border:none;
		width: 100px;
	}
	.sp span{
		display: none;
	}
	.ip input{
		width: 260px;
		height: 40px;
		/* border: none; */
	}
	#j_reset{
		margin-top:5px;
		font-size: 18px;
		font-family: "Microsoft Yahei";
		height:40px;
		width:150px;
		bottom:2px;
		position: relative;	
		background-color: #d0d0d0;
		border: none;
		color: #FFFFFF;
	}
	.j_regit{
		font-family: "Microsoft Yahei";
		margin-top:5px;
		font-size: 18px;
		height:40px;
		width:240px;
		bottom:2px;
		position: relative;
		background-color : #d0d0d0;
		border: none;
		color: #FFFFFF;
	}
	
	#j_reset:HOVER{
		background-color: blue;
	}
	.j_regit:HOVER{
		background-color : red;
	}
</style>
<script type="text/javascript">
	$(function(){
		var regex_phone=/^1(3|4|5|7|8)\d{9}$/;
		
		//姓名校验
		$('.mg_name input').blur(function(){
			var name=$(this).val();
			var oldname=$(this).parent().find('span').text();
			if(name==null||name==""){
				
				$(this).parent().parent().find('.nm').text('姓名不能为空');
				$(this).parent().parent().find('.nm').css({'color':'red','font-size':'10px'});
				$(this).parent().parent().find('.nm').show();
				/* alert("姓名不能为空");		 */
			}else{
				$(this).parent().parent().find('.nm').text('无');
				$(this).parent().parent().find('.nm').hide();	
			}
		});
		
		//手机号校验
		$('.mg_phone input').blur(function(){
			var m_phone=$('.mg_phone input').val();
			var oldphone=$('.mg_phone input').parent().find('span').text();
			if(m_phone==null||m_phone==""){
				$(this).parent().parent().find('.ph').text('电话不能为空');
				$(this).parent().parent().find('.ph').css({'color':'red','font-size':'10px'});
				$(this).parent().parent().find('.ph').show();
				
			}else{
				if(regex_phone.test(m_phone)){
					$(this).parent().parent().find('.ph').text('无');
					$(this).parent().parent().find('.ph').hide();	
					return true;
				}else {
					$(this).parent().parent().find('.ph').text('电话号码格式有误');
					$(this).parent().parent().find('.ph').css({'color':'red','font-size':'10px'});
					$(this).parent().parent().find('.ph').show();

				}
			}	 
		});
		
		//搜索管理员
		$('#putmgbut').click(function(){
			var m_name=$('#putmg').val();
			$(location).attr('href',"${pageContext.request.contextPath }/manager/mgment.action?mg_name="+m_name);
		});
		
		//修改用户信息
		$('.mg_up').click(function(){
			$(this).parent().parent().find('.mg_cancel,.mg_crm,.mg_name input,.m_sex,.m_sex input,.mg_phone input').show();
			$(this).parent().parent().find('.mg_ban,.mg_unblock,.mg_up,.mg_name span,.mg_sex span,.mg_phone span').hide();

			var oldsex = $(this).parent().parent().find('.mg_sex span').text();
			var oldname=$(this).parent().parent().find('.mg_name span').text();
			var oldphone=$(this).parent().parent().find('.mg_phone span').text();
			$(this).parent().parent().find('.mg_name input').val(oldname);
			$(this).parent().parent().find('.mg_phone input').val(oldphone);
			$(this).parent().parent().find('.mg_name input,.mg_phone input').css({'border':'solid 1px'});
			$(this).parent().parent().find(":radio[name='mg_sex'][value='" + oldsex + "']").prop("checked", "checked");
			
			$(this).parent().parent().siblings().find('.mg_cancel').click();
		});
		
		//取消修改
		$('.mg_cancel').click(function(){
			$(this).parent().parent().find('.mg_cancel,.mg_crm,.mg_name input,.m_sex,.m_sex input,.mg_phone input,nav').hide();
			$(this).parent().parent().find('.mg_ban,.mg_unblock,.mg_up,.mg_name span,.mg_sex span,.mg_phone span').show();
		});
		
		//封禁管理员
		$('.mg_ban').click(function(){
			var id=$(this).parent().parent().find('.mg_id').text();
			var status="封禁";
			Href=window.location.href;	
			var href=$.href.showWindowHref(Href);
			if(href['page.start']!=null && href['page.start']!=""){
				$(location).attr('href',"${pageContext.request.contextPath }/manager/banmanager.action?mg_id="+id+"&mg_status="+status+"&start="+href['page.start']);
			}else{
				$(location).attr('href',"${pageContext.request.contextPath }/manager/banmanager.action?mg_id="+id+"&mg_status="+status+"&start="+0);
			}
		});
		
		//解封管理员
		$('.mg_unblock').click(function(){
			var id=$(this).parent().parent().find('.mg_id').text();
			var status="正常";
			Href=window.location.href;	
			var href=$.href.showWindowHref(Href);
			if(href['page.start']!=null && href['page.start']!=""){
				$(location).attr('href',"${pageContext.request.contextPath }/manager/banmanager.action?mg_id="+id+"&mg_status="+status+"&start="+href['page.start']);
			}else{
				$(location).attr('href',"${pageContext.request.contextPath }/manager/banmanager.action?mg_id="+id+"&mg_status="+status+"&start="+0);
			}
		});
		
		//确认按钮
		$('.mg_crm').click(function(){
			var id=$(this).parent().parent().find(".mg_id").text();
			var name=$(this).parent().parent().find('.mg_name input').val();
			var name_c=$(this).parent().parent().find('.mg_name .nm').text();
			var phone=$(this).parent().parent().find('.mg_phone input').val();
			var phone_c=$(this).parent().parent().find('.mg_phone .ph').text();
			var sex=$(this).parent().parent().find('.m_sex input:checked').val();
			
			if(name_c=="无" && phone_c=="无"){
				Href=window.location.href;	
				var href=$.href.showWindowHref(Href);
				if(href['page.start']!=null && href['page.start']!=""){
					$(location).attr('href',"${pageContext.request.contextPath }/manager/updatemanager.action?mg_id="+id+"&mg_name="+name+"&mg_sex="+sex+"&mg_phone="+phone+"&start="+href['page.start']);
				}else{
					$(location).attr('href',"${pageContext.request.contextPath }/manager/updatemanager.action?mg_id="+id+"&mg_name="+name+"&mg_sex="+sex+"&mg_phone="+phone+"&start="+0);
				}
			}else{
				alert("请输入正确信息");
			}
			
		});
		
		//新增管理员
		$('#insert_mg').click(function(){
			$('#putmg,#putmgbut,#insert_mg,#u_tab,#page_some,.sp span').hide();
			$('#infomg,#mg_insert').show();
			$('#j_reset').click();
		});
		
		//信息管理
		$('#infomg').click(function(){
			$('#putmg,#putmgbut,#insert_mg,#u_tab,#page_some').show();
			$('#infomg,#mg_insert').hide();
			$('.mg_cancel').click();
		});
	});
</script>

<script type="text/javascript">
	$(function(){
		var dui="✅";
		var cuo="❌"
		var regex_id=/^[a-zA-Z][\w]{2,14}$/;
		var regex_password=/^[\x21-\x7eA-Za-z0-9]{7,16}$/;
		var regex_phone=/^1(3|4|5|7|8)\d{9}$/;
		
		//校验账号
		$('#m_id').blur(function(){
			var m_id=$('#m_id').val();
			if(m_id==null||m_id==""){
				$('#lm_id').text(cuo+"账号不能为空").css({'color':"red",'font-size':'12px'});
				$('#lm_id').show();
				return false;
			}else{
				if(regex_id.test(m_id)){				
					$.post("${pageContext.request.contextPath }/manager/checkid.action"
					,{mg_id:m_id},function(date){
						if(date){
							$('#lm_id').text(cuo+"此账号已经存在").css({'color':"red",'font-size':'12px'});
							$('#lm_id').show();
							return false;
						}else {
							$('#lm_id').text(dui).css({'color':"green",'font-size':'12px'});
							$('#lm_id').show();
							return true;
						}
					},'json');
				}else{
					$('#lm_id').text(cuo+"必须以字母开头,由'字母''_''数字'组成,长度在3~15").css({'color':"red"
						,'font-size':'12px'
						});
					$('#lm_id').show();
					return false;
				}
		
			}
		});
		
		//校验密码
		$('#m_password').blur(function(){
			var m_password=$('#m_password').val();
			var r_password=$('#r_password').val();
			if(m_password==null||m_password==""){
				$('#lm_password').text(cuo+"密码不能为空").css({'color':"red",'font-size':'12px'});
				$('#lm_password').show();
				return false;
			}else{
				if(regex_password.test(m_password)){
					$('#lm_password').text(dui).css({'color':"green",'font-size':'12px'});
					$('#lm_password').show();
					if(r_password!=null&&r_password!=""){
						$('#r_password').blur();
					}
					return true;
				}else {
					$('#lm_password').text(cuo+"密码以字母、数字、特殊字符组成，至少7个字符，最多16个字符").css({'color':"red"
						,'font-size':'12px'
						});
					$('#lm_password').show();
					return false;
				}
			}
		});
		
		//重复密码校验
		$('#r_password').blur(function(){
			var m_password=$('#m_password').val();
			var r_password=$('#r_password').val();
			if(m_password==null||m_password==""){
				$('#lm_password').text(cuo+"密码不能为空").css({'color':"red",'font-size':'12px'});
				$('#lm_password').show();
				return false;
			}
			else if(r_password==null||r_password==""){
				$('#lm_repassword').text(cuo+"重复密码不能为空").css({'color':"red",'font-size':'12px'});
				$('#lm_repassword').show();
				return false;
			}else{
				if(r_password==m_password){
					$('#lm_repassword').text(dui).css({'color':"green",'font-size':'12px'});
					$('#lm_repassword').show();
					return true;
				}else {
					$('#lm_repassword').text(cuo+"两次密码要一致").css({'color':"red",'font-size':'12px'});
					$('#lg_repassword').show();
					return false;
				}
			}
		});
		
		//姓名校验
		$('#name').blur(function(){
			var name=$('#name').val();
			if(name==null||name==""){
				$('#lg_name').text(cuo+"姓名不能为空").css({'color':"red",'font-size':'12px'});
				$('#lg_name').show();
				return false;
			}else{
				$('#lg_name').text(dui).css({'color':"green",'font-size':'12px'});
				$('#lg_name').show();
				return true;
			}
		});
		
		//手机号校验
		$('#m_phone').blur(function(){
			var m_phone=$('#m_phone').val();
			if(m_phone==null||m_phone==""){
				$('#lm_phone').text(cuo+"手机号不能为空").css({'color':"red",'font-size':'12px'});
				$('#lm_phone').show();
				return false;
			}else{
				if(regex_phone.test(m_phone)){
					$('#lm_phone').text(dui).css({'color':"green",'font-size':'12px'});
					$('#lm_phone').show();
					return true;
				}else {
					$('#lm_phone').text(cuo+"手机号格式错误").css({'color':"red",'font-size':'12px'});
					$('#lm_phone').show();
					return false;
				}
			}
		});
		
		//清空
		$('#j_reset').click(function(){
			$('.sp span').text('');
		});
		
		//提交表单
		$('.j_regit').click(function(){
			var ipt=new Array();
			var spt=new Array();
			$('.ip input').each(function(){
				ipt.push($(this).val());
			});
			$('.sp span').each(function(){
				spt.push($(this).text());
			});
			
			for(var x=0;x<ipt.length;x++){
				if(ipt[x]==null||ipt[x]==""){
					alert("请输入完整的信息!");
					return;
				}
			}
			console.log(spt.length);
			for(var y=0;y<spt.length;y++){
				console.log(spt[y]);
				if(spt[y]!=dui){
					alert("请输入正确的信息!");
					return;
				}
				console.log(spt[y]);
			}
			$('#mgForm').submit();
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

	<input type="text" id="putmg" placeholder="搜索 管理员账号或姓名" />
    <input type="button" id="putmgbut" value="搜索" />
    <input type="button" id="insert_mg" value="新增管理员"/>
    <input type="button" id="infomg" value="信息管理"/>
  
    <div id="u_tab">
    <table>
    	<tr>
    		<td class="mg_id">账号</td>
    		<td class="mg_password">密码</td>
    		<td class="mg_name">姓名</td>
    		<td class="mg_status">状态</td>
    		<td class="mg_level">级别</td>
    		<td class="mg_sex">性别</td>
    		<td class="mg_phone">电话</td>
    		
    		<td>操作</td>
    	</tr>
    	<c:forEach items="${mglist}" var="mglist">
    		<tr>
	    		<td class="mg_id">${mglist.mg_id }</td>
	    		<td class="mg_password">${mglist.mg_password }</td>
	    		<td class="mg_name"><span>${mglist.mg_name }</span><input type="text" name="mg_name" value="${mglist.mg_name }" maxlength="20"><nav class="nm">无</nav></td>
	    		<td class="mg_status">${mglist.mg_status }</td>
	    		<td class="mg_level">${mglist.mg_level }</td>
	    		<td class="mg_sex"><span>${mglist.mg_sex }</span>
	    		<nav class="m_sex">
	    		<input type="radio" name="mg_sex" value="男">男
	    		<input type="radio" name="mg_sex" value="女">女
	    		</nav>
	    		</td>
	    		<td class="mg_phone"><span>${mglist.mg_phone }</span><input type="text" name="mg_phone" value="${mglist.mg_phone }"><nav class="ph">无</nav></td>
    			<c:if test="${mglist.mg_status=='正常' }">
    				<td><input type="button" class="mg_ban" value="封禁"/>
    					<input type="button" class="mg_up" value="修改"/>
    					<input type="button" class="mg_crm" value="确认"/>
    					<input type="button" class="mg_cancel" value="取消"/>
    				</td>
    			</c:if>
    			<c:if test="${mglist.mg_status=='封禁' }">
    				<td><input type="button" class="mg_unblock" value="解封"/>
    					<input type="button" class="mg_up" value="修改"/>
    					<input type="button" class="mg_crm" value="确认"/>
    					<input type="button" class="mg_cancel" value="取消"/>
    				</td>
    			</c:if>
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
	<div id="mg_insert">
		<form method="post" id="mgForm" action="${pageContext.request.contextPath }/manager/insertmg.action">
			<table id="form_mg">
				<tr>
					<td class="gd">账号:</td>
					<td class="ip"><input class="txt" name="mg_id" id="m_id" placeholder="请输入账号"/>
					</td>
					<td class="sp"><span id="lm_id"></span></td>
				</tr>
				<tr>
					<td class="gd">密码:</td>
					<td class="ip"><input class="txt" name="mg_password" type="password" id="m_password" placeholder="请输入密码" />
		  
					</td>
					<td class="sp"><span id="lm_password"></span></td>
				</tr>
				<tr>
					<td class="gd">重复密码:</td>
					<td class="ip"><input class="txt" name="r_password" type="password" id="r_password" placeholder="重复密码" />
		       			
		       		</td>
		       		<td class="sp"><span id="lm_repassword"></span></td>
				</tr>
				<tr>
					<td class="gd">姓名:</td>
					<td class="ip"><input class="txt" name="mg_name" type="text" id="name" placeholder="姓名" maxlength="20"/>
		       		</td>
		       		<td class="sp"><span id="lg_name"></span></td>
				</tr>
				<tr>
					<td class="gd">状态:</td>
					<td>正常</td>
					<td class="sp"></td>
				</tr>
				<tr>
					<td class="gd">级别:</td>
					<td>次级权限</td>
					<td class="sp"></td>
				</tr>
				<tr>
					<td class="gd">性别:</td>
					<td><input type="radio" name="mg_sex" value="男" checked="checked"/>男
		   				<input type="radio" name="mg_sex" value="女"/>女
		   			</td>
		   			<td class="sp"></td>
				</tr>
				<tr>
					<td class="gd">手机号:</td>
					<td class="ip"><input class="txt" name="mg_phone" type="text" id="m_phone" placeholder="手机号" />
		       			
		       		</td>
		       		<td class="sp"><span id="lm_phone"></span></td>
				</tr>
				<tr>
					<td colspan="2"><input type="reset" value="清空" id="j_reset"/>
		   		<input type="button" value="增加" class="j_regit"></td>
		   		<td class="sp"></td>
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