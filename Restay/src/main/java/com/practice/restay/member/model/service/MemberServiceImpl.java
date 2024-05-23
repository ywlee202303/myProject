package com.practice.restay.member.model.service;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.practice.restay.member.model.mapper.MemberMapper;
import com.practice.restay.member.model.vo.Member;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService {
	
	private final MemberMapper memberMapper;
	private final BCryptPasswordEncoder encoder;

	// 로그인
	@Override
	public Member login(String userId, String userPw) {
		
		Member loginMember = memberMapper.selectMemberId(userId);
		
		// matches 메소드를 사용하면 내부적으로 복호화해서 
		// 나온 결과 값에 솔트값을 땐 나머지 값과 원문을 비교
		if(loginMember == null || !encoder.matches(userPw, loginMember.getMemberPw())) {
			return null;
		}
		
		return loginMember;
		
	}

	// 아이디 중복 체크
	@Override
	public Member memberIdCheck(String userId) {
		
		return memberMapper.selectMemberId(userId);
		
	}

	// 회원가입 / 수정
	@Override
	@Transactional // 에러가 생기면 자동 롤백
	public int save(Member member) {
		
		System.out.println("멤버가 널이냐? : " + member == null);
		
		int result = 0;
		
		if(member.getMemberNo() > 0) {
			// update
			// 새로운 비밀번호를 암호화하여 설정
			member.setMemberPw(encoder.encode(member.getMemberPw()));
			result = memberMapper.updateMember(member);
		} else {
			// insert
			// 새로운 비밀번호를 암호화하여 설정
			member.setMemberPw(encoder.encode(member.getMemberPw()));
			result = memberMapper.insertMember(member);
		}
		
		return result;
		
	}

}
