package com.koreaIT.demo.chatingController;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.koreaIT.demo.service.MemberService;
import com.koreaIT.demo.vo.Member;
import com.koreaIT.demo.vo.Rq;

//@Controller는 사용자의 요청을 받기 위함이다
//오류창에 빈 관련 파라미터 관련이면 어노테이션을 확인해보자
@Controller
public class MainController {

	// 멤버 서비스의 의존성을 주입하기 위함이다
	// 서비스의 기능들을 가져다가 사용할수 있다
	// private은 해당 클래스에대해서만 사용을 하기 위함이며 캡슐화를 위함으다
	private MemberService memberService;
	private Rq rq;
	// rq 역시 마찬가지이다
	// rq는 로그인한 사람의 대한 정보를 가지고 있으며
	// 검증을 위해 존재 하며 조건에 부합하지 않을시 특정 메세지를 보여주기 위함이다

	// @Autowired의존성 주입을하기 위함이다
	@Autowired
	// 해당 컨트롤러에 위에서 주입한 멤버와 rq를 물고 있게 하기 위함이다
	public MainController(MemberService memberService, Rq rq) {
		this.memberService = memberService;
		this.rq = rq;
	}

	// 사용자가 요청한 맵핑 주소를 사용하기 위함이다s
	// 채팅을 하기 휘함의 매서드이다
	@RequestMapping("/usr/chat/chat")
	public String chat(Model model, String department, String name, HttpServletRequest request) {
	    Member loggedInMember = (Member) request.getSession().getAttribute("loggedInMember");
	    String userName = loggedInMember != null ? loggedInMember.getName() : "";
	    
	    List<Member> getAllApprovedMembers = memberService.getAllApprovedMembers(department, name);
	    model.addAttribute("getAllApprovedMembers", getAllApprovedMembers);
	    model.addAttribute("userName", userName);
	    
	    return "usr/chat/chat";
	}

	
	@RequestMapping("/getUserInfo")
    public String getUserInfo() {
        Member loggedInMember = rq.getLoginedMember();
        String userName = loggedInMember != null ? loggedInMember.getName() : "";
        return "{\"userName\":\"" + userName + "\"}";
    }
	
	// 부서들을 보여주는 화면 이다
	@RequestMapping("/usr/chat/department")
	// Model model은 메서드의 매개변수로 Model 객체를 받아올 수 있음을 의미한다
	// 모델은 데이터를 추가하고 전송하기 위함이다
	public String showdepartment(Model model) {
		return "usr/chat/department";
	}

	// 부서를 클릭시 부서에 해당하는 사람들의 정보를 보여주기 위함
	@RequestMapping("/usr/chat/members")

	public String members(Model model, @RequestParam(defaultValue = "department") String department) {

		List<Member> departmentMembers = memberService.getMembersByDepartment(department);

		model.addAttribute("departmentMembers", departmentMembers);


		return "usr/chat/members";
	}
}