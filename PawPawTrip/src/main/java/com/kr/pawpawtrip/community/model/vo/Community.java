package com.kr.pawpawtrip.community.model.vo;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Community {

	// 커뮤니티 번호
	private int communityNo;
	
	// ROWNUM
	private int communityRNUM;

	// 커뮤니티 분류
	private String communityCategory;

	// 커뮤니티 제목
	private String communityTitle;

	// 커뮤니티 내용
	private String communityContent;

	// 커뮤니티 등록일
	private LocalDate communityEd;

	// 커뮤니티 상태
	private String communityStatus;

	// 조회수
	private int communityCount;

	// 첨부파일 원래이름
	private String communityOfileName;

	// 첨부파일 변경이름
	private String communityRfileName;

	// 공지사항 중요 여부
	private String noticeImportantYN;
	
	// 커뮤니티 작성자 번호
	private int communityWriterNo;
	
	// 커뮤니티 작성자 아이디
	private String communityWriterId;
	
}
