package com.koreaIT.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Insert;

import com.koreaIT.demo.vo.JoinRequest;

public interface JoinRequestRepository {
	
	
	
	@Insert("""
			INSERT INTO `joinrequest`
				SET regDate = NOW(),
					updateDate = NOW(),
					loginId = #{loginId},
					loginPw = #{loginPw},
					`name` = #{name},
					nickname = #{nickname},
					cellphoneNum = #{cellphoneNum},
					email = #{email}
			""")
	public void doJoin(String loginId, String loginPw, String name, String nickname, String cellphoneNum, String email);

	public List<JoinRequest> findAll() ;

	


}
