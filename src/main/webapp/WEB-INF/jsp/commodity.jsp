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
		height: 1050px;
	}
	#b-left{
		float:left;
		width:20%;
		height:1000px;
		border: solid;
	}
	#b-right{
		float:left;
		width:78%;
		height:1000px;
		border: solid;
		margin-left: 10px;
	}
	#show{
		position: relative;
		margin-top:20px;
		border: solid 1px; 
		text-align: center;
		min-width: 1020px;
	}
	 
	#u_tab{
		position: relative;
		top: 5%;	
	}
	table{
		position:relative;
		text-align: center;
	}
	table tr{
		height: 80px;
	}
	table td{
		border:solid 1px;
		width: 100px;
	}
	.pd_id{
		width: 50px;
	}
	.pd_itd{
		width: 200px;
	}
	.pd_name{
		width: 120px;
	}
	.pd_stock{
		width: 80px;
	}
	#page_some{
		position: relative;
		top:20px;
	}
	#pd_insert{
		width:80px;
		height:35px;
		position:relative;
		left: 15%;
		border: none;
		background-color: #CCFF99;
	}
	#pd_insert:hover{
		background-color: #FFBB00;
		color: #FFF;
	}
	#putpd{
		width:300px;
		height:30px;
		position:relative;
		left:22%;
	}
	#putpdbut{
		font-size:16px;
		width:80px;
		height:35px;
		
		left:22%;
		position:relative;
		color:#FFF;
		background-color:#F00;
		border:#FFF;
	}
	.pd_ban,.pd_up,.pd_ware{
		border: none;
		background-color: #EEEEEE;
		width: 80px;
		height: 35px;
	}
	.pd_ware{
		position:relative;
		top:3px;	
	}
	.pd_unblock{
		border: none;
		background-color: #9999FF;
		width: 80px;
		height: 40px;
	}
	.pd_ban:hover{
		background-color: #333333;
		color: #FFFFFF;
	}
	.pd_unblock:hover{
		background-color: #00DD00;
		color: #FFFFFF;
	}
	.pd_up:HOVER,.pd_ware:hover{
		background-color: #66CCCC;
		color: #FFFFFF;
	}
	.pd_cancel:hover{
		background-color: #FFFFCC;
		color: #FF99FF;
	}
	.operating{
		width: 180px;
	}
	#allline{
		position: relative;
		left: 27%;
		width: 100px;
		height: 35px;
		top: 75px;
		border: none;
		background-color: #99FFFF;
	}
	#online,#offline{
		position: relative;
		left: 10%;
		width: 100px;
		height: 35px;
		top: 80px;
		border: none;
		background-color: #99FFFF;
	}
	#online:hover,#offline:hover,#allline:hover{
		background-color: #FFC0CB;
		color: #FFF;
	}
	
	#j_hideFormLogin{
		padding:5px 10px;
		float:right;
		cursor:pointer;
	}
	.form-login-title{
		width:700px;
		height:40px;
		background-color:#ccc;
	}
	.form-login-title span{
		position:relative;
		left:5px;
		height:40px;
		line-height:40px;
	}
	#j_formlogin{
		/* width:700px;
		height:786px;	 */
		display:none;
		position:absolute;
		top:30%;
		left:30%;
		margin-left:-54px;
		margin-top:-81px;
		background-color:#ccc;
	}
	#j_mask{
		position: fixed;
		top: 0;
		left: 0;
		bottom: 0;
		right: 0;
		width: 100%;
		height: 100%;
		background: gray;
		opacity:0.8;
		display:none;
	}
	#mp_tab{
		/* height:686px; */
		width: 600px;
		margin-left:90px;
		margin-bottom:20px;
		background-color:#fff;
		border: none;
	}
	#mpit_tab{
		width: 600px;
		margin-left:90px;
		margin-bottom:20px;
		background-color:#fff;
		border: none;
	}
	#mp_tab .sp,#mpit_tab .sp{
		width: 50px;
		background-color:#ccc;
		border-color: #ccc;
	}
	#j_hideFormLogin:HOVER {
		background-color: #d667dd;
		color: #FFF;
	}
	#mp_tab input,#mpit_tab input{
		width: 240px;
		height: 40px; 
	}
	#in_confirm{
		background-color: #ffffcc;
		border: none;
	}
	#in_confirm:hover{
		background-color: #ff33cc;
		color: #FFF;
	}
	#mit_tab，#in_confirm{
		display: none;
	}
