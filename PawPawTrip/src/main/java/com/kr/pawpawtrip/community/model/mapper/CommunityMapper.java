package com.kr.pawpawtrip.community.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.kr.pawpawtrip.community.model.vo.Community;

@Mapper
public interface CommunityMapper
{
    int selectBoardCount(     @Param("select") String select, @Param("search") String search);
    int selectNoticeCount(    @Param("select") String select, @Param("search") String search);
    int selectBoardTalkCount( @Param("select") String select, @Param("search") String search);
    int selectBoardMypetCount(@Param("select") String select, @Param("search") String search);


    List<Community> selectBoardList(     RowBounds rowBounds, @Param("select") String select, @Param("search") String search);
    List<Community> selectBoardTalkList( RowBounds rowBounds, @Param("select") String select, @Param("search") String search);
    List<Community> selectBoardMypetList(RowBounds rowBounds, @Param("select") String select, @Param("search") String search);
    List<Community> selectNoticeList(    RowBounds rowBounds, @Param("select") String select, @Param("search") String search);

    Community selectBoardByNo(@Param("no") int no);

    int insertBoard(Community community);
    int insertNotice(Community community);
    int updateBoard(Community community);
    
    int updateCommunityCount(@Param("no") int no, @Param("viewsCount") int viewsCount);
    
    int updateStatus(@Param("no") int no, @Param("status") String status);
    
    List<Community> selectBoardByMember(RowBounds rowBounds, @Param("memberNo") int memberNo);
    
    int selectBoardByMemberCount(@Param("memberNo") int memberNo);
    
    int updateFileName(@Param("cNo") int cNo);
}
