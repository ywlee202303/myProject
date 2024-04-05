package com.practice.restay.notice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class NoticeController {

	// 공지사항 페이지
	@GetMapping("/notice")
	public String Notice() {
		
		return "notice/notice";
	}
}
