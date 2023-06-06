package com.koreaIT.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.koreaIT.demo.service.AdminService;
import com.koreaIT.demo.service.ArticleService;
import com.koreaIT.demo.service.JoinRequestService;
import com.koreaIT.demo.service.MemberService;
import com.koreaIT.demo.vo.JoinRequest;
import com.koreaIT.demo.vo.Member;
import com.koreaIT.demo.vo.Rq;
import com.koreaIT.demo.vo.Suggestion;
import com.koreaIT.demo.vo.Vacation;

@Controller
public class ArticleController {

	private MemberService memberService;
	private AdminService adminService;
	private Rq rq;

	@Autowired
	public ArticleController(ArticleService articleService, AdminService adminService, MemberService memberService,
			Rq rq, JoinRequestService joinRequestService) {
		this.memberService = memberService;
		this.adminService = adminService;
		this.rq = rq;
	}

	// 인사이동 페이지
	@RequestMapping("/usr/article/transferList")
	public String showtransfer(Model model) {

		// 가입 완료된 멤버 정보 조회
		List<Member> approvedMembers = memberService.approvedMembers();
		model.addAttribute("approvedMembers", approvedMembers);

		return "usr/article/transferList";
	}

	// 인사이동 내용
	@RequestMapping("/usr/article/transferdetail")
	public String showatransferdetail(Model model) {

		// 가입 완료된 멤버 정보 조회
		List<Member> approvedMembers = memberService.approvedMembers();
		model.addAttribute("approvedMembers", approvedMembers);
		return "/usr/article/transferdetail";
	}

	// 요청 사항 선택 메서드
	@RequestMapping("/usr/article/suggestion")
	public String showsuggestion(Model model) {

		int applicantnumber = rq.getLoginedMember().getId();

		List<Suggestion> showsuggestion = memberService.showsuggestion(applicantnumber);
		model.addAttribute("showsuggestion", showsuggestion);

		return "usr/article/suggestion";
	}

	// 요청사항 테이블에 넣기
	@RequestMapping("/usr/article/insertSuggestion")
	public String insertSuggestion(Model model, String item) {
		int applicantNumber = rq.getLoginedMemberId();
		adminService.insertSuggestion(applicantNumber, item);

		return "usr/article/suggestion";
	}

	// 휴가 신청 화면
	@RequestMapping("usr/article/leave")
	public String leave(Model model ) {

		int applicantnumber = rq.getLoginedMember().getId();

		// 본인이 신청한것만
		List<Vacation> showVacation = memberService.showVacation(applicantnumber);
		model.addAttribute("showVacation", showVacation);

		// 신청한 사람 전체 보기
		List<Vacation> showallVacation = memberService.showallVacation();
		model.addAttribute("showallVacation", showallVacation);

		return "/usr/article/leave";
	}

	// 휴가신청 넣기
	@RequestMapping("usr/article/leaveRequest")
	public String leave(Model model, String date, String vacationType) {

		int applicantNumber = rq.getLoginedMemberId();
		adminService.leaveRequest(applicantNumber, date, vacationType);
		

		return "redirect:/usr/article/leave";
	}

	// 휴가신청 허가 거부
	@RequestMapping("usr/article/leaveAp")
	public String getLeaveMember(@RequestParam int id, @RequestParam int status) {
		
	  memberService.updateStatus(id, status);
	  
	  return "redirect:/usr/article/leave";
	}

}