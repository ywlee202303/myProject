package com.kr.pawpawtrip.common.api.response;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.kr.pawpawtrip.common.api.item.DetailImageItem;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DetailImageResponse {
	
	// API 호출 결과의 상태 코드
	private String resultCode;
	
	// API 호출 결과의 상태
	private String resultMsg;
	
	// 한 페이지의 결과 수
	private int numOfRows;
	
	// 현재 조회된 데이터의 페이지 번호
	private int pageNo;
	
	// 전체 데이터의 총 수
	private int totalCount;
	
	// 데이터가 담겨 있는 객체배열
	private List<DetailImageItem> detailImageItems = new ArrayList<>();
	
	@JsonProperty("response")
	@SuppressWarnings("unchecked")
	public void unpackResponse(Map<String, Object> response) {
		
		// response --> header, body
		
		// header   --> resultCode, resultMsg
		Map<String, String> header = (Map<String, String>)response.get("header");
		
		// body     --> numOfRows, pageNo, totalCount, items
		Map<String, Object> body   = (Map<String, Object>)response.get("body");
		
		// items    --> item
		// System.out.println("response : " + body.get("items"));
		if(!body.get("items").equals("")) {
			Map<String, ArrayList<Map<String, Object>>> items = (Map<String, ArrayList<Map<String, Object>>>)body.get("items");
			
			// item     --> contentid,imgname, originimgurl, serialnum, smallimageurl, cpyrhtDivCd     
			ArrayList<Map<String, Object>> item = items.get("item");
			
			this.resultCode = header.get("resultCode");
			this.resultMsg  = header.get("resultMsg");
			this.numOfRows  = (Integer)body.get("numOfRows");
			this.pageNo     = (Integer)body.get("pageNo");
			this.totalCount = (Integer)body.get("totalCount");
			for (Map<String, Object> map : item) {
				DetailImageItem detailImageItem = new DetailImageItem();
				
				detailImageItem.setContentid((String) map.get("contentid"));
				detailImageItem.setImgname((String) map.get("imgname"));
				detailImageItem.setOriginimgurl((String) map.get("originimgurl"));
				detailImageItem.setSmallimageurl((String) map.get("smallimageurl"));
				detailImageItem.setCpyrhtDivCd((String) map.get("cpyrhtDivCd"));
				detailImageItem.setSerialnum((String) map.get("serialnum"));
				
				detailImageItems.add(detailImageItem);
			}
			
		} else {
			DetailImageItem detailImageItem = new DetailImageItem();
			detailImageItems.add(detailImageItem);
		}
	}	
}