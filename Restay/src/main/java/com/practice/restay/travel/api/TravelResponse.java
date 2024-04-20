package com.practice.restay.travel.api;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TravelResponse {

	private String resultCode;
	
	private String resultMsg;
	
	private int numOfRows;
	
	private int pageNo;
	
	private int totalCount;
	
	private List<TravelItem> travelItems = new ArrayList<>();
	
	@JsonProperty("response")
	public void unpackResponse(Map<String, Object> response) {
		
		Map<String, String> header = (Map<String, String>) response.get("header");
		
		Map<String, Object> body = (Map<String, Object>) response.get("body");
		
		Map<String, ArrayList<Map<String, Object>>> items = (Map<String, ArrayList<Map<String, Object>>>) body.get("items");
		
		ArrayList<Map<String, Object>> item = items.get("item");
		
		this.resultCode = header.get("resultCode");
		this.resultMsg = header.get("resultMsg");
		this.numOfRows = (Integer) body.get("numOfRows");
		this.pageNo = (Integer) body.get("pageNo");
		this.totalCount = (Integer) body.get("totalCount");
		
		for(Map<String, Object> map : item) {
			TravelItem travelItem = new TravelItem();
			
			travelItem.setAddr1((String) map.get("addr1"));
			travelItem.setAddr2((String) map.get("addr2"));
			travelItem.setAreacode((String) map.get("areacode"));
			travelItem.setBooktour((String) map.get("booktour"));
			travelItem.setCat1((String) map.get("cat1"));
			travelItem.setCat2((String) map.get("cat2"));
			travelItem.setCat3((String) map.get("cat3"));
			travelItem.setContentid((String) map.get("contentid"));
			travelItem.setContenttypeid((String) map.get("contenttypeid"));
			travelItem.setCreatedtime((String) map.get("createdtime"));
			travelItem.setFirstimage((String) map.get("firstimage"));
			travelItem.setFirstimage2((String) map.get("firstimage2"));
			travelItem.setCpyrhtDivCd((String) map.get("cpyrhtDivCd"));
			travelItem.setMapx((String) map.get("mapx"));
			travelItem.setMapy((String) map.get("mapy"));
			travelItem.setMlevel((String) map.get("mlevel"));
			travelItem.setModifiedtime((String) map.get("modifiedtime"));
			travelItem.setSigungucode((String) map.get("sigungucode"));
			travelItem.setTel((String) map.get("tel"));
			travelItem.setTitle((String) map.get("title"));
			travelItem.setZipcode((String) map.get("zipcode"));
			
			travelItems.add(travelItem);
		}
		
		System.out.println("TravelItems : " + travelItems);
		
	}
	
}
