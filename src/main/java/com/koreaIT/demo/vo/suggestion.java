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
	private String List;
	private String chair;
	private String item;
	private String reason;
}