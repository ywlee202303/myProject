package com.practice.restay.customer.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.practice.restay.customer.model.vo.Customer;

@Mapper
public interface CustomerMapper {
	
	List<Customer> selectNoticeList();
	
	List<Customer> selectBoardList();
	
	List<Customer> selectQuestionList();
	
	int insertCustomerInfo(Customer customer);
}
