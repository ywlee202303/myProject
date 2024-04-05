package com.practice.restay.promotion.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PromotionController {

	// 프로모션 페이지
	@GetMapping("/promotion")
	public String Promotion() {
		
		return "promotion/promotion";
	}
}
