package com.practice.restay.customer.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import com.practice.restay.customer.model.vo.Reply;
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
			@PathVariable String customerNo,
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(defaultValue = "1") int page
		) {
		
		PageInfo pageInfo = null;
		Customer customer = null;
		// 로그인 회원 정보 요청
		HttpSession session = request.getSession();
		Member loginMember = (Member) session.getAttribute("loginMember");
		// 클라이언트에서 가져온 쿠키정보들
		Cookie[] cookies = request.getCookies();
		// 쿠키에 저장할 객체
		Cookie cookie = null;
		// 클라이언트 접근 유저 ip
		String ipAddr = request.getRemoteAddr();
		boolean cookieCheck = false;
		
		// 조회수 카운트 전
		customer = customerService.detailCustomer(customerNo);
		
		// cookie 정보에 동일한 게시글 번호 && ip 주소 중복 체크
		for (Cookie c : cookies) {
			if(customerNo.equals(c.getName()) && ipAddr.equals(c.getValue())) {
				cookieCheck = true;
			}
		}
		
		// 중복되지 않으면 cookie에 저장 후 조회수 카운트
		if(!cookieCheck) {
			cookie = new Cookie(customerNo, ipAddr);
			
			// 하루 지나면 쿠키 리셋
			cookie.setMaxAge(3600);
			
			int viewCount = customer.getCustomerCount();
			
			// 관리자는 조회수 카운트X
			if(loginMember == null || loginMember.getMemberRole().equals("ROLE_USER")) {
				viewCount++;
				
				// 조회수 업데이트
				customerService.updateCustomerCount(customerNo, viewCount);
			}
			
			response.addCookie(cookie);
		}
		
		// 조회수 카운트 후
		customer = customerService.detailCustomer(customerNo);
		
		int replyCount = customerService.replyCount(customerNo);
		
		System.out.println("댓글 수 : " + replyCount);
		
		pageInfo = new PageInfo(page, 5, replyCount, 10);
		
		// 댓글 조회
		List<Reply> replies = customerService.getReplyList(customerNo, pageInfo);
		
		System.out.println("Customer : " + customer);
		System.out.println("Reply : " + replies);
		
		modelAndView.addObject("pageInfo", pageInfo);
		modelAndView.addObject("customer", customer);
		modelAndView.addObject("replyList", replies);
		modelAndView.setViewName("customer/Detail");
		
		return modelAndView;
	}
	
	// 1:1문의 상세 페이지
	@GetMapping("/customer/inquiry/{customerNo}")
	public ModelAndView inquiryDetail(
			ModelAndView modelAndView,
			@PathVariable String customerNo,
			@RequestParam(defaultValue = "1") int page,
			@SessionAttribute("loginMember") Member loginMember
	) {
		
		Customer customer = null;
		PageInfo pageInfo = null;
		
		customer = customerService.detailCustomer(customerNo);
		
		int replyCount = customerService.replyCount(customerNo);
		
		pageInfo = new PageInfo(page, 5, replyCount, 10);
		
		// 댓글 조회
		List<Reply> replies = customerService.getReplyList(customerNo, pageInfo);
		
		System.out.println("댓글 : " + replies);
		
		if(loginMember.getMemberRole().equals("ROLE_ADMIN") || loginMember.getMemberNo() == customer.getMemberNo()) {
			modelAndView.addObject("pageInfo", pageInfo);
			modelAndView.addObject("customer", customer);
			modelAndView.addObject("replyList", replies);
			modelAndView.setViewName("customer/Detail");
		} else {
			modelAndView.addObject("msg", "잘못된 접근입니다.");
			modelAndView.addObject("location", "/");
			modelAndView.setViewName("common/msg");
		}
		
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
	
	// 고객센터 수정 페이지(공지사항, 자유게시판, 자주 묻는 질문)
	@GetMapping("/customer/update/{customerNo}")
	public ModelAndView update(
			ModelAndView modelAndView,
			@PathVariable String customerNo,
			@SessionAttribute("loginMember") Member loginMember
	) {
		
		Customer customer = null;
		customer = customerService.detailCustomer(customerNo);
		
		if(loginMember.getMemberNo() != customer.getMemberNo()) {
			modelAndView.addObject("msg", "잘못된 접근입니다.");
			modelAndView.addObject("location", "/customer");
			modelAndView.setViewName("common/msg");
		} else {
			modelAndView.addObject("customer", customer);
			modelAndView.setViewName("customer/Update");
		}
		
		return modelAndView;
	}
	
	@PostMapping("/customer/update")
	public ModelAndView update(
			ModelAndView modelAndView,
			@RequestParam("customerNo") String customerNo,
			@RequestParam("customerCategory") String customerCagetory,
			@RequestParam("customerTitle") String customerTitle,
			@RequestParam("customerContent") String customerContent,
			@RequestParam("fileName") MultipartFile fileName
	) {
		
		int result = 0;
		String location = null;
		String renamedFileName = null;
		Customer customer = null;
		
		customer = customerService.detailCustomer(customerNo);
		
		if(fileName.isEmpty()) {
			// 첨부파일 변경 없이 업데이트
			customer.setCustomerCategory(customerCagetory);
			customer.setCustomerTitle(customerTitle);
			customer.setCustomerContent(customerContent);
			
			result = customerService.save(customer);
			
		} else {
			// 첨부파일 변경 후 업데이트
			customer.setCustomerCategory(customerCagetory);
			customer.setCustomerTitle(customerTitle);
			customer.setCustomerContent(customerContent);
			
			try {
				location = resourceLoader.getResource("resources/upload/customer").getFile().getPath();
				
				// 기존에 업로드 된 파일 삭제
				if(customer.getCustomerRenamedFileName() != null) {
					MultipartFileUtil.delete(location + "/" + customer.getCustomerRenamedFileName());
				}
				
				renamedFileName = MultipartFileUtil.save(fileName, location);
				
				if(renamedFileName != null) {
					customer.setCustomerOriginalFileName(fileName.getOriginalFilename());
					customer.setCustomerRenamedFileName(renamedFileName);
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			result = customerService.save(customer);
		}
		
		if(result > 0) {
			modelAndView.addObject("msg", "게시글 수정 성공");
			modelAndView.addObject("location", "/customer/" + customer.getCustomerNo());
		} else {
			modelAndView.addObject("msg", "게시글 수정 실패");
			modelAndView.addObject("location", "/customer/update/" + customer.getCustomerNo());
		}
		
		modelAndView.setViewName("common/msg");
		
		return modelAndView;
	}
	
	// 고객센터 삭제(공지사항, 자유게시판, 자주 묻는 질문)
	@GetMapping("/customer/delete")
	public ModelAndView delete(
			ModelAndView modelAndView,
			@RequestParam("no") String customerNo,
			@SessionAttribute("loginMember") Member loginMember
	) {
		
		int result = 0;
		Customer customer = null;
		
		customer = customerService.detailCustomer(customerNo);
		
		if(loginMember.getMemberNo() != customer.getMemberNo()) {
			modelAndView.addObject("msg", "잘못된 접근입니다.");
			modelAndView.addObject("location", "/customer");
		} else {
			result = customerService.delete(customerNo);
			
			modelAndView.addObject("msg", "삭제가 완료되었습니다.");
			modelAndView.addObject("location", "/customer");
		}
		
		modelAndView.setViewName("common/msg");
		
		return modelAndView;
	}
	
	// 댓글 등록
	@PostMapping("/customer/{customerNo}/reply")
	public ModelAndView comment(
			ModelAndView modelAndView,
			@PathVariable("customerNo") String customerNo,
			Reply reply,
			@SessionAttribute("loginMember") Member loginMember
	) {
		
		int result = 0;
		
		// 댓글 정보 댓글 객체에 저장
		reply.setCustomerNo(customerNo);
		reply.setWriterNo(loginMember.getMemberNo());
		reply.setWriterId(loginMember.getMemberId());
		
		System.out.println("reply : " + reply);
		
		result = customerService.saveReply(reply);
		
		if(result > 0) {
			// 등록 성공
			modelAndView.addObject("msg", "댓글 등록 성공");
			modelAndView.addObject("location", "/customer/" + customerNo);
		} else {
			// 등록 실패
			modelAndView.addObject("msg", "댓글 등록 성공");
			modelAndView.addObject("location", "/customer/" + customerNo);
		}
		
		modelAndView.setViewName("common/msg");
		
		return modelAndView;
	}
	
	// 첨부파일 삭제
	@PostMapping("/customer/deleteFile")
	public ResponseEntity<Map<String, Integer>> deleteFile(
			@RequestParam("customerNo") String customerNo
	) {
		
		int result = 0;
		String location = null;
		String renamedFileName = null;
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		Customer customer = customerService.detailCustomer(customerNo);
		
		try {
			location = resourceLoader.getResource("resources/upload/customer").getFile().getPath();
			
			MultipartFileUtil.delete(location + "/" + customer.getCustomerRenamedFileName());
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		// 파일 삭제(null 처리)
		result = customerService.updateFileName(customerNo);
		
		map.put("resultCode", result);
		
		return ResponseEntity.ok(map);
	}
	
	// 파일 다운로드
	@GetMapping("/customer/fileDown")
	public ResponseEntity<Resource> fileDown(
			@RequestParam("oname") String oname,
			@RequestParam("rname") String rname,
			@RequestHeader("user-agent") String userAgent
	) {
		
		/*
		 * 1. 메서드 어노테이션 및 파라미터
		 * - @GetMapping("/customer/fileDown"): HTTP GET 요청을 "/customer/fileDown" 경로로 받음
		 * - @RequestParam("oname"): 요청 파라미터 "oname"을 받아옴
		 * - @RequestParam("rname"): 요청 파라미터 "rname"을 받아옴
		 * - @RequestHeader("user-agent"): 요청 헤더의 "user-agent" 값을 받아옴
		 *   => userAgent: 브라우저별 인코딩 처리하기 위한 매개변수
		 */
		
		
		Resource resource = null;
		String downName = null;
		
		System.out.println("oname : " + oname);
		System.out.println("rname : " + rname);
		System.out.println("user-agent : " + userAgent);
		
		try {
			/*
			 * 2. 파일 가져오기
			 * - resource = resourceLoader.getResource("resources/upload/customer/" + rname)
			 *   => 서버에 저장된 파일을 가져옴 
			 */
			resource = resourceLoader.getResource("resources/upload/customer/" + rname);
			
			/*
			 * 3. 브라우저별 인코딩 처리
			 * - 브라우저 IE인지 그 외 브라우저인지 확인
			 */
			boolean isMISE = userAgent.indexOf("MSIE") != -1 || userAgent.indexOf("Trident") != -1;
			
			if(isMISE) {
				// IE의 경우 URLEncoder.encode를 사용
				downName = URLEncoder.encode(oname, "UTF-8").replaceAll("\\+", "%20");
			} else {
				// 그 외 브라우저의 경우 ISO-8859-1로 인코딩
				downName = new String(oname.getBytes("UTF-8"), "ISO-8859-1");
			}
			
			/*
			 * 4. 응답 메시지 작성 및 파일 전송
			 * - ResponseEntity.ok()를 사용해 응답을 생성
			 * - HttpHeaders.CONTENT_TYPE을 MediaType.APPLICATION_OCTET_STREAM_VALUE로 설정해 바이너리 데이터로 전송
			 * - HttpHeaders.CONTENT_DISPOSITION을 설정해 파일을 첨부 파일로 다운로드하도록 설정
			 * - body(resource)로 파일 데이터를 응답 본문에 담아 전송
			 */
			return ResponseEntity.ok().header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_OCTET_STREAM_VALUE)
					.header(HttpHeaders.CONTENT_DISPOSITION, "attachment;filename=" + downName).body(resource);
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			/*
			 * 5. 에러 처리
			 * - 인코딩 중 UnsupportedEncodingException이 발생하면 스택 트레이스를 출력하고
			 *   HTTP 500(내부 서버 오류) 상태코드를 반환
			 */
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build(); // 에러가 발생하면 500에러(내부 서버 에러) 응답
		}
	}
}
