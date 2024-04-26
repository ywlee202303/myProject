package com.practice.restay.findstay.model.vo;

import java.time.LocalDate;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class House {
	
	// 숙소 코드
	private String houseCode;
	
	// 숙소 이름
	private String houseName;
	
	// 숙소 주소
	private String houseAddress;
	
	// 숙소 전화번호
	private String houseTel;
	
	// 숙소 이메일
	private String houseEmail;
	
	// 숙소 좋아요 여부(Y/N)
	private String likeStatus;
	
	// 숙소 이미지
	private String houseImg;
	
	// 숙소 지역명
	private String houseArea;
	
	// 숙소 등록일
	private LocalDate houseEnrollDate;
	
	// 숙소 상태
	private String houseStatus;
	
	// 숙소 시군구
	private String houseSigungu;
	
}
