package com.practice.restay.findstay.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.core.io.ResourceLoader;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
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
	private final ResourceLoader resourceLoader;

	// 숙소 조회 페이지
	@GetMapping("/findstay")
	public ModelAndView findStay(ModelAndView modelAndView) {
		
		// 숙소 조회
		List<House> houseList = findStayService.getHouseList();
		
		log.info("House List : {}", houseList);
		
		modelAndView.setViewName("findstay/FindStay");
		
		return modelAndView;
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
			@RequestParam("imgFiles") List<MultipartFile> imgFiles,
			House house
	) {
		
		int result = 0;
		String location = null;
		String str = "";
		List<String> originalFileNames = new ArrayList<>();
		
		/*
		 * ResourceLoader
		 * -  파일이나 클래스 경로와 같은 리소스에 대한 접근을 추상화한 인터페이스
		 * 
		 * getFile()
		 * - 리소스의 파일 시스템 경로를 File 객체로 반환
		 * getPath()
		 * - 리소스의 경로를 문자열로 반환
		 */
		
		try {
			location = resourceLoader.getResource("resources/upload/findstay").getFile().getPath();
			
			System.out.println("파일 경로 : " + location);
			
			for (MultipartFile multipartFile : imgFiles) {
				System.out.println("업파일 : " + multipartFile.getOriginalFilename());
				
				originalFileNames.add(multipartFile.getOriginalFilename());
				
				File folder = new File(location);
				
				if(!folder.exists()) {
					folder.mkdirs();
				}
				
				multipartFile.transferTo(new File(location + "/" + originalFileNames));
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		// List 타입을 문자열로 저장하기 위해 String 타입으로 변경
		// House 객체에서 houseImg 필드에 저장하기 위함
		for (String string : originalFileNames) {
			str = str + string + ",";
		}
		
		// 지역코드, 시군구 코드로 시,도 / 시군구 조회
		Area area = findStayService.getAreaInfo(areaCode, sigunguCode);
		
		// House 객체에 지역, 시군구, 이미지 저장
		house.setHouseArea(area.getAreaName());
		house.setHouseSigungu(area.getSigunguName());
		house.setHouseImg(str);
		
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
