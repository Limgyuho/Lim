package com.koreaIT.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Member {
	private int id;
	private String regDate;
	private String updateDate;
	private String loginId;
	private String loginPw;
	private int authLevel;
	private String name;
	private String cellphoneNum;
	private String email;
	private int delStatus;
	private String delDate;
	public int Permission;
	public String department;
	public String position;
	public String vacationType;
	public String date;
}