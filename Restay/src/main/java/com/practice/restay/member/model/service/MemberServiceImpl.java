package com.practice.restay.member.model.service;

import org.springframework.stereotype.Service;

import com.practice.restay.member.model.mapper.MemberMapper;
import com.practice.restay.member.model.vo.Member;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService {
	
	private final MemberMapper memberMapper;

	// 로그인
	@Override
	public Member login(String userId, String userPw) {
		
		Member loginMember = memberMapper.selectMemberId(userId);
		
		// 패스워드 검사
		if(loginMember != null && userPw.equals(loginMember.getMemberPw())) {
			// 로그인 성공
			return loginMember;
		} else {
			// 로그인 실패
			return null;
		}
		
	}

	// 아이디 중복 체크
	@Override
	public Member memberIdCheck(String userId) {
		
		return memberMapper.selectMemberId(userId);
		
	}

}
