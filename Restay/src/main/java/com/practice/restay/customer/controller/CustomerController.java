package com.practice.restay.customer.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.practice.restay.common.util.MultipartFileUtil;
import com.practice.restay.common.util.PageInfo;
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
	public ModelAndView customer(
			ModelAndView modelAndView,
			@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "notice") String menu
		) {
		
		System.out.println("메뉴 : " + menu);
		
		PageInfo pageInfo = null;
		
		List<Customer> customerList = null;
		
		int customerCount = 0;
			
		customerCount = customerService.getCustomerCount(menu);
		
		System.out.println("카운트  :" + customerCount);
		
		pageInfo = new PageInfo(page, 5, customerCount, 10);
		
		customerList = customerService.getCustomerList(pageInfo, menu);
		
		System.out.println("수정 공지 : " + customerList);
		
		modelAndView.addObject("pageInfo", pageInfo);
		modelAndView.addObject("menu", menu);
		modelAndView.addObject("customerList", customerList);
		
		modelAndView.setViewName("customer/Customer");
		
		return modelAndView;
	}
	
	// 고객센터(1:1문의 페이지)
	@GetMapping("/customer/inquiry")
	public ModelAndView inquiry(
			ModelAndView modelAndView,
			@RequestParam(defaultValue = "1") int page
		) {
		
		List<Customer> customerInquiryList = null;
		PageInfo pageInfo = null;
		int customerInquiryCount;
		
		// 고객센터 1:1문의 카운트
		customerInquiryCount = customerService.getCustomerInquiryCount();
		
		// 페이징 처리
		pageInfo = new PageInfo(page, 5, customerInquiryCount, 10);
		
		// 고객센터 1:1문의 리스트 조회
		customerInquiryList = customerService.getCustomerInquiryList(pageInfo);
		
		System.out.println("1:1문의 리스트 : " + customerInquiryList);
		
		modelAndView.addObject("pageInfo", pageInfo);
		modelAndView.addObject("customerInquiryList", customerInquiryList);
		
		modelAndView.setViewName("customer/inquiry");
		
		return modelAndView;
	}
	
	@PostMapping("/customer/inquiry")
	public ModelAndView inquiry(
			ModelAndView modelAndView,
			Customer customer,
			@SessionAttribute("loginMember") Member loginMember
		) {
		
		int result = 0;

		// 고객센터 객체에 카테고리, 회원번호 저장
		customer.setCustomerCategory("[1:1문의]");
		customer.setMemberNo(loginMember.getMemberNo());
		
		// 고객센터 객체 DB에 저장
		result = customerService.saveInquiry(customer);
		
		if(result > 0) {
			// 등록 성공
			modelAndView.addObject("msg", "1:1문의 등록 성공");
			// 마이페이지로 변경 예정(**)
			modelAndView.addObject("location", "/customer");
		} else {
			// 등록 실패
			modelAndView.addObject("msg", "1:1문의 등록 실패");
			modelAndView.addObject("location", "/customer/inquiry");
		}
		
		modelAndView.setViewName("common/msg");
		
		return modelAndView;
	}
	
	// 고객센터 상세 페이지(공지사항, 자유게시판, 자주 묻는 질문)
	@GetMapping("/customer/{customerNo}")
	public ModelAndView customerDetail(
			ModelAndView modelAndView,
			@PathVariable String customerNo
		) {
		
		Customer customer = null;
		
		customer = customerService.detailCustomer(customerNo);
		
		// 조회수 카운트 구현 예정..
		
		System.out.println("Customer : " + customer);
		
		modelAndView.addObject("customer", customer);
		modelAndView.setViewName("customer/Detail");
		
		return modelAndView;
	}
	
	// 고객센터 등록 페이지(공지사항, 자유게시판, 자주 묻는 질문)
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
	
	// 파일 다운로드
	@GetMapping("/customer/fileDown")
	public ResponseEntity<Resource> fileDown(
			@RequestParam("oname") String oname,
			@RequestParam("rname") String rname,
			@RequestHeader("user-agent") String userAgent
	) {
		
		// userAgent: 브라우저별 인코딩 처리하기 위한 매개변수
		
		Resource resource = null;
		String downName = null;
		
		System.out.println("oname : " + oname);
		System.out.println("rname : " + rname);
		System.out.println("user-agent : " + userAgent);
		
		try {
			// 1. 클라이언트로 전송할 파일을 가져온다.
			resource = resourceLoader.getResource("resources/upload/customer/" + rname);
			
			// 2. 브라우저별 인코딩
			boolean isMISE = userAgent.indexOf("MSIE") != -1 || userAgent.indexOf("Trident") != -1;
			
			if(isMISE) {
				downName = URLEncoder.encode(oname, "UTF-8").replaceAll("\\+", "%20");
			} else {
				downName = new String(oname.getBytes("UTF-8"), "ISO-8859-1");
			}
			
			// 3. 응답 메시지 작성 & 클라이언트로 출력(전송)
			return ResponseEntity.ok().header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_OCTET_STREAM_VALUE)
					.header(HttpHeaders.CONTENT_DISPOSITION, "attachment;filename=" + downName).body(resource);
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build(); // 에러가 발생하면 500에러(내부 서버 에러) 응답
		}
	}
}
