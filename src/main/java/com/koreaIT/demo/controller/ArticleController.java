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
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

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

	@RequestMapping("/usr/article/cafeteria")
	public String showsCafeteria(Model model) {
		
		LocalDate currentDate = LocalDate.now();
		int dayOfMonth = currentDate.getDayOfMonth();
		
		// 리스트를 만들어 리스트에 직접 값들을 넣어주고
		List<String> riceList = new ArrayList<>();
		riceList.add("현미밥");
		riceList.add("잡곡밥");
		riceList.add("흰쌀밥");

		// 리스트를 만들어 리스트에 직접 값들을 넣어주고
		List<String> soupList = new ArrayList<>();
		soupList.add("된장국");
		soupList.add("김치찌개");
		soupList.add("육개장");

		// 리스트를 만들어 리스트에 직접 값들을 넣어주고
		List<String> sideDish1List = new ArrayList<>();
		sideDish1List.add("제육볶음");
		sideDish1List.add("소불고기");
		sideDish1List.add("춘천닭갈비");

		// 리스트를 만들어 리스트에 직접 값들을 넣어주고
		List<String> sideDish2List = new ArrayList<>();
		sideDish2List.add("김치");
		sideDish2List.add("김");
		sideDish2List.add("장조림");

		// 리스트를 만들어 리스트에 직접 값들을 넣어주고
		List<String> sideDish3List = new ArrayList<>();
		sideDish3List.add("상추,깻잎,쌈장");
		sideDish3List.add("요거트");
		sideDish3List.add("아이스크림");

		// 변수를 만들어 들어 있는 리스트를 값으로 넣어 준다
		String rice = getRandomMenu(riceList, dayOfMonth);
		String soup = getRandomMenu(soupList, dayOfMonth);
		String sideDish1 = getRandomMenu(sideDish1List, dayOfMonth);
		String sideDish2 = getRandomMenu(sideDish2List, dayOfMonth);
		String sideDish3 = getRandomMenu(sideDish3List, dayOfMonth);

		// 넣어준것은 화면에 보여주기 위해 모델로 추가한다
		model.addAttribute("date", currentDate.toString());
		model.addAttribute("rice", rice);
		model.addAttribute("soup", soup);
		model.addAttribute("sideDish1", sideDish1);
		model.addAttribute("sideDish2", sideDish2);
		model.addAttribute("sideDish3", sideDish3);
		
		
		return "usr/article/cafeteria";
	}

	// 랜덤 뽑기 자바에서 랜덤으로 수를 뽀는것은 두가지의 방법이 있다
	// 1.Random 클래스 사용
	// 2.Math.random()
	// 1. Random 클래스는 int, long, float, double, boolean type의 난수를 얻을 수 있지만
	// Math.random()은 0.0에서 1사이의 난수를 얻습니다.
	//2. Random 클래스는 seed를 설정 할 수 있지만 Math.random()은 현재시간으로 seed가 고정되어있습니다.
	// - seed란 난수를 만드는 알고리즘에 사용되는 값으로 seed가 같으면 같은 난수를 생성합니다.
	private String getRandomMenu(List<String> menuList, int seed) {
		
		System.out.println(seed);
		//random 객체를 생성해줍니다.
		Random random = new Random(seed);
		
//		random.nextInt(4); // 0 ~ 3 까지의 무작위 int 값 리턴
//		random.nextInt(10); // 0 ~ 9 까지의 무작위 int 값 리턴 
//		random.nextInt(100); // 0 ~ 99 까지의 무작위 int 값 리턴 
//		random.nextInt(4)+1; // 1 ~ 4 까지의 무작위 int 값 리턴 
//		random.nextInt(4)+100; // 101 ~ 104 까지의 무작위 int 값 리턴		
		int randomIndex = random.nextInt(menuList.size());
		
		//리턴값에 멤버리스트에 겟으로 가져와서 보여준다
		return menuList.get(randomIndex);
	}

	@RequestMapping("/usr/article/bus")
	public String showschedule() {

		return "usr/article/bus";
	}

	@RequestMapping("/usr/article/ministry")
	public String showministry() {

		return "usr/article/ministry";
	}

	@RequestMapping("/usr/article/organization")
	public String showorganization(Model model) {

		List<Member> approvedMembers = memberService.approvedMembers();

		model.addAttribute("approvedMembers", approvedMembers);

		return "usr/article/organization";
	}

	@RequestMapping("/usr/article/api")
	public String showapi() {

		return "usr/article/api";
	}

	@RequestMapping("/usr/article/transferList")
	public String showTransfer(@RequestParam(defaultValue = "1") int page, Model model) {
		int itemsPerPage = 10;
		int totalCount = memberService.getApprovedMembersCount();
		int totalPages = (int) Math.ceil((double) totalCount / itemsPerPage);

		if (page < 1 || page > totalPages) {
			page = 1;
		}

		int startItemIndex = (page - 1) * itemsPerPage;
		List<Member> approvedMembers = memberService.getTransferMembers(startItemIndex, itemsPerPage);

		model.addAttribute("approvedMembers", approvedMembers);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", totalPages);

		return "usr/article/transferList";
	}

	// 해당 멤버의 인사이동 내용
	@RequestMapping("/usr/article/transferdetail")
	public String showTransferDetail(@RequestParam("memberId") int memberId, Model model) {

		Member member = memberService.getMemberById(memberId);

		model.addAttribute("member", member);

		return "usr/article/transferdetail";
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

		return "redirect:/usr/article/suggestion";
	}

	// 휴가 신청 화면
	@RequestMapping("usr/article/leave")
	public String leave(Model model) {

		int applicantnumber = rq.getLoginedMember().getId();

		// 본인이 신청한것만
		List<Vacation> showVacation = memberService.showVacation(applicantnumber);
		model.addAttribute("showVacation", showVacation);

		// 직급이 과장인 사람 뽑아오기
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