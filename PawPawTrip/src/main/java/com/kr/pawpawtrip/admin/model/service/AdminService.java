package com.kr.pawpawtrip.admin.model.service;

import java.util.List;

import com.kr.pawpawtrip.admin.model.vo.CommunityRank;
import com.kr.pawpawtrip.admin.model.vo.FavorSite;
import com.kr.pawpawtrip.admin.model.vo.LogCount;
import com.kr.pawpawtrip.admin.model.vo.MemberAccsLog;
import com.kr.pawpawtrip.admin.model.vo.Pet;
import com.kr.pawpawtrip.admin.model.vo.WeatherArea;
import com.kr.pawpawtrip.common.util.PageInfo;
import com.kr.pawpawtrip.community.model.vo.Community;

public interface AdminService
{
    List<CommunityRank> getCommunityRanks();
    
    List<Pet> getMyPetRatio();

    List<FavorSite> getFavorSite(PageInfo pageInfo, String select, String search);

    int getFavorSiteCount(String select, String search);

    List<FavorSite> getFavoriteTopThree();

    int saveFavoriteTopThree(List<String> contentIdsArr);

    int saveVisitorLog(MemberAccsLog memberAccsLog);

    List<MemberAccsLog> getVisitorLog(MemberAccsLog memberAccsLog);

	List<WeatherArea> getWeatherAreaList();
	
    List<LogCount> getAccessMemberCount();
    
    public int saveNotice(Community community);
}
