package com.koreaIT.demo.repository;

import org.apache.ibatis.annotations.Insert;

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
}
