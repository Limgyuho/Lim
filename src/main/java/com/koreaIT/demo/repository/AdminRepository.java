package com.koreaIT.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.koreaIT.demo.vo.Admin;
import com.koreaIT.demo.vo.Member;
import com.koreaIT.demo.vo.suggestion;

@Mapper
public interface AdminRepository {
	
	@Insert("""
			INSERT INTO  `admin`
				SET regDate = NOW(),
					updateDate = NOW(),
					loginId = #{loginId},
					loginPw = #{loginPw},
					`name` = #{name},
					cellphoneNum = #{cellphoneNum},
					email = #{email},
			""")
	public void doJoin(String loginId, String loginPw, String name,  String cellphoneNum, String email);
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
	
	@Insert("""
			INSERT INTO suggestion
				SET regDate = NOW(),	
					monitor = #{monitor},
					pc = #{pc},
					chair = #{chair},
					desk = #{desk},
					starex = #{starex},
					genesis =#{genesis},
					potter =#{potter},
					reason1 = #{reason1}
					reason2 = #{reason2}
					destination = #{destination}
			
			""")
	public List<suggestion> suggestion(String monitor, String pc, String chair, String desk, String starex, 
			String genesis,String potter, String reason1, String reason2, String destination);

}