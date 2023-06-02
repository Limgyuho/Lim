package com.koreaIT.demo.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koreaIT.demo.repository.AdminRepository;
import com.koreaIT.demo.vo.Admin;
import com.koreaIT.demo.vo.suggestion;@Service
public class AdminService {

	private AdminRepository adminRepository;

	@Autowired
	public AdminService(AdminRepository adminRepository) {
		this.adminRepository = adminRepository;
	}

	public Admin getAdminByLoginId(String loginId) {
		return adminRepository.getMemberByLoginId(loginId);
	}

	public List<suggestion> getsuggestion() {
		return adminRepository.getsuggestion();
	}

	public void insertSuggestion(String items, String reason) {
		String[] itemArray = items.split(",");
		
		for(int i = 0; i < itemArray.length; i++) {
			adminRepository.insertSuggestion(itemArray[i], reason);
		}
		
		
//	    if (items.size() > 0) {
//	        for (String item : items) {
//	            
//	        }
//	    }
	}
}