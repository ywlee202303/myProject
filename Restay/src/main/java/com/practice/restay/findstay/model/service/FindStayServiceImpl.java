package com.practice.restay.findstay.model.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.practice.restay.findstay.model.mapper.FindStayMapper;
import com.practice.restay.findstay.model.vo.Area;
import com.practice.restay.findstay.model.vo.House;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class FindStayServiceImpl implements FindStayService {
	
	private final FindStayMapper findStayMapper;

	// 지역 조회(시, 도)
	@Override
	public List<Area> getAreaName() {
		
		return findStayMapper.selectAreaName();
	}

	// 지역 조회(시군구)
	@Override
	public List<Area> getSigunguName(int areaCode) {
		
		return findStayMapper.selectSigunguName(areaCode);
	}

	// 지역 조회(시, 도 / 시군구)
	@Override
	public Area getAreaInfo(int areaCode, int sigunguCode) {
		
		return findStayMapper.selectAreaInfo(areaCode, sigunguCode);
	}

	// 숙소 등록 수정
	@Override
	@Transactional
	public int saveHouseInfo(House house) {
		
		int result = 0;
		
		if(house.getHouseCode() != null) {
			// update
		} else {
			// insert
			result = findStayMapper.insertHouseInfo(house);
		}
		
		return result;
	}

}
