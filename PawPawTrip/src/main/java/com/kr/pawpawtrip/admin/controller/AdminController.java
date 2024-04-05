package com.kr.pawpawtrip.admin.controller;

import java.io.IOException;
import java.net.URISyntaxException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.springframework.core.io.ResourceLoader;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.client.RestClientException;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kr.pawpawtrip.admin.model.service.AdminService;
import com.kr.pawpawtrip.admin.model.vo.CommunityRank;
import com.kr.pawpawtrip.admin.model.vo.FavorSite;
import com.kr.pawpawtrip.admin.model.vo.LogCount;
import com.kr.pawpawtrip.admin.model.vo.Pet;
import com.kr.pawpawtrip.admin.model.vo.WeatherArea;
import com.kr.pawpawtrip.common.api.CommonApiClient;
import com.kr.pawpawtrip.common.api.CommonWeatherApiClient;
import com.kr.pawpawtrip.common.api.item.DetailCommonItem;
import com.kr.pawpawtrip.common.api.item.PetTourItem;
import com.kr.pawpawtrip.common.api.response.DetailCommonResponse;
import com.kr.pawpawtrip.common.api.response.GetMidLandFcstResponse;
import com.kr.pawpawtrip.common.api.response.GetMidTaResponse;
import com.kr.pawpawtrip.common.api.response.PetTourResponse;
import com.kr.pawpawtrip.common.model.service.CommonService;
import com.kr.pawpawtrip.common.model.vo.Category;
import com.kr.pawpawtrip.common.model.vo.CommonArea;
import com.kr.pawpawtrip.common.util.MultipartFileUtil;
import com.kr.pawpawtrip.common.util.PageInfo;
import com.kr.pawpawtrip.community.model.service.CommunityService;
import com.kr.pawpawtrip.community.model.vo.Community;
import com.kr.pawpawtrip.member.model.vo.Member;
import com.kr.pawpawtrip.trip.model.service.TripService;
import com.kr.pawpawtrip.trip.model.vo.Comm;
import com.kr.pawpawtrip.trip.model.vo.PetInfo;
import com.kr.pawpawtrip.trip.model.vo.Spot;
import com.kr.pawpawtrip.trip.model.vo.Stay;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@SessionAttributes(
{
        "petTourInfos", "petTourDetail", "detailCommonItem", "loginMember"
})
public class AdminController
{
    private final CommonApiClient        commonApiClient;
    private final CommonWeatherApiClient commonWeatherApiClient;
    private final CommonService          commonService;
    private final AdminService           adminService;
    private final CommunityService       communityService;
    private final TripService            tripService;
    private final ResourceLoader         resourceLoader;

    /** 대시보드 화면 이동 */
    @GetMapping("/admin/dashboard")
    public ModelAndView dashboard(ModelAndView modelAndView)
    {
        // 대쉬보드 중 게시물 조회수 순위정보를 가져온다.
        List<CommunityRank> ranks = adminService.getCommunityRanks();

//        //대쉬보드 중 마이펫 비율 정보를 가져온다.
//        List<Pet> pets = adminService.getMyPetRatio();

//        System.out.println("마이펫 비율 정보 : " + pets);

        modelAndView.addObject("ranks", ranks);
        modelAndView.setViewName("admin/dashboard");
        return modelAndView;
    }

    /** 대시보드 마이펫 비율 */
    @GetMapping("/admin/mypetRatioAjax")
    public ResponseEntity<List<Pet>> mypetRatioAjax()
    {
        List<Pet> pets = adminService.getMyPetRatio();

        return ResponseEntity.ok(pets);
    }
    /** 대시보드 사용자 접속로그 */
    @GetMapping("/admin/accessMemberCountAjax")
    public ResponseEntity<List<LogCount>> accessMemberCountAjax()
    {
        List<LogCount> logCount = adminService.getAccessMemberCount();
        
        return ResponseEntity.ok(logCount);
    }

    /** 트립 매핑 - 목록 화면으로 이동 */
    @GetMapping("/admin/tripList")
    public ModelAndView tripList(ModelAndView modelAndView, @RequestParam(defaultValue = "10") String numOfRows,
            @RequestParam(defaultValue = "1") int pageNo)
    {
        modelAndView.addObject("pageNo", pageNo);
        modelAndView.addObject("numOfRows", numOfRows);
        modelAndView.setViewName("/admin/tripList");

        return modelAndView;
    }