</style>
<script type="text/javascript">
	$(function(){
		var dui="✅";
		//关闭遮罩层和添加数据层
		$('#j_hideFormLogin').click(function(){
			$('#j_formlogin,#in_confirm').hide();
			$('#j_mask').hide();
			$('.sp span').text('');
			$('#mit_stock,#mit_price').val('');
		});
		
		//搜索商品
		$('#putpdbut').click(function(){
			var pd_name=$('#putpd').val();
			$(location).attr('href',"${pageContext.request.contextPath }/manager/search_pd_mg.action?product_name="+pd_name); 
		});
		
		
		
		
		//增加商品
		$('#pd_insert').click(function(){
			$('.form-login-title span').text("新增商品");
			$('#j_formlogin,#j_mask,#mup_tab,#in_confirm').show();
			$('#mit_tab,#mp_confirm').hide();
			$('#mgp_id').val('');
			$('.mp_id').text("系统生成");
			$('.mp_name').val('');
			$('.mp_stock').text(0);
			$('.mp_price').val('');
			$('.mp_itd').val('');
			$('.mp_brand').val('');
			$('.mp_date').val('');
			$('.mp_status').text('在售');
			$('.sh_img').attr("src",null).show();
		});
		
		//增加商品提交
		$('#in_confirm').click(function(){
			var msp=new Array();
			$('#mp_tab .sp span').each(function(){
				if($(this).text().length==0){
					return true;
				}
				msp.push($(this).text());
			});
			console.log(msp.length);
			if(msp.length!=0&&msp.length==6||msp.length==5){
				for(var x=0;x<msp.length;x++){
					console.log(x+msp[x]);
					if(msp[x]!=dui){
						alert("请输入正确的信息!");
						return ; 
						
					}
				}
				$('#mgp_id').val(-1);
				
				$("#mup_tab").attr('action',"${pageContext.request.contextPath }/manager/insert_product.action");
				$('#mup_tab').submit();
			}else{
				alert("请输入完整信息")
			}
		});
		
		//商品入库
		$('.pd_ware').click(function(){
			$('.form-login-title span').text("商品入库");
			$('#j_formlogin,#j_mask,#mit_tab').show();
			$('#mup_tab').hide();
			$('.mp_id').text($(this).parent().parent().find('.pd_id').text());
			$('.mp_name').text($(this).parent().parent().find('.pd_name').text());
			$('#mit_stock').val('');
			$('.mp_price').val('');
			$('#mit_name').val($(this).parent().parent().find('.pd_name').text());
			$('#mit_id').val($(this).parent().parent().find('.pd_id').text());
			Href=window.location.href;	
			var href=$.href.showWindowHref(Href);
			if(href['page.start']!=null && href['page.start']!=""){
				$('#mit_tab').attr('action',"${pageContext.request.contextPath }/manager/insert_receipt.action?start="+href['page.start']);
			}else{
				$('#mit_tab').attr('action',"${pageContext.request.contextPath }/manager/insert_receipt.action?start="+0);
			}
		})
		
		//提交入库单
		$('#mit_confirm').click(function(){
			var ware=new Array();
			$('#mpit_tab .sp span').each(function(){
				ware.push($(this).text());
			});
			for(var x=0;x<ware.length;x++){
				if(ware[x]!=dui){
					alert("请输入正确的信息!");
					return;
				}
			}
			$('#mit_tab').submit();
		})
		
		//修改商品信息
		$('.pd_up').click(function(){
			$('.form-login-title span').text("修改商品信息");
			$('#j_formlogin,#j_mask,#mup_tab,#mp_confirm').show();
			$('#mit_tab,#in_confirm').hide();
			$('.mp_id').text($(this).parent().parent().find('.pd_id').text());
			$('#mgp_id').val($(this).parent().parent().find('.pd_id').text());
			$('.mp_name').val($(this).parent().parent().find('.pd_name').text());
			$('.mp_stock').text($(this).parent().parent().find('.pd_stock').text());
			$('.mp_price').val($(this).parent().parent().find('.pd_price').text());
			$('.mp_itd').val($(this).parent().parent().find('.pd_itd').text());
			$('.mp_brand').val($(this).parent().parent().find('.pd_brand').text());
			$('.mp_date').val($(this).parent().parent().find('.pd_date').text());
			$('.mp_status').text($(this).parent().parent().find('.pd_status').text());
		    var ctg=$(this).parent().parent().find('.pd_category').text();		  
		    $('.mp_cg').find("option[value='" + ctg + "']").prop("selected","selected"); 		   
		    var img=$(this).parent().parent().find('#pd_p')[0].src;
		    $('.sh_img').attr("src",img).show();
		    $('.jmp_img').val('');
		    Href=window.location.href;	
			var href=$.href.showWindowHref(Href);
			if(href['page.start']!=null && href['page.start']!=""){
		    	$("#mup_tab").attr('action',"${pageContext.request.contextPath }/manager/update_product.action?start="+href['page.start']);
			}else{
		    	$("#mup_tab").attr('action',"${pageContext.request.contextPath }/manager/update_product.action?start="+0);
			}
		});
		
		//选择图片上传
		$('.jmp_img').change(function(){
			var current_img=this.files[0];
			preview_picture(current_img);
		});
		
		
		function preview_picture(pic){
			var r=new FileReader();
			r.readAsDataURL(pic);
			r.onload=function(e){
				$('.sh_img').attr("src",this.result).show();
			}
		}
		$('.mp_cg').change(function(){
			$('.smp_ctg').text(dui).css({'color':"green",'font-size':'12px'});
			$('.smp_ctg').show();
		});
		//提交表单
		$('#mp_confirm').click(function(){
			var msp=new Array();
			var a=$('.mg_cg').change();
			console.log(a);
			$('#mp_tab .sp span').each(function(){
				if($(this).text().length==0){
					return true;
				}
				msp.push($(this).text());
			});
			
			var fileInput = $('.jmp_img').get(0).files[0];	
			
			if(msp.length!=0){
				for(var x=0;x<msp.length;x++){
					console.log(x+msp[x]);
					if(msp[x]!=dui&&msp[x]!='暂无改变'){
						alert("请输入正确的信息!");
						return ; 
						
					}
				}
				$('#mup_tab').submit();
			}else{
				if(fileInput){
					$('#mup_tab').submit();
				}else{
					alert("无须修改")	
				}
			}
				
			
		});
		
		//取消修改
		$('.mp_cancel').click(function(){
			$('#j_hideFormLogin').click();
		});
		
		//下架商品
		$('.pd_ban').click(function(){
			var id=$(this).parent().parent().find('.pd_id').text();
			var status="停售";
			
		    
			Href=window.location.href;	
			var href=$.href.showWindowHref(Href);
			if(href['page.start']!=null && href['page.start']!=""){
				$(location).attr('href',"${pageContext.request.contextPath }/manager/ban_pd.action?id="+id+"&product_status="+status+"&start="+href['page.start']);
			}else{
				$(location).attr('href',"${pageContext.request.contextPath }/manager/ban_pd.action?id="+id+"&product_status="+status+"&start="+0);
			}
		});
		
		//上架商品
		$('.pd_unblock').click(function(){
			var id=$(this).parent().parent().find('.pd_id').text();
			var status="在售";
			Href=window.location.href;	
			var href=$.href.showWindowHref(Href);
			if(href['page.start']!=null && href['page.start']!=""){
				$(location).attr('href',"${pageContext.request.contextPath }/manager/ban_pd.action?id="+id+"&product_status="+status+"&start="+href['page.start']);
			}else{
				$(location).attr('href',"${pageContext.request.contextPath }/manager/ban_pd.action?id="+id+"&product_status="+status+"&start="+0);
			}
		});
		
		//显示所有商品
		$('#allline').click(function(){
			$('#mg_product').click();
		});
		
		//显示在售商品
		$('#online').click(function(){
			var status="在售";
			$(location).attr('href',"${pageContext.request.contextPath }/manager/commodity_show.action?product_status="+status+"&pj="+"sc");
		});
		
		//显示停售的商品
		$('#offline').click(function(){
			var status="停售";
			$(location).attr('href',"${pageContext.request.contextPath }/manager/commodity_show.action?product_status="+status+"&pj="+"sc");
		});
		
		//点击种类选择显示
		$("#tab a").click(function(){
			var temp = $(this).text();
		
 			$(location).attr('href',"${pageContext.request.contextPath }/manager/commodity_show.action?product_category="+temp);
 		});
	});
