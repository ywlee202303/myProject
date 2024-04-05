package com.kr.pawpawtrip.common.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Category
{
    private String bigCateCode;
    private String bigCateName;
    private String midCateCode;
    private String midCateName;
    private String smlCateCode;
    private String smlCateName;
}
