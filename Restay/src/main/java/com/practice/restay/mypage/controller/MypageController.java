package com.practice.restay.mypage.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.practice.restay.common.util.PageInfo;
import com.practice.restay.customer.model.service.CustomerService;
import com.practice.restay.customer.model.vo.Customer;
import com.practice.restay.findstay.model.service.FindStayService;
import com.practice.restay.findstay.model.vo.HouseImage;
import com.practice.restay.findstay.model.vo.Reservation;
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
	private final CustomerService customerService;
	private final FindStayService findStayService;

	// 예약 페이지
	@GetMapping("/mypage/reservation")
	public ModelAndView reservation(
			ModelAndView modelAndView,
			@SessionAttribute("loginMember") Member loginMember
	) {
		
		// 나의 예약 숙소 정보 조회
		String resState = "결제완료";
		List<Reservation> myResHouseList = null;
		
		myResHouseList = findStayService.getMyResHouse(loginMember.getMemberNo(), resState);
		
		System.out.println("####나의 예약 숙소 정보#### : " + myResHouseList);
		
		modelAndView.addObject("myResHouseList", myResHouseList);
		modelAndView.setViewName("mypage/Reservation");
		
		return modelAndView;
	}
	
	// 취소 페이지
	@GetMapping("/mypage/cancel")
	public ModelAndView cancel(
			ModelAndView modelAndView,
			@SessionAttribute("loginMember") Member loginMember
	) {
		
		// 결제 취소 리스트
		String resState = "결제취소";
		List<Reservation> myResCancelHouseList = null;
		
		myResCancelHouseList = findStayService.getMyResHouse(loginMember.getMemberNo(), resState);
		
		System.out.println("####예약 취소 정보#### : " + myResCancelHouseList);
		
		modelAndView.addObject("myResCancelHouseList", myResCancelHouseList);
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
	
	// 비밀번호 입력 페이지
	@GetMapping("mypage/member/check")
	public ModelAndView check(
			ModelAndView modelAndView
	) {
		
		modelAndView.setViewName("mypage/Check");
		
		return modelAndView;
	}
	
	@PostMapping("mypage/member/check")
	public ModelAndView check(
			ModelAndView modelAndView,
			@RequestParam("memberPw") String memberPw,
			@SessionAttribute("loginMember") Member member
	) {
		
		Member loginMember = memberService.login(member.getMemberId(), memberPw);
		
		if(loginMember != null) {
			modelAndView.addObject("loginMember", loginMember);
			modelAndView.setViewName("redirect:/mypage/member/edit");
		} else {
			modelAndView.addObject("msg", "패스워드가 일치하지 않습니다.");
			modelAndView.addObject("location", "/mypage/member/check");
			modelAndView.setViewName("common/msg");
		}
		
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
	
	// 회원 탈퇴
	@PostMapping("/mypage/member/delete")
	public ModelAndView delete(
			ModelAndView modelAndView,
			@SessionAttribute("loginMember") Member loginMember,
			SessionStatus status
	) {
		
		System.out.println("####회원 탈퇴 로그인 정보#### : " + loginMember);
		
		int result = 0;
		
		result = memberService.delete(loginMember.getMemberNo());
		
		if(result > 0) {
			// 회원 탈퇴 성공
			modelAndView.addObject("msg", "정상적으로 탈퇴 되었습니다.");
			status.setComplete();
			modelAndView.addObject("location", "/");
		} else {
			// 회원 탈퇴 실패
			modelAndView.addObject("msg", "회원 탈퇴에 실패하였습니다.");
			modelAndView.addObject("location", "/mypage/member/edit");
		}
		
		modelAndView.setViewName("common/msg");
		
		return modelAndView;
	}
	
	// 나의 문의 내역(1:1 문의 내역)
	@GetMapping("/mypage/customer/myinquiry")
	public ModelAndView myInquiry(
			ModelAndView modelAndView,
			@SessionAttribute("loginMember") Member loginMember,
			@RequestParam(defaultValue = "1") int page
	) {
		
		PageInfo pageInfo = null;
		List<Customer> myInquiryList = null;
		int myInquiryCount = 0;
		
		myInquiryCount = customerService.getMyInquiryCount(loginMember.getMemberNo());
		
		pageInfo = new PageInfo(page, 5, myInquiryCount, 10);
		
		myInquiryList = customerService.getMyInquiryList(loginMember.getMemberNo(), pageInfo);
		
		System.out.println("####나의 문의 내역 로그인 정보#### : " + loginMember);
		System.out.println("####나의 문의 내역 리스트#### : " + myInquiryList);
		
		modelAndView.addObject("pageInfo", pageInfo);
		modelAndView.addObject("myInquiryList", myInquiryList);
		modelAndView.setViewName("mypage/MyInquiry");
		
		return modelAndView;
	}
	
}
