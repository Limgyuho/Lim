package com.koreaIT.demo.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.koreaIT.demo.repository.AdminRepository;
import com.koreaIT.demo.util.Util;
import com.koreaIT.demo.vo.Admin;
import com.koreaIT.demo.vo.ResultData;

public class AdminService {

	private AdminRepository adminRepository;

	public Admin getAdminByLoginId(String loginId) {
		return adminRepository.getMemberByLoginId(loginId);
	}
	
}
