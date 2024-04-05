package com.kr.pawpawtrip.map.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.kr.pawpawtrip.map.model.vo.PositionInfo;

@Mapper
public interface MapMapper
{
    List<PositionInfo> selectAllPositions(@Param("contentType") String contentType, @Param("keyword") String keyword);
}