    /** 트립 매핑 - 일괄등록 버튼 클릭시 */
    @PostMapping("/admin/tripList")
    @ResponseBody
    public ResponseEntity<Map<String, Integer>> saveTripList(@RequestParam(defaultValue = "10") String numOfRows,
            @RequestParam(value = "contentIdsArr[]") List<String> contentIdsArr)
            throws RestClientException, URISyntaxException
    {
        int petTripResult = 0;
        int petStayResult = 0;
        int commonCount = 0;
        int petInfoCount = 0;
        Map<String, Integer> resultMap = new HashMap<String, Integer>();

        // 세션에 저장된 petTourInfos로 for문을 돌면서 데이터를 저장한다.
        for (String contentIds : contentIdsArr)
        {
            int contentId = Integer.parseInt(contentIds);
            DetailCommonResponse commonResponse = commonApiClient.apiDetailCommonToContentId(contentId);
            PetTourResponse petTourResponse = commonApiClient.apiDetailPetTour("1", contentId, numOfRows);// ApiClient로
                                                                                                          // API
                                                                                                          // response
                                                                                                          // 객체를 받아온다.
            PetInfo dbPetInfo = tripService.getPetTourByContentId(contentId);
            DetailCommonItem detailCommonItem = commonResponse.getDetailCommonItems().get(0);
            PetTourItem petTourItem = petTourResponse.getPetTourItems().get(0);

            String contentTypeid = detailCommonItem.getContenttypeid();
            String acmpyTypeCd = petTourItem.getAcmpyTypeCd();

            // DB에 이미 저장된 내용은 건너뛴다
            if (dbPetInfo != null)
            {
                continue;
            }

            // 컨텐츠타입아이디로 VO를 선언 후 저장
            if (contentTypeid.equals("12") && (acmpyTypeCd.equals("전용") || acmpyTypeCd.equals("동반가능"))) // 여행지- Trip
            {
                Spot spot = new Spot();
                // Spot와 DetailCommonItem객체를 매핑한다.
                mappingCommonItemVo(detailCommonItem, spot);

                // VO로 save처리를 한다.
                petTripResult += tripService.saveTrip(spot);
            } else if (contentTypeid.equals("32") && (acmpyTypeCd.equals("전용") || acmpyTypeCd.equals("동반가능"))) // 숙소-
                                                                                                               // Stay
            {
                Stay stay = new Stay();
                // Stay와 DetailCommonItem객체를 매핑한다.
                mappingCommonItemVo(detailCommonItem, stay);

                // VO로 save처리를 한다.
                petStayResult += tripService.saveStay(stay);
            }

            Comm comm = new Comm();
            // Comm와 DetailCommonItem객체를 매핑한다.
            mappingCommonItemVo(detailCommonItem, comm);

            // VO로 save처리를 한다.
            commonCount += tripService.saveComm(comm);

            // VO로 save처리를 한다.
            PetInfo petInfo = new PetInfo();
            // PetInfo와 PetTourItem객체를 매핑한다.
            mappingPetTourItemVo(petTourItem, petInfo);

            petInfoCount += tripService.savePetInfo(petInfo);
        }

        resultMap.put("totalCount", contentIdsArr.size());
        resultMap.put("petTripResult", petTripResult);
        resultMap.put("petStayResult", petStayResult);
        resultMap.put("commonCount", commonCount);
        resultMap.put("petInfoCount", petInfoCount);
        return ResponseEntity.ok(resultMap);
    }

