package com.practice.restay.payment.model.vo;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Payment {

	private String payCode; // 결제 코드
	
	private LocalDate payDate; // 결제일
	
	private String payMethod; // 결제 수단
	
	private String resCode; // 예매 코드
	
}
