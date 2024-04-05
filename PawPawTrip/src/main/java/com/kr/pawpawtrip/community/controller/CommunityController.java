package com.kr.pawpawtrip.community.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URISyntaxException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.client.RestClientException;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kr.pawpawtrip.common.util.MultipartFileUtil;
import com.kr.pawpawtrip.common.util.PageInfo;
import com.kr.pawpawtrip.community.model.service.CommunityService;
import com.kr.pawpawtrip.community.model.vo.Community;
import com.kr.pawpawtrip.member.model.vo.Member;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/community")
@RequiredArgsConstructor
public class CommunityController
{
    private final CommunityService communityService;
    private final ResourceLoader resourceLoader;

    //공지사항
    @GetMapping("/notice")
    public ModelAndView notice(ModelAndView modelAndView,
            @RequestParam(defaultValue = "1") int page,
            @RequestParam(defaultValue = "title") String select, 
            @RequestParam(defaultValue = "") String search)
    {
        // 전체 리스트 조회(검색기능 포함)
        List<Community> noticeList = null;

        // 페이징 처리
        PageInfo pageInfo = null;
        // 전체 리스트 수
        int listCount = 0;
        // 검색 파라미터 request scope에 저장하기 위한 HashMap
        Map<String, String> map = new HashMap<String, String>();

        map.put("select", select);
        map.put("search", search);

        listCount = communityService.getNoticeCount(select, search);
        pageInfo = new PageInfo(page, 5, listCount, 15);

        // 공지사항 리스트 조회
        noticeList = communityService.getNoticeList(pageInfo, select, search);
        
//        log.info("Notice List - {}", noticeList);

        modelAndView.addObject("searchInfoMap", map);
        modelAndView.addObject("pageInfo", pageInfo);
        modelAndView.addObject("noticeList", noticeList);
        modelAndView.setViewName("community/notice");

        return modelAndView;
    }



    //자유 게시판
    @GetMapping("/board")
    public ModelAndView board(ModelAndView modelAndView, 
            @RequestParam(defaultValue = "1") int page,
            @RequestParam(defaultValue = "") String select, 
            @RequestParam(defaultValue = "") String search) throws RestClientException, URISyntaxException
    {
    	
        // 전체 리스트 조회(검색기능 포함)
        List<Community> boardList = null;
        // 페이징 처리
        PageInfo pageInfo = null;
        // 전체 리스트 수
        int listCount = 0;
        // 검색 파라미터 request scope에 저장하기 위한 HashMap
        Map<String, String> map = new HashMap<String, String>();

        map.put("select", select);
        map.put("search", search);

        listCount = communityService.getBoardCount(select, search);
        pageInfo = new PageInfo(page, 5, listCount, 15);

        // 자유게시판 리스트 조회(수다, 마이펫 자랑 포함)
        boardList = communityService.getBoardList(pageInfo, select, search);

        log.info("Board List - {}", boardList);

        modelAndView.addObject("searchInfoMap", map);
        modelAndView.addObject("pageInfo", pageInfo);
        modelAndView.addObject("boardList", boardList);
        modelAndView.setViewName("community/board");

        return modelAndView;
    }

    //자유 게시판 > 수다
    @GetMapping("/board/talk")
    public ModelAndView talk(ModelAndView modelAndView, 
            @RequestParam(defaultValue = "1") int page,
            @RequestParam(defaultValue = "") String select,
            @RequestParam(defaultValue = "") String search)
    {
        // 수다 리스트 조회(검색기능 포함)
        List<Community> boardTalkList = null;
        // 페이징 처리
        PageInfo pageInfo = null;
        // 전체 리스트 수
        int listCount = 0;
        // 검색 파라미터 request scope에 저장하기 위한 HashMap
        Map<String, String> map = new HashMap<String, String>();

        map.put("select", select);
        map.put("search", search);

        listCount = communityService.getBoardTalkCount(select, search);
        pageInfo = new PageInfo(page, 5, listCount, 15);

        // 수다 리스트 조회
        boardTalkList = communityService.getBoardTalkList(pageInfo, select, search);

        log.info("Board TalkList - {}", boardTalkList);

        modelAndView.addObject("searchInfoMap", map);
        modelAndView.addObject("pageInfo", pageInfo);
        modelAndView.addObject("boardTalkList", boardTalkList);
        modelAndView.setViewName("community/board/talk");

        return modelAndView;
    }

