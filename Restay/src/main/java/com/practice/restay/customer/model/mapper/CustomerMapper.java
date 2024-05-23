package com.practice.restay.customer.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.practice.restay.customer.model.vo.Customer;
import com.practice.restay.customer.model.vo.Reply;

@Mapper
public interface CustomerMapper {
	
	int selectCustomerCount(@Param("menu") String menu);
	
	int selectCustomerInquiryCount();
	
	int selectReplyCount(@Param("customerNo") String customerNo);
	
	List<Customer> selectCustomerList(RowBounds rowBounds, @Param("menu") String menu);
	
	List<Customer> selectCustomerInquiryList(RowBounds rowBounds);
	
	Customer selectDetailCustomer(@Param("customerNo") String customerNo);
	
	List<Reply> selectReplyList(@Param("customerNo") String customerNo, RowBounds rowBounds);
	
	int insertCustomerInfo(Customer customer);
	
	int insertCustomerInquiryInfo(Customer customer);
	
	int updateCustomerCount(@Param("customerNo") String customerNo, @Param("viewCount") int viewCount);
	
	int insertReply(Reply reply);
	
	int updateCustomerInfo(Customer customer);
	
	int updateFileName(@Param("customerNo") String customerNo);
	
	int deleteCustomerInfo(@Param("customerNo") String customerNo);
	
}
