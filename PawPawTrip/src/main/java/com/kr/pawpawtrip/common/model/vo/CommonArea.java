package com.kr.pawpawtrip.common.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CommonArea
{
    private String cityCode;    //시,도 코드
    private String cityName;    //시,도 이름
    private String sigunguCode; //시군구 이름
    private String areaName;    //지역 이름 (시,도 이름도 여기에서 가져올수 있다. ) sigunguCode 를 0으로 줬을때
}
