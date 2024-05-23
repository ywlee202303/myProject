package com.practice.restay.customer.model.service;

import java.util.List;

import com.practice.restay.common.util.PageInfo;
import com.practice.restay.customer.model.vo.Customer;
import com.practice.restay.customer.model.vo.Reply;

public interface CustomerService {

	// 고객센터(공지사항, 자유게시판, 자주 묻는 질문 카운트)
	int getCustomerCount(String menu);
	
	// 고객센터(1:1문의 카운트)
	int getCustomerInquiryCount();
	
	// 댓글 카운트
	int replyCount(String customerNo);
	
	// 고객센터(공지사항, 자유게시판, 자주 묻는 질문 리스트)
	List<Customer> getCustomerList(PageInfo pageInfo, String menu);
	
	// 고객센터(1:1문의)
	List<Customer> getCustomerInquiryList(PageInfo pageInfo);
	
	// 고객센터 상세조회(공지사항, 자유게시판, 자주 묻는 질문)
	Customer detailCustomer(String customerNo);
	
	// 댓글 조회
	List<Reply> getReplyList(String customerNo, PageInfo pageInfo);
	
	// 고객센터 글 등록/수정
	int save(Customer customer);

	// 고객센터 1:1문의 등록/수정
	int saveInquiry(Customer customer);

	// 조회수 업데이트
	int updateCustomerCount(String customerNo, int viewCount);

	// 댓글 등록/수정
	int saveReply(Reply reply);

	// 첨부파일 삭제(null 처리)
	int updateFileName(String customerNo);

	// 고객센터 1:1문의 삭제
	int delete(String customerNo);

}