    //자유 게시판 > 마이펫 자랑
    @GetMapping("/board/mypet")
    public ModelAndView mypet(ModelAndView modelAndView, 
            @RequestParam(defaultValue = "1") int page,
            @RequestParam(defaultValue = "") String select, 
            @RequestParam(defaultValue = "") String search)
    {

        // 마이펫 리스트 조회(검색기능 포함)
        List<Community> boardMypetList = null;
        // 페이징 처리
        PageInfo pageInfo = null;
        // 전체 리스트 수
        int listCount = 0;
        // 검색 파라미터 request scope에 저장하기 위한 HashMap
        Map<String, String> map = new HashMap<String, String>();

        map.put("select", select);
        map.put("search", search);

        listCount = communityService.getBoardMypetCount(select, search);
        pageInfo = new PageInfo(page, 5, listCount, 15);

        // 마이펫 리스트 조회
        boardMypetList = communityService.getBoardMypetList(pageInfo, select, search);

        log.info("Board MypetList - {}", boardMypetList);

        modelAndView.addObject("searchInfoMap", map);
        modelAndView.addObject("pageInfo", pageInfo);
        modelAndView.addObject("boardMypetList", boardMypetList);
        modelAndView.setViewName("community/board/mypet");

        return modelAndView;
    }
    
