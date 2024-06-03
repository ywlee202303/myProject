package com.practice.restay.payment.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.practice.restay.findstay.model.service.FindStayService;
import com.practice.restay.findstay.model.vo.Reservation;
import com.practice.restay.payment.model.service.PaymentService;
import com.practice.restay.payment.model.vo.Payment;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class PaymentController {
	
	private final FindStayService findStayService;
	private final PaymentService paymentService;

	// 결제
	@GetMapping("/payment")
	public ModelAndView payment(
			ModelAndView modelAndView,
			@RequestParam("resCode") String resCode
	) {
		
		Reservation reservation = null;
		
		// 예약 사용자, 숙소 정보 조회
		reservation = findStayService.resMemberHouseInfo(resCode);
		
		System.out.println("####예약 사용자, 숙소 정보 조회#### : " + reservation);
		
		modelAndView.addObject("reservation", reservation);
		modelAndView.setViewName("payment/Payment");
		
		return modelAndView;
	}
	
	@PostMapping("payment")
	public ModelAndView payment(
			ModelAndView modelAndView,
			Payment payment
	) {
		
		int result = 0;
		
		// 결제정보 insert
		result = paymentService.savePaymentInfo(payment);
		
		if(result > 0) {
			modelAndView.addObject("msg", "결제가 완료되었습니다.");
			modelAndView.addObject("location", "/mypage/reservation");
		} else {
			modelAndView.addObject("msg", "결제가 정상적으로 이루어지지 않았습니다.");
			modelAndView.addObject("location", "/payment?resCode=" + payment.getResCode());
		}
		
		modelAndView.setViewName("common/msg");
		
		return modelAndView;
	}
}
