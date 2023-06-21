package com.koreaIT.demo.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.koreaIT.demo.interceptor.BeforeActionInterceptor;
import com.koreaIT.demo.interceptor.NeedLoginInterceptor;
import com.koreaIT.demo.interceptor.NeedLogoutInterceptor;


@Configuration
public class MyWebMvcConfigurer implements WebMvcConfigurer {

	private BeforeActionInterceptor beforeActionInterceptor;
	private NeedLoginInterceptor needLoginInterceptor;
	private NeedLogoutInterceptor needLogoutInterceptor;

	@Autowired
	public MyWebMvcConfigurer(BeforeActionInterceptor beforeActionInterceptor,
	NeedLoginInterceptor needLoginInterceptor, NeedLogoutInterceptor needLogoutInterceptor) {
	this.beforeActionInterceptor = beforeActionInterceptor;
	this.needLoginInterceptor = needLoginInterceptor;
	this.needLogoutInterceptor = needLogoutInterceptor;
}
	

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		
		InterceptorRegistration ir;
		

		
		ir = registry.addInterceptor(beforeActionInterceptor);
		ir.addPathPatterns("/**");
		ir.addPathPatterns("/favicon.ico");
		ir.excludePathPatterns("/resource/**");
		

		ir = registry.addInterceptor(needLoginInterceptor);	
		ir.addPathPatterns("/usr/home/main");
		ir.addPathPatterns("/usr/member/doLogout");
		ir.addPathPatterns("/usr/article/suggestion");
		ir.addPathPatterns("/usr/article/transferList");
		ir.addPathPatterns("/usr/article/departmentalData");
		ir.addPathPatterns("/usr/article/program");
		ir.addPathPatterns("/usr/article/program");
		ir.addPathPatterns("/usr/article/leave");
		ir.addPathPatterns("/usr/article/bus");
		ir.addPathPatterns("/usr/article/cafeteria");
		ir.addPathPatterns("/usr/article/cafeteria");
		ir.addPathPatterns("/usr/article/organization");
		ir.addPathPatterns("/usr/article/organization");
		ir.addPathPatterns("/usr/article/garden");
		
//		
		
	}

}