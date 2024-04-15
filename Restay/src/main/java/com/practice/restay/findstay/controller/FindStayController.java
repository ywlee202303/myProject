package com.practice.restay.findstay.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class FindStayController {

	// 숙소 조회 페이지
	@GetMapping("/findstay")
	public String FindStay() {
		
		return "findstay/FindStay";
	}
	
	// 숙소 예약 패이지
	@GetMapping("/findstay/room")
	public String Room() {
		
		return "findstay/room";
	}
}
