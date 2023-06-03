package com.koreaIT.demo.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class HomeContoller {

	@RequestMapping("/usr/home/home")
	public String showMain() {
		return "usr/home/home";
	}

	@RequestMapping("/usr/home/popUp")
	public String showPopUp() {
		return "/usr/home/popUp";
	}
	

	@RequestMapping("/usr/home/main")
	public String showmain() {
		
		
		
		return "usr/home/main";
	}


}