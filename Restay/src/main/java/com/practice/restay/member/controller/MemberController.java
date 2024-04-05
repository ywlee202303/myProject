package com.practice.restay.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MemberController {

	@GetMapping("/login")
	public String Login() {
		
		return "member/login";
	}
	
	@GetMapping("/enroll")
	public String Enroll() {
		
		return "member/enroll";
	}
}
