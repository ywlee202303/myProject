package com.kr.pawpawtrip.trip.model.service;

import java.util.List;

import com.kr.pawpawtrip.common.util.PageInfo;
import com.kr.pawpawtrip.trip.model.vo.Comm;
import com.kr.pawpawtrip.trip.model.vo.MyTrip;
import com.kr.pawpawtrip.trip.model.vo.PetInfo;
import com.kr.pawpawtrip.trip.model.vo.Spot;
import com.kr.pawpawtrip.trip.model.vo.Stay;

public interface TripService {
   
   // 관광지 전체 게시물 수 조회
   int getSpotCount(String selectArea, String searchKeyword);
   
   // 관광지 리스트 조회 
   List<Spot> getSpotList(PageInfo pageInfo, String selectArea, String searchKeyword);
   
   // 관광지 이미지 저장 (API 이미지 저장)
   int saveSpotImage(int id, String apiImageURL);
   
   // 관광지 상세 조회(여행지 ID 사용)
   Spot getSpotById(int id);
   
   // 숙소 전체 게시물 수 조회
   int getStayCount(String selectArea, String searchKeyword);
   
   // 숙소 리스트 조회
   List<Stay> getStayList(PageInfo pageInfo, String selectArea, String searchKeyword);
   
   // 숙소 이미지 저장 (API 이미지 저장)
   int saveStayImage(int id, String apiImageURL);
   
   // 숙소 상세 조회(숙박 ID 사용) 
   Stay getStayById(int id);
   
   // -----------------------------------------------------------------------------------------
   
   // memberNo를 이용하여 회원이 찜한 장소 갯수 조회 
   int getMyTripByMemberNo(int memberNo);
   
   // memberNo를 이용하여 회원이 찜한 장소 리스트 조회
   List<MyTrip> getMyTripListByMemberNo(PageInfo pageInfo, int memberNo);
   
   // contentId와 memberNo를 이용하여 MyTrip에 관광지/숙소 추가 
   int saveMyTrip(String contentId, int memberNo);
   
   // contentId와 memberNo를 이용하여 MyTrip에 관광지/숙소 삭제 
   int deleteMyTrip(String contentId, int memberNo);
   
   String isZzimThis(String contentId, String memberNo);
   
   // -----------------------------------------------------------------------------------------
   
   //반려동물 동반정보 수정/저장
    int savePetInfo(PetInfo petInfo);

    //Trip 수정/저장
    int saveTrip(Spot trip);

    //Stay 수정/저장
    int saveStay(Stay stay);

    int saveComm(Comm comm);

    List<PetInfo> getPetTourListByContentIds(List<Integer> contentIdList);
    
    PetInfo getPetTourByContentId(int contentId);

	

	



}