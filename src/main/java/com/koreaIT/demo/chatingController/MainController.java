package com.koreaIT.demo.chatingController;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {
	
	@RequestMapping("/usr/chat/chat")
	public String chat() {
		
		return "usr/chat/chat";
	}
}