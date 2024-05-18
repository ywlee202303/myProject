package com.practice.restay.customer.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.practice.restay.common.util.PageInfo;
import com.practice.restay.customer.model.mapper.CustomerMapper;
import com.practice.restay.customer.model.vo.Customer;
import com.practice.restay.customer.model.vo.Reply;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CustomerServiceImpl implements CustomerService {
	
	private final CustomerMapper customerMapper;
	
	// 고객센터(공지사항, 자유게시판, 자주 묻는 질문 카운트)
	@Override
	public int getCustomerCount(String menu) {
		
		return customerMapper.selectCustomerCount(menu);
	}
	
	// 고객센터(1:1문의 카운트)
	@Override
	public int getCustomerInquiryCount() {
		
		return customerMapper.selectCustomerInquiryCount();
	}
	
	// 댓글 카운트
	@Override
	public int replyCount(String customerNo) {
		
		return customerMapper.selectReplyCount(customerNo);
	}
	
	// 고객센터(공지사항, 자유게시판, 자주 묻는 질문 리스트)
	@Override
	public List<Customer> getCustomerList(PageInfo pageInfo, String menu) {
		
		int limit = pageInfo.getListLimit();
		int offset = (pageInfo.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return customerMapper.selectCustomerList(rowBounds, menu);
	}
	
	// 고객센터(1:1문의)
	@Override
	public List<Customer> getCustomerInquiryList(PageInfo pageInfo) {
		
		int limit = pageInfo.getListLimit();
		int offset = (pageInfo.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return customerMapper.selectCustomerInquiryList(rowBounds);
	}
	
	// 고객센터(상세 조회)
	@Override
	public Customer detailCustomer(String customerNo) {
		
		return customerMapper.selectDetailCustomer(customerNo);
	}
	
	// 댓글 조회
	@Override
	public List<Reply> getReplyList(String customerNo, PageInfo pageInfo) {
		
		int limit = pageInfo.getListLimit();
		int offset = (pageInfo.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return customerMapper.selectReplyList(customerNo, rowBounds);
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

	// 고객센터 1:1문의 등록/수정
	@Override
	@Transactional
	public int saveInquiry(Customer customer) {
		
		int result = 0;
		
		if(customer.getCustomerNo() != null) {
			// update
		} else {
			// insert
			result = customerMapper.insertCustomerInquiryInfo(customer);
		}
		
		return result;
	}

	// 조회수 업데이트
	@Override
	@Transactional
	public int updateCustomerCount(String customerNo, int viewCount) {
		
		return customerMapper.updateCustomerCount(customerNo, viewCount);
	}

	// 댓글 등록/수정
	@Override
	public int saveReply(Reply reply) {
		
		int result = 0;
		
		if(reply.getReplyNo() != null) {
			// update
		} else {
			// insert
			result = customerMapper.insertReply(reply);
		}
		
		return result;
	}

}
