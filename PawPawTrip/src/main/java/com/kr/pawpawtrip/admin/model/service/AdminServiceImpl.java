package com.kr.pawpawtrip.admin.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kr.pawpawtrip.admin.model.mapper.AdminMapper;
import com.kr.pawpawtrip.admin.model.vo.CommunityRank;
import com.kr.pawpawtrip.admin.model.vo.FavorSite;
import com.kr.pawpawtrip.admin.model.vo.LogCount;
import com.kr.pawpawtrip.admin.model.vo.MemberAccsLog;
import com.kr.pawpawtrip.admin.model.vo.Pet;
import com.kr.pawpawtrip.admin.model.vo.WeatherArea;
import com.kr.pawpawtrip.common.util.PageInfo;
import com.kr.pawpawtrip.community.model.mapper.CommunityMapper;
import com.kr.pawpawtrip.community.model.vo.Community;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AdminServiceImpl implements AdminService
{
    private final AdminMapper     adminMapper;
    private final CommunityMapper communityMapper;

    // 대쉬보드에서 공지사항을 제외한 커뮤니티 조회수를 가장 많이 받은 TOP7을 가져온다.
    @Override
    public List<CommunityRank> getCommunityRanks()
    {
        return adminMapper.selectCommunityRanks();
    }

    // 대쉬보드에서 마이펫 비율 정보를 가져온다.
    @Override
    public List<Pet> getMyPetRatio()
    {
        return adminMapper.selectMypetRatio();
    }

    // 관리자화면 인기추천장소에서 사용할 숙박/여행지 목록
    @Override
    public List<FavorSite> getFavorSite(PageInfo pageInfo, String select, String search)
    {
        int limit = pageInfo.getListLimit();
        int offset = (pageInfo.getCurrentPage() - 1) * limit;
        RowBounds rowBounds = new RowBounds(offset, limit);

        return adminMapper.selectAllFavorSite(rowBounds, select, search);
    }

    // 관리자화면 인기추천장소에서 사용할 페이징용 카운트
    @Override
    public int getFavorSiteCount(String select, String search)
    {
        return adminMapper.selectFavorSiteCount(select, search);
    }

    // 선택된 인기추천 장소의 목록을 가져온다.
    @Override
    public List<FavorSite> getFavoriteTopThree()
    {
        return adminMapper.selectFavoriteTopThree();
    }

    @Override
    // 선택된 인기추천 장소의 목록을 저장한다.
    public int saveFavoriteTopThree(List<String> contentIdsArr)
    {
        int result = 0;

        // delete - 샤실은 전부 N으로 update
        result += adminMapper.updateFavoriteTripInit();
        result += adminMapper.updateFavoriteStayInit();

        if (contentIdsArr.size() != 0)
        {
            // update
            result += adminMapper.updateFavoriteTrip(contentIdsArr);
            result += adminMapper.updateFavoriteStay(contentIdsArr);
        }

        return result;
    }

    @Override
    public int saveVisitorLog(MemberAccsLog memberAccsLog)
    {
        return adminMapper.insertMemberAccsLog(memberAccsLog);
    }

    @Override
    public List<MemberAccsLog> getVisitorLog(MemberAccsLog memberAccsLog)
    {
        return adminMapper.selectMemberAccsLog(memberAccsLog);
    }

    // 중기 기온 지역 조회
	@Override
	public List<WeatherArea> getWeatherAreaList() {
		
		return adminMapper.selectWeatherAreaList();
	}
	
	
    @Override
    public List<LogCount> getAccessMemberCount()
    {
        return adminMapper.selectAccessMemberCount();
    }

    // 공지사항 작성, 수정
    @Override
    @Transactional
    public int saveNotice(Community community) {
        
        int result = 0;
        
        if(community.getCommunityNo() > 0) {
            // 업데이트
            result = communityMapper.updateBoard(community);
        } else {
            // 인서트
            result = communityMapper.insertNotice(community);
        }
        
        return result;
    }
}
