package com.koreaIT.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.koreaIT.demo.service.AdminService;
import com.koreaIT.demo.service.ArticleService;
import com.koreaIT.demo.service.BoardService;
import com.koreaIT.demo.service.JoinRequestService;
import com.koreaIT.demo.service.MemberService;
import com.koreaIT.demo.vo.Rq;

@Controller
public class HomeContoller {
	
	
	private MemberService memberService;
	
	@Autowired
	public HomeContoller(MemberService memberService) {

		this.memberService = memberService;

	}
	
	
	@RequestMapping("/usr/home/home")
	public String showMain() {
		return "usr/home/home";
	}
//	@RequestMapping("/")
//	public String showRoot() {
//		return "redirect:/usr/home/main";
//	}	
	@RequestMapping("/usr/home/popUp")
	public String showPopUp() {
		return "/usr/home/popUp";
	}
	

	@RequestMapping("/usr/home/main")
	public String showmain() {
		
		
		
		return "usr/home/main";
	}


}