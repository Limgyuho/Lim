package com.koreaIT.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koreaIT.demo.service.AdminService;
import com.koreaIT.demo.service.JoinRequestService;
import com.koreaIT.demo.service.MemberService;
import com.koreaIT.demo.util.Util;
import com.koreaIT.demo.vo.Admin;
import com.koreaIT.demo.vo.JoinRequest;
import com.koreaIT.demo.vo.Member;
import com.koreaIT.demo.vo.Rq;


@Controller
public class AdminController {

	private AdminService adminService;

	private MemberService memberService;
	private Rq rq;

	@Autowired
	public AdminController(AdminService adminService, MemberService memberService, Rq rq) {
		this.adminService = adminService;
		this.memberService = memberService;
		this.rq = rq;
	}

	
	
	@GetMapping
	@RequestMapping("/usr/admin/admindashboard")
	 public String showadmindashboard(Model model) {
	        // 가입 요청자 정보 조회
	        List<JoinRequest> joinRequests = JoinRequestService.getAllJoinRequests();
	        model.addAttribute("joinRequests", joinRequests);

	        // 가입 완료된 멤버 정보 조회
	        List<Member> approvedMembers = memberService.getAllApprovedMembers();
	        model.addAttribute("approvedMembers", approvedMembers);

	        return "usr/admin/admindashboard";
	    }
	
	
	 @PostMapping("/approve")
	    public String approveJoinRequest(@RequestParam("memberId") Long memberId) {
	        // 가입 요청 승인 처리
	        JoinRequestService.approveJoinRequest(memberId);
	        return "redirect:/admin/dashboard";
	    }
	 
	 
	 @PostMapping("/reject")
	    public String rejectJoinRequest(@RequestParam("memberId") Long memberId) {
	        // 가입 요청 거부 처리
	        JoinRequestService.rejectJoinRequest(memberId);
	        return "redirect:/admin/dashboard";
	    }
	

	@RequestMapping("/usr/admin/doLogin")
	@ResponseBody
	public String doLogin(String loginId, String loginPw) {

		if (Util.empty(loginId)) {
			return Util.jsHistoryBack("아이디를 입력해주세요");
		}
		if (Util.empty(loginPw)) {
			return Util.jsHistoryBack("비밀번호를 입력해주세요");
		}

		Admin member = adminService.getAdminByLoginId(loginId);

		if (member == null) {
			return Util.jsHistoryBack(Util.f("%s은(는) 존재하지 않는 아이디입니다", loginId));
		}

		if (member.getLoginPw().equals(loginPw) == false) {
			return Util.jsHistoryBack("비밀번호가 일치하지 않습니다");
		}

		rq.login(member);

		return Util.jsReplace(Util.f("%s 회원님 환영합니다~!", member.getName()), "/");
	}
}
