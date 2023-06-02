package com.koreaIT.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koreaIT.demo.repository.AdminRepository;
import com.koreaIT.demo.vo.Admin;
import com.koreaIT.demo.vo.suggestion;


@Service	
public class AdminService {

	private AdminRepository adminRepository;
		
	@Autowired
	public AdminService(AdminRepository adminRepository) {
		this.adminRepository = adminRepository;
	}


	public Admin getAdminByLoginId(String loginId) {
		return adminRepository.getMemberByLoginId(loginId);
	}


	public List<suggestion> suggestion(String item) {
		return adminRepository.getsuggestion(item);
	}


	
}