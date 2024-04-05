package com.kr.pawpawtrip.common.api.item;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class WeatherMidItem {

	// 예보구역코드
	private String regId;
	
	// 3일 후 예상 최저기온
	private int taMin3;
	
	// 3일 후 예상 최고기온
	private int taMax3;
	
	// 4일 후 예상 최저기온
	private int taMin4;
	
	// 4일 후 예상 최고기온
	private int taMax4;
	
	// 5일 후 예상 최저기온
	private int taMin5;
	
	// 5일 후 예상 최고기온
	private int taMax5;
	
	// 6일 후 예상 최저기온
	private int taMin6;
	
	// 6일 후 예상 최고기온
	private int taMax6;
	
	// 7일 후 예상 최저기온
	private int taMin7;
	
	// 7일 후 예상 최고기온
	private int taMax7;
	
	// 8일 후 예상 최저기온
	private int taMin8;
	
	// 8일 후 예상 최고기온
	private int taMax8;
}
