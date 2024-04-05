package com.kr.pawpawtrip.admin.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class LogCount
{
    private String accessDate;
    private int    count;
}
