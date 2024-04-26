package com.practice.restay.findstay.model.service;

import java.util.List;

import com.practice.restay.findstay.model.vo.Area;
import com.practice.restay.findstay.model.vo.House;
import com.practice.restay.findstay.model.vo.HouseImage;

public interface FindStayService {

	// 지역 조회(시, 도)
	List<Area> getAreaName();

	// 지역 조회(시군구)
	List<Area> getSigunguName(int areaCode);

	// 지역 조회(시, 도 / 시군구)
	Area getAreaInfo(int areaCode, int sigunguCode);
	
	// 숙소 조회
	List<House> getHouseList();
	
	// 숙소 등록/수정
	int saveHouseInfo(House house);

	// 숙소 이미지 등록/수정
	int saveHouseImageInfo(HouseImage houseImage);

	List<HouseImage> getHouseImageList();
	
}
