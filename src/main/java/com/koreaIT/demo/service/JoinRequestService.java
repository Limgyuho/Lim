package com.koreaIT.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.koreaIT.demo.repository.JoinRequestRepository;
import com.koreaIT.demo.repository.MemberRepository;
import com.koreaIT.demo.vo.JoinRequest;

public class JoinRequestService {
	
	
	private JoinRequestRepository joinRequestRepository;
		
		@Autowired
		public JoinRequestService(JoinRequestRepository joinRequestRepository) {
			this.joinRequestRepository = joinRequestRepository;
		}	


		public static  List<JoinRequest> getAllJoinRequests() {
			 return JoinRequestRepository.findAll();
		}


		public static void approveJoinRequest(Long memberId) {
			// TODO Auto-generated method stub
			
		}


		public static void rejectJoinRequest(Long memberId) {
			// TODO Auto-generated method stub
			
		}


}
