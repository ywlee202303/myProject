package com.kr.pawpawtrip.admin.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class FavorSite
{
    private String contentid;
    private String address;     //address + detailAddress
    private String title;
    private String contenttype; //32 / 12 코드를 이름으로 변경
    private String image;       
    private String tel;         //NVL 처리함
    private String favorRcmdYn;
}
