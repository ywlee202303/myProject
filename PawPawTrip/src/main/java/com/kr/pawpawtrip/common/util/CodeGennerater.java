package com.kr.pawpawtrip.common.util;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class CodeGennerater
{
    public static void main(String[] args)
    {
        CodeGennerater dg = new CodeGennerater();
//        dg.gennerateSsn();
//        dg.gennerateName();
//        dg.genneratePhone();
//        dg.gennerateEmail();
        LocalDate now = LocalDate.now();
//        SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
//        String date = sdf1.format(now);
        //INSERT INTO MEMBER VALUES(1, 'USER1', '1234', '홍길동', '2023-11-09');
        for(int i = 0; i < 100; i++)
        {
            System.out.print("INSERT INTO MEMBER VALUES(");
            System.out.print((i+1) + ", ");
            System.out.print("'" + dg.gennerateEmail().split("@")[0] + "', ");
            System.out.print("'1234', ");
            System.out.print("'" + dg.gennerateName("korean") + "', ");
            System.out.println("'" + now.format(formatter) + "');");
        }
        
    }
    /**
     *  특수문자는 _ 만 포함하는 메일의 형식을 만든다.
     */
    public String gennerateEmail()
    {
        String email = "";
        String[] arrDomain = {"cyworld.com" , "daum.net" , "gmail.com" , "hanmail.net" , "kakao.com" , "nate.com" , "naver.com" , "outlook.com" , "tistory.com" , "yahoo.com" , "kh.or.kr"};
        int month;
        int day  ;
        int idLength     = randomIntToNum(5, 20);
        int letterLength = 0;
        month  = randomIntZeroTo(12);
        day    = randomIntZeroTo(31);
        boolean numYn   = randomIntZeroTo(1, true)==1?true:false;
        
        
        //65 ~ 90 , 97 ~ 122
        //A  ~ Z  , a  ~  z
        if(numYn)
        {
            letterLength = idLength - 4; 
        }
        char[] idChArr = new char[letterLength];
        int underBarCnt = 0;
        
        for(int i = 0; i < letterLength; i ++)
        {
            boolean underYn = randomIntToNum(1, 100)%13==5?true:false;
            if(underYn && underBarCnt <= 2)
            {
                idChArr[i] = '_';
                underBarCnt++;
                continue;
            }
            boolean upperYn = randomIntZeroTo(1, true)==1?true:false;
            if(upperYn)
            {
                idChArr[i] = (char)randomIntToNum(65, 90);
            }
            else
            {
                idChArr[i] = (char)randomIntToNum(97, 122);
            }
        }
        
        email = String.valueOf(idChArr) + StringFunc.lpad(month+"", 2, "0") + StringFunc.lpad(day+"", 2, "0");
        email += "@" + arrDomain[randomIntZeroTo(arrDomain.length, true)];
        
        
        return email;
    }
    
    public String genneratePhone()
    {
        String phone = "010-";
        phone += StringFunc.lpad(randomIntToNum(1, 10000)+"", 4, "0") + "-";
        phone += StringFunc.lpad(randomIntToNum(1, 10000)+"", 4, "0");
        
        return phone;
    }
    
    public String gennerateName(String nameType)
    {
        String[] firstName   = {"김" , "이" , "박" , "최" , "정" , "강" , "조" , "윤" , "장" , "임" , "한" , "오" , "서" , "신" , "권" , "황" , "안" , "송" , "전" , "홍" , "유" , "고" , "문" , "양" , "손" , "배" , "조" , "백" , "허" , "유" , "남" , "심" , "노" , "정" , "하" , "곽" , "성" , "차" , "주" , "우" , "구" , "신" , "임" , "전" , "민" , "유" , "류" , "나" , "진" , "지" , "엄" , "채" , "원" , "천" , "방" , "공" , "강" , "현" , "함" , "변" , "염" , "양" , "변" , "여" , "추" , "노" , "도" , "소" , "신" , "석" , "선" , "설" , "마" , "길" , "주" , "연" , "방" , "위" , "표" , "명" , "기" , "반" , "라" , "왕" , "금" , "옥" , "육" , "인" , "맹" , "제" , "모" , "장" , "남궁" , "탁" , "국" , "여" , "진" , "어"};
        String[] krName      = {"길동", "개똥","국뽕","백만불", "안테나","것다","까따","하다", "성","나르샤", "현아", "동일" , "중기" , "홍철" , "은이" , "재석" , "준하" , "나라" , "이유" , "혜수" , "봉선" , "은혜" , "형돈" , "쯔위" , "동훈" , "명수" , "프콘" , "태현" , "태연" , "지현" , "효리" , "시완"};
        String[] animalName  = {"어흥","코끼리", "멍멍", "야옹", "짹짹", "까악", "원숭", "삐약" ,"꿀꿀" ,"히잉" ,"윙윙" ,"꺆꺆" ,"닭" ,"구구" ,"매미" ,"개굴" ,"말벌"};
//        String[] lastName    = krName.clone();
        String rtnName = "";
        
        if(nameType.equals("animal"))
        {
            rtnName  = firstName[randomIntZeroTo(firstName.length, true)];
            rtnName += animalName[randomIntZeroTo(animalName.length, true)];
        }
        if (nameType.equals("korean"))
        {
            rtnName  = firstName[randomIntZeroTo(firstName.length, true)];
            rtnName += krName[randomIntZeroTo(krName.length, true)];
        }
        
        
        return rtnName;
    }
    
    /** 주민등록번호를 생성해준다. */
    public String gennerateSsn()
    {
        //주민번호 생성기
        int year   ;
        int month  ;
        int gender ;
        int day    ;
        LocalDate now = LocalDate.now();
        
        year   = now.getYear() - randomIntToNum(20,80);
        month  = randomIntZeroTo(12);
        day    = randomIntZeroTo(31);
        gender = randomIntZeroTo(4);
        
        switch(month)
        {
            case 11:
                day = randomIntZeroTo(30);
                break;
            case 10:
                day = randomIntZeroTo(30);
            break;
            case 9:
                day = randomIntZeroTo(30);
            break;
            case 6:
                day = randomIntZeroTo(30);
            break;
            case 4:
                day = randomIntZeroTo(30);
            break;
            case 2:
                day = randomIntZeroTo(28);
                break;
        }
        
        
//        System.out.println(year +"년 " + month + "월 " + day + "일 " + gender + "성별 ");
        String ssn = Integer.toString(year).substring(2) + StringFunc.lpad(month+"", "0", 2) + StringFunc.lpad(day+"", "0", 2) + "-" + gender + "123456";
        
        String resultStr;
        
        resultStr  = StringFunc.rpad(ssn, 15, " ")+ ": ";
        resultStr += year +"년 ";
        resultStr += StringFunc.lpad(month  + "월 "  , 5, " ");
        resultStr += StringFunc.lpad(  day  + "일 "  , 5, " ");
        resultStr += StringFunc.rpad("성별 " + gender, 7, " ");
        resultStr += StringFunc.rpad("나이 " + (now.getYear() - year), 5, " ");

        System.out.println(resultStr);
        return ssn;
//        return Integer.toString(year).substring(2) + StringFunc.lpad(month, "0", 2) + StringFunc.lpad(day, "0", 2) + " - " + gender + "123456";
    }
    
    /** 시작 int 와 종료 int 를 넘겨주면 사이에서의 랜덤 int값을 반환한다. 
     * @param startNum
     * @param endNum
     */
    private static int randomIntToNum(int startNum, int endNum)
    {
        int randomInt = randomIntZeroTo(endNum);
        //0이 들어올때 0 반환
        if(startNum <0 || endNum <0)
        {
            return 0;
        }
        // 대소가 바뀌어들어올때도 실행될수 있게 거꾸로 바꿔준다.
        if(startNum > endNum)
        {
            int temp = startNum;
            startNum = endNum;
            endNum   = temp;
        }
        while(true)
        {
            if(randomInt < startNum || randomInt > endNum)
            {
                randomInt    = randomIntZeroTo(endNum);
            }
            else
            {
                break;
            }
        }
        return randomInt;
    }

    public static int randomIntZeroTo(int endNum)
    {
        return randomIntZeroTo(endNum, false);
    }
    /**<pre>
     * 0을 포함하면 0 ~ endNum -1
     * 0을 포함하지 않으면 1 ~ endNum
     * 까지의 int 값을 반환한다.
     * @param endNum
     * @param zeroContain
     * </pre>
     */
    public static int randomIntZeroTo(int endNum, boolean zeroContain)
    {
        if(endNum == 1 && zeroContain)
        {
            endNum = 2;
        }
        int randomInt = (zeroContain?0:1) + (int)(Math.random() * (endNum));
        return randomInt;
    }
}
// 아래 타이핑은 11/2 연희님이 키보드 변경하고타이핑한 내용입니다.
// 소리가 되게 신기하다 ㅎㅎ.... 노트북 치는 것 같아요 흐흐흐흐히힣히힣ㅎ히히히힠ㅋㅋㅋㅋㅋ 무선ㅅ무섬무선 아 ㅋㅋㅋ 신기해 신기방기 