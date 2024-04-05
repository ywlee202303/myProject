package com.kr.pawpawtrip.member.model.service;

import java.util.HashMap;
import java.util.Map;

import com.kr.pawpawtrip.member.model.vo.Member;

public interface MemberService {

	Member login(String memberId, String memberPw);

	int save(Member member);

	Boolean isDuplicateId(String memberId);

	String getAccessToken(String code);

	Member getUserInfo(String access_Token);

	Member findMemberById(String memberId);

	int delete(int memberNo);

	// 아이디 찾기
	String findMemberId(String memberName, String memberPhone);

	// 비밀번호 찾기
	Member findMemberAndChangePw(String memberId, String memberName, String memberPhone);
	
}
