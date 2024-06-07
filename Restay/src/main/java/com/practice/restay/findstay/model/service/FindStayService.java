package com.practice.restay.findstay.model.service;

import java.util.List;

import com.practice.restay.common.util.PageInfo;
import com.practice.restay.findstay.model.vo.Area;
import com.practice.restay.findstay.model.vo.House;
import com.practice.restay.findstay.model.vo.HouseImage;
import com.practice.restay.findstay.model.vo.InterestStay;
import com.practice.restay.findstay.model.vo.Reservation;

public interface FindStayService {

	// 지역 조회(시, 도)
	List<Area> getAreaName();

	// 지역 조회(시군구)
	List<Area> getSigunguName(int areaCode);

	// 지역 조회(시, 도 / 시군구)
	Area getAreaInfo(int areaCode, int sigunguCode);
	
	// 숙소 리스트 수
	int getHouseListCount(String inputSearch, List<String> searchLocationKewords);
	
	// 숙소 조회(숙소만)
	List<House> getOnlyHouseList(PageInfo pageInfo, String inputSearch, List<String> searchLocationKewords);
	
	// 숙소 조회(이미지 포함)
	List<House> getHouseList(List<String> houseCode, String inputSearch, List<String> searchLocationKewords);
	
	// 숙소 이미지 조회
	List<HouseImage> getHouseImageList(List<String> houseCode);
	
	// 숙소 등록/수정
	int saveHouseInfo(House house);

	// 숙소 이미지 등록/수정
	int saveHouseImageInfo(HouseImage houseImage);

    House getHouse(String houseCode);

    // 숙소 예약/수정
    int saveReservation(Reservation reservation);

    // 예약 정보 조회
	Reservation resInfo(Reservation reservation);

	// 예약 사용자, 숙소 정보 조회
	Reservation resMemberHouseInfo(String resCode);

	// 나의 예약 숙소 정보
	List<Reservation> getMyResHouse(int memberNo, String resState);
	
    //스테이찜기능
    int insertInterestStay(InterestStay interestStay);
    
    //스테이찜기능
    int deleteInterestStay(InterestStay interestStay);

    //스테이찜 저장전 조회
    InterestStay getInterestStay(InterestStay interestStay);

    // 결제취소
	int updateResState(String resCode);

	
}
