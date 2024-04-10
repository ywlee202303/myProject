package com.practice.restay.travel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TravelController {

	// 프로모션 페이지
	@GetMapping("/travel")
	public String Travel() {
		
		return "travel/travel";
	}
}
