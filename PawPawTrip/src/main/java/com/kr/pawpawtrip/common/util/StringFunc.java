package com.kr.pawpawtrip.common.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;



public class StringFunc
{

    /**
     * 입력된 문자열을 입력된 길이에 맞게 입력된 문자로 공백을 채우는 메소드
     * @param target     : 채울 문자열
     * @param strLength  : 채울 문자열 길이
     * @param replaceExp : 채울 문자
     * @return
     */
//    public static String rpad(String target, int strLength, String replaceExp)
//    {
//        String rstStr = target;
//        if(target.length() >= strLength)
//        {
//            return target;
//        }
//        
//        int hangeulInt = 0;
//        for(int i = 0; i < strLength; i ++)
//        {
//            int charInt;
//
//            if(i < target.length())
//            {
//                charInt = (int)target.charAt(i);
//                //12593 ~ 12643 : ㄱ ~ ㅣ 까지 char형의 int
//                //44032 ~ 55203 : 가 ~ 힣 까지 char형의 int
//                if(((charInt >= 12593 && charInt <= 12643)|| (charInt >= 44032 && charInt <= 55203)) && replaceExp.equals(" "))
//                {
//                    //한글은 공백을 2개로 처리한다.
//                    hangeulInt++;
//                }
//            }
//                else if(i >= target.length()+hangeulInt)
//            {
//                    rstStr += replaceExp;
//            }
//        }
////        System.out.println("target.length : " + target.length());
////        System.out.println("rstStr.length : " + rstStr.length());
//        return rstStr;
//        
//    }

    public static final String rpad(String value, int length, String padValue)
    {
        return rpad(value, padValue, length);
    }

    public static final String rpad(String value, String padValue, int length)
    {
        if(length > 0)
        {
            String tranVal = value;
            return tranVal + getPadVal(tranVal, padValue, length);
        }
        else
        {
            return value;
        }
    }

    public static final String lpad(String value, int length, String padValue)
    {
        return lpad(value, padValue, length);
    }

    public static final String lpad(String value, String padValue, int length)
    {
        String tranVal = value;
        return getPadVal(tranVal, padValue, length) + tranVal;
    }
    
    public static String getPadVal(String value, String padValue, int length)
    {
        String rtnStr = "";

        if(padValue == null)
        {
            padValue = " ";
        }
        
        if(length < getLength(value))
        {
            return rtnStr;
        }
        int repeat = length - getLength(value);

        for(int i = 0; i < repeat; i ++)
        {
            rtnStr += padValue;
        }
        
        return rtnStr;
    }

    /**
     * <PRE>
     *  2Byte문자를 감안한 문자열을 길이를 반환한다
     * </PRE>
     */
    public static final int getLength(String input)
    {
        if(input == null)
        {
            return 0;
        }

        String inputs = input;

        if("".equals(inputs))
        {
            return 0;
        }

        int strLength = 0;

        for(int i = 0; i < inputs.length(); i++)
        {
            String oneChar = inputs.charAt(i) + "";

            if(oneChar.getBytes().length > 1) // 2byte문자로 인식
            {
                strLength += 2;
            }
            else
            {
                strLength++;
            }
        }

        return strLength;
    }

    /** 파일 읽어들여서 메서드, 필드만 추출하는 메소드 만들기 */
    public void bufferedReaderFileRead()
    {
//        File file = new File("input_file/hashMap1.txt");
        File file = new File("input_file/hashMap2.txt");
//        File file = new File("input_file/FileStreamTestCopy.txt");
        long milliSeconds = System.currentTimeMillis();
        StringBuilder sb = new StringBuilder();
        
        int levelDepth    = 2;
        int rpadLength    = 13;
        int braceCnt      = 0;
        int braceLevel    = 0;
        int braceLevelMax = 0;
        int lineNum       = 1;
        
        try(BufferedReader fr2 = new BufferedReader(new FileReader(file)))
        {
            String currStr ="";
            while((currStr = fr2.readLine()) != null)
            {
                // 읽어들인 한 라인에 열고닫기가 둘다있을때는 건너뛴다. 
                if(currStr.indexOf("{") != -1 && currStr.indexOf("}") != -1)
                {
                    lineNum++;
                    continue;
                }
                // 중괄호 여는 괄호 감지
                else if(currStr.indexOf("{") != -1)
                {
                    if(levelDepth > braceLevel)
                    {
                        sb.append(currStr).append("\n");
                    }
                    braceLevel++; //괄호가 열릴때 Level을 올린다.
                    braceCnt++;
                }
                // 중괄호 닫는 괄호 감지
                else if(currStr.indexOf("}") != -1)
                {
                    braceLevelMax = braceLevelMax < braceLevel? braceLevel : braceLevelMax;

                    if(levelDepth > braceLevel)
                    {
                        sb.append(currStr).append("\n");
                    }

                    braceLevel--;
                }
                System.out.println(rpad("Line:"+ lineNum  ,rpadLength, " ") + " : " + braceLevel + " " + currStr);
                lineNum++;
                if(levelDepth > braceLevel)
                {
                    sb.append(currStr).append("\n");
                }
            }
            System.out.println("==================================================================================");
            milliSeconds = System.currentTimeMillis() - milliSeconds;
            System.out.println(rpad("처리시간"   ,rpadLength, " ") + " : "  + milliSeconds);
            System.out.println(rpad("Level"      ,rpadLength, " ") + " : "  + braceLevel);
            System.out.println(rpad("Max Level"  ,rpadLength, " ") + " : "  + braceLevelMax);
            System.out.println(rpad("brace Count",rpadLength, " ") + " : "  + braceCnt);
            System.out.println("==================================================================================");
            System.out.println(sb.toString());
        } 
        catch (IOException e)
        {
            e.printStackTrace();
        }
        
    }
}
