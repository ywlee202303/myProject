package com.practice.restay.payment.model.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.practice.restay.payment.model.mapper.PaymentMapper;
import com.practice.restay.payment.model.vo.Payment;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class PaymentServiceImpl implements PaymentService {
	
	private final PaymentMapper paymentMapper;

	// 결제정보 insert
	@Override
	@Transactional
	public int savePaymentInfo(Payment payment) {
		
		int result = 0;
		
		result = paymentMapper.insertPaymentInfo(payment);
		
		return result;
	}

	// 결제정보
	@Override
	public Payment paymentInfo(String resCode) {
		
		return paymentMapper.selectPaymentInfo(resCode);
	}

}
