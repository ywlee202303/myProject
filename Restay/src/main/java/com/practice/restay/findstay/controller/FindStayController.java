package com.practice.restay.findstay.controller;

import static java.time.temporal.ChronoUnit.DAYS;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.core.io.ResourceLoader;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.practice.restay.common.util.MultipartFileUtil;
import com.practice.restay.common.util.PageInfo;
import com.practice.restay.findstay.model.service.FindStayService;
import com.practice.restay.findstay.model.vo.Area;
import com.practice.restay.findstay.model.vo.House;
import com.practice.restay.findstay.model.vo.HouseImage;
import com.practice.restay.findstay.model.vo.InterestStay;
import com.practice.restay.findstay.model.vo.Reservation;
import com.practice.restay.member.model.vo.Member;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
public class FindStayController {
    
    private final FindStayService findStayService;
    private final ResourceLoader resourceLoader;

    // 숙소 조회 페이지
    @GetMapping("/findstay")
    public ModelAndView findStay(
            ModelAndView modelAndView,
            @RequestParam(defaultValue = "1") int page,
            @RequestParam(defaultValue = "") String searchLocationKewords,
            @RequestParam(defaultValue = "") String searchBrandKewords,
            @RequestParam(defaultValue = "") String inputSearch,
            @RequestParam(name="checkIn", defaultValue = "") String checkIn,
            @RequestParam(name="checkOut", defaultValue = "") String checkOut
        ) 
    {
        if(searchLocationKewords.contains("충청")||searchLocationKewords.contains("경상")||searchLocationKewords.contains("전라"))
        {
            //충청 => 충남, 충북
            if(searchLocationKewords.contains("충청")) 
            {
                searchLocationKewords = searchLocationKewords.replace("충청", ",충남,충북");
            }
            //경상 => 경남, 경북
            if(searchLocationKewords.contains("경상")) 
            {
                searchLocationKewords = searchLocationKewords.replace("경상", ",경남,경북");
            }
            //전라 => 전남, 전북
            if(searchLocationKewords.contains("전라")) 
            {
                searchLocationKewords = searchLocationKewords.replace("전라", ",전남,전북");
            }
            
        }
        List<String> searchKeywordList = new ArrayList<String>();
        
        if(!searchLocationKewords.equals(""))
        {
            searchKeywordList = Arrays.asList(searchLocationKewords.split(","));
        }
        
        //Brand가 뭐지
//      if(searchBrandKewords.equals(""))
//      {
//          System.out.println("빈값이용");
//      }
//      else if(searchBrandKewords.contains(","))
//      {
//      }

        System.out.println("checkIn : " + checkIn);
        System.out.println("checkOut : " + checkOut);

        int listCount = 0;
        PageInfo pageInfo = null;
        List<String> houseCode = new ArrayList<>();
        
        // 페이징 처리
        listCount = findStayService.getHouseListCount(inputSearch, searchKeywordList);
        pageInfo = new PageInfo(page, 5, listCount, 10);
        
        // 숙소 조회(숙소만)
        List<House> onlyHouseList = findStayService.getOnlyHouseList(pageInfo, inputSearch, searchKeywordList);
        
        for (House house : onlyHouseList) {
            houseCode.add(house.getHouseCode());
        }
        List<House> houseList = findStayService.getHouseList(houseCode,inputSearch, searchKeywordList);
        
        // 숙소 이미지 조회
        List<HouseImage> houseImageList = findStayService.getHouseImageList(houseCode);
        
        log.info("Only House List : {}", onlyHouseList);
        log.info("House List : {}", houseList);
        log.info("HouseImage List : {}", houseImageList);
        
        modelAndView.addObject("pageInfo", pageInfo);
        modelAndView.addObject("checkIn", checkIn);
        modelAndView.addObject("checkOut", checkOut);
        modelAndView.addObject("houseList", houseList);
        modelAndView.setViewName("findstay/FindStay");
        
        return modelAndView;
    }