    /** 트립 매핑 - 목록 조회 */
    @GetMapping("/admin/tripListApi")
    @ResponseBody
    public ResponseEntity<PetTourResponse> tripListApi(HttpSession session,
            @RequestParam(defaultValue = "10") String numOfRows, @RequestParam(defaultValue = "1") String pageNo,
            @RequestParam(defaultValue = "0") int contentId) throws RestClientException, URISyntaxException
    {
        // ApiClient로 API response 객체를 받아온다.
        PetTourResponse response = commonApiClient.apiDetailPetTour(pageNo, contentId, numOfRows);

        // @SessionAttributes("petTourInfos") 에 설정한 이름으로 session에 저장한다. - Detail 페이지로 갈때
        // 다시 Api 호출하면 느려지므로
        ArrayList<PetTourItem> petTourInfos = response.getPetTourItems();

        // 컨텐츠 아이디만 List<Integer>으로 만든다
        List<Integer> contentIdList = petTourInfos.stream()
                .map(petTourItem -> Integer.parseInt(petTourItem.getPetinfoContentid())).collect(Collectors.toList());

        // TODO: Comm 에서 데이터를 가져와야하는데 PetInfo에서 가져왔네
        List<PetInfo> dbPetTours = tripService.getPetTourListByContentIds(contentIdList);

        log.info("petTourInfos : {} , petTourInfos : {}", petTourInfos.size(), dbPetTours.size());

        // 리스트에 보여줄 petInfo정보에 DB정보를 담아서 보내준다.
        for (PetTourItem petTourItem : response.getPetTourItems())
        {
            petTourItem.setDbExistYn("미등록");
            petTourItem.setDbAcmpyTypeCd(null);

            // DB에서 가져온 정보로 for문
            for (PetInfo dbPetTour : dbPetTours)
            {
                // DB에서 가져온 contentId 가 있을때
                if (dbPetTour.getPetinfoContentid() == Integer.parseInt(petTourItem.getPetinfoContentid()))
                {
                    petTourItem.setDbExistYn("등록");
                    petTourItem.setDbAcmpyTypeCd(dbPetTour.getAcmpyTypeCd());
                }
            }
        }

        petTourInfos = response.getPetTourItems();
        session.setAttribute("petTourInfos", petTourInfos);// detail화면을 위한 세션저장

        return ResponseEntity.ok(response);
    }

    /** 트립 매핑 - 상세 화면으로 이동 */
    @GetMapping("/admin/tripDetail")
    public ModelAndView stayDetail(@SessionAttribute("petTourInfos") ArrayList<PetTourItem> petTourInfos,
            @RequestParam(defaultValue = "") int contentId, @RequestParam(defaultValue = "1") int pageNo,
            ModelAndView modelAndView, HttpSession session) throws RestClientException, URISyntaxException
    {
        PetTourItem petTourDetail = new PetTourItem();

        List<PetTourItem> selectedItems = petTourInfos.stream()
                .filter(petTourInfo -> Integer.parseInt(petTourInfo.getPetinfoContentid()) == contentId)
                .collect(Collectors.toList());

        if (!selectedItems.isEmpty())
        {
            petTourDetail = selectedItems.get(0);
        }
        session.setAttribute("petTourDetail", petTourDetail);
        modelAndView.addObject("contentId", contentId);
        modelAndView.addObject("pageNo", pageNo);
        modelAndView.setViewName("/admin/tripDetail");

        return modelAndView;
    }

    /** 트립 매핑 - 상세 화면 ajax */
    @GetMapping("/admin/tripDetailAjax")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> tripDetailAjax(ModelAndView modelAndView,
            @RequestParam("contentId") int contentId, HttpSession session)
            throws RestClientException, URISyntaxException
    {
        Map<String, Object> resultMap = new HashMap<String, Object>();

        /*
         * 1. 파라미터로 가져온 contentId 를 가지고 공통 API 객체를 받아온다(petTour쪽은 List<> 타입으로 세션에 저장
         * 해놓음)
         */
        /* 2. 가져온 트립 객체를 세션에 저장한다(DB에 insert 할때는 세션에서 객체만 가져오도록) */
        /* 3. List에서 contentId에 해당하는 객체만 세션에 저장한다. */
        DetailCommonResponse commonResponse = commonApiClient.apiDetailCommonToContentId(contentId);
        PetTourResponse petTourResponse = commonApiClient.apiDetailPetTour("1", contentId, "10");// ApiClient로 API
                                                                                                 // response 객체를 받아온다.
        PetInfo dbPetInfo = tripService.getPetTourByContentId(contentId);
        DetailCommonItem detailCommonItem = commonResponse.getDetailCommonItems().get(0);
        PetTourItem petTourReponseItem = petTourResponse.getPetTourItems().get(0);

        Category category = commonService.getAllCategory(detailCommonItem.getCat3());
        CommonArea commonArea = commonService.getFullAreaName(detailCommonItem.getAreacode(),
                (detailCommonItem.getSigungucode().isEmpty() ? "0" : detailCommonItem.getSigungucode()));

        petTourReponseItem.setDbExistYn("미등록");
        petTourReponseItem.setDbAcmpyTypeCd(null);

        if (dbPetInfo != null)
        {
            petTourReponseItem.setDbExistYn("등록");
            petTourReponseItem.setDbAcmpyTypeCd(dbPetInfo.getAcmpyTypeCd());
        }
        session.setAttribute("detailCommonItem", detailCommonItem);
        session.setAttribute("petTourDetail", petTourReponseItem);

        resultMap.put("detailCommonItem", detailCommonItem);
        resultMap.put("petTourDetailMap", petTourReponseItem);
        resultMap.put("category", category);
        resultMap.put("commonArea", commonArea);

        return ResponseEntity.ok(resultMap);
    }

