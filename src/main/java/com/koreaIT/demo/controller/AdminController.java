package com.koreaIT.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koreaIT.demo.service.AdminService;
import com.koreaIT.demo.util.Util;
import com.koreaIT.demo.vo.Admin;
import com.koreaIT.demo.vo.Member;
import com.koreaIT.demo.vo.Rq;

public class AdminController {
	
	
	private AdminService adminService;
	private Rq rq;
	
	@Autowired
	public AdminController(AdminService adminService, Rq rq) {
		this.adminService = adminService;
		this.rq = rq;
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
