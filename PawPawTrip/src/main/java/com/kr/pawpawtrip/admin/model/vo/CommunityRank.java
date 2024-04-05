package com.kr.pawpawtrip.admin.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CommunityRank
{
    private String rownum;
    private String communityTitle;
    private String communityCount;
    private String communityWriterNo;
    private String memberId;
    private String communityNo;
    private String communityCategory;

}
