package com.koreaIT.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.koreaIT.demo.service.AdminService;
import com.koreaIT.demo.service.ArticleService;
import com.koreaIT.demo.service.JoinRequestService;
import com.koreaIT.demo.service.MemberService;
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
	public String leave(Model model) {

		int applicantnumber = rq.getLoginedMember().getId();

		//멤버 서비스 넣고
		//이게 아니지 병신아 보여지는 건 jsp 니까 씨태그 조건걸어서
		//포지션이 과장인 사람만 해당 div가 보이게 하고
		//컨트롤러 부분은 병시나 아래와 똑같이 보여 지는데 
		
		//본인이 신청한것만 
		List<Vacation> showVacation = memberService.showVacation(applicantnumber);
		model.addAttribute("showVacation", showVacation);
		
		//신청한 사람 전체 보기
	)

		return "/usr/article/leave";
	}
	//휴가 승인허가와 불가 메서드를 만들어야지
	//여기서 실제로 업데이트를 할수 있게 서비스로 넘기고
	//

	// 휴가신청 넣기
	@RequestMapping("usr/article/leaveRequest")
	public String leave(Model model, String date, String vacationType) {
		
		int applicantNumber = rq.getLoginedMemberId();
		adminService.leaveRequest(applicantNumber, date,vacationType);

		
		return "redirect:/usr/article/leave";
	}

}