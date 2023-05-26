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
	
	@Select("""
			SELECT *
				FROM join_requests AS J
				WHERE department =#{department}
					<if test="searchKeyword != ''">
						<choose>
						WHEN test="department == 'General Affairs Division'"
							AND  department LIKE CONCAT('%', #{name}, '%')
						
						<when test="department == 'Junbo'" >
							AND  department LIKE CONCAT('%', #{name}, '%')
						<when test="department == 'Planning and Finance'">
							AND  department LIKE CONCAT('%', #{name}, '%')
						<when test="department == 'Inspector General'">
							AND  department LIKE CONCAT('%', #{name}, '%')
						</when>
						<otherwise>
							AND (
								J.General Affairs Division LIKE CONCAT('%', #{name}, '%')
								J.Junbo LIKE CONCAT LIKE CONCAT('%', #{name}, '%')
								J.Planning and Finance LIKE CONCAT LIKE CONCAT('%', #{name}, '%')
								J.Inspector General LIKE CONCAT LIKE CONCAT('%', #{name}, '%')				
							)
						</otherwise>	
			""")

	public JoinRequest getjoinrq(String department, String name);

	

	@Select("""
			SELECT COUNT(*)
				FROM join_requests			
			""")
	public int getjoinRequestCnt();

}