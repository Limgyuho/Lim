package com.koreaIT.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Accestime {
	private int id;
	private String recent_access;
	private String last_access;

}
