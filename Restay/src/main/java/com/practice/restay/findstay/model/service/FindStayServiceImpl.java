package com.practice.restay.findstay.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.practice.restay.findstay.model.mapper.FindStayMapper;
import com.practice.restay.findstay.model.vo.Area;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class FindStayServiceImpl implements FindStayService {
	
	private final FindStayMapper findStayMapper;

	// 지역 조회
	@Override
	public List<Area> getAreaName() {
		
		return findStayMapper.selectAreaName();
	}

}
