package com.koreaIT.demo.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.koreaIT.demo.service.AdminService;
import com.koreaIT.demo.service.ArticleService;
import com.koreaIT.demo.service.BoardService;
import com.koreaIT.demo.service.FileService;
import com.koreaIT.demo.service.JoinRequestService;
import com.koreaIT.demo.service.MemberService;
import com.koreaIT.demo.vo.FileDP;
import com.koreaIT.demo.vo.Member;
import com.koreaIT.demo.vo.Rq;
import com.koreaIT.demo.vo.Suggestion;
import com.koreaIT.demo.vo.Vacation;

@Controller
public class ArticleController {

	private FileService fileService;
	private MemberService memberService;
	private AdminService adminService;
	private Rq rq;

	@Autowired
	public ArticleController(FileService fileService, ArticleService articleService, AdminService adminService,
			BoardService boardService, MemberService memberService, Rq rq, JoinRequestService joinRequestService) {
		this.memberService = memberService;
		this.adminService = adminService;
		this.fileService = fileService;
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

	// 해당 멤버의 인사이동 내용
	@RequestMapping("/usr/article/transferdetail")
	public String showTransferDetail(@RequestParam("memberId") int memberId, Model model) {

	    Member member = memberService.getMemberById(memberId);
	    
	    model.addAttribute("member", member);
	    
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

		// 본인이 신청한것만
		List<Vacation> showVacation = memberService.showVacation(applicantnumber);
		model.addAttribute("showVacation", showVacation);

		// 직급이 과장인
		List<Member> manager = memberService.manager();
		model.addAttribute("manager", manager);

		// 휴가 신청한 기록 보기
		List<Vacation> showallVacation = memberService.showallVacation();
		model.addAttribute("showallVacation", showallVacation);

		return "/usr/article/leave";
	}

	// 휴가신청 넣기
	@RequestMapping("usr/article/leaveRequest")
	public String leave(Model model, String date, String vacationType1, String vacationType2) {

		System.out.println(vacationType1);

		int applicantNumber = rq.getLoginedMemberId();
		adminService.leaveRequest(applicantNumber, date, vacationType1, vacationType2);

		return "redirect:/usr/article/leave";
	}

	// 휴가신청 허가 거부
	@RequestMapping("usr/article/leaveAp")
	public String getLeaveMember(@RequestParam int id, @RequestParam int status) {

		memberService.updateStatus(id, status);

		return "redirect:/usr/article/leave";
	}

	@RequestMapping("usr/article/departmentalData")
	public String departmentalData(Model model) {

		List<FileDP> files2 = fileService.getFileDPByDpn();
		model.addAttribute("files2", files2);

		return "usr/article/departmentalData";
	}

	@RequestMapping("/usr/article/upload2")
	@ResponseBody
	public String uploadFile(@RequestParam("file2") MultipartFile file2, @RequestParam("dpn") String dpn) {

		try {
			fileService.saveFileDP(file2, dpn);
		} catch (IOException e) {
			e.printStackTrace();
			return "파일 업로드 실패";
		}

		return "파일 업로드 성공";
	}

	@RequestMapping("/usr/article/file2/{fileId}")
	@ResponseBody
	public ResponseEntity<Resource> downloadFile(@PathVariable("fileId") int fileId) throws IOException {

		FileDP FileDP = fileService.getFileDPeById(fileId);

		Resource resource = new FileSystemResource(FileDP.getSavedPath());

		return ResponseEntity.ok()
				.header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + resource.getFilename() + "\"")
				.body(resource);
	}

}