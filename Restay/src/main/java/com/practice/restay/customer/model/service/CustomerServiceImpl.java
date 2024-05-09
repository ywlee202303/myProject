package com.practice.restay.customer.model.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.practice.restay.customer.model.mapper.CustomerMapper;
import com.practice.restay.customer.model.vo.Customer;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CustomerServiceImpl implements CustomerService {
	
	private final CustomerMapper customerMapper;

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
