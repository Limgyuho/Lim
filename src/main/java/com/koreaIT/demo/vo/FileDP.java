package com.koreaIT.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class FileDP {
	private int id;
	private String originName;
	private String savedNm;
	private String savedPath;
	private String dpn;
	
}
