package com.practice.restay.travel.api;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TravelResponse {

	private String resultCode;
	private String resultMsg;
	private int numOfRows;
	private int pageNo;
	private int totalCount;
}
