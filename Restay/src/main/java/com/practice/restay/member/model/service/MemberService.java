package com.practice.restay.member.model.service;

import com.practice.restay.member.model.vo.Member;

public interface MemberService {

	// 로그인
	Member login(String userId, String userPw);

	// 아이디 중복 체크
	Member memberIdCheck(String userId);

	// 회원가입 / 수정
	int save(Member member);

}
