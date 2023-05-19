//package com.koreaIT.demo.controller;
//
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PostMapping;
//
//@Controller
//public class AdminDashboardController {
//    private List<RegistrationRequest> registrationRequests = new ArrayList<>();
//    private List<User> approvedUsers = new ArrayList<>();
//
//    @GetMapping("/admin/dashboard")
//    public String adminDashboard(Model model) {
//        model.addAttribute("registrationRequests", registrationRequests);
//        return "admin-dashboard";
//    }
//
//    @PostMapping("/admin/approve")
//    public String approveRegistration(@RequestParam("requestId") int requestId) {
//        // requestId에 해당하는 회원가입 요청을 승인하고, 회원가입 완료 처리
//        RegistrationRequest request = findRequestById(requestId);
//        if (request != null) {
//            User newUser = createUserFromRequest(request);
//            approvedUsers.add(newUser);
//            registrationRequests.remove(request);
//        }
//        return "redirect:/admin/dashboard";
//    }
//
//    @PostMapping("/admin/reject")
//    public String rejectRegistration(@RequestParam("requestId") int requestId) {
//        // requestId에 해당하는 회원가입 요청을 거절 처리
//        RegistrationRequest request = findRequestById(requestId);
//        if (request != null) {
//            registrationRequests.remove(request);
//        }
//        return "redirect:/admin/dashboard";
//    }
//
//    private RegistrationRequest findRequestById(int requestId) {
//        for (RegistrationRequest request : registrationRequests) {
//            if (request.getId() == requestId) {
//                return request;
//            }
//        }
//        return null;
//    }
//
//    private User createUserFromRequest(RegistrationRequest request) {
//        User newUser = new User();
//        newUser.setUsername(request.getUsername());
//        newUser.setPassword(request.getPassword());
//        newUser.setName(request.getName());
//        newUser.setEmail(request.getEmail());
//        newUser.setPhone(request.getPhone());
//        return newUser;
//    }
//}
//
//	