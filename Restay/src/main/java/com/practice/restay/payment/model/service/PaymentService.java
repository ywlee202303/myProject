package com.practice.restay.payment.model.service;

import com.practice.restay.payment.model.vo.Payment;

public interface PaymentService {

	// 결제정보 insert
	int savePaymentInfo(Payment payment);

}
