package com.practice.restay.payment.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.practice.restay.findstay.model.service.FindStayService;
import com.practice.restay.findstay.model.vo.Reservation;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class PaymentController {
	
	private final FindStayService findStayService;

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
			ModelAndView modelAndView
	) {
		
		modelAndView.setViewName("redirect:/mypage/reservation");
		
		return modelAndView;
	}
}
