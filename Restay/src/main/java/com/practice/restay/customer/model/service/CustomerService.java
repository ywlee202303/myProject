package com.practice.restay.customer.model.service;

import java.util.List;

import com.practice.restay.common.util.PageInfo;
import com.practice.restay.customer.model.vo.Customer;

public interface CustomerService {

	// 고객센터(공지사항, 자유게시판, 자주 묻는 질문 카운트)
	int getCustomerCount(String menu);
	
	// 고객센터(1:1문의 카운트)
	int getCustomerInquiryCount();
	
	// 고객센터(공지사항, 자유게시판, 자주 묻는 질문 리스트)
	List<Customer> getCustomerList(PageInfo pageInfo, String menu);
	
	// 고객센터(1:1문의)
	List<Customer> getCustomerInquiryList(PageInfo pageInfo);
	
	// 고객센터 상세조회(공지사항, 자유게시판, 자주 묻는 질문)
	Customer detailCustomer(String customerNo);
	
	// 고객센터 글 등록/수정
	int save(Customer customer);

	// 고객센터 1:1문의 등록/수정
	int saveInquiry(Customer customer);

}