    /** 컨텐츠 등록 처리 */
    @PostMapping("/admin/tripDetail")
    @ResponseBody
    public ModelAndView tripSave(ModelAndView modelAndView, @RequestParam("contentId") int contentId,
            HttpSession session) throws RestClientException, URISyntaxException
    {
        DetailCommonResponse commonResponse = commonApiClient.apiDetailCommonToContentId(contentId);
        PetTourResponse petTourResponse = commonApiClient.apiDetailPetTour("1", contentId, "10");// ApiClient로 API
                                                                                                 // response 객체를 받아온다.
        PetInfo dbPetInfo = tripService.getPetTourByContentId(contentId);
        DetailCommonItem detailCommonItem = commonResponse.getDetailCommonItems().get(0);
        PetTourItem petTourItem = petTourResponse.getPetTourItems().get(0);
        String contentTypeId = null;
        int petTripResult = 0;
        int petInfoResult = 0;

        // 이미 저장되어 있는 컨텐츠라면 insert하지 않는다. TODO: 시간나면 수정기능 추가 예정
        if (dbPetInfo != null)
        {
            modelAndView.addObject("requestMsg", "이미 저장되어있는 컨텐츠입니다.");
            modelAndView.addObject("contentId", detailCommonItem.getContentid());
            modelAndView.setViewName("admin/tripDetail");

            return modelAndView;
        }

        // 1. DetailCommonItem 에서 컨텐츠타입아이디를 가져온다.
        contentTypeId = detailCommonItem.getContenttypeid();

        // 2. 컨텐츠타입아이디로 VO를 선언한다
        if (contentTypeId.equals("12")) // 여행지- Trip
        {
            Spot spot = new Spot();
            // Spot와 DetailCommonItem객체를 매핑한다.
            mappingCommonItemVo(detailCommonItem, spot);

            // 3. VO로 save처리를 한다.
            petTripResult = tripService.saveTrip(spot);

        } else if (contentTypeId.equals("32")) // 숙소- Stay
        {
            Stay stay = new Stay();
            // Stay와 DetailCommonItem객체를 매핑한다.
            mappingCommonItemVo(detailCommonItem, stay);

            // 3. VO로 save처리를 한다.
            petTripResult = tripService.saveStay(stay);
        }
        Comm comm = new Comm();
        // Comm와 DetailCommonItem객체를 매핑한다.
        mappingCommonItemVo(detailCommonItem, comm);

        // 3. VO로 save처리를 한다.
        petTripResult += tripService.saveComm(comm);

        // 4. PetInfo를 저장처리한다.
        PetInfo petInfo = new PetInfo();
        // PetInfo와 PetTourItem객체를 매핑한다.
        mappingPetTourItemVo(petTourItem, petInfo);

        petInfoResult = tripService.savePetInfo(petInfo);

        if ((petInfoResult + petTripResult) == 3)
        {
            modelAndView.addObject("requestMsg", "성공적으로 저장되었습니다.");
        } else if ((petInfoResult + petTripResult) == 0)
        {
            modelAndView.addObject("requestMsg", "저장에 실패하였습니다.");
        } else
        {
            modelAndView.addObject("requestMsg", "일부 테이블만 저장되었습니다.");
        }
        modelAndView.addObject("contentId", detailCommonItem.getContentid());
        modelAndView.setViewName("admin/tripDetail");

        return modelAndView;
    }

    /** 공지사항입력 화면 이동 */
    @GetMapping("/admin/noticeWrite")
    public String noticeWrite()
    {
        return "admin/noticeWrite";
    }

