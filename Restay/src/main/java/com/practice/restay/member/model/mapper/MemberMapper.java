package com.practice.restay.member.model.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.practice.restay.member.model.vo.Member;

@Mapper
public interface MemberMapper {

	Member selectMemberId(@Param("memberId") String userId);

}
