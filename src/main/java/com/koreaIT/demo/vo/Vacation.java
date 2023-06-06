package com.koreaIT.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Vacation {
	private int id;
	private String date;
	private int status;
	private String vacationType;
	private int applicantNumber;
}
