package com.koreaIT.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class JoinRequest {
	private int id;
	private String regDate;
	private String updateDate;
	private String loginId;
	private String loginPw;
	private int authLevel;
	private String name;
<<<<<<< HEAD
	private String cellphoneNum;
	private String email;
	private int delStatus;
	private int permission;
	private String delDate;
	public int getPermission(int i) {
		return 1;
	}
	
=======
	private String nickname;
	private String cellphoneNum;
	private String email;
	private int delStatus;
	private String delDate;
>>>>>>> master
}