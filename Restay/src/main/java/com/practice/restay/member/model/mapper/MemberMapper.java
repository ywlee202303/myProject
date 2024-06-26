package com.practice.restay.member.model.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.practice.restay.member.model.vo.Member;

@Mapper
public interface MemberMapper {

	// 로그인, 아이디 조회
	Member selectMemberId(@Param("memberId") String userId);

	// 회원가입
	int insertMember(Member member);
	
	// 회원정보 수정
	int updateMember(Member member);
	
	// 회원 탈퇴
	int deleteMember(@Param("memberNo") int memberNo);

}
