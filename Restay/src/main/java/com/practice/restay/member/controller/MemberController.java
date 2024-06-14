package com.practice.restay.member.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.practice.restay.member.model.service.MemberService;
import com.practice.restay.member.model.vo.Member;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@SessionAttributes("loginMember")
public class MemberController {
	
	private final MemberService memberService;

	// 로그인
	@GetMapping("/login")
	public String login() {
		
		return "member/login";
	}
	
	@PostMapping("/login")
	public ModelAndView login(
			ModelAndView modelAndView,
			@RequestParam String userId,
			@RequestParam String userPw
	) {
		
		Member loginMember = memberService.login(userId, userPw);
		
		log.info("Member : {}", loginMember);
		
		if(loginMember != null) {
			// 로그인 성공
			modelAndView.addObject("loginMember", loginMember);
			modelAndView.setViewName("redirect:/");
		} else {
			// 로그인 실패
			modelAndView.addObject("msg", "아이디 또는 비밀번호가 일치하지 않습니다.");
			modelAndView.addObject("location", "/login");
			modelAndView.setViewName("common/msg");
		}
		
		
		return modelAndView;
	}
	
	// 로그아웃
	@GetMapping("/logout")
	public String logout(SessionStatus status) {
		
		// 세션 영역으로 확장된 Attribute를 지워준다.
		status.setComplete();
		
		return "redirect:/";
	}
	
	// 아이디 중복체크
	@PostMapping("/enroll/duplication_check")
	public ResponseEntity<String> duplicationCheck(@RequestParam String userId) {
		
		System.out.println("유저 아이디 : " + userId);
		
		// 회원 아이디 조회
		Member member = memberService.memberIdCheck(userId);
		
		if(member == null) {
			return ResponseEntity.ok("available");
		} else {
			return ResponseEntity.ok("not available");
		}
		
	}
	
	// 회원가입
	@GetMapping("/enroll")
	public String enroll() {
		
		return "member/enroll";
	}
	
	@PostMapping("/enroll")
	public ModelAndView enroll(
			ModelAndView modelAndView,
			Member member
	) {
		
		int result = 0;
		
		result = memberService.save(member);
		
		if(result > 0) {
			// 회원가입 성공
			modelAndView.addObject("msg", "회원가입에 성공하였습니다.");
			modelAndView.addObject("location", "/login");
			modelAndView.setViewName("common/msg");
		} else {
			// 회원가입 실패
			modelAndView.addObject("msg", "회원가입에 실패하였습니다.");
			modelAndView.addObject("location", "/enroll");
			modelAndView.setViewName("common/msg");
		}
		
		return modelAndView;
	}
	
}























