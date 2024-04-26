package com.practice.restay.findstay.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class HouseImage {

	// 숙소 코드
	private String houseCode;
	
	// 숙소 이미지 코드
	private String houseImageCode;
	
	// 숙소 오리지널 파일
	private String houseImageOriginalFileName;
	
	// 숙소 리네임드 파일
	private String houseImageRenamedFileName;
	
}
