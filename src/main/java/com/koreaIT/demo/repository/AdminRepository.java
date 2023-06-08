package com.koreaIT.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.koreaIT.demo.vo.Admin;
import com.koreaIT.demo.vo.Suggestion;
import com.koreaIT.demo.vo.Vacation;

@Mapper
public interface AdminRepository {
	
	@Select("""
			SELECT *
				FROM `admin`
				WHERE loginId = #{loginId}
			""")
	public Admin getMemberByLoginId(String loginId);
	
	
	@Select("""
			SELECT *
				FROM `admin`
				WHERE id = #{id}
			""")
	public Admin getMemberById(int id);
	
	
	@Select("""
			SELECT *
				FROM `admin`
				WHERE loginId = #{loginId}
			""")
	public Admin getAdminByLoginId(String loginId);
	
	@Select("SELECT LAST_INSERT_ID()")	
	public int getLastInsertId();
	
	@Insert("""
			<script>
			INSERT INTO suggestion
				SET regDate = NOW(),
					item = #{item},
					applicantNumber	 =#{applicantNumber}
			</script>	
			""")
	public void insertSuggestion(int applicantNumber,String  item);

	
	@Select("""
			SELECT s.*, m.department, m.position, m.name
			FROM suggestion AS s
			JOIN member AS m ON s.applicantNumber = m.id
			""")
	public List<Suggestion> getSuggestion();
	
	@Update("""
	        UPDATE suggestion
	        SET permission = #{permission},
	            reason = #{reason}
	        WHERE id = #{id}
	        """)
	public void updateSuggestionPermission(int id, int permission, String reason);

	
	@Insert("""
			INSERT INTO vacation
				SET regDate = NOW(),
					date = #{date},
					vacationType =#{vacationType}	
			""")
	public void insertVacation(int applicantNumber,String date, String vacationType);


	
	@Insert("""
			<script>
			INSERT INTO vacation
				SET regDate = NOW(),
					date = #{date},
					vacationType1 = #{vacationType1},
					vacationType2 = #{vacationType2},
					applicantNumber	 =#{applicantNumber}
			</script>	
			""")
	public void leaveRequest(int applicantNumber, String date, String vacationType1,String vacationType2);

//	@Select("""
//			SELECT v.date, v.status, v.vacationType
//			FROM vacation AS v
//			JOIN member AS m ON v.id = m.id
//			""")
//	public List<Vacation> showVacation();

}