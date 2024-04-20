package com.practice.restay.travel.api;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TravelItem {

	// 주소
	private String addr1;
	
	// 상세 주소
	private String addr2;
	
	// 지역 코드
	private String areacode;
	
	// 교과서속여행지 여부
	private String booktour;
	
	// 대분류
	private String cat1;
	
	// 중분류
	private String cat2;
	
	// 소분류
	private String cat3;
	
	// 콘텐츠ID
	private String contentid;
	
	// 콘텐츠타입ID
	private String contenttypeid;
	
	// 등록일
	private String createdtime;
	
	// 대표이미지(원본)
	private String firstimage;
	
	// 대표이미지(썸네일)
	private String firstimage2;
	
	// 저작권 유형 (Type1:제1유형(출처표시-권장), Type3:제3유형(제1유형+변경금지)
	private String cpyrhtDivCd;
	
	// GPS X좌표
	private String mapx;
	
	// GPS Y좌표
	private String mapy;
	
	// Map Level
	private String mlevel;
	
	// 수정일
	private String modifiedtime;
	
	// 시군구코드
	private String sigungucode;
	
	// 전화번호
	private String tel;
	
	// 제목
	private String title;
	
	// 우편번호
	private String zipcode;
	
}