    /** 공지사항 저장 처리 */
    @PostMapping("/admin/noticeWrite")
    public ModelAndView noticeWrite(ModelAndView modelAndView, Community community,
            @SessionAttribute("loginMember") Member loginMember,
            @RequestParam("talkWriteFile") MultipartFile talkWriteFile)
    {
        int result = 0;
        // 1. 파일 업로드 확인 후 파일 저장
        // 파일을 업로드하지 않으면 로그에 true, 업로드하면 false
        // log.info("isEmpty: {}", talkWriteFile.isEmpty());

        // 파일을 업로드하지 않으면 ""(빈문자), 업로드하면 "파일명"
        // log.info("File Name : {}", talkWriteFile.getOriginalFilename());

        if (talkWriteFile != null && !talkWriteFile.isEmpty())
        {
            String location = null;
            String renamedFileName = null;
            try
            {
                location = resourceLoader.getResource("resources/upload/community").getFile().getPath();

                renamedFileName = MultipartFileUtil.save(talkWriteFile, location);

                if (renamedFileName != null)
                {
                    community.setCommunityOfileName(talkWriteFile.getOriginalFilename());
                    community.setCommunityRfileName(renamedFileName);
                }
            } catch (IOException e)
            {
                e.printStackTrace();
            }
        }
        log.info("community : {}", community);
        
        community.setCommunityWriterNo(loginMember.getMemberNo());
        community.setCommunityCategory("[공지사항]");

        result = adminService.saveNotice(community);

        if (result > 0)
        {
            modelAndView.setViewName("redirect:/community/notice");
        } else
        {
            modelAndView.addObject("writeRstMsg", "저장중에 문제가 발생했습니다. 다시 시도해 주세요");
            modelAndView.setViewName("admin/noticeWrite");
        }
        return modelAndView;
    }

    /** 공지사항수정 화면 이동 */
    @GetMapping("/admin/noticeUpdate")
    public ModelAndView noticeUpdate(ModelAndView modelAndView, @RequestParam int no,
            @SessionAttribute Member loginMember)
    {
        Community community = communityService.getBoardNo(no);

        if (community != null && community.getCommunityWriterId().equals(loginMember.getMemberId()))
        {
            modelAndView.addObject("community", community);
            modelAndView.setViewName("admin/noticeUpdate");
        } else
        {
            modelAndView.addObject("msg", "잘못된 접근입니다.");
            modelAndView.addObject("location", "/community/notice");
            modelAndView.setViewName("common/msg");
        }

        return modelAndView;
    }

    /** 공지사항 수정 처리 */
    @PostMapping("admin/noticeUpdate")
    public ModelAndView updateNotice(    ModelAndView  modelAndView, 
                                         Community     community,
                       @RequestParam     MultipartFile talkWriteFile, 
                       @SessionAttribute Member        loginMember)
    {
        int result = 0;

        Community dbCommunity = communityService.getBoardNo(community.getCommunityNo());

        String location = null;
        String renamedFileName = null;
        
        if (talkWriteFile != null && !talkWriteFile.isEmpty())
        {
            try
            {
                // workspace에 저장되어 있는 파일 경로
                location = resourceLoader.getResource("resources/upload/community").getFile().getPath();
                
                if (dbCommunity.getCommunityRfileName() != null)
                {
                    MultipartFileUtil.delete(location + "/" + dbCommunity.getCommunityRfileName());
                }
                renamedFileName = MultipartFileUtil.save(talkWriteFile, location);
                
                if (renamedFileName != null)
                {
                    dbCommunity.setCommunityOfileName(talkWriteFile.getOriginalFilename());
                    dbCommunity.setCommunityRfileName(renamedFileName);
                }
            }
            catch (IOException e)
            {
                e.printStackTrace();
            }
        }
        
        dbCommunity.setCommunityWriterNo(loginMember.getMemberNo());
        dbCommunity.setNoticeImportantYN(community.getNoticeImportantYN());
        dbCommunity.setCommunityTitle(community.getCommunityTitle());
        dbCommunity.setCommunityContent(community.getCommunityContent());
        
        result = communityService.save(dbCommunity);
        
        if (result > 0)
        {
            modelAndView.addObject("msg", "게시글 수정 성공");
            modelAndView.addObject("location", "/community/notice");
        }
        else
        {
            modelAndView.addObject("msg", "게시글 수정 실패");
            modelAndView.addObject("location", "/community/noticedetail?no=" + dbCommunity.getCommunityNo());
        }
        
        modelAndView.setViewName("common/msg");

        return modelAndView;
    }

