package com.koreaIT.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koreaIT.demo.repository.JoinRequestRepository;
import com.koreaIT.demo.repository.MemberRepository;
import com.koreaIT.demo.util.Util;
import com.koreaIT.demo.vo.JoinRequest;
import com.koreaIT.demo.vo.Member;
import com.koreaIT.demo.vo.ResultData;
@Service
//회원가입 요청자들들의 대하 서비스
public class JoinRequestService {

	private static JoinRequestRepository joinRequestRepository;


	@Autowired
	public JoinRequestService(JoinRequestRepository joinRequestRepository  ) {
		this.joinRequestRepository = joinRequestRepository;

	}

	// 회원가입요청을한 사람들...정보
	public ResultData<Integer> doJoin(String loginId, String loginPw, String name, String cellphoneNum, String email) {
		Member existsMember = getJoinRequestByLoginId(loginId);

		if (existsMember != null) {
			return ResultData.from("F-7", Util.f("이미 사용중인 아이디(%s) 입니다", loginId));
		}

		existsMember = getJoinRequestByNameAndEmail(name, email);

		if (existsMember != null) {
			return ResultData.from("F-9", Util.f("이미 사용중인 이름(%s)과 이메일(%s) 입니다", name, email));
		}

		joinRequestRepository.doJoin(loginId, loginPw, name, cellphoneNum, email);

		return ResultData.from("S-1", Util.f("%s님, 가입승인 요청을 보냈습니다", loginId), "id", joinRequestRepository.getLastInsertId());
	}

	private Member getJoinRequestByNameAndEmail(String name, String email) {
		return joinRequestRepository.getJoinRequestByNameAndEmail(name, email);
	}

	public Member getJoinRequestByLoginId(String loginId) {
		return joinRequestRepository.getJoinRequestByLoginId(loginId);
	}

	public Member getMemberById(int id) {
		return joinRequestRepository.getMemberById(id);
	}

	
	
	
	
	public List<JoinRequest> getAllJoinRequestsInfo() {
		
		return joinRequestRepository.getAllJoinRequestsInfo();
	}

	
	
	

	//거부
	public void rejectJoinRequest(int memberId) {
		
		
	}



	
	

}