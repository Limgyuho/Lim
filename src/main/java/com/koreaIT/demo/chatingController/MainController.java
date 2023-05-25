package com.koreaIT.demo.chatingController;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.koreaIT.demo.service.AdminService;
import com.koreaIT.demo.service.JoinRequestService;
import com.koreaIT.demo.service.MemberService;
import com.koreaIT.demo.vo.JoinRequest;
import com.koreaIT.demo.vo.Member;
import com.koreaIT.demo.vo.Rq;

@Controller
public class MainController {
	

	private MemberService memberService;
	private Rq rq;

	@Autowired
	public MainController(MemberService memberService, Rq rq) {
		this.memberService = memberService;
		this.rq = rq;
	}
	
	
	 
	@RequestMapping("/usr/chat/chat")
	public String chat() {
		
		return "usr/chat/chat";
	}
	
	@RequestMapping("/usr/chat/chatmember")
	public String showachatmember(Model model) {	
		// 가입 완료된 멤버 정보 조회
		List<Member> approvedMembers = memberService.getAllApprovedMembers();
		model.addAttribute("approvedMembers", approvedMembers);

		return "usr/chat/chatmember";
	}
}