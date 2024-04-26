package com.practice.restay.findstay.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.practice.restay.findstay.model.vo.Area;
import com.practice.restay.findstay.model.vo.House;

@Mapper
public interface FindStayMapper {

	List<Area> selectAreaName();
	
	List<Area> selectSigunguName(@Param("areaCode") int areaCode);
	
	Area selectAreaInfo(@Param("areaCode") int areaCode, @Param("sigunguCode") int sigunguCode);
	
	List<House> selectHouseList();
	
	int insertHouseInfo(House house);
}
