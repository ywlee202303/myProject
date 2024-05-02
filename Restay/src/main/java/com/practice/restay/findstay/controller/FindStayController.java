package com.practice.restay.findstay.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.core.io.ResourceLoader;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.practice.restay.common.util.MultipartFileUtil;
import com.practice.restay.common.util.PageInfo;
import com.practice.restay.findstay.model.service.FindStayService;
import com.practice.restay.findstay.model.vo.Area;
import com.practice.restay.findstay.model.vo.House;
import com.practice.restay.findstay.model.vo.HouseImage;

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
	public ModelAndView findStay(
			ModelAndView modelAndView,
			@RequestParam(defaultValue = "1") int page
		) {
		
		int listCount = 0;
		PageInfo pageInfo = null;
		List<String> houseCode = new ArrayList<>();
		
		// 페이징 처리
		listCount = findStayService.getHouseListCount();
		pageInfo = new PageInfo(page, 5, listCount, 10);
		
		// 숙소 조회(숙소만)
		List<House> onlyHouseList = findStayService.getOnlyHouseList(pageInfo);
		
		for (House house : onlyHouseList) {
			houseCode.add(house.getHouseCode());
		}
		
		// 숙소 조회(이미지 포함)
		List<House> houseList = findStayService.getHouseList(houseCode);
		
		// 숙소 이미지 조회
		List<HouseImage> houseImageList = findStayService.getHouseImageList(houseCode);
		
		System.out.println("테스트 : " + houseCode);
		
		log.info("HouseList Count : {}", listCount);
		log.info("Only House List : {}", onlyHouseList);
		log.info("House List : {}", houseList);
		log.info("HouseImage List : {}", houseImageList);
		
		modelAndView.addObject("pageInfo", pageInfo);
		modelAndView.addObject("houseList", houseList);
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
		int imgResult = 0;
		String location = null;
		String renamedFileName = null;
		
		/*
		 * ResourceLoader
		 * -  파일이나 클래스 경로와 같은 리소스에 대한 접근을 추상화한 인터페이스
		 * 
		 * getFile()
		 * - 리소스의 파일 시스템 경로를 File 객체로 반환
		 * getPath()
		 * - 리소스의 경로를 문자열로 반환
		 */
		
		// 1 - 지역코드, 시군구 코드로 시,도 / 시군구 조회
		Area area = findStayService.getAreaInfo(areaCode, sigunguCode);
		
		// 2 - Parameter로 넘어온 값들 DB에 저장
		// House 객체에 지역, 시군구, 이미지 저장
		house.setHouseArea(area.getAreaName());
		house.setHouseSigungu(area.getSigunguName());
		
		result = findStayService.saveHouseInfo(house);
		
		System.out.println("숙소 객체 조회 : " + house);
		
		// 3 - Parameter로 넘어온 이미지 파일 DB에 저장
		try {
			location = resourceLoader.getResource("resources/upload/findstay").getFile().getPath();
			
			for (MultipartFile multipartFile : imgFiles) {
				
				// 빈파일 저장 방지
				if(!multipartFile.isEmpty()) {
					renamedFileName = MultipartFileUtil.save(multipartFile, location);
					
					HouseImage houseImage = new HouseImage();
					
					houseImage.setHouseCode(house.getHouseCode());
					houseImage.setHouseImageOriginalFileName(multipartFile.getOriginalFilename());
					houseImage.setHouseImageRenamedFileName(renamedFileName);
					
					// 숙소 이미지 저장
					imgResult = findStayService.saveHouseImageInfo(houseImage);
					
					System.out.println("HouseImage 객체 : " + houseImage);
				}
				
				System.out.println(multipartFile);
				System.out.println(multipartFile.isEmpty());
			}
			
			System.out.println("location : " + location);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		if(result > 0) {
			if(imgResult > 0) {
				// 게시글 정상 등록
				modelAndView.addObject("msg", "게시글 등록 성공");
				modelAndView.addObject("location", "/findstay");
			} else {
				// 게시글 등록 실패
				modelAndView.addObject("msg", "게시글 등록 실패");
				modelAndView.addObject("location", "/findstay/write");
			}
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
