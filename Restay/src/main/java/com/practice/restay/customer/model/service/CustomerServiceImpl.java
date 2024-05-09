package com.practice.restay.customer.model.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.practice.restay.customer.model.mapper.CustomerMapper;
import com.practice.restay.customer.model.vo.Customer;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CustomerServiceImpl implements CustomerService {
	
	private final CustomerMapper customerMapper;
	
	// 고객센터(공지사항 리스트)
	@Override
	public List<Customer> getNoticeList() {
		
		return customerMapper.selectNoticeList();
	}
	
	// 고객센터(자유게시판 리스트)
	@Override
	public List<Customer> getBoardList() {
		
		return customerMapper.selectBoardList();
	}
	
	// 고객센터(자주 묻는 질문 리스트)
	@Override
	public List<Customer> getQuestionList() {
		
		return customerMapper.selectQuestionList();
	}

	// 고객센터 글 등록/수정
	@Override
	@Transactional
	public int save(Customer customer) {
		
		int result = 0;
		
		if(customer.getCustomerNo() != null) {
			// update
		} else {
			// insert
			result = customerMapper.insertCustomerInfo(customer);
		}
		
		return result;
	}

}
