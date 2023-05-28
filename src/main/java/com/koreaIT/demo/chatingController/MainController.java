package com.koreaIT.demo.chatingController;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.SpringBootApplication;
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

	// 부서들을 보여주는 화면
	@RequestMapping("/usr/chat/department")
	public String showdepartment(Model model) {
		return "usr/chat/department";
	}

	// 각각의 부서를 클리시 오게 되는 컨트롤러
	// 여러개를 만들어야 하는지
	@RequestMapping("/usr/chat/members")
	public String members(Model model, @RequestParam(defaultValue = "department") String department) {

		List<Member> departmentMembers = memberService.getMembersByDepartment(department);
		model.addAttribute("departmentMembers", departmentMembers);

		return "usr/chat/members";
	}
}