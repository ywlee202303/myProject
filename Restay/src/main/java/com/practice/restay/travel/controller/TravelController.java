package com.practice.restay.travel.controller;

import java.net.URISyntaxException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestClientException;
import org.springframework.web.servlet.ModelAndView;

import com.practice.restay.common.util.PageInfo;
import com.practice.restay.travel.api.TravelApiClient;
import com.practice.restay.travel.api.TravelResponse;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class TravelController {

	// 여행코스 API
	private final TravelApiClient travelApiClient;
	
	// 프로모션 페이지
	@GetMapping("/travel")
	public ModelAndView Travel(
			ModelAndView modelAndView,
			@RequestParam(defaultValue = "1") int pageNo
	) throws RestClientException, URISyntaxException {
		
		// 페이지 인포
		PageInfo pageInfo;
		
		TravelResponse response = travelApiClient.areaBasedList(pageNo);
		System.out.println("response : " + response.getTravelItems());
		
		pageInfo = new PageInfo(pageNo, 5, response.getTotalCount(), 15);
		
		modelAndView.addObject("response", response.getTravelItems());
		modelAndView.addObject("pageInfo", pageInfo);
		modelAndView.setViewName("travel/travel");
		
		return modelAndView;
	}
}