    // 게시글 삭제
    @GetMapping("/admin/noticeDelete")
    public ModelAndView delete(ModelAndView modelAndView, @RequestParam int no, @SessionAttribute Member loginMember)
    {
        int result = communityService.delete(no);

        if (result > 0)
        {
            modelAndView.setViewName("redirect:/community/notice");
        }
        modelAndView.setViewName("redirect:/community/notice");
        return modelAndView;
    }

    // 인추장 사이트 이동
    @GetMapping("/admin/favoritesite")
    public ModelAndView favoritesite(ModelAndView modelAndView, @RequestParam(defaultValue = "1") int page,
            @RequestParam(defaultValue = "") String select, @RequestParam(defaultValue = "") String search)
    {
        // 전체 리스트 수
        int listCount = 0;
        // 페이징 처리
        PageInfo pageInfo = null;

        // 검색 파라미터 request scope에 저장하기 위한 HashMap
        Map<String, String> map = new HashMap<String, String>();

        map.put("select", select);
        map.put("search", search);

        listCount = adminService.getFavorSiteCount(select, search);
        pageInfo = new PageInfo(page, 5, listCount, 20);

        List<FavorSite> sites = adminService.getFavorSite(pageInfo, select, search);

        log.info("sites.size() : {}", sites.size());

        modelAndView.addObject("searchInfoMap", map);
        modelAndView.addObject("pageInfo", pageInfo);
        modelAndView.addObject("sites", sites);
        modelAndView.setViewName("admin/favoritesite");
        return modelAndView;
    }

    // 인추장 Top3 가져오는 Ajax
    @GetMapping("/admin/favoriteTopThreeAjax")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> favoriteTopThreeAjax(ModelAndView modelAndView)
    {
        Map<String, Object> map = new HashMap<String, Object>();

        List<FavorSite> sites = adminService.getFavoriteTopThree();

        map.put("sites", sites);

        return ResponseEntity.ok(map);
    }

    // 인추장 사이트 저장하는 Ajax
    @ResponseBody
    @PostMapping("/admin/addTopThreeAjax")
    public ResponseEntity<Map<String, Object>> addTopThreeAjax(
            @RequestParam(value = "contentIdsArr[]") List<String> contentIdsArr)
    {
        Map<String, Object> map = new HashMap<String, Object>();

        int result = adminService.saveFavoriteTopThree(contentIdsArr);

        map.put("result", result);

        return ResponseEntity.ok(map);
    }

    // 개발예정 사이트로 이동하는
    @ResponseBody
    @GetMapping("/admin/plannedDevelop")
    public ModelAndView plannedDevelop(ModelAndView modelAndView) throws RestClientException, URISyntaxException
    {
        //지점번호 : "11B00000" 발표 시각 : yyyyMMddHHmm - 일 2회(06:00,18:00)회 생성
        String response = commonWeatherApiClient.apiGetMidFcst("11B00000","202403150600");
        
        // 중기 기운 지역별 날씨정보 조회
        List<WeatherArea> weatherAreas = null;
        
        weatherAreas = adminService.getWeatherAreaList();
        
        log.info("WeatherAreas - {}", weatherAreas);
        
        log.info("response : {}" ,response);
        
        modelAndView.addObject("weatherAreas", weatherAreas);
        modelAndView.setViewName("admin/plannedDevelop");

        return modelAndView;
    }

