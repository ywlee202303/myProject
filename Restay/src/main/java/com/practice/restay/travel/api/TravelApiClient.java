package com.practice.restay.travel.api;

import java.net.URI;
import java.net.URISyntaxException;

import org.springframework.stereotype.Component;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
@RequiredArgsConstructor
public class TravelApiClient {

	private final RestTemplate restTemplate;
	private String baseURL = "https://apis.data.go.kr/B551011/KorService1/";
	private String serviceKey = "fy5UCawbCcSeqWlDOgrzesPXX5yVrPvrNEia06ga%2BrMarGll244o1Bpbuha11tFV8gXGce5J%2ByBGmJgA%2FMrqyw%3D%3D";
	
	public String areaBasedSyncList() throws RestClientException, URISyntaxException {
		
		StringBuilder urlBuilder = null;
		
		urlBuilder = new StringBuilder(baseURL + "areaBasedSyncList1");
		
		urlBuilder.append("?serviceKey=").append(serviceKey);
		urlBuilder.append("&numOfRows=").append(10);
		urlBuilder.append("&pageNo=").append(1);
		urlBuilder.append("&MobileOS=").append("ETC");
		urlBuilder.append("&MobileApp=").append("AppTest");
		urlBuilder.append("&_type=").append("json");
		urlBuilder.append("&showflag=").append(1);
		urlBuilder.append("&listYN=").append("Y");
		urlBuilder.append("&arrange=").append("A");
		urlBuilder.append("&contentTypeId=").append(25);
		// 지역코드 반복해서 꺼내올것.
		urlBuilder.append("&areaCode=").append(4);
		urlBuilder.append("&sigunguCode=").append(4);
		
		log.info("Request URL : {}", urlBuilder.toString());
		
		return restTemplate.getForObject(new URI(urlBuilder.toString()), String.class);
	}
	
}
