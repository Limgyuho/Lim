package com.koreaIT.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koreaIT.demo.repository.MemberRepository;
import com.koreaIT.demo.vo.Accestime;
import com.koreaIT.demo.vo.Member;
import com.koreaIT.demo.vo.Suggestion;
import com.koreaIT.demo.vo.Vacation;

@Service
public class MemberService {

	private MemberRepository memberRepository;

	@Autowired
	public MemberService(MemberRepository memberRepository) {
		this.memberRepository = memberRepository;
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

	public void insertMembertable(String regDate, String updateDate, String loginId, String loginPw, String name,
			String cellphoneNum, String email, int Permission, String department, String position) {
		memberRepository.insertMembertable(regDate, updateDate, loginId, loginPw, name, cellphoneNum, email, Permission,
				department, position);

	}

	public void deletejoinRequestsMember(int id) {

		memberRepository.deletejoinRequestsMember(id);
	}

	public Member getMembers(String department, String name) {
		return memberRepository.Members(department, name);
	}

	public List<Member> getMembersByDepartment(String department) {
		return memberRepository.getMembersByDepartment(department);
	}

	public int getMemberCnt() {

		return memberRepository.getMemberCnt();
	}

	public List<Member> getAllApprovedMembers(String department, String name) {

		return memberRepository.getAllApprovedMembers(department, name);
	}

	public List<Member> approvedMembers() {

		return memberRepository.approvedMembers();
	}

	public int updatePermission() {
		return memberRepository.updatePermission();

	}

	public Member searchMember(int id) {

		return memberRepository.searchMember(id);
	}

	public void memberTransfer(int id, String department, String position) {
		memberRepository.memberTransfer(id, department, position);

	}

	public List<Suggestion> showsuggestion(int applicantnumber) {

		return memberRepository.showsuggestion(applicantnumber);
	}

	public List<Vacation> showVacation(int applicantnumber) {

		return memberRepository.showVacation(applicantnumber);
	}

	public List<Member> adminUpload() {

		return memberRepository.adminUpload();
	}

	public List<Vacation> showallVacation() {

		return memberRepository.showallVacation();
	}

	public void updateStatus(int id, int status) {
		memberRepository.updateStatus(id, status);
	}

	public List<Member> manager() {

		return memberRepository.manager();
	}

	public List<Member> transmissionMembers() {

		return memberRepository.transmissionMembers();
	}

	public void deleteMembers(int id) {

		memberRepository.deleteMembers(id);
	}

	public Member getMemberByName(int memberName) {

		return memberRepository.getMemberById(memberName);
	}

	public Member getMemberBychatId(int userId) {

		return memberRepository.getMemberBychatId(userId);
	}

	public List<Member> approvedMembersMain() {

		return memberRepository.approvedMembersMain();
	}

	public List<Suggestion> showsuggestionMain(int applicantnumber) {

		return memberRepository.showsuggestionMain(applicantnumber);
	}

	public List<Vacation> showVacationMain(int applicantnumber) {

		return memberRepository.showVacationMain(applicantnumber);
	}

	public int getApprovedMembersCount() {
		return memberRepository.getApprovedMembersCount();
	}


	public List<Member> getTransferMembers(int startItemIndex, int itemsPerPage) {

		return memberRepository.getApprovedMembers(startItemIndex, itemsPerPage);
	}





	public void insertOrUpdateRecentAccess(int memberId, String formattedDateTime) {
		boolean isExistingRecord = memberRepository.isExistingRecord(memberId);
		
        if (isExistingRecord) {
            memberRepository.updateRecentAccess(memberId, formattedDateTime);
        } else {
            memberRepository.insertaccestime(memberId, formattedDateTime);
        }
		
	}

	public void updatelastaccess(int memberId, String formattedDateTime) {
		memberRepository.updatelastaccess(memberId,formattedDateTime);
		
	}

	





}