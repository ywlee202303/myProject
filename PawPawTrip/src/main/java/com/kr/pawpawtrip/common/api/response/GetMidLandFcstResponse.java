package com.kr.pawpawtrip.common.api.response;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.kr.pawpawtrip.common.api.item.WeatherMidLandItem;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class GetMidLandFcstResponse {

	// API 호출 결과의 상태 코드
	private String resultCode;
	
	// API 호출 결과의 상태
	private String resultMsg;
	
	// 데이터 타입
	private String dataType;
	
	// 한 페이지의 결과 수
	private int numOfRows;
	
	// 현재 조회된 데이터의 페이지 번호
	private int pageNo;
	
	// 전체 데이터의 총 수
	private int totalCount;
	
	// 중기육상정보 담긴 객체
	private List<WeatherMidLandItem> weatherMidLandItems = new ArrayList<>(); 
	
	@JsonProperty("response")
	@SuppressWarnings("unchecked")
	public void unpackMidLandFcstResponse(Map<String, Object> response) {
		
		Map<String, String> header = (Map<String, String>) response.get("header");
		Map<String, Object> body = (Map<String, Object>) response.get("body");
		Map<String, ArrayList<Map<String, Object>>> items = (Map<String, ArrayList<Map<String, Object>>>) body.get("items");
		ArrayList<Map<String, Object>> item = items.get("item");
		
		this.resultCode = header.get("resultCode");
		this.resultMsg = header.get("resultMsg");
		this.pageNo = (Integer) body.get("pageNo");
		this.numOfRows = (Integer) body.get("numOfRows");
		this.dataType = (String) body.get("dataType");
		this.totalCount = (Integer) body.get("totalCount");
		
		for(Map<String, Object> map : item) {
			WeatherMidLandItem weatherMidLandItem = new WeatherMidLandItem();
			
			weatherMidLandItem.setRegId((String) map.get("regId"));
			weatherMidLandItem.setWf3Am((String) map.get("wf3Am"));
			weatherMidLandItem.setWf3Pm((String) map.get("wf3Pm"));
			weatherMidLandItem.setWf4Am((String) map.get("wf4Am"));
			weatherMidLandItem.setWf4Pm((String) map.get("wf4Pm"));
			weatherMidLandItem.setWf5Am((String) map.get("wf5Am"));
			weatherMidLandItem.setWf5Pm((String) map.get("wf5Pm"));
			weatherMidLandItem.setWf6Am((String) map.get("wf6Am"));
			weatherMidLandItem.setWf6Pm((String) map.get("wf6Pm"));
			weatherMidLandItem.setWf7Am((String) map.get("wf7Am"));
			weatherMidLandItem.setWf7Pm((String) map.get("wf7Pm"));
			weatherMidLandItem.setWf8((String) map.get("wf8"));
			
			weatherMidLandItems.add(weatherMidLandItem);
		}
		
	}
	
}
