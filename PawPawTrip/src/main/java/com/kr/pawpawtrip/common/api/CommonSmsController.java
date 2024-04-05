package com.kr.pawpawtrip.common.api;

import java.util.ArrayList;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.slf4j.Slf4j;
import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.exception.NurigoMessageNotReceivedException;
import net.nurigo.sdk.message.model.Balance;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.request.MessageListRequest;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.MessageListResponse;
import net.nurigo.sdk.message.response.MultipleDetailMessageSentResponse;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;
import net.nurigo.sdk.message.service.DefaultMessageService;

@Slf4j
@RestController // @Controller + @ResponseBody가 합쳐진 형태로 JSON 형태의 객체 데이터를 반환
public class CommonSmsController {

    final DefaultMessageService messageService;

    public CommonSmsController() {
        // 반드시 계정 내 등록된 유효한 API 키, API Secret Key를 입력해주셔야 합니다!
        this.messageService = NurigoApp.INSTANCE.initialize("NCSUTKR0D0IXAJYJ", "OGKHX84E3BV4VX5T11WQHSJNYWGBR09G", "https://api.coolsms.co.kr");
    }

    /**
     * 메시지 조회 예제
     */
    @GetMapping("/get-message-list")
    public MessageListResponse getMessageList() {
        // 검색 조건이 있는 경우에 MessagListRequest를 초기화 하여 getMessageList 함수에 파라미터로 넣어서 검색할 수 있습니다!.
        // 수신번호와 발신번호는 반드시 -,* 등의 특수문자를 제거한 01012345678 형식으로 입력해주셔야 합니다!
        MessageListRequest request = new MessageListRequest();

        // 검색할 건 수, 값 미지정 시 20건 조회, 최대 500건 까지 설정 가능
        // request.setLimit(1);

        // 조회 후 다음 페이지로 넘어가려면 조회 당시 마지막의 messageId를 입력해주셔야 합니다!
        // request.setStartKey("메시지 ID");

        // request.setTo("검색할 수신번호");
        // request.setFrom("검색할 발신번호");

        // 메시지 상태 검색, PENDING은 대기 건, SENDING은 발송 중,COMPLETE는 발송완료, FAILED는 발송에 실패한 모든 건입니다.
        /*
        request.setStatus(MessageStatusType.PENDING);
        request.setStatus(MessageStatusType.SENDING);
        request.setStatus(MessageStatusType.COMPLETE);
        request.setStatus(MessageStatusType.FAILED);
        */

        // request.setMessageId("검색할 메시지 ID");

        // 검색할 메시지 목록
        /*
        ArrayList<String> messageIds = new ArrayList<>();
        messageIds.add("검색할 메시지 ID");
        request.setMessageIds(messageIds);
         */

        // 조회 할 메시지 유형 검색, 유형에 대한 값은 아래 내용을 참고해주세요!
        // SMS: 단문
        // LMS: 장문
        // MMS: 사진문자
        // ATA: 알림톡
        // CTA: 친구톡
        // CTI: 이미지 친구톡
        // NSA: 네이버 스마트알림
        // RCS_SMS: RCS 단문
        // RCS_LMS: RCS 장문
        // RCS_MMS: RCS 사진문자
        // RCS_TPL: RCS 템플릿문자
        // request.setType("조회 할 메시지 유형");

        return this.messageService.getMessageList(request);
    }

    /**
     * 단일 메시지 발송 예제
     */
    @PostMapping("/send-one")
    public SingleMessageSentResponse sendOne(@RequestParam String memberPhone, @RequestParam int generatedCode) {
        
//        Random random = new Random();
//        String numStr = "";
//        for(int i = 0; i < 6; i++) {
//          String ran = Integer.toString(random.nextInt(10));
//          numStr+=ran;
//        }
        
//        System.out.println("####memberPhone#### : " + memberphone);
        
        System.out.println("######## phone, code ###### : " + memberPhone + " /  " + generatedCode);
        
        Message message = new Message();
        
        // 발신번호 및 수신번호는 반드시 01012345678 형태로 입력되어야 합니다.
        message.setFrom("01033954663");
        message.setTo(memberPhone);
        message.setText("[포포트립] 아래의 인증번호를 입력해주세요.\n" + generatedCode);

        SingleMessageSentResponse response = this.messageService.sendOne(new SingleMessageSendingRequest(message));
        
        System.out.println("######response : #######" + response);

        return response;
    }
    /**
     * 관리자 화면 
     */
    /**
     * 여러 메시지 발송 예제
     * 한 번 실행으로 최대 10,000건 까지의 메시지가 발송 가능합니다.
     */
    @PostMapping("/sendMessages")
    public MultipleDetailMessageSentResponse sendMessages(@RequestParam String memberPhone, @RequestParam String sendingMessages) {
        ArrayList<Message> messageList  = new ArrayList<>();
        String[]           memberPhones = new String[1];

        if(memberPhone.contains(";")) 
        {
            memberPhones = memberPhone.split(";").clone();
        }
        else 
        {
            memberPhones[0] = memberPhone;
        }
        
        log.info("memberPhones : {}", memberPhones);
        
        for (int i = 0; i < memberPhones.length; i++) {
            String phoneNumber = memberPhones[i];
            Message message = new Message();
            message.setFrom("01033954663");
            message.setTo(phoneNumber);
            message.setText(sendingMessages);
            
            messageList.add(message);
        }
        try {
            MultipleDetailMessageSentResponse response = this.messageService.send(messageList, false, true);

            return response;
        }
        catch (NurigoMessageNotReceivedException exception)
        {
            System.out.println(exception.getFailedMessageList());
            System.out.println(exception.getMessage());
        }
        catch (Exception exception)
        {
            System.out.println(exception.getMessage());
        }
        return null;
    }

    /**
     * 잔액 조회 예제
     */
    @GetMapping("/get-balance")
    public Balance getBalance() {
        Balance balance = this.messageService.getBalance();
        System.out.println(balance);

        return balance;
    }
}