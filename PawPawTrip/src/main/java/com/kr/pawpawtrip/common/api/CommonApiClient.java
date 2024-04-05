package com.kr.pawpawtrip.common.api;

import java.net.URI;
import java.net.URISyntaxException;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import com.kr.pawpawtrip.common.api.response.DetailCommonResponse;
import com.kr.pawpawtrip.common.api.response.DetailImageResponse;
import com.kr.pawpawtrip.common.api.response.PetTourResponse;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Component
/** 관리자 화면용 API Class */
public class CommonApiClient
{
    private String baseURL    = "https://apis.data.go.kr/B551011/KorService1/";
    private String serviceKey = "ZvQj%2BdF7Qii%2FQOORAN4qLXkSnfUuR%2Bcf8Wg00ku7ZWwfnLmNlS%2F%2Bpi2YaWjmGJIXxLWSI5uHZp%2FIwqDDFO5VFA%3D%3D";
//    private String serviceKey = "ZvQj+dF7Qii/QOORAN4qLXkSnfUuR+cf8Wg00ku7ZWwfnLmNlS/+pi2YaWjmGJIXxLWSI5uHZp/IwqDDFO5VFA==";

    @Qualifier("restTemplate")
    private final RestTemplate restTemplate;

    /** detailPetTour1 API 사용 메소드 
     *  사용페이지 : 관리자 - 포포트립 매핑 화면 
     * @param numOfRows */
    public PetTourResponse apiDetailPetTour(String pageNo, int contentId, String numOfRows) throws RestClientException, URISyntaxException
    {
        StringBuilder urlBuilder = new StringBuilder(baseURL + "detailPetTour1");
        //중요파라미터 입력
        urlBuilder.append("?ServiceKey=").append(serviceKey);
        urlBuilder.append("&pageNo="    ).append(pageNo);
        urlBuilder.append("&numOfRows=" ).append(numOfRows);
        urlBuilder.append("&MobileOS="  ).append("ETC");
        urlBuilder.append("&MobileApp=" ).append("pawpawtrip");
        urlBuilder.append("&_type="     ).append("json");

        //검색용 파라미터가 있을때
        if (contentId != 0)
        {
            urlBuilder.append("&contentId=").append(contentId);
        }

        log.info("Request URL : {}", urlBuilder.toString());

        return restTemplate.getForObject(new URI(urlBuilder.toString()), PetTourResponse.class);
    }

    /** detailCommon1 API 사용 메소드 
     *  사용페이지 : 관리자 - 포포트립 매핑 상세 화면 */
    public DetailCommonResponse apiDetailCommonToContentId(int contentId) throws RestClientException, URISyntaxException
    {
        StringBuilder urlBuilder = new StringBuilder(baseURL + "detailCommon1");
        //중요파라미터 입력
        urlBuilder.append("?ServiceKey="  ).append(serviceKey);   //인증키(서비스키)
        urlBuilder.append("&MobileOS="    ).append("ETC");        //OS 구분 : IOS (아이폰), AND (안드로이드), WIN (윈도우폰), ETC(기타)
        urlBuilder.append("&MobileApp="   ).append("pawpawtrip"); //서비스명(어플명)
        urlBuilder.append("&contentId="   ).append(contentId);    //콘텐츠ID
        urlBuilder.append("&pageNo="      ).append("1");          //페이지번호
        urlBuilder.append("&numOfRows="   ).append("10");         //한페이지결과수
        urlBuilder.append("&_type="       ).append("json");       //응답메세지 형식 : REST방식의 URL호출 시 json값 추가(디폴트 응답메세지 형식은XML)
        urlBuilder.append("&defaultYN="   ).append("Y");          //기본정보조회여부( Y,N )
        urlBuilder.append("&firstImageYN=").append("Y");          //원본, 썸네일대표 이미지, 이미지 공공누리유형정보 조회여부( Y,N )
        urlBuilder.append("&areacodeYN="  ).append("Y");          //지역코드, 시군구코드조회여부( Y,N )
        urlBuilder.append("&catcodeYN="   ).append("Y");          //대,중,소분류코드조회여부( Y,N )
        urlBuilder.append("&addrinfoYN="  ).append("Y");          //주소, 상세주소조회여부( Y,N )
        urlBuilder.append("&mapinfoYN="   ).append("Y");          //좌표X, Y 조회여부( Y,N )
        urlBuilder.append("&overviewYN="  ).append("Y");          //콘텐츠개요조회여부( Y,N )
//        urlBuilder.append("&contentTypeId="     ).append("");   // 12 또는 32   관광타입(12:관광지, 14:문화시설, 15:축제공연행사, 25:여행코스, 28:레포츠, 32:숙박, 38:쇼핑, 39:음식점) ID
        
        
        
        log.info("Request URL : {}", urlBuilder.toString());

        return restTemplate.getForObject(new URI(urlBuilder.toString()), DetailCommonResponse.class);
    }
    
    /**
     *  detailImage API 사용 메소드
     *   - 사용페이지 : 여행/숙박 상세페이지 이미지 슬라이드
     */
    public DetailImageResponse apiDetailImageByContentId(int contentId, int numOfRows) throws RestClientException, URISyntaxException {
    	
    	// API 요청 URL
    	StringBuilder urlBuilder = new StringBuilder(baseURL + "detailImage1");
    	
    	urlBuilder.append("?ServiceKey="  ).append(serviceKey);     // 인증키(서비스키)
    	urlBuilder.append("&MobileOS="    ).append("ETC");			// OS 구분 : IOS (아이폰), AND (안드로이드), WIN (윈도우폰), ETC(기타)
    	urlBuilder.append("&MobileApp="   ).append("pawpawtrip");	// 서비스명(어플명)
    	urlBuilder.append("&contentId="   ).append(contentId);		// 콘텐츠ID
    	urlBuilder.append("&pageNo="      ).append("1");			// 페이지번호
    	urlBuilder.append("&numOfRows="   ).append(numOfRows);		// 한페이지결과수
    	urlBuilder.append("&_type="       ).append("json");    		// 응답메세지 형식 : REST방식의 URL호출 시 json값 추가(디폴트 응답메세지 형식은XML)
    	urlBuilder.append("&imageYN="     ).append("Y");			// 이미지조회1 : Y=콘텐츠이미지조회 N=”음식점”타입의음식메뉴이미지
    	urlBuilder.append("&subImageYN="  ).append("Y");			// 이미지조회2 : Y=원본,썸네일이미지조회,공공누리 저작권유형정보조회 N=Null
    	
    	 // log.info("Response : {}", new URI(urlBuilder.toString()), String.class);
    	
    	return restTemplate.getForObject(new URI(urlBuilder.toString()), DetailImageResponse.class);
    }
}