    /**
     * DetailCommonItem 을 다른 VO로 매핑해준다.
     * 
     * @param detailCommonItem
     * @param comm
     */
    private void mappingCommonItemVo(DetailCommonItem detailCommonItem, Spot spot)
    {
        spot.setTripContentId(Integer.parseInt(detailCommonItem.getContentid())); // 여행 콘텐츠 ID (기본키)
        spot.setTripAddress(detailCommonItem.getAddr1()); // 여행지 주소
        spot.setTripDetailAddress(detailCommonItem.getAddr2()); // 여행지 상세주소
        spot.setTripTitle(detailCommonItem.getTitle()); // 여행지 이름
        spot.setAreaCode(detailCommonItem.getAreacode()); // 지역 코드
        spot.setTripCategory1(detailCommonItem.getCat1()); // 여행 카테고리 대분류
        spot.setTripCategory2(detailCommonItem.getCat2()); // 여행 카테고리 중분류
        spot.setTripCategory3(detailCommonItem.getCat3()); // 여행 카테고리 소분류
        spot.setTripContentTypeId(detailCommonItem.getContenttypeid()); // 여행 콘텐츠 타입 ID
        if (detailCommonItem.getCreatedtime().length() == 12)
        {
            detailCommonItem.setCreatedtime(detailCommonItem.getCreatedtime() + "00");
        }
        if (detailCommonItem.getModifiedtime().length() == 12)
        {
            detailCommonItem.setModifiedtime(detailCommonItem.getModifiedtime() + "00");
        }
        LocalDate createdtime = LocalDateTime
                .parse(detailCommonItem.getCreatedtime(), DateTimeFormatter.ofPattern("yyyyMMddHHmmss")).toLocalDate();
        LocalDate modifiedtime = LocalDateTime
                .parse(detailCommonItem.getModifiedtime(), DateTimeFormatter.ofPattern("yyyyMMddHHmmss")).toLocalDate();
        spot.setTripCreateTime(createdtime); // 등록일
        spot.setTripModifyTime(modifiedtime); // 수정일
        spot.setTripImage(detailCommonItem.getFirstimage()); // 여행 이미지
        spot.setMapX(detailCommonItem.getMapx()); // x좌표
        spot.setMapY(detailCommonItem.getMapy()); // y좌표
        spot.setMapLevel(detailCommonItem.getMlevel()); // 축척
        spot.setTripTel(detailCommonItem.getTel()); // 여행 전화번호
        spot.setSigunguCode(detailCommonItem.getSigungucode()); // 시군구 코드
        spot.setHomepage(detailCommonItem.getHomepage()); // 홈페이지주소
        spot.setOverview(detailCommonItem.getOverview()); // 소개설명
    }

    private void mappingCommonItemVo(DetailCommonItem detailCommonItem, Stay stay)
    {
        stay.setStayContentId(Integer.parseInt(detailCommonItem.getContentid())); // 숙소 콘텐츠 ID (기본키)
        stay.setStayAddress(detailCommonItem.getAddr1()); // 숙소 주소
        stay.setStayDetailAddress(detailCommonItem.getAddr2()); // 숙소 상세주소
        stay.setStayTitle(detailCommonItem.getTitle()); // 숙소 이름
        stay.setAreaCode(detailCommonItem.getAreacode()); // 숙소 코드
        stay.setStayCategory1(detailCommonItem.getCat1()); // 숙소 카테고리 대분류
        stay.setStayCategory2(detailCommonItem.getCat2()); // 숙소 카테고리 중분류
        stay.setStayCategory3(detailCommonItem.getCat3()); // 숙소 카테고리 소분류
        stay.setStayContentTypeId(detailCommonItem.getContenttypeid()); // 숙소 콘텐츠 타입 ID
        if (detailCommonItem.getCreatedtime().length() == 12)
        {
            detailCommonItem.setCreatedtime(detailCommonItem.getCreatedtime() + "00");
        }
        if (detailCommonItem.getModifiedtime().length() == 12)
        {
            detailCommonItem.setModifiedtime(detailCommonItem.getModifiedtime() + "00");
        }
        LocalDate createdtime = LocalDateTime
                .parse(detailCommonItem.getCreatedtime(), DateTimeFormatter.ofPattern("yyyyMMddHHmmss")).toLocalDate();
        LocalDate modifiedtime = LocalDateTime
                .parse(detailCommonItem.getModifiedtime(), DateTimeFormatter.ofPattern("yyyyMMddHHmmss")).toLocalDate();
        stay.setStayCreateTime(createdtime); // 등록일
        stay.setStayModifyTime(modifiedtime); // 수정일
        stay.setStayImage(detailCommonItem.getFirstimage()); // 숙소 이미지
        stay.setMapX(detailCommonItem.getMapx()); // x좌표
        stay.setMapY(detailCommonItem.getMapy()); // y좌표
        stay.setMapLevel(detailCommonItem.getMlevel()); // 축척
        stay.setStayTel(detailCommonItem.getTel()); // 숙소 전화번호
        stay.setSigunguCode(detailCommonItem.getSigungucode()); // 시군구 코드
        stay.setHomepage(detailCommonItem.getHomepage()); // 홈페이지주소
        stay.setOverview(detailCommonItem.getOverview()); // 소개설명
    }

