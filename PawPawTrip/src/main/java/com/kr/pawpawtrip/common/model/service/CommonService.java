package com.kr.pawpawtrip.common.model.service;

import java.util.List;

import com.kr.pawpawtrip.common.model.vo.Category;
import com.kr.pawpawtrip.common.model.vo.CommonArea;

public interface CommonService
{
    Category getAllCategory(String smlCategory);
    
    CommonArea getFullAreaName(String areaCode, String sigunguCode);

    List<CommonArea> getAreaByCode(String areaCode);
}
