package com.kr.pawpawtrip.admin.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.kr.pawpawtrip.admin.model.vo.CommunityRank;
import com.kr.pawpawtrip.admin.model.vo.FavorSite;
import com.kr.pawpawtrip.admin.model.vo.LogCount;
import com.kr.pawpawtrip.admin.model.vo.MemberAccsLog;
import com.kr.pawpawtrip.admin.model.vo.Pet;
import com.kr.pawpawtrip.admin.model.vo.WeatherArea;

@Mapper
public interface AdminMapper
{
    List<CommunityRank> selectCommunityRanks();
    
    List<Pet> selectMypetRatio();

    List<FavorSite> selectAllFavorSite(RowBounds rowBounds, @Param("select") String select, @Param("search") String search);

    int selectFavorSiteCount(@Param("select") String select, @Param("search") String search);

    List<FavorSite> selectFavoriteTopThree();


    //TRIP 테이블 FAVOR_RCMD_YN 전부 N
    int updateFavoriteTripInit();
    //STAY 테이블 FAVOR_RCMD_YN 전부 N
    int updateFavoriteStayInit();

    //TRIP 테이블 FAVOR_RCMD_YN = Y
    int updateFavoriteTrip(@Param("contentIds") List<String> contentIds);
    //STAY 테이블 FAVOR_RCMD_YN = Y
    int updateFavoriteStay(@Param("contentIds")List<String> contentIds);

    //사용자 접속 로그 테이블에 로그 기록
    int insertMemberAccsLog(MemberAccsLog memberAccsLog);

    //사용자 접속 로그 테이블에서 사용자 가져오기
    List<MemberAccsLog> selectMemberAccsLog(MemberAccsLog memberAccsLog);

	List<WeatherArea> selectWeatherAreaList();
	
    List<LogCount> selectAccessMemberCount();
}
