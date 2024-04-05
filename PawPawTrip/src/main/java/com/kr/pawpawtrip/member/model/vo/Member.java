package com.kr.pawpawtrip.member.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Member {
	private int memberNo;
	
	private String memberId;
		
	private String memberPw;
	
	private String memberRole;
	
	private String memberPhone;
	
	private String memberEmail;
	
	private int memberBirth;
	
	private String memberPetName;
	
	private String memberPetType;
	
	private String memberStatus;
	
	private Date MemberEd;
	
	// 회원정보 수정일
	private Date memberMd;
	
	private String mrktAgreeYn;
	
	private String recvAgreeYn;
	
	private String locaAgreeYn;
	
	private String memberName;
	
}
