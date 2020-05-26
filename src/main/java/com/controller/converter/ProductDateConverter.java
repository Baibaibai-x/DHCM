package com.controller.converter;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.core.convert.converter.Converter;


/**
 * 日期转换器
 * @author Administrator
 *
 */
public class ProductDateConverter implements Converter<String, Date>{
	@Override
	public Date convert(String source) {
		// 将日期串转成日期类型（格式是yyyy-MM-dd）
		//System.out.println("这是什么"+source);
		//成功直接返回
		//System.out.println(simpleDateFormat.parse(source));//转为
		//System.err.println(java.sql.Date.valueOf(source));
		return java.sql.Date.valueOf(source);
		
	}

}

/*public class ProductDateConverter implements Converter<Date, Date>{
	@Override
	public Date convert(Date source) {
		// 将日期串转成日期类型（格式是yyyy-MM-dd）
		
		SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd"); 
		String stringdate=simpleDateFormat.format(source);
		try {
			//成功直接返回
			return simpleDateFormat.parse(stringdate);
		} catch (ParseException e) {
			e.getStackTrace();
		}
		//如果参数绑定失败返回null
		return null;
		
	}


}*/
