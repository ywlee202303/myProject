package com.practice.restay.customer.model.service;

import com.practice.restay.customer.model.vo.Customer;

public interface CustomerService {

	// 고객센터 글 등록/수정
	int save(Customer customer);

}
