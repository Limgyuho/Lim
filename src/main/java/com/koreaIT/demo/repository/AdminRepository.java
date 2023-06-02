package com.koreaIT.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.koreaIT.demo.vo.Admin;
import com.koreaIT.demo.vo.suggestion;

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
	
	
	@Select("""
			SELECT *
				FROM suggestion
				WHERE item= #{item}
			""")
	public List<suggestion> getsuggestion(String item);
	
	

}