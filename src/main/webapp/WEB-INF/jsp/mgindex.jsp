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
		background-image: url("./img/glbj.jpg");
		
	}
	#u_tab{
		position: relative;
		top: 5%;	
	}
	table{
		position:relative;
		left:3%;
		text-align: center;
	}
	table tr{
		height: 60px;
	}
	table td{
		border:solid 1px;
		width: 200px;
	}
	.sel,.u_id{
		width: 60px;
	}
	.u_phone,.u_password,.u_name,.u_sex{
		width: 160px;
	}
	.u_status,.u_username{
		width: 120px;
	}
	.u_address{
		width: 260px;
	}
	#page_some{
		position: relative;
		top:40px;
		left: 41%;
	}
	.ban,.us_up,.us_cancel,.us_crm{
		border: none;
		background-color: #EEEEEE;
		width: 80px;
		height: 40px;
	}
	.unblock{
		border: none;
		background-color: #9999FF;
		width: 80px;
		height: 40px;
	}
	.ban:hover{
		background-color: #333333;
		color: #FFFFFF;
	}
	.unblock:hover{
		background-color: #00DD00;
		color: #FFFFFF;
	}
	#u_update{
		width: 80px;
		height: 40px;
	}
	.us_up:HOVER,.us_crm:hover{
		background-color: #66CCCC;
		color: #FFFFFF;
	}
	.us_cancel:hover{
		background-color: #FFFFCC;
		color: #FF99FF;
	}
	
	.us_crm,.us_cancel,nav,.u_name input,.u_sex input,.u_phone input{
		display: none;
	}
