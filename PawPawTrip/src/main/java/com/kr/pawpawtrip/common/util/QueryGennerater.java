package com.kr.pawpawtrip.common.util;

public class QueryGennerater
{
    public static void main(String[] args)
    {
        CodeGennerater dg = new CodeGennerater();
        String[] petTypes = {"골든 리트리버" , "포메라니안" , "프렌치 불도그" , "비숑 프리제" , "푸들" , "말티즈" , "시츄" , "요크셔 테리어" , "믹스견" , "기타"};
        StringBuilder sb = new StringBuilder();
        
        for(int i = 0; i < 100; i++)
        {
            String email = dg.gennerateEmail();
            sb.append("INSERT INTO MEMBER(");
            sb.append("MEMBER_NO,");
            sb.append("MEMBER_NAME,");
            sb.append("MEMBER_ID,");
            sb.append("MEMBER_PW,");
            sb.append("MEMBER_PHONE,");
            sb.append("MEMBER_EMAIL,");
            sb.append("MEMBER_BIRTH,");
            sb.append("MEMBER_PET_NAME,");
            sb.append("MEMBER_PET_TYPE");
            sb.append(")");
            sb.append("VALUES(");
            sb.append("SEQ_MEM_NO.NEXTVAL, ");                                                         //MEMBER_NO
            sb.append("'" + dg.gennerateName("korean")                           + "', ");             //MEMBER_NAME
            sb.append("'" + email.split("@")[0]                                  + "', ");             //MEMBER_ID
            sb.append("'$2a$10$iX8UsrsoCkp16cC5dRnkPOSM6aDw3eHmyuI.DZlIZZP8DK9shGwc6', ");             //MEMBER_PW
            sb.append("'" + dg.genneratePhone().replaceAll("-", "")              + "', ");             //MEMBER_PHONE
            sb.append("'" + email                                                + "', ");             //MEMBER_EMAIL
            sb.append("'" + dg.gennerateSsn().split("-")[0]                      + "', ");             //MEMBER_BIRTH
            sb.append("'" + dg.gennerateName("animal")                           + "', ");             //MEMBER_PET_NAME
            sb.append("'" + petTypes[dg.randomIntZeroTo(9)]                         + "');").append("\n");//MEMBER_PET_TYPE
        }
        
        
        System.out.println(sb.toString());
    }
}