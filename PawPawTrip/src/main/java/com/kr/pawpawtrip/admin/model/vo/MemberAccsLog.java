package com.kr.pawpawtrip.admin.model.vo;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
@AllArgsConstructor
public class MemberAccsLog
{
    private int       memberNo;
    private String    accessAddr;
    private LocalDate accessDate;
    private String    accessPath;
}
