package com.practice.restay.customer.model.vo;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Reply {

	// 댓글 번호
	private String replyNo;
	
	// 고객센터 번호
	private String customerNo;
	
	// 작성자 번호
	private int writerNo;
	
	// 댓글 내용
	private String replyContent;
	
	// 댓글 상태
	private String replyStatus;
	
	// 댓글 등록일
	private LocalDate replyCreateDate;
	
	// 댓글 수정일
	private LocalDate replyModifyDate;
	
	// 작성자 아이디
	private String writerId;
	
}
