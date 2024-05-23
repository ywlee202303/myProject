package com.practice.restay.mypage.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
@SessionAttributes("loginMember")
@RequiredArgsConstructor
public class MypageController {
	
	private final MemberService memberService;

	// 예약 페이지
	@GetMapping("/mypage/reservation")
	public ModelAndView reservation(
			ModelAndView modelAndView
	) {
		
		modelAndView.setViewName("mypage/Reservation");
		
		return modelAndView;
	}
	
	// 취소 페이지
	@GetMapping("/mypage/cancel")
	public ModelAndView cancel(
			ModelAndView modelAndView
	) {
		
		modelAndView.setViewName("mypage/Cancel");
		
		return modelAndView;
	}
	
	// 관심 스테이
	@GetMapping("mypage/interest")
	public ModelAndView interest(
			ModelAndView modelAndView
	) {
		
		modelAndView.setViewName("mypage/Interest");
		
		return modelAndView;
	}
	
	// 회원 정보 수정
	@GetMapping("mypage/member/edit")
	public ModelAndView edit(
			ModelAndView modelAndView
	) {
		
		modelAndView.setViewName("mypage/Edit");
		
		return modelAndView;
	}
	
	@PostMapping("mypage/member/edit")
	public ModelAndView edit(
			ModelAndView modelAndView,
			Member member,
			HttpSession session,
			@SessionAttribute("loginMember") Member loginMember,
			SessionStatus status
	) {
		
		int result = 0;
		
		member.setMemberNo(loginMember.getMemberNo());
		member.setMemberId(loginMember.getMemberId());
		
		System.out.println("멤버 : " + member);
		
		result = memberService.save(member);
		
		if(result > 0) {
			// 회원정보 수정 완료
			status.setComplete();
			modelAndView.addObject("msg", "회원정보 수정 완료! 다시 로그인 해주세요.");
			modelAndView.addObject("location", "/login");
		} else {
			// 회원정보 수정 실패
			modelAndView.addObject("msg", "회원정보 수정 실패");
			modelAndView.addObject("location", "/mypage/member/edit");
		}
		
		
		modelAndView.setViewName("common/msg");
		
		return modelAndView;
	}
}
