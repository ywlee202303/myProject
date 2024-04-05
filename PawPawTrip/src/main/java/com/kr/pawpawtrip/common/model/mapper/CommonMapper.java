package com.kr.pawpawtrip.common.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.kr.pawpawtrip.common.model.vo.Category;
import com.kr.pawpawtrip.common.model.vo.CommonArea;

@Mapper
public interface CommonMapper
{
    Category selectCategoryGroupBySml(@Param("smlCategory") String smlCategory);

    CommonArea selectCommonArea(@Param("areaCode") String areaCode, @Param("sigunguCode") String sigunguCode);

    List<CommonArea> selectAreaByCode(@Param("areaCode") String areaCode);
}