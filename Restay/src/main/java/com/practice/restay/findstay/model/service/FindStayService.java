package com.practice.restay.findstay.model.service;

import java.util.List;

import com.practice.restay.findstay.model.vo.Area;

public interface FindStayService {

	// 지역 조회
	List<Area> getAreaName();
	
}
