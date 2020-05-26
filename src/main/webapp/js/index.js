/**
 * 
 */
$(function(){
		//点击登陆，遮罩层和添加数据层出现
		$('#u_login').click(function(){
			$('#j_formlogin').show();
			$('#j_mask').show();
		});		
		//关闭遮罩层和添加数据层
		$('#j_hideFormLogin').click(function(){
			$('#j_formlogin').hide();
			$('#j_mask').hide();
		});
		
		
		//清空按钮
		$('#j_btnreset').click(function(){
			$('#j_username').val("");
			$('#j_password').val("");
		});
		//登陆，提交数据验证
		$('#j_btnlogin').click(function(){
			var username=$('#j_username').val();//获取用户输入的账号
			var password=$('#j_password').val();//获取用户输入的密码
			if(username==""){
				alert("请输入账号");
				return;
			}
			if(password==""){
				alert("请输入密码");
				return;
			}
			//发送ajx请求
			$.post("/DHCM/login.action",{username:username,password:password},function(date){
				//判断userExsit的值是否为true			
				if(date.userExsit){
					if(date.u_status=="封禁"){
						alert("此账号已被封禁");
						$('#j_username').val("");
						$('#j_password').val("");
					}else{
						$('#j_username').val("");
						$('#j_password').val("");
						//用户名存在
						$('#login').hide();
						$('#regit').hide();
						$('#l_user').show();
						$('#u_esc').show();
						$.session.set('L_username', date.L_username);
						$.session.set("user_id", date.user_id);
						console.log($.session.get("user_id"));
						$('#l_user').text('当前用户:'+$.session.get('L_username'));
						
						
						//把添加数据面板和遮罩层隐藏起来
						$('#j_hideFormLogin').click();
					}
					
				}else{
					alert("账号密码错误或用户名不存在!");
					$('#j_username').val("");
					$('#j_password').val("");
				}
			},"json");
		});
		
		//注册，跳转注册页面
		$('.j_btnregit').click(function(){
			$(location).attr('href',"/DHCM/regitindex.action");
		});

		//退出登录
		$('#esc').click(function(){
			if(confirm("你确定要退出?")){
				$.session.clear();
				$('#login').show();
				$('#regit').show();
				$('.manager').show();
				$('#l_user').hide();
				$('#u_esc').hide();
				$(location).attr('href',"/DHCM/loginindex.action");
			}else{
				return;
			}
			
		}); 
		
		//点击商品查看商品详情
		$('.sp-a a').click(function(){
			var product_name=$(this).text();
			$(location).attr('href',"/DHCM/product/getOne.action?product_name="+product_name);
		});
		
		//
		$('.sp-img img').click(function(){
			var img_name=$(this).parent().parent().children(this).text();
			$(location).attr('href',"/DHCM/product/getOne.action?product_name="+img_name);
		});
		
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
			$(location).attr('href',"/DHCM/index.action"); 
		});
		
		//搜索
		$('#putbut').click(function(){
			var product_name= $('#putseh').val();
			$(location).attr('href',"/DHCM/search.action?product_name="+product_name);
		});
		
		//点击种类选择显示
		$("#tab a").click(function(){
			var temp = $(this).text();
			$(location).attr('href',"/DHCM/loginindex.action?product_category="+temp);
		});
		
		//分页按钮
		$('ul.pagination li.disabled a').click(function(){
			return false;
		}); 
		$('ul.pagination a.disabled').mouseenter(function(){
		 		$(this).css({'cursor':'not-allowed'});
		}); 
		
		
		//个人信息管理
		$('#m-info').click(function(){
			
			var username=$.session.get('L_username');
			
			$(location).attr('href',"/DHCM/info.action?username="+username);
				
		});
		
		//购物车
		$('#m-car').click(function(){
			var carid=$.session.get('user_id');
			if(carid!=null&&carid!=""){
				$(location).attr('href',"/DHCM/product/allcar.action?car_id="+carid);
			}else{
				alert("请登陆!");
				$(location).attr('href',"/DHCM/loginindex.action");
			}
		});
		
		//订单
		$('#m-order').click(function(){
			var usid=$.session.get('user_id');
			if(usid!=null&&usid!=""){
				$(location).attr('href',"/DHCM/order/show_all_order.action?id="+usid);
			}else{
				alert("请登陆!");
				$(location).attr('href',"/DHCM/loginindex.action");
			}
		});
			
	});
onload=function(){
	if($.session.get('L_username')!=null){
	    $('#login').hide();
		$('#regit,.manager').hide();
		$('#l_user').show();
		$('#u_esc').show(); 
		$('#l_user').text('当前用户:'+$.session.get('L_username'));	
		return;
	}else{
		$('#login').show();
		$('#regit,.manager').show();
		$('#l_user').hide();
		$('#u_esc').hide();	
		return;
	}
}