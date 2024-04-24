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
import com.practice.restay.findstay.model.vo.House;

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
	public ModelAndView write(ModelAndView modelAndView) {
		
		// 숙소 등록 지역 조회(시, 도)
		List<Area> areas = findStayService.getAreaName();
		
		log.info("지역 조회 : " + areas);
		
		modelAndView.addObject("areas", areas);
		modelAndView.setViewName("findstay/Write");
		
		return modelAndView;
	}
	
	@PostMapping("/findstay/write")
	public ModelAndView write(
			ModelAndView modelAndView,
			@RequestParam("area") int areaCode,
			@RequestParam("sigungu") int sigunguCode,
			@RequestParam("house-img-1") String img1,
			@RequestParam("house-img-2") String img2,
			@RequestParam("house-img-3") String img3,
			@RequestParam("house-img-4") String img4,
			@RequestParam("house-img-5") String img5,
			House house
	) {
		
		int result = 0;
		
		// 지역코드, 시군구 코드로 시,도 / 시군구 조회
		Area area = findStayService.getAreaInfo(areaCode, sigunguCode);
		
		// 등록한 이미지 배열에 저장
		List<String> imgArr = new ArrayList<String>();
		
		imgArr.add(img1);
		imgArr.add(img2);
		imgArr.add(img3);
		imgArr.add(img4);
		imgArr.add(img5);
		
		// House 객체에 지역, 시군구, 이미지 저장
		house.setHouseArea(area.getAreaName());
		house.setHouseSigungu(area.getSigunguName());
		house.setHouseImg(imgArr);
		
		System.out.println("숙소 객체 조회 : " + house);
		
		// DB에 숙소 정보 저장
		result = findStayService.saveHouseInfo(house);
		
		if(result > 0) {
			// 게시글 정상 등록
			modelAndView.addObject("msg", "게시글 등록 성공");
			modelAndView.addObject("location", "/findstay");
		} else {
			// 게시글 등록 실패
			modelAndView.addObject("msg", "게시글 등록 실패");
			modelAndView.addObject("location", "/findstay/write");
		}
		
		modelAndView.setViewName("common/msg");
		
		return modelAndView;
	}
	
	// 숙소 등록 지역 조회(시군구)
	@PostMapping("/findstay/write/sigungus")
	public ResponseEntity<List<Area>> sigungus(
			@RequestParam int areaCode
	) {
		
		List<Area> areas = findStayService.getSigunguName(areaCode);
		
		log.info("시군구 조회 : " + areaCode);
		
		return ResponseEntity.ok(areas);
	}
}
