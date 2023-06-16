package com.koreaIT.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class schedule {
	private int scheduleId;
	private int userId;
	private String startDate;
	private String endDate;
	private String title;
	private String description;
}
