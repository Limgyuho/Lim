package com.koreaIT.demo.chatingController;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.koreaIT.demo.service.MemberService;
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

	@GetMapping("/usr/chat/chat/{id}")
	public String chat(@PathVariable int id, HttpSession session, Model model) {
	    // HttpSession을 사용하여 로그인한 사용자의 정보를 세션에 저장합니다.
	    session.setAttribute("userId", id);

	    // 사용자 ID를 기반으로 사용자 정보를 조회합니다.
	    int userId = (int) session.getAttribute("userId");
	    Member member = memberService.getMemberById(userId);

	    // 사용자 정보를 모델에 추가합니다.
	    model.addAttribute("member", member);

	    return "usr/chat/chat";
	}



	@GetMapping("/usr/chat/department")
	public String showDepartment() {
		return "usr/chat/department";
	}

	@RequestMapping("/usr/chat/members")
	public String showMembers(Model model, @RequestParam(defaultValue = "") String department) {
		List<Member> departmentMembers = memberService.getMembersByDepartment(department);
		model.addAttribute("departmentMembers", departmentMembers);
		return "usr/chat/members";
	}

	@RequestMapping("/getUserInfo")
	public String getUserInfo(Model model) {
		Member loggedInMember = rq.getLoginedMember();
		String userName = loggedInMember != null ? loggedInMember.getName() : "";
		model.addAttribute("userName", userName);
		return "jsonView";
	}
}