</script>

<script type="text/javascript">
	$(function(){
		var dui="✅";
		var cuo="❌"
		var regex_price=/^\d\.[0-9]{1,2}|([1-9]\d+(\.)[0-9]{0,2})$/;
		var regex_date=/^(\d{4})-(0\d{1}|1[0-2])-(0\d{1}|[12]\d{1}|3[01])$/;
		var regex_stock=/^\d+$/;
		//校验账号
		$('.mp_name').blur(function(){
			var m_name=$('.mp_name').val();
			var id=$('#mgp_id').val();
			if(m_name==null||m_name==""){
				$('.smp_name').text(cuo+"商品名不能为空").css({'color':"red",'font-size':'12px'});
				$('.smp_name').show();
				return false;
			}else{	
				if(id!=null && id!=""){
					
				
					$.post("${pageContext.request.contextPath }/manager/check_pdname.action"
					,{id:id},function(date){
						if(date==m_name){
							$('.smp_name').text("暂无改变").css({'color':"green",'font-size':'12px'});
							$('.smp_name').show();
							return false;
						}else {
							$.post("${pageContext.request.contextPath }/manager/check_pdname.action"
									,{product_name:m_name},function(date){
										if(date){
											$('.smp_name').text(dui).css({'color':"green",'font-size':'12px'});
											$('.smp_name').show();
										}else{
											$('.smp_name').text(cuo+"此商品名已存在").css({'color':"red",'font-size':'12px'});
											$('.smp_name').show();
										}
									},"json");
						}
					},'json');
				}else{
					$.post("${pageContext.request.contextPath }/manager/check_pdname.action"
							,{product_name:m_name},function(date){
								if(date){
									$('.smp_name').text(dui).css({'color':"green",'font-size':'12px'});
									$('.smp_name').show();
								}else{
									$('.smp_name').text(cuo+"此商品名已存在").css({'color':"red",'font-size':'12px'});
									$('.smp_name').show();
								}
							},"json");
				}
			}
		});
		//商品入库数量
		function allprice(){
			var price=$('.mp_price').val();
			var stock=$('#mit_stock').val();
			$('.mp_alprice').text(price*stock);
			console.log(price*stock);
		}
		
		
		//入库数量校验
		$('#mit_stock').blur(function(){
			var stock=$(this).val();
			var price= $('#xp .mp_price').val();
			if(stock==null||stock==""||stock==0){
				$('.smp_stock').text(cuo+"数量不能为空").css({'color':"red",'font-size':'12px'});
				$('.smp_stock').show();
				return false;
			}else{
				if(regex_stock.test(stock)){
					$('.smp_stock').text(dui).css({'color':"green",'font-size':'12px'});
					$('.smp_stock').show();
					console.log(price);
					if(price!=null&&price!=""){
						$('.mp_alprice').text((price*stock).toFixed(2));
					}
					return true;
				}else{
					$('.smp_stock').text(cuo+"数量输入格式有误").css({'color':"red",'font-size':'12px'});
					$('.smp_stock').show();
					return false;
				}
			}
		});
		
		//价格校验
		$('.mp_price').blur(function(){
			var price=$(this).val();
			var stock=$('#mit_stock').val();
			if(price==null||price==""){
				$('.smp_price').text(cuo+"价格不能为空").css({'color':"red",'font-size':'12px'});
				$('.smp_price').show();
				return false;
			}else{
				if(regex_price.test(price)){
					$('.smp_price').text(dui).css({'color':"green",'font-size':'12px'});
					$('.smp_price').show();	
					if(stock!=null&&stock!=""){
						$('.mp_alprice').text((price*stock).toFixed(2));
					}
					return true;
				}else{
					$('.smp_price').text(cuo+"价格输入格式有误").css({'color':"red",'font-size':'12px'});
					$('.smp_price').show();
					return false;
				}
			}
		});
		
		//商品介绍校验
		$('.mp_itd').blur(function(){
			var m_itd=$(this).val();
			if(m_itd==null||m_itd==""){
				$('.smp_itd').text(cuo+"商品介绍不能为空").css({'color':"red",'font-size':'12px'});
				$('.smp_itd').show();
				return false;
			}else{	
				$('.smp_itd').text(dui).css({'color':"green",'font-size':'12px'});
				$('.smp_itd').show();
				return true;
			}
		});
		
		//品牌介绍校验
		$('.mp_brand').blur(function(){
			var m_brand=$(this).val();
			if(m_brand==null||m_brand==""){
				$('.smp_brand').text(cuo+"商品品牌不能为空").css({'color':"red",'font-size':'12px'});
				$('.smp_brand').show();
				return false;
			}else{	
				$('.smp_brand').text(dui).css({'color':"green",'font-size':'12px'});
				$('.smp_brand').show();
				return true;
			}
		});
		
		//上架日期介绍校验
		$('.mp_date').blur(function(){
			var m_date=$(this).val();
			if(m_date==null||m_date==""){
				$('.smp_date').text(cuo+"日期不能为空").css({'color':"red",'font-size':'12px'});
				$('.smp_date').show();
				return false;
			}else{
				if(regex_date.test(m_date)){
					$.post("${pageContext.request.contextPath }/manager/check_date.action",{product_date:m_date},
							function(date){
						if(date.dtExsit){
							$('.smp_date').text(dui).css({'color':"green",'font-size':'12px'});
							$('.smp_date').show();
							return true;
						}else{
							$('.smp_date').text(cuo+date.message).css({'color':"red",'font-size':'12px'});
							$('.smp_date').show();
							return false;
						}
					},"json");	
				}else{
					$('.smp_date').text(cuo+"请输入正确格式的日期").css({'color':"red",'font-size':'12px'});
					$('.smp_date').show();
					return false;
				}
				
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
	<input type="button" id="pd_insert" value="增加商品"/>
	<input type="text" id="putpd" placeholder="搜索 商品名/品牌" />
    <input type="button" id="putpdbut" value="搜索" />
 
  	<div id="b-left">
  	<input type="button" id="allline" value="所有商品"/><br/>
   	<input type="button" id="online" value="在售商品">
    <input type="button" id="offline" value="停售商品"/>
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
	<c:if test="${productlist.size()==0}">
	<span class="none">商品空空如也!</span>
	</c:if>
	<c:if test="${productlist.size()!=0}">
    <div id="u_tab">
    <table>
    	<tr>
    		<td class="pd_id">商品id</td>
    		<td class="pd_name">商品名</td>
    		<td class="pd_category">商品类别</td>
    		<td class="pd_img">图片</td>
    		<td class="pd_stock">库存</td>
    		<td class="pd_price">价格(元)</td>
    		<td class="pd_status">状态</td>
    		<td class="pd_itd">介绍</td>
    		<td class="pd_brand">品牌</td>
    		<td class="pd_date">上架日期</td>
    		<td class="operating">操作</td>
    	</tr>
    	<c:forEach items="${productlist}" var="pdlist">
    		<tr>
	    		<td class="pd_id">${pdlist.id }</td>
	    		<td class="pd_name">${pdlist.product_name }</td>
	    		<td class="pd_category">${pdlist.product_category }</td>
	    		<td class="pd_img"><img src="/pic/${pdlist.product_img }" id="pd_p" width=120 height=80/></td>
	    		<td class="pd_stock">${pdlist.product_stock }</td>
	    		<td class="pd_price">${pdlist.product_price }</td>
	    		<td class="pd_status">${pdlist.product_status }</td>
	    		<td class="pd_itd">${pdlist.product_itd }</td>
	    		<td class="pd_brand">${pdlist.product_brand }</td>
	    		<td class="pd_date"><fmt:formatDate value="${pdlist.product_date }" pattern="yyyy-MM-dd"/></td>
    			<c:if test="${pdlist.product_status=='在售' }">
    				<td class="operating"><input type="button" class="pd_ban" value="下架"/>
    					<input type="button" class="pd_up" value="修改"/>
    					<input type="button" class="pd_ware" value="入库"/>
    					
    				</td>
    			</c:if>
    			<c:if test="${pdlist.product_status=='停售' }">
    				<td class="operating">
    					<input type="button" class="pd_unblock" value="上架"/>
    					<input type="button" class="pd_up" value="修改"/>
    					<input type="button" class="pd_ware" value="入库"/>
    					
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
					<span>»</span>
				</a>
			</li>
		</ul>
	</nav>
	</c:if>
	</div>

</div></div>


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
    	<span>修改商品信息</span>
        <div id="j_hideFormLogin">x</div>
    </div>
    <form action="${pageContext.request.contextPath }/manager/update_product.action" method="post" enctype="multipart/form-data" id="mup_tab">
    <input type="text" id="mgp_id" name="id" style="display: none"/>
   	<table id="mp_tab">
   		<tr>
   			<td>商品id</td>
   			<td class="mp_id"></td>
   			<td class="sp"></td>
   		</tr>
   		<tr>
   			<td>商品名</td>
   			<td><input type="text" name="product_name" class="mp_name" maxlength="30"/></td>
   			<td class="sp"><span class="smp_name"></span></td>
   		</tr>
   		<tr>
   			<td>商品类别</td>
   			<td class="mp_category">
   			<select class="mp_cg" name="product_category">
   				<c:forEach items="${allist }" var="al">
   					<option value="${al.product_category }">${al.product_category }</option>
   				</c:forEach>
   			</select>
   			</td>
   			<td class="sp"><span class="smp_ctg"></span></td>
   		</tr>
   		<tr>
   			<td>商品图片</td>
   			<td class="mp_img">
				<img src="/pic/" class="sh_img" width=120 height=80/>
				<input type="file" class="jmp_img" name="pds_img"/>
			</td>
   			<td class="sp"></td>
   		</tr>
   		<tr>
   			<td>商品库存</td>
   			<td class="mp_stock"></td>
   			<td class="sp"></td>
   		</tr>
   		<tr>
   			<td>商品价格(元)</td>
   			<td><input type="text" name="product_price" class="mp_price"/></td>
   			<td class="sp"><span class="smp_price"></span></td>
   		</tr>
   		<tr>
   			<td>商品介绍</td>
   			<td><input type="text" name="product_itd" class="mp_itd" maxlength="50"/></td>
   			<td class="sp"><span class="smp_itd"></span></td>
   		</tr>
   		<tr>
   			<td>商品品牌</td>
   			<td><input type="text" name="product_brand" class="mp_brand" maxlength="20"/></td>
   			<td class="sp"><span class="smp_brand"></span></td>
   		</tr>
   		<tr>
   			<td>上架日期</td>
   			<td><input type="text" name="product_date" class="mp_date"/></td>
   			<td class="sp"><span class="smp_date"></span></td>
   		</tr>
   		<tr>
   			<td>商品状态</td>
   			<td class="mp_status"></td>
   			<td class="sp"></td>
   		</tr>
   		<tr>
   			<td colspan="2">
   			<input type="button" value="取消" class="mp_cancel"/>
    		<input type="button" value="确认" id="mp_confirm"/>
    		<input type="button" value="确认" id="in_confirm"/>
   			</td>
   			<td class="sp"></td>
   		</tr>
   	</table>
   	</form>
   	
   	<form action="${pageContext.request.contextPath }/manager/insert_receipt.action" method="post" enctype="multipart/form-data" id="mit_tab">
    <input type="text" id="mit_id" name="product_id" style="display: none"/>
    <input type="text" name="product_name" id="mit_name" style="display: none"/>
   	<table id="mpit_tab">
   		<tr>
   			<td>商品id</td>
   			<td class="mp_id"></td>
   			<td class="sp"></td>
   		</tr>
   		<tr>
   			<td>商品名</td>
   			<td class="mp_name"></td>
   			<td class="sp"></td>
   		</tr>
   		<tr>
   			<td>入库数量</td>
   			<td><input type="text" name="receipt_stock" id="mit_stock"/></td>
   			<td class="sp"><span class="smp_stock"></span></td>
   		</tr>
   		<tr>
   			<td>商品价格(元)</td>
   			<td id="xp"><input type="text" name="receipt_price" class="mp_price"/></td>
   			<td class="sp"><span class="smp_price"></span></td>
   		</tr>
   		<tr>
   			<td>总价格(元)</td>
   			<td class="mp_alprice"></td>
   			<td class="sp"></td>
   		</tr>
   		<tr>
   			<td colspan="2">
   			<input type="button" value="取消" class="mp_cancel"/>
    		<input type="button" value="确认" id="mit_confirm"/>
   			</td>
   			<td class="sp"></td>
   		</tr>
   	</table>
   	</form>
</div>

</body>
</html>