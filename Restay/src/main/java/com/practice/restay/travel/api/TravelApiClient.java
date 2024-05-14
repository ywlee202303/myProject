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
	
	public TravelResponse areaBasedList(int pageNo) throws RestClientException, URISyntaxException {
		
		StringBuilder urlBuilder = null;
		
		urlBuilder = new StringBuilder(baseURL + "areaBasedList1");
		
		urlBuilder.append("?serviceKey=").append(serviceKey);
		urlBuilder.append("&numOfRows=").append(15);
		urlBuilder.append("&pageNo=").append(pageNo);
		urlBuilder.append("&MobileOS=").append("ETC");
		urlBuilder.append("&MobileApp=").append("AppTest");
		urlBuilder.append("&_type=").append("json");
		urlBuilder.append("&listYN=").append("Y");
		urlBuilder.append("&arrange=").append("A");
		urlBuilder.append("&contentTypeId=").append(25);
		urlBuilder.append("&cat1=").append("C01");
		
		return restTemplate.getForObject(new URI(urlBuilder.toString()), TravelResponse.class);
	}
	
}
