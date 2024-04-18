package com.practice.restay.travel.controller;

import java.net.URISyntaxException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.client.RestClientException;

import com.practice.restay.travel.api.TravelApiClient;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class TravelController {

	// 여행코스 API
	private final TravelApiClient travelApiClient;
	
	// 프로모션 페이지
	@GetMapping("/travel")
	public String Travel() throws RestClientException, URISyntaxException {
		
		travelApiClient.areaBasedSyncList();
		
		return "travel/travel";
	}
}