    // 공지사항 상세
    @GetMapping("/noticedetail")
    public ModelAndView noticeDetail(ModelAndView modelAndView, @RequestParam int no, HttpSession session, HttpServletRequest request, HttpServletResponse response)
    {
        Community community = null;
        Member loginMember = (Member) session.getAttribute("loginMember");
    	String ipAddr = request.getRemoteAddr();
    	String communityNo = "";
    	String cNo = "";
    	Cookie[] cookies = request.getCookies();;
    	Cookie cookie = null;
    	boolean cookieCheck = false;

    	System.out.println("가져온 ip 주소 : " + ipAddr);
    	
    	// 조회수 카운트 되기 전
        community = communityService.getBoardNo(no);
        
        // 게시글 번호를 cookie에 저장하기 위해 int -> String 변경
    	communityNo = String.valueOf(community.getCommunityNo());
    	
    	cNo = "community_no" + communityNo;
    	
    	System.out.println(cNo);

    	// cookie 정보에 동일한 게시글 번호 && ip 주소 중복 체크
    	for (Cookie c : cookies) {
			if(cNo.equals(c.getName()) && ipAddr.equals(c.getValue())) {
				cookieCheck = true;
			}
    		
		}
    	
    	// 중복되지 않으면 cookie에 값을 저장 후 조회수 카운트
    	if(!cookieCheck) {
    		// name : 게시글 번호, value : 접속 IP cookie에 저장
        	cookie = new Cookie("community_no" + communityNo, ipAddr);
        	
        	cookie.setMaxAge(3600);
        	
        	int viewsCount =  community.getCommunityCount();
        	
        	if(loginMember == null || loginMember.getMemberRole().equals("ROLE_USER")) {
            	viewsCount ++;
            	
            	communityService.updateCommunityCount(no, viewsCount);
            }
        	
        	response.addCookie(cookie);
    	}
        
        // 조회수 업데이트
        System.out.println("로그인 멤버 : " + loginMember);
        System.out.println("로그인 멤버 : " + (loginMember == null));
        
        // 조회수 카운트 되고 난 후
        community = communityService.getBoardNo(no);

        log.info("Notice Detail - {}", community);

        modelAndView.addObject("community", community);
        modelAndView.setViewName("community/noticedetail");

        return modelAndView;
    }
    
//    자유 게시판(수다) 상세
    @GetMapping("/board/talkdetail")
    public ModelAndView talkDetail(ModelAndView modelAndView, @RequestParam int no, HttpSession session, HttpServletRequest request, HttpServletResponse response)
    {
    	
    	Community community = null;
    	Member loginMember = (Member) session.getAttribute("loginMember");
    	String ipAddr = request.getRemoteAddr();
    	String communityNo = "";
    	String cNo = "";
    	Cookie[] cookies = request.getCookies();;
    	Cookie cookie = null;
    	boolean cookieCheck = false;
    	
    	System.out.println("가져온 ip 주소 : " + ipAddr);
    	
    	// 조회수 카운트 되기 전
    	community = communityService.getBoardNo(no);
    	
    	// 게시글 번호를 cookie에 저장하기 위해 int -> String 변경
    	communityNo = String.valueOf(community.getCommunityNo());
    	
    	cNo = "community_no" + communityNo;
    	
    	System.out.println(cNo);

    	// cookie 정보에 동일한 게시글 번호 && ip 주소 중복 체크
    	for (Cookie c : cookies) {
			if(cNo.equals(c.getName()) && ipAddr.equals(c.getValue())) {
				cookieCheck = true;
			}
    		
		}
    	
    	// 중복되지 않으면 cookie에 값을 저장 후 조회수 카운트
    	if(!cookieCheck) {
    		// name : 게시글 번호, value : 접속 IP cookie에 저장
        	cookie = new Cookie("community_no" + communityNo, ipAddr);
        	
        	cookie.setMaxAge(3600);
        	
        	int viewsCount =  community.getCommunityCount();
        	
        	if(loginMember == null || loginMember.getMemberRole().equals("ROLE_USER")) {
            	viewsCount ++;
            	
            	communityService.updateCommunityCount(no, viewsCount);
            }
        	
        	response.addCookie(cookie);
    	}
        
        // 조회수 업데이트
        System.out.println("로그인 멤버 : " + loginMember);
        System.out.println("로그인 멤버 : " + (loginMember == null));
        
        // 조회수 카운트 되고 난 후
        community = communityService.getBoardNo(no);
        
        log.info("Board TalkDetail - {}", community);

        modelAndView.addObject("community", community);
        modelAndView.setViewName("community/board/talkdetail");

        return modelAndView;
    }

//    자유 게시판(마이펫 자랑) 상세
    @GetMapping("/board/mypetdetail")
    public ModelAndView mypetDetail(ModelAndView modelAndView, @RequestParam int no, HttpSession session, HttpServletRequest request, HttpServletResponse response)
    {

        Community community = null;
        Member loginMember = (Member) session.getAttribute("loginMember");
    	String ipAddr = request.getRemoteAddr();
    	String communityNo = "";
    	String cNo = "";
    	Cookie[] cookies = request.getCookies();;
    	Cookie cookie = null;
    	boolean cookieCheck = false;

        // 조회수 카운트 되기 전
        community = communityService.getBoardNo(no);
        
        // 게시글 번호를 cookie에 저장하기 위해 int -> String 변경
    	communityNo = String.valueOf(community.getCommunityNo());
    	
    	cNo = "community_no" + communityNo;
    	
    	System.out.println(cNo);

    	// cookie 정보에 동일한 게시글 번호 && ip 주소 중복 체크
    	for (Cookie c : cookies) {
			if(cNo.equals(c.getName()) && ipAddr.equals(c.getValue())) {
				cookieCheck = true;
			}
    		
		}
    	
    	// 중복되지 않으면 cookie에 값을 저장 후 조회수 카운트
    	if(!cookieCheck) {
    		// name : 게시글 번호, value : 접속 IP cookie에 저장
        	cookie = new Cookie("community_no" + communityNo, ipAddr);
        	
        	cookie.setMaxAge(3600);
        	
        	int viewsCount =  community.getCommunityCount();
        	
        	if(loginMember == null || loginMember.getMemberRole().equals("ROLE_USER")) {
            	viewsCount ++;
            	
            	communityService.updateCommunityCount(no, viewsCount);
            }
        	
        	response.addCookie(cookie);
    	}
        
        
        // 조회수 업데이트
        System.out.println("로그인 멤버 : " + loginMember);
        System.out.println("로그인 멤버 : " + (loginMember == null));
        
        // 조회수 카운트 되고 난 후
        community = communityService.getBoardNo(no);

        log.info("Board MypetDetail - {}", community);

        modelAndView.addObject("community", community);
        modelAndView.setViewName("community/board/mypetdetail");

        return modelAndView;
    }

//    게시글 작성
    @GetMapping("/board/write")
    public String boardWrite()
    {
    	
        return "community/board/write";
    }