    // 숙소 예약 페이지
    @GetMapping("/findstay/room")
    public ModelAndView room(
            ModelAndView modelAndView,
            @RequestParam(defaultValue = "") String houseCode,
            @RequestParam(name="checkIn", defaultValue = "") String checkIn,
            @RequestParam(name="checkOut", defaultValue = "") String checkOut
    )
    {
        long day = 0L;
        
        if(!checkIn.equals("")&&!checkOut.equals(""))
        {
            DateTimeFormatter sdfStr = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            DateTimeFormatter sdfEnd = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            
            LocalDate dateStr = LocalDate.parse(checkIn, sdfStr);
            LocalDate dateEnd = LocalDate.parse(checkOut, sdfEnd);
            
            day =DAYS.between(dateStr, dateEnd);
        }
        
        House house = new House();

        house = findStayService.getHouse(houseCode);
        
        modelAndView.addObject("house", house);
        modelAndView.addObject("houseCode", houseCode);
        modelAndView.addObject("day"       , day);
        modelAndView.addObject("checkIn"  , checkIn);
        modelAndView.addObject("checkOut" , checkOut);
        modelAndView.setViewName("findstay/Room");
        return modelAndView;
    }

    // 숙소 예약 페이지
    @PostMapping("/findstay/reserveRoom")
    public ModelAndView reserveRoom(
            ModelAndView modelAndView,
            @SessionAttribute("loginMember") Member loginMember,
            @RequestParam(defaultValue = "") String houseCode,
            @RequestParam(name="check-in-3", defaultValue = "") String checkIn,
            @RequestParam(name="check-out-3", defaultValue = "") String checkOut
    )
    {
//        if(loginMember == null || loginMember.getMemberNo() == 0)
//        {
//            modelAndView.addObject("msg", "숙소 예약 실패 로그인이 필요합니다.");
//            modelAndView.addObject("location", "/findstay");
//            
//            modelAndView.setViewName("common/msg");
//            return modelAndView;
//        }
        
        House house = findStayService.getHouse(houseCode);
        
        Reservation reservation = new Reservation();

        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        
        int dateDiff = (int)DAYS.between(LocalDate.parse(checkIn, dtf), LocalDate.parse(checkOut, dtf));
        
        reservation.setResCheckin(LocalDate.parse(checkIn, dtf));
        reservation.setResCheckout(LocalDate.parse(checkOut, dtf));
        reservation.setResState("결제완료");
        reservation.setResNop(2);//숙박인원은 선택이 없으므로 일단 2명
        reservation.setTotalPrice(house.getHouseMinPrice() * dateDiff);
        reservation.setResDate(LocalDate.now());
        reservation.setMemberNo(loginMember.getMemberNo());
        reservation.setHouseCode(houseCode);
        
        int resultNum = findStayService.saveReservation(reservation);

        if(resultNum > 0) {
            // 숙소 예약 성공
        	// 예약 정보 조회
        	reservation = findStayService.resInfo(reservation);
        	
        	System.out.println("####예약정보#### : " + reservation);
        	
        	modelAndView.setViewName("redirect:/payment?resCode=" + reservation.getResCode());
        } else {
            // 숙소 예약 실패
            modelAndView.addObject("msg", "숙소 예약 실패");
            modelAndView.addObject("location", "/findstay");
            modelAndView.setViewName("common/msg");
        }
        
        return modelAndView;
    }
    
    // 숙소 등록 페이지(관리자)
    @GetMapping("/findstay/write")
    public ModelAndView write(ModelAndView modelAndView)
    {
        // 숙소 등록 지역 조회(시, 도)
        List<Area> areas = findStayService.getAreaName();
        
        log.info("지역 조회 : " + areas);
        
        modelAndView.addObject("areas", areas);
        modelAndView.setViewName("findstay/Write");
        
        return modelAndView;
    }
    
