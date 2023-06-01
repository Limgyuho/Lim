package com.koreaIT.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class suggestion {
	private int id;
	private String regDate;
	private String monitor;
	private String pc;
	private String chair;
	private String desk;
	private String starex;
	private String cellphoneNum;
	private String genesis;
	private String potter;
	private String reason1;
	private String reason2;
	private String destination;
}