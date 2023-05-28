package com.koreaIT.demo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	private JoinRequestService joinRequestService;
	private MemberService memberService;
	private Rq rq;

	@Autowired
	public AdminController(AdminService adminService, MemberService memberService, Rq rq, JoinRequestService joinRequestService) {
		this.adminService = adminService;
		this.memberService = memberService;
		this.joinRequestService = joinRequestService;
		this.rq = rq;
	}
	
	
	@RequestMapping("/usr/admin/admin")
	public String showadmin() {
		return "usr/admin/admin";
	}
		

	//어드민 대시보드에서 가입요청자의 정보 가입 완료된 멤버정보 보기
	//각각의 정보회 탭에서의 페이지 처리와 키워드 검색

	@RequestMapping("/usr/admin/admindashboard")
	public String showadmindashboard(Model model,@RequestParam(defaultValue = "1") int boardId,
			@RequestParam(defaultValue = "1") int page, 
			@RequestParam(defaultValue = "General Affairs Division") String department,
			@RequestParam(defaultValue = "") String name) {
		
	
		int memberCnt = memberService.getMemberCnt();
		int joinRequestCnt = joinRequestService.joinRequestCnt();

		Member membersearch = memberService.getMembers(department, name);
		JoinRequest joinsearch = joinRequestService.getjoinrq(department, name);

		//가입 요청자 정보 조회
	
		List<JoinRequest> joinRequests = joinRequestService.getAllJoinRequestsInfo();
		model.addAttribute("joinRequests", joinRequests);
		model.addAttribute("department", department);
		model.addAttribute("memberCnt", memberCnt);
		model.addAttribute("name", name);
		

		
		// 가입 완료된 멤버 정보 조회
		List<Member> approvedMembers = memberService.getAllApprovedMembers(department, name);
		model.addAttribute("approvedMembers", approvedMembers);
		model.addAttribute("department", department);
		model.addAttribute("name", name);

		return "usr/admin/admindashboard";
	}


	@PostMapping("/usr/admin/approve")
	public String approveJoinRequest(@RequestParam("id") int id) {
		// 가입 요청 승인 처리
//		joinRequestService.approveJoinRequest(memberId);
		JoinRequest joinRequests = joinRequestService.getJoinRequestsInfo(id);

		memberService.insertMembertable(joinRequests.getRegDate(),
				joinRequests.getUpdateDate(),joinRequests.getLoginId(),
				joinRequests.getLoginPw(),joinRequests.getName(),
				joinRequests.getCellphoneNum(),joinRequests.getEmail(),joinRequests.getPermission(1),
				joinRequests.getDepartment(),joinRequests.getPosition());
		
		joinRequestService.deletejoinRequestsMember(joinRequests.getId());

		return "redirect:/usr/admin/admindashboard";
	}

	@PostMapping("/usr/admin/reject")
	public String rejectJoinRequest(@RequestParam("id") int id) {
		// 가입 요청 거부 처리

		JoinRequest joinRequests = joinRequestService.getJoinRequestsInfo(id);
		
		memberService.insertMembertable(joinRequests.getRegDate(),
				joinRequests.getUpdateDate(),joinRequests.getLoginId(),
				joinRequests.getLoginPw(),joinRequests.getName(),
				joinRequests.getCellphoneNum(),joinRequests.getEmail(),joinRequests.getPermission(),joinRequests.getDepartment(),joinRequests.getPosition());
		
		
		
		
		return "redirect:/usr/admin/admindashboard";
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

		return Util.jsReplace(Util.f("%s 회원님 환영합니다~!", member.getName()), "/usr/admin/admindashboard");
	}
}