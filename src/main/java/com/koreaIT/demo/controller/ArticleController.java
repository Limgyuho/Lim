package com.koreaIT.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.beans.factory.annotation.Autowired;
import com.koreaIT.demo.service.AdminService;
import com.koreaIT.demo.service.ArticleService;
import com.koreaIT.demo.service.BoardService;
import com.koreaIT.demo.service.JoinRequestService;
import com.koreaIT.demo.service.MemberService;
import com.koreaIT.demo.vo.Article;
import com.koreaIT.demo.vo.Board;
import com.koreaIT.demo.vo.JoinRequest;
import com.koreaIT.demo.vo.Member;
import com.koreaIT.demo.vo.Rq;

@Controller
public class ArticleController {
	
	private AdminService adminService;
	private JoinRequestService joinRequestService;
	private MemberService memberService;
	private ArticleService articleService;
	private BoardService boardService;
	private Rq rq;

	@Autowired
	public ArticleController(ArticleService articleService,BoardService boardService,AdminService adminService, MemberService memberService, Rq rq, JoinRequestService joinRequestService) {
		this.adminService = adminService;
		this.memberService = memberService;
		this.joinRequestService = joinRequestService;
		this.articleService = articleService;
		this.boardService = boardService;
		this.rq = rq;
	}
	

	
	@RequestMapping("/usr/article/noticelist")
	public String showList(Model model, @RequestParam(defaultValue = "1") int boardId,
			@RequestParam(defaultValue = "1") int page, 
			@RequestParam(defaultValue = "title") String searchKeywordType,
			@RequestParam(defaultValue = "") String searchKeyword) {

		if (page <= 0) {
			return rq.jsReturnOnView("페이지번호가 올바르지 않습니다", true);
		}

		Board board = boardService.getBoardById(boardId);

	

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

		return "usr/article/noticelist";
	}
	
	
	@RequestMapping("/usr/article/transfer")
	public String showadmindashboard(Model model) {

	
		// 가입 완료된 멤버 정보 조회
//		List<Member> approvedMembers = memberService.getAllApprovedMembers();
//		model.addAttribute("approvedMembers", approvedMembers);

		return "usr/article/transfer";
	}
}