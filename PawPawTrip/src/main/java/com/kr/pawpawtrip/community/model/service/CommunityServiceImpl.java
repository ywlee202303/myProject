package com.kr.pawpawtrip.community.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kr.pawpawtrip.common.util.PageInfo;
import com.kr.pawpawtrip.community.model.mapper.CommunityMapper;
import com.kr.pawpawtrip.community.model.vo.Community;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CommunityServiceImpl implements CommunityService {
    private final CommunityMapper communityMapper;

    // 전체 게시글 수(공지사항 제외)
    @Override
    public int getBoardCount(String select, String search) {
        
        return communityMapper.selectBoardCount(select, search);
    }

    // 전체 공지사항 수
    @Override
    public int getNoticeCount(String select, String search)
    {
        return communityMapper.selectNoticeCount(select, search);
    }
    // 수다 게시글 수
    @Override
    public int getBoardTalkCount(String select, String search) {
        
        return communityMapper.selectBoardTalkCount(select, search);
    }
    
    // 마이펫 게시글 수
    @Override
    public int getBoardMypetCount(String select, String search) {
        
        return communityMapper.selectBoardMypetCount(select, search);
    }
    
    // 공지사항 리스트 조회
    @Override
    public List<Community> getNoticeList(PageInfo pageInfo, String select, String search) {
        
        int limit = pageInfo.getListLimit();
        int offset = (pageInfo.getCurrentPage() - 1) * limit;
        RowBounds rowBounds = new RowBounds(offset, limit);
        
        return communityMapper.selectNoticeList(rowBounds, select, search);
    }
    
    // 전체 리스트 조회(검색기능 포함)
    @Override
    public List<Community> getBoardList(PageInfo pageInfo, String select, String search) {
        
        int limit = pageInfo.getListLimit();
        int offset = (pageInfo.getCurrentPage() - 1) * limit;
        RowBounds rowBounds = new RowBounds(offset, limit);
        
        return communityMapper.selectBoardList(rowBounds, select, search);
    }
    
    // 수다 리스트 조회(검색기능 포함)
    @Override
    public List<Community> getBoardTalkList(PageInfo pageInfo, String select, String search) {
        
        int limit = pageInfo.getListLimit();
        int offset = (pageInfo.getCurrentPage() - 1) * limit;
        RowBounds rowBounds = new RowBounds(offset, limit);
        
        return communityMapper.selectBoardTalkList(rowBounds, select, search);
    }
    
    // 마이펫 리스트 조회(검색기능 포함)
    @Override
    public List<Community> getBoardMypetList(PageInfo pageInfo, String select, String search) {
        
        int limit = pageInfo.getListLimit();
        int offset = (pageInfo.getCurrentPage() - 1) * limit;
        
        RowBounds rowBounds = new RowBounds(offset, limit);
        
        return communityMapper.selectBoardMypetList(rowBounds, select, search);
    }
    
    // 자유 게시판(수다) 상세
    @Override
    public Community getBoardNo(int no) {
        
        return communityMapper.selectBoardByNo(no);
    }

    // 게시글 작성, 수정
    @Override
    @Transactional
    public int save(Community community) {
        
        int result = 0;
        
        if(community.getCommunityNo() > 0) {
            // 업데이트
            result = communityMapper.updateBoard(community);
        } else {
            // 인서트
            result = communityMapper.insertBoard(community);
        }
        
        return result;
    }
    
    // 조회수 업데이트
	@Override
	@Transactional
	public int updateCommunityCount(int no, int viewsCount) {
		
		return communityMapper.updateCommunityCount(no, viewsCount);
	}

    // 게시글 삭제
    @Override
    @Transactional
    public int delete(int no) {
        
        return communityMapper.updateStatus(no, "N");
    }

    // 내가 쓴 게시글 조회
	@Override
	public List<Community> getBoardByMember(PageInfo pageInfo, int memberNo) {
		
		int limit = pageInfo.getListLimit();
        int offset = (pageInfo.getCurrentPage() - 1) * limit;
        
        RowBounds rowBounds = new RowBounds(offset, limit);
		
		return communityMapper.selectBoardByMember(rowBounds, memberNo);
	}

	// 내가 쓴 게시글 수
	@Override
	public int getBoardByMemberCount(int memberNo) {
		
		return communityMapper.selectBoardByMemberCount(memberNo);
	}

	// 게시글 파일 삭제
	@Override
	@Transactional
	public int updateFileName(int cNo) {
		
		return communityMapper.updateFileName(cNo);
	}

}