    private void mappingCommonItemVo(DetailCommonItem detailCommonItem, Comm comm)
    {
        comm.setCommContentId(Integer.parseInt(detailCommonItem.getContentid())); // 공통 콘텐츠 ID (기본키)
        comm.setCommAddress(detailCommonItem.getAddr1()); // 공통컨텐츠 주소
        comm.setCommDetailAddress(detailCommonItem.getAddr2()); // 공통컨텐츠 상세주소
        comm.setCommTitle(detailCommonItem.getTitle()); // 공통컨텐츠 이름
        comm.setAreaCode(detailCommonItem.getAreacode()); // 지역 코드
        comm.setCommCategory1(detailCommonItem.getCat1()); // 공통 카테고리 대분류
        comm.setCommCategory2(detailCommonItem.getCat2()); // 공통 카테고리 중분류
        comm.setCommCategory3(detailCommonItem.getCat3()); // 공통 카테고리 소분류
        comm.setCommContentTypeId(detailCommonItem.getContenttypeid());// 공통 콘텐츠 타입 ID
        comm.setCommCreateTime(detailCommonItem.getCreatedtime()); // 등록일
        comm.setCommModifyTime(detailCommonItem.getModifiedtime()); // 수정일
        comm.setCommImage(detailCommonItem.getFirstimage()); // 공통 이미지
        comm.setMapX(detailCommonItem.getMapx()); // x좌표
        comm.setMapY(detailCommonItem.getMapy()); // y좌표
        comm.setMapLevel(detailCommonItem.getMlevel()); // 축척
        comm.setCommTel(detailCommonItem.getTel()); // 공통 전화번호
        comm.setSigunguCode(detailCommonItem.getSigungucode()); // 시군구 코드
        comm.setHomepage(detailCommonItem.getHomepage()); // 홈페이지주소
        comm.setOverview(detailCommonItem.getOverview()); // 소개설명
    }

    /**
     * PetInfo와 PetTourItem객체를 매핑한다.
     * 
     * @param petTourItem
     * @param petInfo
     */
    private void mappingPetTourItemVo(PetTourItem petTourItem, PetInfo petInfo)
    {
        petInfo.setPetinfoContentid(Integer.parseInt(petTourItem.getPetinfoContentid())); // 콘텐츠아이디
        petInfo.setTourInfo(petTourItem.getTourInfo()); // 반려견관광정보
        petInfo.setAcmpyTypeCd(petTourItem.getAcmpyTypeCd()); // 동반구분
        petInfo.setRelaPosesFclty(petTourItem.getRelaPosesFclty()); // 관련구비시설
        petInfo.setRelaFrnshPrdlst(petTourItem.getRelaFrnshPrdlst()); // 관련비치품목
        petInfo.setRelaPurcPrdlst(petTourItem.getRelaPurcPrdlst()); // 관련구매품목
        petInfo.setRelaRntlPrdlst(petTourItem.getRelaRntlPrdlst()); // 관련렌탈품목
        petInfo.setAcmpyPsblCpam(petTourItem.getAcmpyPsblCpam()); // 동반가능동물
        petInfo.setEtcAcmpyInfo(petTourItem.getEtcAcmpyInfo()); // 기타동반정보
        petInfo.setAcmpyNeedMtr(petTourItem.getAcmpyNeedMtr()); // 동반시필요사항
    }
    
    // 중기예보
    @GetMapping("/weather/midta")
    public ResponseEntity<Map<String, Object>> midTa(String regId, String regGrpId) throws RestClientException, URISyntaxException {
    	
    	Map<String, Object> map = new HashMap<String, Object>();
    	
    	GetMidTaResponse responseText = null;
    	GetMidLandFcstResponse responseText2 = null;
    	
    	responseText = commonWeatherApiClient.apiGetMidTa(regId);
    	responseText2 = commonWeatherApiClient.apiGetMidLandFcst(regGrpId);
    	
    	map.put("regId", responseText);
    	map.put("regGrpId", responseText2);
    	
    	return ResponseEntity.ok(map);
    }
}





