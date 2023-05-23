package com.koreaIT.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.koreaIT.demo.vo.Member;

@Mapper
public interface MemberRepository {
	
	
	@Select("SELECT LAST_INSERT_ID()")
	public int getLastInsertId();

	@Select("""
			SELECT *
				FROM `member`
				WHERE id = #{id}
			""")
	public Member getMemberById(int id);

	@Select("""
			SELECT *
				FROM `member`
				WHERE loginId = #{loginId}
			""")
	public Member getMemberByLoginId(String loginId);

	

	@Select("""
			SELECT *
				FROM `member`
				WHERE `name` = #{name}
				AND email = #{email}
			""")
	public Member getMemberByNameAndEmail(String name, String email);

	@Update("""
			UPDATE `member`
				SET updateDate = NOW(),
					cellphoneNum = #{cellphoneNum},
					email = #{email}
				WHERE id = #{loginedMemberId}
			""")
	public void doModify(int loginedMemberId, String nickname, String cellphoneNum, String email);

	@Update("""
			UPDATE `member`
				SET updateDate = NOW(),
					loginPw = #{loginPw}
				WHERE id = #{loginedMemberId}
			""")
	public void doPasswordModify(int loginedMemberId, String loginPw);

	
	
	
	
	@Select("""
			SELECT *
				FROM `member`
			""")
	public List<Member> getMemberList();

	public void InsertMember();


	
	



}