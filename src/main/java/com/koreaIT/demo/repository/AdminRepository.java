package com.koreaIT.demo.repository;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.koreaIT.demo.vo.Admin;
import com.koreaIT.demo.vo.Member;

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
					email = #{email}
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
				FROM join_requests
				WHERE loginId = #{loginId}
			""")
	public Admin getAdminByLoginId(String loginId);
	@Select("SELECT LAST_INSERT_ID()")
	public int getLastInsertId();

}