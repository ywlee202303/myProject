package com.kr.pawpawtrip.common.api.response;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.kr.pawpawtrip.common.api.item.WeatherMidItem;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class GetMidTaResponse {
	
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
	
	// 중기기온 데이터 담겨 있는 객체 배열
	private List<WeatherMidItem> weatherMidItems = new ArrayList<>();

	@JsonProperty("response")
	@SuppressWarnings("unchecked")
	public void unpackMidTaResponse(Map<String, Object> response) {
		
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
			WeatherMidItem weatherMidItem = new WeatherMidItem();
			
			weatherMidItem.setRegId((String) map.get("regId"));
			weatherMidItem.setTaMin3((Integer) map.get("taMin3"));
			weatherMidItem.setTaMax3((Integer) map.get("taMax3"));
			weatherMidItem.setTaMin4((Integer) map.get("taMin4"));
			weatherMidItem.setTaMax4((Integer) map.get("taMax4"));
			weatherMidItem.setTaMin5((Integer) map.get("taMin5"));
			weatherMidItem.setTaMax5((Integer) map.get("taMax5"));
			weatherMidItem.setTaMin6((Integer) map.get("taMin6"));
			weatherMidItem.setTaMax6((Integer) map.get("taMax6"));
			weatherMidItem.setTaMin7((Integer) map.get("taMin7"));
			weatherMidItem.setTaMax7((Integer) map.get("taMax7"));
			weatherMidItem.setTaMin8((Integer) map.get("taMin8"));
			weatherMidItem.setTaMax8((Integer) map.get("taMax8"));
			
			weatherMidItems.add(weatherMidItem);
		}
		
	}
}
