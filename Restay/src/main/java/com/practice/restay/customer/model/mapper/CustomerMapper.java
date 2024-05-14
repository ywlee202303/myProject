package com.practice.restay.customer.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.practice.restay.customer.model.vo.Customer;

@Mapper
public interface CustomerMapper {
	
	int selectCustomerCount(@Param("menu") String menu);
	
	List<Customer> selectCustomerList(RowBounds rowBounds, @Param("menu") String menu);
	
	int insertCustomerInfo(Customer customer);
}
