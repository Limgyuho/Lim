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

//
@Service
public class MemberService {
	
	private MemberRepository memberRepository;
	
	@Autowired
	public MemberService(MemberRepository memberRepository) {
		this.memberRepository = memberRepository;
	}
	
	
	@Autowired
	 public List<Member> getAllApprovedMembers() {
		return memberRepository.getMemberList();
	 }
	
	
	private Member getMemberByNameAndEmail(String name, String email) {
		return memberRepository.getMemberByNameAndEmail(name, email);
	}

	public Member getMemberByLoginId(String loginId) {
		return memberRepository.getMemberByLoginId(loginId);
	}

	public Member getMemberById(int id) {
		return memberRepository.getMemberById(id);
	}

	public void doModify(int loginedMemberId, String nickname, String cellphoneNum, String email) {
		memberRepository.doModify(loginedMemberId, nickname, cellphoneNum, email);
	}

	public void doPasswordModify(int loginedMemberId, String loginPw) {
		memberRepository.doPasswordModify(loginedMemberId, loginPw);
	}
	
	public void insertMembertable(String regDate, String updateDate, String loginId,
			String loginPw, String name,
			String cellphoneNum, String email) {
		memberRepository.insertMembertable(regDate,updateDate,loginId,loginPw,name,cellphoneNum,email);
		
	}



	
	
}