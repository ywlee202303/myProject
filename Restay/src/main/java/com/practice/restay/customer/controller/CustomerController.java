package com.practice.restay.customer.controller;

import java.io.IOException;

import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.practice.restay.common.util.MultipartFileUtil;
import com.practice.restay.customer.model.service.CustomerService;
import com.practice.restay.customer.model.vo.Customer;
import com.practice.restay.member.model.vo.Member;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class CustomerController {
	
	private final CustomerService customerService;
	private final ResourceLoader resourceLoader;

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
	public ModelAndView write(
			ModelAndView modelAndView,
			Customer customer,
			@RequestParam("fileName") MultipartFile fileName,
			@SessionAttribute("loginMember") Member loginMember
		) {
		
		int result = 0;
		String location = null;
		String renamedFileName = null;
		
		// 회원 번호 Customer 객체에 저장
		customer.setMemberNo(loginMember.getMemberNo());
		
		// Parameter로 넘어온 첨부파일 객체에 저장
		try {
			location = resourceLoader.getResource("resources/upload/customer").getFile().getPath();
			
			if(!fileName.isEmpty()) {
				renamedFileName = MultipartFileUtil.save(fileName, location);
				
				customer.setCustomerOriginalFileName(fileName.getOriginalFilename());
				customer.setCustomerRenamedFileName(renamedFileName);
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		log.info("파일 정보 : {}", fileName);
		log.info("로그인 정보 : {}", loginMember);
		log.info("고객센터 정보 : {}", customer);
		
		// Customer 객체 정보 DB에 저장
		result = customerService.save(customer);
		
		if(result > 0) {
			// 등록 성공
			if(customer.getCustomerCategory().equals("[공지사항]")) {
				modelAndView.addObject("msg", "공지사항 등록 성공");
			} else if(customer.getCustomerCategory().equals("[자유게시판]")) {
				modelAndView.addObject("msg", "자유게시판 등록 성공");
			} else if(customer.getCustomerCategory().equals("[자주 묻는 질문]")) {
				modelAndView.addObject("msg", "자주 묻는 질문 등록 성공");
			}
			
			modelAndView.addObject("location", "/customer");
			
		} else {
			// 등록 실패
			if(customer.getCustomerCategory().equals("[공지사항]")) {
				modelAndView.addObject("msg", "공지사항 등록 실패");
			} else if(customer.getCustomerCategory().equals("[자유게시판]")) {
				modelAndView.addObject("msg", "자유게시판 등록 실패");
			} else if(customer.getCustomerCategory().equals("[자주 묻는 질문]")) {
				modelAndView.addObject("msg", "자주 묻는 질문 등록 실패");
			}
			
			modelAndView.addObject("location", "/customer/write");
			
		}
		
		modelAndView.setViewName("common/msg");
		
		return modelAndView;
	}
}
