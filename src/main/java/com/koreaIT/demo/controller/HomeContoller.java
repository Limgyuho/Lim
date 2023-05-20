package com.koreaIT.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeContoller {
	@RequestMapping("/usr/home/home")
	public String showMain() {
		return "usr/home/home";
	}
//	@RequestMapping("/")
//	public String showRoot() {
//		return "redirect:/usr/home/main";
//	}	
	
	@RequestMapping("/usr/home/admin")
	public String showadmin() {
		return "usr/home/admin";
	}
	
	@RequestMapping("/usr/home/admindashboard")
	public String showadmindashboard() {
		return "usr/home/admindashboard";
	}
	
	

	@RequestMapping("/usr/home/main")
	public String showmain() {
		return "usr/home/main";
	}


}
