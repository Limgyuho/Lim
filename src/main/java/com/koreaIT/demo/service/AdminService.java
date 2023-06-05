package com.koreaIT.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koreaIT.demo.repository.AdminRepository;
import com.koreaIT.demo.vo.Admin;
import com.koreaIT.demo.vo.Suggestion;

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

	public void insertSuggestion(int applicantNumber, String items) {
		String[] itemArray = items.split(",");

		for (int i = 0; i < itemArray.length; i++) {
			adminRepository.insertSuggestion(applicantNumber, itemArray[i]);
		}

	}

	public List<Suggestion> getsuggestion() {
		return adminRepository.getSuggestion();
	}


	public void updateSuggestionPermission(int id, int permission, String reason) {
		adminRepository.updateSuggestionPermission(id,permission,reason);
		
	}
}