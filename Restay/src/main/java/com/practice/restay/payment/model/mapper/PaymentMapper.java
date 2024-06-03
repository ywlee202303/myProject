package com.practice.restay.payment.model.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.practice.restay.payment.model.vo.Payment;

@Mapper
public interface PaymentMapper {
	
	int insertPaymentInfo(Payment payment);

}