    @PostMapping("/findstay/write")
    public ModelAndView write(
            ModelAndView modelAndView,
            @RequestParam("area") int areaCode,
            @RequestParam("sigungu") int sigunguCode,
            @RequestParam("imgFiles") List<MultipartFile> imgFiles,
            House house
    ) 
    {
        
        int result = 0;
        int imgResult = 0;
        String location = null;
        String renamedFileName = null;
        
        /*
         * ResourceLoader
         * -  파일이나 클래스 경로와 같은 리소스에 대한 접근을 추상화한 인터페이스
         * 
         * getFile()
         * - 리소스의 파일 시스템 경로를 File 객체로 반환
         * getPath()
         * - 리소스의 경로를 문자열로 반환
         */
        
        // 1 - 지역코드, 시군구 코드로 시,도 / 시군구 조회
        Area area = findStayService.getAreaInfo(areaCode, sigunguCode);
        
        // 2 - Parameter로 넘어온 값들 DB에 저장
        // House 객체에 지역, 시군구, 이미지 저장
        house.setHouseArea(area.getAreaName());
        house.setHouseSigungu(area.getSigunguName());
        
        result = findStayService.saveHouseInfo(house);
        
        System.out.println("숙소 객체 조회 : " + house);
        
        // 3 - Parameter로 넘어온 이미지 파일 DB에 저장
        try {
            location = resourceLoader.getResource("resources/upload/findstay").getFile().getPath();
            
            for (MultipartFile multipartFile : imgFiles) {
                
                // 빈파일 저장 방지
                if(!multipartFile.isEmpty()) {
                    renamedFileName = MultipartFileUtil.save(multipartFile, location);
                    
                    HouseImage houseImage = new HouseImage();
                    
                    houseImage.setHouseCode(house.getHouseCode());
                    houseImage.setHouseImageOriginalFileName(multipartFile.getOriginalFilename());
                    houseImage.setHouseImageRenamedFileName(renamedFileName);
                    
                    // 숙소 이미지 저장
                    imgResult = findStayService.saveHouseImageInfo(houseImage);
                    
                    System.out.println("HouseImage 객체 : " + houseImage);
                }
                
                System.out.println(multipartFile);
                System.out.println(multipartFile.isEmpty());
            }
            
            System.out.println("location : " + location);
            
        } 
        catch (IOException e) { e.printStackTrace(); }
        
        if(result > 0) {
            if(imgResult > 0) {
                // 게시글 정상 등록
                modelAndView.addObject("msg", "게시글 등록 성공");
                modelAndView.addObject("location", "/findstay");
            } else {
                // 게시글 등록 실패
                modelAndView.addObject("msg", "게시글 등록 실패");
                modelAndView.addObject("location", "/findstay/write");
            }
        } else {
            // 게시글 등록 실패
            modelAndView.addObject("msg", "게시글 등록 실패");
            modelAndView.addObject("location", "/findstay/write");
        }
        
        modelAndView.setViewName("common/msg");
        
        return modelAndView;
    }
    
    // 숙소 등록 지역 조회(시군구)
    @PostMapping("/findstay/write/sigungus")
    public ResponseEntity<List<Area>> sigungus(@RequestParam int areaCode) 
    {
        List<Area> areas = findStayService.getSigunguName(areaCode);
        
        log.info("시군구 조회 : " + areaCode);
        
        return ResponseEntity.ok(areas);
    }
    
    @PostMapping("/findstay/saveInterestStay")
    public ResponseEntity<Map<String, Object>> addLikeStay(@RequestBody Map<String, Object> requestMap, HttpSession session)
    {
        Map<String, Object> resultMap = new HashMap<String, Object>();
        
        Member loginMember = (Member)session.getAttribute("loginMember");
        
        //로그인 필수 기능
        if(loginMember == null)
        {
            resultMap.put("result"    , 0);
            resultMap.put("resultMsg" , "로그인 후에 사용가능합니다.");
            resultMap.put("failLocation" , "/login");
            return ResponseEntity.ok(resultMap);
        }
        
        
        InterestStay interestStay = new InterestStay(); 
        interestStay.setMemberNo(loginMember.getMemberNo());
        interestStay.setHouseCode(requestMap.get("houseCode").toString());
        
        InterestStay existInterestStay = findStayService.getInterestStay(interestStay);
        String action = requestMap.get("action").toString();
        int result = 0;
        
        if(existInterestStay != null && action.equals("delete"))
        {
            //delete
            result = findStayService.deleteInterestStay(interestStay);
            
        }
        else if(existInterestStay == null && action.equals("insert"))
        {
            //insert
            result = findStayService.insertInterestStay(interestStay);
        }
        else
        {
            resultMap.put("resultMsg" , "문제가 발생하였습니다. 다시 시도해주세요");
            resultMap.put("failLocation" , "/findstay");
        }

        resultMap.put("result"    , result);
        return ResponseEntity.ok(resultMap);
    }

}