package com.koreaIT.demo.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.koreaIT.demo.repository.AdminRepository;
import com.koreaIT.demo.util.Util;
import com.koreaIT.demo.vo.Admin;
import com.koreaIT.demo.vo.ResultData;

public class AdminService {

	private AdminRepository adminRepository;
	
	@Autowired
	public AdminService(AdminRepository adminRepository) {
		this.adminRepository = adminRepository;
	}
	
	
	public ResultData<Integer> doJoin(String loginId, String loginPw, String name, String cellphoneNum, String email) {

		Admin existsMember = getAdminByLoginId(loginId);
		
		if (existsMember != null) {
			return ResultData.from("F-7", Util.f("이미 사용중인 아이디(%s) 입니다", loginId));
		}
		
		
	
		
		adminRepository.doJoin(loginId, loginPw, name, cellphoneNum, email);
		
		return ResultData.from("S-1", Util.f("%s님, 가입승인 요청을 보냈습니다", loginId), "id", adminRepository.getLastInsertId());
	}
	


	public Admin getAdminByLoginId(String loginId) {
		return adminRepository.getAdminByLoginId(loginId);
	}
}
