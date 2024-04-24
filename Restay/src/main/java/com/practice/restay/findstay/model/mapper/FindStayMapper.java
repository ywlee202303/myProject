package com.practice.restay.findstay.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.practice.restay.findstay.model.vo.Area;

@Mapper
public interface FindStayMapper {

	List<Area> selectAreaName();
}
