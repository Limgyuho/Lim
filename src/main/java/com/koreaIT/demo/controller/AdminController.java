package com.koreaIT.demo.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public AdminController(AdminService adminService ,MemberService memberService,Rq rq,
			JoinRequestService joinRequestService) {
		this.adminService = adminService;
		this.memberService = memberService;
		this.joinRequestService = joinRequestService;
		this.rq = rq;
	}

	@RequestMapping("/usr/admin/admin")
	public String showadmin() {
		return "usr/admin/admin";
	}

	// 어드민 대시보드에서 가입요청자의 정보 가입 완료된 멤버정보 보기
	// 각각의 정보회 탭에서의 페이지 처리와 키워드 검색
	// 
	@RequestMapping("/usr/admin/admindashboard")
	public String showadmindashboard(Model model, @RequestParam(defaultValue = "1") int boardId,
			@RequestParam(defaultValue = "1") int page, String department,
			@RequestParam(defaultValue = "") String name) {

		// 가입 요청자 정보 조회
		int joinRequestCnt = joinRequestService.joinRequestCnt();
		List<JoinRequest> getAllRequests = joinRequestService.getAllRequests(department, name);
		model.addAttribute("getAllRequests", getAllRequests);
		model.addAttribute("joinRequestCnt", joinRequestCnt);


		// 가입 완료된 멤버 정보 조회
		int memberCnt = memberService.getMemberCnt();
		List<Member> getAllApprovedMembers = memberService.getAllApprovedMembers(department, name);	
		model.addAttribute("getAllApprovedMembers", getAllApprovedMembers);
		model.addAttribute("memberCnt", memberCnt);

		return "usr/admin/admindashboard";
	}

	//겟과 포트스방식 즉 쿼리 스트링으로 사용경우 @RequestMapping으로 사용해야 한다
	//겟 메소드가 존재하디 않는다라는 메세지가 나올경우.....
	@RequestMapping("/usr/admin/approve")
	public String approveJoinRequest(int id, int permission) {
		JoinRequest joinRequests = joinRequestService.getJoinRequestsInfo(id);

		
		memberService.insertMembertable(joinRequests.getRegDate(), joinRequests.getUpdateDate(),
				joinRequests.getLoginId(), joinRequests.getLoginPw(), joinRequests.getName(),
				joinRequests.getCellphoneNum(), joinRequests.getEmail(), permission,
				joinRequests.getDepartment(), joinRequests.getPosition());
		
		
		joinRequestService.deletejoinRequestsMember(id);
		

		return "redirect:/usr/admin/admindashboard";
	}
	
	@RequestMapping("/usr/admin/Reapproval")
	public String Reapproval() {
		
		memberService.updatePermission();	
		
		return "redirect:/usr/admin/admindashboard";
	}
	

	@RequestMapping("/usr/admin/transferList")
	public String transferList() {
			
		return "/usr/admin/transferList";
	}
	

	@RequestMapping("/usr/admin/transfer")
	public String transfer(Model model, String loginId) {
		
		Member searchMember = memberService.searchMember(loginId);
		model.addAttribute("searchMember",searchMember);
		
		
//		memberService.memberTransfer(loginId,department,position);
//		model.addAttribute("memberTransfer");
		
		return "/usr/admin/transfer";
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