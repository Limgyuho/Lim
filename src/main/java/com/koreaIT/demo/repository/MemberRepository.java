package com.koreaIT.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.koreaIT.demo.vo.Accestime;
import com.koreaIT.demo.vo.JoinRequest;
import com.koreaIT.demo.vo.Member;
import com.koreaIT.demo.vo.Suggestion;
import com.koreaIT.demo.vo.Vacation;

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
				WHERE 1 = 1
				<if test="department != '' and department != null and department != '전체'">
					AND department = #{department}
				</if>
				<if test="name != ''">
					AND name = #{name}
				</if>
			</script>
			""")
	public List<Member> getAllApprovedMembers(String department, String name);

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
			String cellphoneNum, String email, int permission, String department, String position);

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
			SELECT *
			FROM `member`
			WHERE department = #{department} AND permission = 1
			""")
	public List<Member> getMembersByDepartment(String department);

	@Select("""
			    SELECT *
			    FROM `member`
			    WHERE permission =1
			    ORDER BY id DESC
			""")
	public List<Member> approvedMembers();

	@Update("""
			UPDATE `member`
			SET permission = 1
			WHERE  permission = 0
			""")
	public int updatePermission();

	@Update("""
			<script>
			UPDATE `member`
			<set>
			  <if test="department != null">
			    department = #{department},
			  </if>
			  <if test="position != null">
			    position = #{position},
			  </if>
			</set>
			WHERE id = #{id}
				</script>
				""")
	public void memberTransfer(int id, String department, String position);

	@Select("""
			    SELECT *
			    FROM `member`
			    WHERE id = #{id}
			""")
	public Member searchMember(int id);

	@Select("""
			    SELECT *
			    FROM suggestion
			    WHERE applicantnumber = #{applicantnumber}
			""")
	public List<Suggestion> showsuggestion(int applicantnumber);

	@Select("""
			    SELECT *
			    FROM vacation
			    WHERE applicantnumber = #{applicantnumber}
			    ORDER BY id DESC
			""")
	public List<Vacation> showVacation(int applicantnumber);

	@Select("""
			    SELECT *
			    FROM `member`
			    WHERE name = "admin"
			""")
	public List<Member> adminUpload();

	@Select("""
			    SELECT v.*, m.name AS applicantName, m.position AS applicantPosition
			    FROM vacation v
			    JOIN member m ON v.applicantNumber = m.id
			""")
	public List<Vacation> showallVacation();

	@Update("""
			  UPDATE vacation
			  SET status = #{status}
			  WHERE id = #{id}
			""")
	public void updateStatus(int id, int status);

	@Select("""
			    SELECT *
			    FROM `member`
			""")
	public List<Member> manager();

	@Select("""
			    SELECT *
			    FROM `member`
			""")
	public List<Member> transmissionMembers();

	@Update("""
			    UPDATE `member`
			    SET permission = -1
			    WHERE id = #{id}
			""")
	public void deleteMembers(int id);

	@Select("""
			SELECT *
				FROM `member`
				WHERE id = #{userId}
			""")
	public Member getMemberBychatId(int userId);

	@Select("""
			    SELECT *
					FROM `member`
					WHERE permission = 1
					ORDER BY id DESC
					LIMIT 5;
			""")
	public List<Member> approvedMembersMain();

	@Select("""
			    SELECT *
			    FROM suggestion
			    WHERE applicantnumber = #{applicantnumber}
			    ORDER BY id DESC
			    LIMIT 5;

			""")
	public List<Suggestion> showsuggestionMain(int applicantnumber);

	@Select("""
			    SELECT *
			    FROM vacation
			    WHERE applicantnumber = #{applicantnumber}
			    ORDER BY id DESC
			    LIMIT 5;
			""")
	public List<Vacation> showVacationMain(int applicantnumber);

	@Select("""
			    SELECT COUNT(*) FROM member
			""")
	public int getApprovedMembersCount();

	@Select("""
			    SELECT * FROM member
			    LIMIT #{startItemIndex}, #{itemsPerPage}

			""")
	public List<Member> getApprovedMembers(int startItemIndex, int itemsPerPage);

	
	@Insert("""
			INSERT INTO accestime
				SET id = #{memberId},
					recent_access = #{formattedDateTime}			
			""")
	
	public void insertaccestime(int memberId, String formattedDateTime);	

	@Update("""
			UPDATE accestime 
			SET recent_access = #{formattedDateTime}
			WHERE id = #{memberId}
			""")
	public void updateRecentAccess(int memberId, String formattedDateTime);

	
	@Select("""
		    SELECT COUNT(*) FROM accestime
		    WHERE id = #{memberId}
		""")
	public boolean isExistingRecord(int memberId);

	
	@Update("""
			UPDATE accestime 
			SET last_access = #{formattedDateTime}
			WHERE id = #{memberId}	
			""")
	public void updatelastaccess(int memberId, String formattedDateTime);

	
	@Select("""
		    SELECT * FROM accestime
		    WHERE id = #{id}
		""")
	public Accestime getaccesstime(int id);
}