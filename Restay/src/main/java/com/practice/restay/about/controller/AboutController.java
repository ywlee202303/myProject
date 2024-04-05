package com.practice.restay.about.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AboutController {

	// about 페이지
	@GetMapping("/about")
	public String About() {
		
		return "about/about";
	}
}
