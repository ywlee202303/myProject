package com.kr.pawpawtrip.trip.model.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MyTrip {
   
   // 컨텡츠 아이디
   private int contentId;
   
   // 멤버번호
   private int memberNo;
   
   // 장소 주소
   private String address;
   
   // 장소 이름
   private String title;
   
   // 컨텐츠 타입(숫자형을 문자형으로 변경)
   // 12: 숙소, 32: 관광지
   private String contentType;
   
   // 장소 이미지
   private String image;
   
   // 숙소 객체
   // private List<Stay> stays;
   // private Stay stay;
   
   // 관광지 객체
   // private List<Spot> spots;
   // private Spot spot;
}