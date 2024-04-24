package com.practice.restay.findstay.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.practice.restay.findstay.model.service.FindStayService;
import com.practice.restay.findstay.model.vo.Area;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class FindStayController {
	
	private final FindStayService findStayService;

	// 숙소 조회 페이지
	@GetMapping("/findstay")
	public String findStay() {
		
		return "findstay/FindStay";
	}
	
	// 숙소 예약 패이지
	@GetMapping("/findstay/room")
	public String room() {
		
		return "findstay/Room";
	}
	
	// 숙소 등록 페이지(관리자)
	@GetMapping("/findstay/write")
	public String write() {
		
		return "findstay/Write";
	}
	
	@PostMapping("/findstay/write")
	@ResponseBody
	public String write(
			ModelAndView modelAndView,
			@RequestParam("house-name") String name,
			@RequestParam("area") String area,
			@RequestParam("house-price") int price,
			@RequestParam("house-img-1") String img1,
			@RequestParam("house-img-2") String img2,
			@RequestParam("house-img-3") String img3,
			@RequestParam("house-img-4") String img4,
			@RequestParam("house-img-5") String img5
	) {
		
		List<String> imgArr = new ArrayList<String>();
		
		imgArr.add(img1);
		imgArr.add(img2);
		imgArr.add(img3);
		imgArr.add(img4);
		imgArr.add(img5);
		
		System.out.println("이름 : " + name);
		System.out.println("지역 : " + area);
		System.out.println("가격 : " + price);
		System.out.println("임히지 : " + imgArr);
		
		return "success";
	}
	
	// 숙소 등록 지역 조회
	@PostMapping("/findstay/write/areas")
	public ResponseEntity<List<Area>> areas() {
		
		List<Area> areas = findStayService.getAreaName();
		
		log.info("지역 조회 : " + areas);
		
		
		return ResponseEntity.ok(areas);
	}
}
