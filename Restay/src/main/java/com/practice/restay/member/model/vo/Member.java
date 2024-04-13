package com.practice.restay.member.model.vo;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Member {

	// 회원번호
	private String memberNo;
	
	// 회원아이디
	private String memberId;
	
	// 회원비밀번호
	private String memberPw;
	
	// 회원타입
	private String memberRole;
	
	// 회원이름
	private String memberName;
	
	// 회원이메일
	private String memberEmail;
	
	// 회원전화번호
	private String memberPhone;
	
	// 회원가입일
	private LocalDate memberEd;
	
	// 회원정보수정일
	private LocalDate memberMd;
	
	// 회원상태
	private String memberStatus;
	
}