</style>
<script type="text/javascript">
	$(function(){
		var regex_phone=/^1(3|4|5|7|8)\d{9}$/;
		
		//姓名校验
		$('.u_name input').blur(function(){
			var name=$(this).val();
			var oldname=$(this).parent().find('span').text();
			if(name==null||name==""){
				
				$(this).parent().parent().find('.nm').text('姓名不能为空');
				$(this).parent().parent().find('.nm').css({'color':'red','font-size':'10px'});
				$(this).parent().parent().find('.nm').show();

			}else{
				$(this).parent().parent().find('.nm').text('无');
				$(this).parent().parent().find('.nm').hide();	
			}
		});
		
		//手机号校验
		$('.u_phone input').blur(function(){
			var m_phone=$('.u_phone input').val();
			var oldphone=$('.u_phone input').parent().find('span').text();
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
		
		//点击修改
		$('.us_up').click(function(){
			$(this).parent().parent().find('.us_cancel,.us_crm,.u_name input,.m_sex,.m_sex input,.u_phone input').show();
			$(this).parent().parent().find('.ban,.unblock,.us_up,.u_name span,.u_sex span,.u_phone span').hide();

			var oldsex = $(this).parent().parent().find('.u_sex span').text();
			var oldname=$(this).parent().parent().find('.u_name span').text();
			var oldphone=$(this).parent().parent().find('.u_phone span').text();
			$(this).parent().parent().find('.u_name input').val(oldname);
			$(this).parent().parent().find('.u_phone input').val(oldphone);
			$(this).parent().parent().find('.u_name input,.u_phone input').css({'border':'solid 1px'});
			$(this).parent().parent().find(":radio[name='sex'][value='" + oldsex + "']").prop("checked", "checked");
			
			$(this).parent().parent().siblings().find('.us_cancel').click();
		});
		
		//点击取消
		$('.us_cancel').click(function(){
			$(this).parent().parent().find('.us_cancel,.us_crm,.u_name input,.m_sex,.m_sex input,.u_phone input,nav').hide();
			$(this).parent().parent().find('.ban,.unblock,.us_up,.u_name span,.u_sex span,.u_phone span').show();
		});
		
		//确认按钮
		$('.us_crm').click(function(){
			var id=$(this).parent().parent().find('.u_id').text();
			var name=$(this).parent().parent().find('.u_name input').val();
			var name_c=$(this).parent().parent().find('.u_name .nm').text();
			var phone=$(this).parent().parent().find('.u_phone input').val();
			var phone_c=$(this).parent().parent().find('.u_phone .ph').text();
			var sex=$(this).parent().parent().find('.m_sex input:checked').val();
			
			if(name_c=="无" && phone_c=="无"){
				Href=window.location.href;	
				var href=$.href.showWindowHref(Href);	
				if(href['page.start']!=null && href['page.start']!=""){
					$(location).attr('href',"${pageContext.request.contextPath }/manager/updateuser.action?id="+id+"&name="+name+"&sex="+sex+"&phone="+phone+"&start="+href['page.start']);
				}else{
					$(location).attr('href',"${pageContext.request.contextPath }/manager/updateuser.action?id="+id+"&name="+name+"&sex="+sex+"&phone="+phone+"&start="+0);
				}
			}else{
				alert("请输入正确信息");
			}
		});
		
		//封禁用户
		$('.ban').click(function(){
			var id=$(this).parent().parent().find('.u_id').text();
			var status="封禁";
			Href=window.location.href;	
			var href=$.href.showWindowHref(Href);	
			if(href['page.start']!=null && href['page.start']!=""){
				$(location).attr('href',"${pageContext.request.contextPath }/manager/ban.action?id="+id+"&status="+status+"&start="+href['page.start']);
			}else{
				$(location).attr('href',"${pageContext.request.contextPath }/manager/ban.action?id="+id+"&status="+status+"&start="+0);
			}
		});
		
		//解封用户
		$('.unblock').click(function(){
			var id=$(this).parent().parent().find('.u_id').text();
			var status="正常";
			Href=window.location.href;	
			var href=$.href.showWindowHref(Href);	
			if(href['page.start']!=null && href['page.start']!=""){
				$(location).attr('href',"${pageContext.request.contextPath }/manager/ban.action?id="+id+"&status="+status+"&start="+href['page.start']);
			}else{
				$(location).attr('href',"${pageContext.request.contextPath }/manager/ban.action?id="+id+"&status="+status+"&start="+0);
			}
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

	<input type="text" id="putseh" placeholder="搜索 用户账号或姓名" />
    <input type="button" id="putbut" value="搜索" />
    <div id="u_tab">
    <table>
    	<tr>
    		
    		<td class="u_id">id</td>
    		<td class="u_username">账号</td>
    		<td class="u_password">密码</td>
    		<td class="u_status">状态</td>
    		<td class="u_name">姓名</td>
    		<td class="u_sex">性别</td>
    		<td class="u_phone">电话</td>
    		<td class="u_address">地址</td>
    		<td>操作</td>
    	</tr>
    	<c:forEach items="${userlist}" var="userlist">
    		<tr class="fh">
    			
    			<td class="u_id">${userlist.id }</td>
    			<td class="u_username">${userlist.username }</td>
    			<td class="u_password">${userlist.password }</td>
    			<td class="u_status">${userlist.status }</td>
    			<td class="u_name"><span>${userlist.name }</span>
    			<input type="text" name="name" value="${userlist.name }" maxlength="20"><nav class="nm">无</nav></td>
    			<td class="u_sex"><span>${userlist.sex }</span>
	    			<nav class="m_sex">
		    		<input type="radio" name="sex" value="男">男
		    		<input type="radio" name="sex" value="女">女
		    		</nav>
	    		</td>
    			<td class="u_phone"><span>${userlist.phone }</span>
    			<input type="text" name="phone" value="${userlist.phone }"><nav class="ph">无</nav></td>
    			<td class="u_address">${userlist.address }</td>
    			<c:if test="${userlist.status=='正常' }">
    				<td><input type="button" class="ban" value="封禁"/>
    					<input type="button" class="us_up" value="修改"/>
    					<input type="button" class="us_crm" value="确认"/>
    					<input type="button" class="us_cancel" value="取消"/>
    				</td>
    			</c:if>
    			<c:if test="${userlist.status=='封禁' }">
    				<td><input type="button" class="unblock" value="解封"/>
    					<input type="button" class="us_up" value="修改"/>
    					<input type="button" class="us_crm" value="确认"/>
    					<input type="button" class="us_cancel" value="取消"/>
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