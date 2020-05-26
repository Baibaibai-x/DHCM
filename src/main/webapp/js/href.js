/**
 * 
 */
(function($){
	$.href={
		//分页定位当前页
		showWindowHref:function(Href){
			var sHref = Href;
		    var args = sHref.split('?');
		    console.log(args);
		    if(args.length==1){
		    	 var obj = {};
		    	 return obj;
		    }else{
		    	var arr = args[1].split('&');
			    
			    var obj = {};
			    for(var i = 0;i< arr.length;i++){
			        var arg = arr[i].split('=');
			        obj[arg[0]] = arg[1];
			    }
			    return obj;
		    }
		    
		}
	}
})(jQuery);
