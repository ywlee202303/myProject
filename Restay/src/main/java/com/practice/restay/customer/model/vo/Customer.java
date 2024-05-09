package com.practice.restay.customer.model.vo;

import java.time.LocalDate;

import com.practice.restay.member.model.vo.Member;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Customer {

	// 고객센터 번호
	private String customerNo;
	
	// 고객센터 제목
	private String customerTitle;
	
	// 고객센터 카테고리
	private String customerCategory;
	
	// 등록일
	private LocalDate customerEnrollDate;
	
	// 수정일
	private LocalDate customerModifyDate;
	
	// 고객센터 내용
	private String customerContent;
	
	// 파일이름
	private String customerOriginalFileName;
	
	// 서버에 저장될 파일이름
	private String customerRenamedFileName;
	
	// 조회수
	private int customerCount;
	
	// 고객센터 상태(삭제여부)
	private String customerStatus;
	
	// 회원번호
	private int memberNo;
	
	// 회원 아이디
	private Member memberId;
	
}
