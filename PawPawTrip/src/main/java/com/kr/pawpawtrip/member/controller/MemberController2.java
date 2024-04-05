package com.kr.pawpawtrip.member.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kr.pawpawtrip.common.util.PageInfo;
import com.kr.pawpawtrip.community.model.service.CommunityService;
import com.kr.pawpawtrip.member.model.service.MemberService;
import com.kr.pawpawtrip.member.model.vo.Member;
import com.kr.pawpawtrip.trip.model.service.TripService;
import com.kr.pawpawtrip.trip.model.vo.MyTrip;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@SessionAttributes("loginMember")
public class MemberController2 {
    @Autowired // 빈을 만들어 주입
    private MemberService service;
    
    @Autowired
    private CommunityService communityService;
    
    @Autowired
    private TripService tripService;
    
    // 내가 찜한 장소(관광지, 숙소) 조회
   @GetMapping("/member/mypage/my-trip")
   public ModelAndView myTrip(ModelAndView modelAndView, @RequestParam(defaultValue = "1") int page, HttpSession session) {
      
      // 찜한 장소의 정보가 담겨있는 클래스 사용(내부에 spot, stay 객체가 있음)
      List<MyTrip> myTrips = null;
      
      // 로그인한 멤버 객체만 해당 페이지를 사용할 수 있도록 설정
      Member loginMember = (Member) session.getAttribute("loginMember");
      
      // 페이징 처리
      PageInfo pageInfo = null;
      
      // 조회된 전체 게시물 수
      int listCount = 0;
      
      // 로그인한 멤버와 로그인하지 않은 멤버를 구분한 뒤 포워딩
      if (loginMember != null) {
         int memberNo = loginMember.getMemberNo();
         
         // 로그인한 멤버일 경우, 해당 멤버가 찜한 장소 목록 노출
         listCount = tripService.getMyTripByMemberNo(memberNo);
         // log.info("listCount : {}", listCount);
         
         // 페이징 처리
         pageInfo = new PageInfo(page, 5, listCount, 9);
         myTrips = tripService.getMyTripListByMemberNo(pageInfo, memberNo);
         
         for (MyTrip myTrip : myTrips) {
            myTrip.setMemberNo(memberNo);
            
            // 만약 이미지가 없을 시, 특정 이미지 노출
            if (myTrip.getImage() == null) {
               myTrip.setImage("/pawpawtrip/img/trip/readyImage.png");
            }
         }
         
         // System.out.println("***************************************************************");
         // log.info("mytrips : {}", myTrips);
         // log.info("mytrips size : {}", myTrips.size());
         // log.info("LoginMember NO : {}", loginMember.getMemberNo());
         
         modelAndView.addObject("pageInfo", pageInfo);
         modelAndView.addObject("myTrips", myTrips);
         modelAndView.setViewName("member/mypage/myTrip");
         
      } else {
         // 로그인 하지 않은 멤버일 경우, msg 출력 & 로그인페이지로 이동
            modelAndView.addObject("msg", "로그인 후 이용해주세요.");
            modelAndView.addObject("location", "/login");
            modelAndView.setViewName("common/msg");
      }
      
      return modelAndView; 
   }
   
   // 찜 목록에 추가
   @GetMapping("/member/mypage/my-trip/insert")
   public ModelAndView insertSpotToZzim(ModelAndView modelAndView, @RequestParam("contentId") String contentId, @RequestParam("memberNo") int memberNo, HttpSession session) {
      
	  // contentId와 memberNo를 받아 한 행(My Trip) 추가
      int result = tripService.saveMyTrip(contentId, memberNo);
      
      modelAndView.addObject(contentId, session);
      modelAndView.addObject("msg", "찜 목록에 추가되었습니다.");
      modelAndView.setViewName("common/msg");
      
      return modelAndView;
   }
   
   @GetMapping("/member/mypage/my-trip/delete")
   public ModelAndView deleteSpotToZzim(ModelAndView modelAndView, @RequestParam("contentId") String contentId, @RequestParam("memberNo") int memberNo, HttpSession session) {
	   
	// contentId와 memberNo를 받아 한 행(My Trip) 삭제
	   int result = tripService.deleteMyTrip(contentId, memberNo);
	   
	   modelAndView.addObject(contentId, session);
	   modelAndView.addObject("msg", "찜 목록에서 삭제되었습니다.");
	   modelAndView.setViewName("common/msg");
	   
	   return modelAndView;
   }
   
}
