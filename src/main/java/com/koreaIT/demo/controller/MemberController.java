package com.koreaIT.demo.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.koreaIT.demo.service.JoinRequestService;
import com.koreaIT.demo.service.MemberService;
import com.koreaIT.demo.util.Util;
import com.koreaIT.demo.vo.Member;
import com.koreaIT.demo.vo.ResultData;
import com.koreaIT.demo.vo.Rq;

@Controller
public class MemberController {

	private MemberService memberService;
	private JoinRequestService joinRequestService;
	private Rq rq;

	@Autowired
	public MemberController(MemberService memberService, JoinRequestService joinRequestService, Rq rq) {
		this.memberService = memberService;
		this.joinRequestService = joinRequestService;
		this.rq = rq;
	}

	@RequestMapping("/usr/member/myPage")
	public String myPage() {
		return "usr/member/myPage";
	}

	@RequestMapping("/usr/member/memberModify")
	public String memberModify() {
		return "usr/member/memberModify";
	}

	// 회원가입승은을 받은 사람들....
	@RequestMapping("/usr/home/doLogin")
	@ResponseBody
	public String doLogin(String loginId, String loginPw) {

		if (Util.empty(loginId)) {
			return Util.jsHistoryBack("아이디를 입력해주세요");
		}
		if (Util.empty(loginPw)) {
			return Util.jsHistoryBack("비밀번호를 입력해주세요");
		}

		Member member = memberService.getMemberByLoginId(loginId);

		if (member == null) {
			return Util.jsHistoryBack(Util.f("%s은(는) 존재하지 않는 아이디입니다", loginId));
		}

		if (member.getLoginPw().equals(loginPw) == false) {
			return Util.jsHistoryBack("비밀번호가 일치하지 않습니다");
		}

		if (member.Permission != 1) {
			return Util.jsHistoryBack("가입이 거절 되었습니다 내선 번호로 문의 주세요");
		}

		rq.login(member);

		return Util.jsReplace(Util.f("%s 회원님 환영합니다~!", member.getName()), "/usr/home/access");
	}

	// 회원가입요청자들.....
	@RequestMapping("/usr/member/join")
	public String join() {
		return "usr/member/join";
	}

	// 회원가입요청 폼....
	@RequestMapping("/usr/member/dojoin")
	@ResponseBody
	public String doJoin(String loginId, String loginPw, String name, String cellphoneNum, String email,
			String department, String position) {

		if (Util.empty(loginId)) {
			return Util.jsHistoryBack("아이디를 입력해주세요");
		}
		if (Util.empty(loginPw)) {
			return Util.jsHistoryBack("비밀번호를 입력해주세요");
		}
		if (Util.empty(name)) {
			return Util.jsHistoryBack("이름을 입력해주세요");
		}

		if (Util.empty(cellphoneNum)) {
			return Util.jsHistoryBack("전화번호를 입력해주세요");
		}
		if (Util.empty(email)) {
			return Util.jsHistoryBack("이메일을 입력해주세요");
		}

		// 회원가입 정보들을 joinRequest에 넣어두고 저장하여 멤버테이블에 넣기 위함
		ResultData<Integer> doJoinRd = joinRequestService.doJoin(loginId, loginPw, name, cellphoneNum, email,
				department, position);

		// 메세지
		if (doJoinRd.isFail()) {
			return Util.jsHistoryBack(doJoinRd.getMsg());
		}

		return Util.jsReplace(doJoinRd.getMsg(), "/usr/home/home");
	}

	@RequestMapping("/usr/member/doModify")
	@ResponseBody
	public String doModify(String nickname, String cellphoneNum, String email) {

		if (Util.empty(cellphoneNum)) {
			return Util.jsHistoryBack("전화번호를 입력해주세요");
		}

		if (Util.empty(email)) {
			return Util.jsHistoryBack("이메일을 입력해주세요");
		}

		memberService.doModify(rq.getLoginedMemberId(), nickname, cellphoneNum, email);

		return Util.jsReplace("회원정보가 수정되었습니다", "memberModify");
	}

	// 회원가입 요청자들 정보 확인...
	@RequestMapping("/usr/member/loginIdDupCheck")
	@ResponseBody
	public ResultData loginIdDupCheck(String loginId) {

		if (Util.empty(loginId)) {
			return ResultData.from("F-1", "아이디를 입력해주세요");
		}

		Member member = memberService.getMemberByLoginId(loginId);

		if (member != null) {
			return ResultData.from("F-2", "이미 사용중인 아이디입니다", "loginId", loginId);
		}

		return ResultData.from("S-1", "사용 가능한 아이디입니다", "loginId", loginId);
	}

	@RequestMapping("/usr/member/doLogout")
	public String doLogout(HttpSession httpSession, HttpServletRequest request) {
		if (httpSession.getAttribute("loginedMemberId") == null) {
			return rq.jsReturnOnView("로그인 후 이용해주세요", true);
		}

		int memberId = rq.getLoginedMember().getId();
		LocalDateTime now = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		String formattedDateTime = now.format(formatter);

	        memberService.updatelastaccess(memberId, formattedDateTime);
	
		
		
		httpSession.removeAttribute("loginedMemberId");

		return "redirect:/usr/home/home";
	}

}