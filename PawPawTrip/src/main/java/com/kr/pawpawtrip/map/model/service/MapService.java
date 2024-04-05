package com.kr.pawpawtrip.map.model.service;

import java.util.List;

import com.kr.pawpawtrip.map.model.vo.PositionInfo;

public interface MapService
{

    List<PositionInfo> getPoisitions(String contentType, String keyword);

}
