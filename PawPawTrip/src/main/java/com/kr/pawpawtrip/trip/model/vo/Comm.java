package com.kr.pawpawtrip.trip.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Comm
{
    private int       commContentId;      // 공통컨텐츠 콘텐츠 ID (기본키)
    private String    commAddress;        // 공통컨텐츠지 주소
    private String    commDetailAddress;  // 공통컨텐츠지 상세주소
    private String    commTitle;          // 공통컨텐츠지 이름
    private String    areaCode;           // 지역 코드
    private String    commCategory1;      // 공통컨텐츠 카테고리 대분류
    private String    commCategory2;      // 공통컨텐츠 카테고리 중분류
    private String    commCategory3;      // 공통컨텐츠 카테고리 소분류
    private String    commContentTypeId;  // 공통컨텐츠 콘텐츠 타입 ID
    private String    commCreateTime;     // 등록일
    private String    commModifyTime;     // 수정일
    private String    commImage;          // 공통컨텐츠 이미지
    private String    mapX;               // x좌표
    private String    mapY;               // y좌표
    private String    mapLevel;           // 축척
    private String    commTel;            // 공통컨텐츠 전화번호
    private String    sigunguCode;        // 시군구 코드
    private String    homepage;           // 홈페이지주소
    private String    overview;           // 소개설명
}
