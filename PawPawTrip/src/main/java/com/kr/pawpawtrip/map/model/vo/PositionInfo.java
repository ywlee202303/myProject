package com.kr.pawpawtrip.map.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PositionInfo
{
    private int    contentid;
    private String address;
    private String title;
    private String contenttypeid;
    private String image;
    private String mapx;
    private String mapy;
    private String maplevel;
    private String tel;
    private String acmpyTypeCd;
}
