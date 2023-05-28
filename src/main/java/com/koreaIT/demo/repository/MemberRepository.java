package com.koreaIT.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.koreaIT.demo.vo.JoinRequest;
import com.koreaIT.demo.vo.Member;

@Mapper
public interface MemberRepository {
	
	public JoinRequest selectJoinRequests(String name);
	
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
			<script>
			SELECT *
				FROM `member`
				WHERE department = #{department}
				<if test="name != ''">
					AND name = #{name}
				</if>
			</script>
			""")
	public List<Member> getMemberList(String department, String name);
	
	@Insert("""
			INSERT INTO `member`
				SET regDate = NOW(),
					updateDate = NOW(),
					loginId = #{loginId},
					loginPw = #{loginPw},
					`name` = #{name},
					cellphoneNum = #{cellphoneNum},
					email = #{email},
					permission =#{permission},
					department =#{department},
					position = #{position}
			""")

	public void insertMembertable(String regDate, String updateDate, String loginId, String loginPw, String name,
			String cellphoneNum, String email, int permission,String department,String position);

	@Delete("""
			DELETE FROM `member`
				WHERE id = #{id}
			""")
	public void deletejoinRequestsMember(int id);

	
	@Select("""
			SELECT *
				FROM `member`
				WHERE department = #{department} AND `name` = #{name}
			""")
	public Member Members(String department, String name);


	@Select("""
			SELECT COUNT(*)
				FROM `member`
				
			""")
	public int getMemberCnt();
	
	@Select("""
		    SELECT `name`, `position`, cellphoneNum
		    FROM `member`
		    WHERE department = #{department}
		    """)
	public List<Member> getMembersByDepartment(String department);

	@Select("""
			SELECT *
				FROM `member`
			""")
	
	public List<JoinRequest> approvedMembers();



}