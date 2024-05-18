package com.practice.restay.findstay.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.practice.restay.findstay.model.vo.Area;
import com.practice.restay.findstay.model.vo.House;
import com.practice.restay.findstay.model.vo.HouseImage;

@Mapper
public interface FindStayMapper {

	List<Area> selectAreaName();
	
	List<Area> selectSigunguName(@Param("areaCode") int areaCode);
	
	Area selectAreaInfo(@Param("areaCode") int areaCode, @Param("sigunguCode") int sigunguCode);
	
	int selectHouseListCount(@Param("inputSearch") String inputSearch,@Param("searchLocationKewords") List<String> searchLocationKewords);
	
	List<House> selectOnlyHouseList(RowBounds rowBounds,@Param("inputSearch") String inputSearch,@Param("searchLocationKewords") List<String> searchLocationKewords);
	
	List<House> selectHouseList(@Param("list") List<String> houseCode,@Param("inputSearch") String inputSearch,@Param("searchLocationKewords") List<String> searchLocationKewords);
	
	List<HouseImage> selectHouseImageList(List<String> houseCode);
	
	int insertHouseInfo(House house);
	
	int insertHouseImageInfo(HouseImage houseImage);
	
}