    @PostMapping("/board/write")
    public ModelAndView boardWrite(         ModelAndView  modelAndView, 
                                            Community     community, 
            @SessionAttribute("loginMember")Member        loginMember,
            @RequestParam("talkWriteFile")  MultipartFile talkWriteFile)
    {

        int result = 0;

        // 1. 파일 업로드 확인 후 파일 저장
        // 파일을 업로드하지 않으면 로그에 true, 업로드하면 false
        log.info("isEmpty: {}", talkWriteFile.isEmpty());

        // 파일을 업로드하지 않으면 ""(빈문자), 업로드하면 "파일명"
        log.info("File Name : {}", talkWriteFile.getOriginalFilename());

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

            }
            catch (IOException e)
            {
                e.printStackTrace();
            }

        }

        // 2. 작성한 게시글 데이터베이스 저장
        // 누가 작성했는지..(일단 임의로 저장)
        community.setCommunityWriterNo(loginMember.getMemberNo());

//        System.out.println("커뮤니티 : " + community);

        result = communityService.save(community);

        if (result > 0)
        {
            modelAndView.addObject("msg", "게시글이 정상적으로 등록되었습니다.");

            if (community.getCommunityCategory().equals("[수다]"))
            {
                modelAndView.addObject("location", "/community/board/talkdetail?no=" + community.getCommunityNo());
            }

            if (community.getCommunityCategory().equals("[마이펫 자랑]"))
            {
                modelAndView.addObject("location", "/community/board/mypetdetail?no=" + community.getCommunityNo());
            }

        }
        modelAndView.setViewName("common/msg");

        return modelAndView;
    }

//    게시글 수정
    @GetMapping("/board/update")
    public ModelAndView boardUpdate(ModelAndView modelAndView, @RequestParam int no,
            @SessionAttribute Member loginMember)
    {

        Community community = null;

        community = communityService.getBoardNo(no);

        log.info("Board Update - {}", community);
        
//        modelAndView.addObject("community", community);
//        modelAndView.setViewName("community/board/update");

        if (community != null && community.getCommunityWriterId().equals(loginMember.getMemberId()))
        {
            modelAndView.addObject("community", community);
            modelAndView.setViewName("community/board/update");
        } else
        {
            modelAndView.addObject("msg", "잘못 된 접근입니다.");
            modelAndView.addObject("location", "/community/board");
            modelAndView.setViewName("common/msg");
        }

        return modelAndView;
    }

    @PostMapping("/board/update")
    public ModelAndView boardUpdate(ModelAndView  modelAndView,
//            Community community,
                  @RequestParam     int           communityNo, 
                  @RequestParam     String        communityCategory, 
                  @RequestParam     String        communityTitle,
                  @RequestParam     String        communityContent, 
//                  @RequestParam     String        fileName,
                  @RequestParam     MultipartFile talkWriteFile,
                  @SessionAttribute Member        loginMember)
    {

        int result = 0;
        String location = null;
        String renamedFileName = null;
        Community community = null;
        
        System.out.println("MultipartFile : " + talkWriteFile);
        System.out.println("업로드한 파일 명 : " + talkWriteFile.getOriginalFilename());

        community = communityService.getBoardNo(communityNo);
        
        if(talkWriteFile != null && !talkWriteFile.isEmpty()) // 파일 업로드 했을 때
        {
        	
        	try {
				location = resourceLoader.getResource("resources/upload/community")
						                 .getFile()
						                 .getPath();
				
				// 기존에 업로드 된 파일 삭제
				if(community.getCommunityRfileName() != null) {
					MultipartFileUtil.delete(location + "/" + community.getCommunityRfileName());
				}
				
				renamedFileName = MultipartFileUtil.save(talkWriteFile, location);
				
				if(renamedFileName != null) {
					community.setCommunityOfileName(talkWriteFile.getOriginalFilename());
					community.setCommunityRfileName(renamedFileName);
				}
				
			} catch (IOException e) {
				e.printStackTrace();
			}
        }
        
        community.setCommunityCategory(communityCategory);
        community.setCommunityTitle(communityTitle);
        community.setCommunityContent(communityContent);
        
        result = communityService.save(community);
        
        if(result > 0) {
        	modelAndView.addObject("msg", "게시글 수정 성공");
		
        	if (community.getCommunityCategory().equals("[수다]"))
        	{
        		modelAndView.addObject("location", "/community/board/talkdetail?no=" + community.getCommunityNo());
        	}
		
        	if (community.getCommunityCategory().equals("[마이펫 자랑]"))
        	{
        		modelAndView.addObject("location", "/community/board/mypetdetail?no=" + community.getCommunityNo());
        	}
        } else {
        	modelAndView.addObject("msg", "게시글 수정 실패");
        	modelAndView.addObject("location", "/community/board");
        }
        
        log.info("Board Update(게시글 수정 성공) - {}", community);
        
        modelAndView.setViewName("common/msg");
        
        return modelAndView;
        
    }
    
