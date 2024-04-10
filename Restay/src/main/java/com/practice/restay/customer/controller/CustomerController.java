package com.practice.restay.customer.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CustomerController {

	// 공지사항 페이지
	@GetMapping("/customer")
	public String Notice() {
		
		return "customer/customer";
	}
}
