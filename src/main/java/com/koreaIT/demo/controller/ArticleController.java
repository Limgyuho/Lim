package com.koreaIT.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.koreaIT.demo.service.AdminService;
import com.koreaIT.demo.service.ArticleService;
import com.koreaIT.demo.service.BoardService;
import com.koreaIT.demo.service.JoinRequestService;
import com.koreaIT.demo.service.MemberService;
import com.koreaIT.demo.vo.Article;
import com.koreaIT.demo.vo.Board;
import com.koreaIT.demo.vo.Member;
import com.koreaIT.demo.vo.Rq;
import com.koreaIT.demo.vo.Suggestion;
import com.koreaIT.demo.vo.Vacation;

@Controller
public class ArticleController {

	private ArticleService articleService;
	private MemberService memberService;
	private AdminService adminService;
	private BoardService boardService;
	private Rq rq;

	@Autowired
	public ArticleController(ArticleService articleService, AdminService adminService, BoardService boardService,MemberService memberService,
			Rq rq, JoinRequestService joinRequestService) {
		this.memberService = memberService;
		this.adminService = adminService;
		this.boardService = boardService;
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
	public String showatransferdetail(Model model, @RequestParam(defaultValue = "1") int boardId,
			@RequestParam(defaultValue = "1") int page, 
			@RequestParam(defaultValue = "title") String searchKeywordType,
			@RequestParam(defaultValue = "") String searchKeyword) {
		
		if (page <= 0) {
			return rq.jsReturnOnView("페이지번호가 올바르지 않습니다", true);
		}

		Board board = boardService.getBoardById(boardId);

		if (board == null) {
			return rq.jsReturnOnView("존재하지 않는 게시판입니다", true);
		}

		int articlesCnt = articleService.getArticlesCnt(boardId, searchKeywordType, searchKeyword);

		int itemsInAPage = 10;

		int pagesCount = (int) Math.ceil((double) articlesCnt / itemsInAPage);

		List<Article> articles = articleService.getArticles(boardId, searchKeywordType, searchKeyword, itemsInAPage, page);

		model.addAttribute("pagesCount", pagesCount);
		model.addAttribute("page", page);
		model.addAttribute("articlesCnt", articlesCnt);
		model.addAttribute("articles", articles);
		model.addAttribute("board", board);
		model.addAttribute("searchKeyword", searchKeyword);
		model.addAttribute("searchKeywordType", searchKeywordType);

		
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

		//직급이 과장인
		List<Member> manager = memberService.manager();
		model.addAttribute("manager",manager);
		
		//휴가 신청한 기록 보기
		List<Vacation> showallVacation = memberService.showallVacation();
		model.addAttribute("showallVacation", showallVacation);

		
		
		return "/usr/article/leave";
	}

	// 휴가신청 넣기
	@RequestMapping("usr/article/leaveRequest")
	public String leave(Model model, String date, String vacationType1,String vacationType2) {
		
		System.out.println(vacationType1);
		
		int applicantNumber = rq.getLoginedMemberId();
		adminService.leaveRequest(applicantNumber, date, vacationType1,vacationType2);
		

		return "redirect:/usr/article/leave";
	}

	// 휴가신청 허가 거부
	@RequestMapping("usr/article/leaveAp")
	public String getLeaveMember(@RequestParam int id, @RequestParam int status) {
		
	  memberService.updateStatus(id, status);
	  
	  return "redirect:/usr/article/leave";
	}
	
	
	@RequestMapping("usr/article/departmentalData")
	public String departmentalData() {
		
	  
	  return "usr/article/departmentalData";
	}
	

}