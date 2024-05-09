package com.practice.restay.customer.model.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.practice.restay.customer.model.vo.Customer;

@Mapper
public interface CustomerMapper {
	
	int insertCustomerInfo(Customer customer);
}
