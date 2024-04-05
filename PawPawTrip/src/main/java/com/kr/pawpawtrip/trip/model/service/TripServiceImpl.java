package com.kr.pawpawtrip.trip.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kr.pawpawtrip.common.util.PageInfo;
import com.kr.pawpawtrip.trip.model.mapper.TripMapper;
import com.kr.pawpawtrip.trip.model.vo.Comm;
import com.kr.pawpawtrip.trip.model.vo.MyTrip;
import com.kr.pawpawtrip.trip.model.vo.PetInfo;
import com.kr.pawpawtrip.trip.model.vo.Spot;
import com.kr.pawpawtrip.trip.model.vo.Stay;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class TripServiceImpl implements TripService {
   private final TripMapper tripMapper;
   
   // 관광지 전체 게시물 수 조회
   @Override
   public int getSpotCount(String selectArea, String searchKeyword) {
      
      return tripMapper.selectSpotCount(selectArea, searchKeyword);
   }
   
   // 관광지 리스트 조회
   @Override
   public List<Spot> getSpotList(PageInfo pageInfo, String selectArea, String searchKeyword) {
         int limit = pageInfo.getListLimit();
         int offset = (pageInfo.getCurrentPage() - 1) * limit;
         
         RowBounds rowBounds = new RowBounds(offset, limit);      
      
      return tripMapper.selectSpotList(rowBounds, selectArea, searchKeyword);
   }
   
   // 관광지 API 이미지 저장
   @Override
   @Transactional
   public int saveSpotImage(int id, String apiImageURL) {
      
      return tripMapper.updateSpotApiImage(id, apiImageURL);
   }
   
   // 관광지 상세 조회(반려동물 동반 정보 확인)
   @Override
   public Spot getSpotById(int id) {
      
      return tripMapper.selectSpotById(id);
   }
   
   // -------------------------------------------------------------------------
   
   // 숙소 전체 게시물 수 조회
   @Override
   public int getStayCount(String selectArea, String searchKeyword) {
      
      return tripMapper.selectStayCount(selectArea, searchKeyword);
   }
   
   // 숙소 리스트 조회
   @Override
   public List<Stay> getStayList(PageInfo pageInfo, String selectArea, String searchKeyword) {
         int limit = pageInfo.getListLimit();
         int offset = (pageInfo.getCurrentPage() - 1) * limit;
         
         RowBounds rowBounds = new RowBounds(offset, limit);
         
      return tripMapper.selectStaytList(rowBounds, selectArea, searchKeyword);
   }
   
   // 숙소 API 이미지 저장
   @Override
   @Transactional
   public int saveStayImage(int id, String apiImageURL) {
      // TODO Auto-generated method stub
      return tripMapper.updateStayApiImage(id, apiImageURL);
   }
   
   // 숙소 상세 조회(반려동물 동반 정보 확인)
   @Override
   public Stay getStayById(int id) {
      
      return tripMapper.selectStayById(id);
   }

   // -----------------------------------------------------------------------------------------
   
   // 회원이 찜한 장소 갯수 조회 - (관광지, 숙소)
   @Override
   public int getMyTripByMemberNo(int memberNo) {
      
      return tripMapper.selectMyTripCount(memberNo);
   }
   
   // 회원이 찜한 장소 리스트 조회 - (관광지, 숙소)
   @Override
   public List<MyTrip> getMyTripListByMemberNo(PageInfo pageInfo, int memberNo) {
       int limit = pageInfo.getListLimit();
       int offset = (pageInfo.getCurrentPage() - 1) * limit;
       
       RowBounds rowBounds = new RowBounds(offset, limit);
       
      return tripMapper.selectMyTripList(rowBounds,memberNo);
   }
   
   // 
   @Override
   public String isZzimThis(String contentId, String memberNo)
   {
       return tripMapper.selectZzimId(contentId, memberNo);
   }
   
   // 찜한 관광지/숙소 MyTrip에 추가
   @Override
   @Transactional
   public int saveMyTrip(String contentId, int memberNo) {
	   	
	   return tripMapper.insertMyTrip(contentId, memberNo);
   }
   
   // MyTrip에서 관광지/숙소 삭제
	@Override
	@Transactional
	public int deleteMyTrip(String contentId, int memberNo) {
		
		return tripMapper.deleteMyTrip(contentId, memberNo);
	}   
   
   // -----------------------------------------------------------------------------------------
   
   
    @Override
    @Transactional
    public int savePetInfo(PetInfo petInfo)
    {
        int result = 0;
        
//        if (!petInfo.getPetinfoContentid().isEmpty()) {
//            // update
//            result = petInfo.updateBoard(petInfo);
//        } else {
//            // insert
//        }
        result = tripMapper.insertPetInfo(petInfo);
        
        return result;
    }
    
    
    @Override
    @Transactional
    public int saveTrip(Spot trip)
    {
        int result = 0;
        
        result = tripMapper.insertTrip(trip);
        
        return result;
    }
    
    
    @Override
    @Transactional
    public int saveStay(Stay stay)
    {
        int result = 0;
        
        result = tripMapper.insertStay(stay);
        
        return result;
    }
    
    
    @Override
    public int saveComm(Comm comm)
    {
        int result = 0;
        
        result = tripMapper.insertComm(comm);
      
        return result;
    }
    
    
    @Override
    public List<PetInfo> getPetTourListByContentIds(List<Integer> contentIdList)
    {
        return tripMapper.selectPetInfoByContentIds(contentIdList);
    }
    
    @Override
    public PetInfo getPetTourByContentId(int contentId)
    {
        return tripMapper.selectPetInfoByContentId(contentId);
    }


}