package com.practice.restay.customer.model.service;

import java.util.List;

import com.practice.restay.customer.model.vo.Customer;

public interface CustomerService {

	// 고객센터(공지사항 리스트)
	List<Customer> getNoticeList();
	
	// 고객센터(자유게시판 리스트)
	List<Customer> getBoardList();
	
	// 고객센터(자주 묻는 질문 리스트)
	List<Customer> getQuestionList();
	
	// 고객센터 글 등록/수정
	int save(Customer customer);
	
}
