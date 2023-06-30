package com.koreaIT.demo.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.koreaIT.demo.service.FileService;
import com.koreaIT.demo.service.MemberService;
import com.koreaIT.demo.vo.Accestime;
import com.koreaIT.demo.vo.FileVO;
import com.koreaIT.demo.vo.Member;
import com.koreaIT.demo.vo.Rq;
import com.koreaIT.demo.vo.Suggestion;
import com.koreaIT.demo.vo.Vacation;

@Controller
public class HomeContoller {

	private FileService fileService;
	private MemberService memberService;
	private Rq rq;

	@Autowired
	public HomeContoller(FileService fileService, MemberService memberService, Rq rq) {
		this.memberService = memberService;
		this.fileService = fileService;
		this.rq = rq;
	}	

	@RequestMapping("/usr/home/home")
	public String showMain() {

		return "usr/home/home";
	}

	@RequestMapping("/usr/home/access")
	public String showaccess(Model model) {
		rq.getLoginedMember().getId();		
		
		return "usr/home/access";
	}

	@RequestMapping("/usr/home/gomain")
	public String redirectToMain() {
	    int memberId = rq.getLoginedMember().getId();
	    LocalDateTime now = LocalDateTime.now();
	    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
	    String formattedDateTime = now.format(formatter);

	    System.out.println(memberId);
	    System.out.println(formattedDateTime);

	    memberService.isExistingRecord(memberId);
	
	

	    
	        memberService.insertaccestime(memberId, formattedDateTime);

	    return "redirect:/usr/home/main";
	}


	@RequestMapping("/usr/home/popUp")
	public String showPopUp() {

		return "/usr/home/popUp";
	}

	@RequestMapping("/usr/home/main")
	public String showmain(Model model) {
		int applicantnumber = rq.getLoginedMember().getId();

		// 가입 완료된 멤버 정보 조회 한것을 div 안에 보여주기
		List<Member> approvedMembers = memberService.approvedMembersMain();
		model.addAttribute("approvedMembers", approvedMembers);

		// 건의 요청사항 div 안에 보여주기 다운로드 버튼이 같이 있어야 하는가?
		List<Suggestion> showsuggestion = memberService.showsuggestionMain(applicantnumber);
		model.addAttribute("showsuggestion", showsuggestion);

		// 필수 프로그램 div 안에 보여주기 다운로드 버튼이 같이 있어야 하는가?
		// 다운로드 버튼이 있으면 필수 프로그램 페이지가 존재?이유가 있어야 하나
		// div 안에는 몇개 안보여 지니까 있어도 상관이 없나?
		List<FileVO> files = fileService.getFilesMain();
		model.addAttribute("files", files);

		// 건의/요청사항 div 안에 보여주기 그런데 신청한 목록들만 보여주기 허가 여부와 함께
		// 여부는 무조건 보여줘야 할것 같긴한데
		// 본인이 신청한것만

		List<Vacation> showVacation = memberService.showVacationMain(applicantnumber);
		model.addAttribute("showVacation", showVacation);

		return "/usr/home/main";

	}

}