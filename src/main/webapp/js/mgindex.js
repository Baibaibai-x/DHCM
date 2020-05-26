/**
 * 
 */

$(function(){

		//退出登录
		$('#esc').click(function(){
			if(confirm("你确定要退出?")){
				$.session.clear();
				$(location).attr('href',"/DHCM/gomg.action");
			}else{
				return;
			}
			
		}); 
		
		//分页定位当前页
		function showWindowHref(){
			var sHref = window.location.href;
		    var args = sHref.split('?');
		    var arr = args[1].split('&');
		    var obj = {};
		    for(var i = 0;i< arr.length;i++){
		        var arg = arr[i].split('=');
		        obj[arg[0]] = arg[1];
		    }
		    return obj;
		}
		
		//鼠标移入事件
		$("#tab div").mouseenter(function(){
			$(this).children('ul').stop(true,false).slideDown(300);
		});
		//
		$("#tab div ul li").mouseenter(function(){
			$(this).css({
				'border':'#FFF solid 1px',
				'background':'#FC6'
			});
		});
		//鼠标移除事件
		$("#tab div").mouseleave(function(){
			$(this).children('ul').stop(true,false).slideUp(150);
		});
		$("#tab div ul li").mouseleave(function(){
			$(this).css({
				'border':'#CCC solid 1px',
				'background':'#FFF'
			});
		});
		
		//首页
		$('#index').click(function(){
			$(location).attr('href',"/DHCM/manager/mgindex.action?username="+""); 
		});
		
		//搜索
		$('#putbut').click(function(){
			var uname= $('#putseh').val();
			$(location).attr('href',"/DHCM/manager/mgindex.action?username="+uname);
		});
		
		//管理员管理
		$('#mg_mg').click(function(){
			$(location).attr('href',"/DHCM/manager/mgment.action?mg_name="+""); 
		});
		
		//用户管理
		$('#mg_user').click(function(){
			$('#index').click();
		});
		
		//商品管理
		$('#mg_product').click(function(){
			$(location).attr('href',"/DHCM/manager/product_mg.action");
		});
		
		//全选
		$('#s_all').click(function(){
			$('.sel input:checkbox').prop("checked",this.checked); 
		});
		
	
		
		//分页按钮
		$('ul.pagination li.disabled a').click(function(){
			return false;
		}); 
		$('ul.pagination a.disabled').mouseenter(function(){
		 		$(this).css({'cursor':'not-allowed'});
		}); 
		
		
		//个人信息管理
		$('#m_info').click(function(){
			console.log(11);
			var mgid=$.session.get('mgid');
			console.log(mgid);
			$(location).attr('href',"/DHCM/manager/mginfo.action?mg_id="+mgid);
				
		});
		
		//订单管理
		$('#mg_order').click(function(){
			$(location).attr('href',"/DHCM/manager/show_orders.action?oj="+"sc");
		});
		
		//入库单管理
		$('#mg_warehouse').click(function(){
			$(location).attr('href',"/DHCM/manager/show_receipt.action?rj="+"sc");
		});
		
		//数据统计
		$('#mg_statistics').click(function(){
			$(location).attr('href',"/DHCM/manager/statistics.action?tc="+"all");
		});
		
	});
onload=function(){
	if($.session.get('mgid')!=null){
		if($.session.get("level")!="最高权限"){
			$('#mg_mg').hide();
			$('.fh .u_password').text('*******');
		}else{
			$('#mg_mg').show();
		}
		$('#l_user').text($.session.get("level")+'管理员:'+$.session.get('mgid'));	
		return;
	}else{
		
		$(location).attr('href',"/DHCM/gomg.action");
	}
}