//  파일 삭제
    @PostMapping("/deletefile")
    public ResponseEntity<Map<String, Object>> deleteFile(@RequestParam("cNo") int cNo) {
    	
    	Community community = null;
    	int result = 0;
    	String location = null;
    	Map<String, Object> map = new HashMap<String, Object>();
    	
    	// 파일 삭제 되기 전
    	community = communityService.getBoardNo(cNo);
    	
    	// workspace에 저장되어 있는 파일 경로
    	try {
			location = resourceLoader.getResource("resources/upload/community").getFile().getPath()
					+ "\\" + community.getCommunityRfileName();
			
			File file = new File(location);
			
			// workspace에 저장되어 있는 파일 삭제
			if(file.exists()) {
				file.delete();
			}
			
			System.out.println("경로 : " + location);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
    	
    	// 파일 null 처리
    	result = communityService.updateFileName(cNo);
    	
    	// 게시글 조회
    	community = communityService.getBoardNo(cNo);
    	
    	map.put("resultCode", result);
    	
    	log.info("Community FileDelete - {}", community);
    	
    	return ResponseEntity.ok(map);
    }

//    게시글 삭제
    @GetMapping("/board/delete")
    public ModelAndView delete(        ModelAndView modelAndView, 
                     @RequestParam     int          no, 
                     @SessionAttribute Member       loginMember)
    {

        int result = 0;
        Community community = null;

        community = communityService.getBoardNo(no);

        if(community != null && community.getCommunityWriterId().equals(loginMember.getMemberId())) {
        	
        	result = communityService.delete(no);
        
        	if (result > 0)
        	{
        		modelAndView.addObject("msg", "게시글이 정상적으로 삭제되었습니다.");
        		
        		if (community.getCommunityCategory().equals("[수다]"))
        		{
        			modelAndView.addObject("location", "/community/board/talk");
        		}
        		
        		if (community.getCommunityCategory().equals("[마이펫 자랑]"))
        		{
        			modelAndView.addObject("location", "/community/board/mypet");
        		}
        	} else
        	{
        		modelAndView.addObject("msg", "게시글이 정상적으로 삭제되지 않았습니다.");
        		
        		if (community.getCommunityCategory().equals("[수다]"))
        		{
        			modelAndView.addObject("location", "/community/board/talkdetail?no=" + community.getCommunityNo());
        		}
        		
        		if (community.getCommunityCategory().equals("[마이펫 자랑]"))
        		{
        			modelAndView.addObject("location", "/community/board/mypetdetail?no=" + community.getCommunityNo());
        		}
        	}
        } else {
        	modelAndView.addObject("msg", "잘못 된 접근입니다.");
        	modelAndView.addObject("location", "/community/board");
        }


        modelAndView.setViewName("common/msg");

        return modelAndView;
    }

    // 파일 다운로드
    @GetMapping("/board/fileDown")
    public ResponseEntity<Resource> fileDown(@RequestParam("oname")       String oname, 
                                             @RequestParam("rname")       String rname,
                                             @RequestHeader("user-agent") String userAgent)
    {
        // userAgent: 브라우저별 인코딩 처리하기 위한 매개변수

        Resource resource = null;
        String downName = null;

        System.out.println("oname : " + oname);
        System.out.println("rname : " + rname);

        try
        {
            // 1. 클라이언트로 전송할 파일을 가져온다.
            resource = resourceLoader.getResource("resources/upload/community/" + rname);

            // 2. 브라우저별 인코딩
            boolean isMISE = userAgent.indexOf("MSIE") != -1 || userAgent.indexOf("Trident") != -1;

            if (isMISE)
            {
                downName = URLEncoder.encode(oname, "UTF-8").replaceAll("\\+", "%20");
            } else
            {
                downName = new String(oname.getBytes("UTF-8"), "ISO-8859-1");
            }

            // 3. 응답 메세지 작성 & 클라이언트로 출력(전송)
            return ResponseEntity.ok().header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_OCTET_STREAM_VALUE)
                    .header(HttpHeaders.CONTENT_DISPOSITION, "attachment;filename=" + downName).body(resource);
        } catch (UnsupportedEncodingException e)
        {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build(); // 에러가 발생하면 500에러(내부 서버 에러) 응답
        }
    }

}