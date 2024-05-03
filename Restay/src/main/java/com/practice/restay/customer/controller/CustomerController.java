package com.practice.restay.customer.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CustomerController {

	// 고객센터 페이지
	@GetMapping("/customer")
	public String customer() {
		
		return "customer/Customer";
	}
	
	// 고객센터 등록 페이지(공지사항, 자유게시판, 자주묻는질문)
	@GetMapping("/customer/write")
	public String write() {
		
		return "customer/Write";
	}
	
	@PostMapping("/customer/write")
	public ModelAndView write(ModelAndView modelAndView) {
		
		modelAndView.addObject("msg", "등록 테스트");
		modelAndView.setViewName("common/msg");
		
		return modelAndView;
	}
}
