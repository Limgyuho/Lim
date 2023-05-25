package com.koreaIT.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.koreaIT.demo.vo.JoinRequest;
import com.koreaIT.demo.vo.Member;

//회원가입 요청자들의 대한....
@Mapper
public interface JoinRequestRepository {

	
	@Insert("""
			INSERT INTO join_requests
				SET regDate = NOW(),
					updateDate = NOW(),
					loginId = #{loginId},
					loginPw = #{loginPw},
					`name` = #{name},
					cellphoneNum = #{cellphoneNum},
					email = #{email},
					department =#{department},
					position = #{position}
		
			""")
	public void doJoin(String loginId, String loginPw, String name,  String cellphoneNum, String email ,String department,String position);
	
	@Select("SELECT LAST_INSERT_ID()")
	public int getLastInsertId();

	@Select("""
			SELECT *
				FROM join_requests
				WHERE id = #{id}
				
			""")
	public Member getMemberById(int id);
		
	@Select("""
			SELECT *
				FROM join_requests
				WHERE loginId = #{loginId}
			""")
	public Member getjoinRequestByLoginId(String loginId);

	

	@Select("""
			SELECT *
				FROM join_requests
				WHERE `name` = #{name}
				AND email = #{email}
			""")
	public Member getJoinRequestByNameAndEmail(String name, String email);
	

	
	@Select("""
			SELECT *
				FROM join_requests

			""")
	public List<JoinRequest> getAllJoinRequestsInfo();

	
	
	@Delete("""
			DELETE *
				FROM members
				WHERE id = #{memberId};
			""")
	public void deleteArticle(int id);
	
	@Select("""
			SELECT *
				FROM join_requests
				WHERE id = #{id};
			""")
	public JoinRequest getJoinRequestsInfo(int id);
	
	
	@Delete("""
			DELETE FROM join_requests
				WHERE id = #{id}
			""")
	public void deletejoinRequestsMember(int id);
	

	
}