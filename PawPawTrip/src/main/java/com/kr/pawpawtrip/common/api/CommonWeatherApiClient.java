package com.kr.pawpawtrip.common.api;

import java.net.URI;
import java.net.URISyntaxException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import com.kr.pawpawtrip.common.api.response.GetMidLandFcstResponse;
import com.kr.pawpawtrip.common.api.response.GetMidTaResponse;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Component
/** 날씨 API Class */
public class CommonWeatherApiClient
{
    private String baseURL    = "http://apis.data.go.kr/1360000/MidFcstInfoService/";
    private String serviceKey = "ZvQj%2BdF7Qii%2FQOORAN4qLXkSnfUuR%2Bcf8Wg00ku7ZWwfnLmNlS%2F%2Bpi2YaWjmGJIXxLWSI5uHZp%2FIwqDDFO5VFA%3D%3D";
//    private String serviceKey = "ZvQj+dF7Qii/QOORAN4qLXkSnfUuR+cf8Wg00ku7ZWwfnLmNlS/+pi2YaWjmGJIXxLWSI5uHZp/IwqDDFO5VFA==";

    @Qualifier("restTemplate")
    private final RestTemplate restTemplate;

    /**  
     * @param  */
    // 중기육상예보조회
    public String apiGetMidFcst(String regId, String tmFc) throws RestClientException, URISyntaxException
    {
        StringBuilder urlBuilder = new StringBuilder(baseURL + "getMidLandFcst");
        //중요파라미터 입력
        urlBuilder.append("?ServiceKey=").append(serviceKey);
        urlBuilder.append("&pageNo="    ).append("1");
        urlBuilder.append("&numOfRows=" ).append("10");
        urlBuilder.append("&dataType="  ).append("JSON");
        urlBuilder.append("&regId="     ).append(regId);//예보구역코드
        urlBuilder.append("&tmFc="      ).append(tmFc); // 발표시각


        log.info("Request URL : {}", urlBuilder.toString());

        return restTemplate.getForObject(new URI(urlBuilder.toString()), String.class);
    }
    
    // 중기기온조회
    public GetMidTaResponse apiGetMidTa(String regId) throws RestClientException, URISyntaxException {
    	
    	String currentDate = null;
    	StringBuilder urlBuilder = null;
    	
    	urlBuilder = new StringBuilder(baseURL + "getMidTa");
    	// 현재 시간
    	currentDate = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyyMMdd")) + "0600";
    	
    	urlBuilder.append("?ServiceKey=").append(serviceKey);
    	urlBuilder.append("&pageNo=").append("1");
    	urlBuilder.append("&numOfRows=").append("10");
    	urlBuilder.append("&dataType=").append("JSON");
    	urlBuilder.append("&regId=").append(regId);
    	urlBuilder.append("&tmFc=").append(currentDate);
    	
    	log.info("Request URL - getMidTa : {}", urlBuilder.toString());
    	
    	return restTemplate.getForObject(new URI(urlBuilder.toString()), GetMidTaResponse.class);
    }
    
    // 중기육상예보조회(송은정)
    public GetMidLandFcstResponse apiGetMidLandFcst(String regId) throws RestClientException, URISyntaxException {
    	
    	String currentDate = null;
    	StringBuilder urlBuilder = null;
    	
    	urlBuilder = new StringBuilder(baseURL + "getMidLandFcst");
    	// 현재 시간
    	currentDate = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyyMMdd")) + "0600";
    	
    	urlBuilder.append("?ServiceKey=").append(serviceKey);
    	urlBuilder.append("&pageNo=").append("1");
    	urlBuilder.append("&numOfRows=").append("10");
    	urlBuilder.append("&dataType=").append("JSON");
    	urlBuilder.append("&regId=").append(regId);
    	urlBuilder.append("&tmFc=").append(currentDate);
    	
    	log.info("Request URL - getLandFcst : {}", urlBuilder.toString());
    	
    	return restTemplate.getForObject(new URI(urlBuilder.toString()), GetMidLandFcstResponse.class);
    }
    

}
