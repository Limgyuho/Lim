//package com.koreaIT.demo.controller;
//
//import java.util.List;
//
//import javax.servlet.http.HttpServletRequest;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PostMapping;
//
//import com.koreaIT.demo.repository.JoinRequestRepository;
//import com.koreaIT.demo.vo.JoinRequest;
//
//// ...
//
//public class AdminDashboardController {
//
//
//	@GetMapping("/admin/dashboard")
//	public String adminDashboard(HttpServletRequest request) {
//	    List<RegistrationRequest> requests = registrationRequestRepository.findAll();
//	    request.setAttribute("requests", requests);
//	    return "admin_dashboard";
//	}
//
//	@PostMapping("/admin/approve")
//	public String approveRegistration(HttpServletRequest request) {
//	    Long requestId = Long.valueOf(request.getParameter("requestId"));
//	    RegistrationRequest request = registrationRequestRepository.findById(requestId).orElse(null);
//	    if (request != null) {
//	        userService.approveRegistration(request);
//	        registrationRequestRepository.deleteById(requestId);
//	    }
//	    return "redirect:/admin/dashboard";
//	}
//
//	@PostMapping("/admin/reject")
//	public String rejectRegistration(HttpServletRequest request) {
//	    Long requestId = Long.valueOf(request.getParameter("requestId"));
//	    registrationRequestRepository.deleteById(requestId);
//	    return "redirect:/admin/dashboard";
//	}
//}