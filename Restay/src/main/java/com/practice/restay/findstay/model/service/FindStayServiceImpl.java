package com.practice.restay.findstay.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.practice.restay.common.util.PageInfo;
import com.practice.restay.findstay.model.mapper.FindStayMapper;
import com.practice.restay.findstay.model.vo.Area;
import com.practice.restay.findstay.model.vo.House;
import com.practice.restay.findstay.model.vo.HouseImage;

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
	
	// 숙소 리스트 수
	@Override
	public int getHouseListCount() {
		
		return findStayMapper.selectHouseListCount();
	}
	
	// 숙소 조회(숙소만)
	@Override
	public List<House> getOnlyHouseList(PageInfo pageInfo) {
		
		int limit = pageInfo.getListLimit();
		int offset = (pageInfo.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return findStayMapper.selectOnlyHouseList(rowBounds);
	}
	
	// 숙소 조회(이미지 포함)
	@Override
	public List<House> getHouseList(List<String> houseCode) {
		
		return findStayMapper.selectHouseList(houseCode);
	}
	
	// 숙소 이미지 조회
	@Override
	public List<HouseImage> getHouseImageList(List<String> houseCode) {
		
		return findStayMapper.selectHouseImageList(houseCode);
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

	// 숙소 이미지 등록 수정
	@Override
	public int saveHouseImageInfo(HouseImage houseImage) {
		
		int result = 0;
		
		if(houseImage.getHouseImageCode() != null) {
			// update
		} else {
			// insert
			result = findStayMapper.insertHouseImageInfo(houseImage);
		}
		
		return result;
	}

}
