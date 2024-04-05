package com.kr.pawpawtrip.map.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kr.pawpawtrip.common.model.service.CommonService;
import com.kr.pawpawtrip.common.model.vo.CommonArea;
import com.kr.pawpawtrip.map.model.service.MapService;
import com.kr.pawpawtrip.map.model.vo.PositionInfo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequiredArgsConstructor
public class MapController
{
    private final CommonService commonService;
    private final MapService mapService;

    @GetMapping("/map")
    public ModelAndView map(ModelAndView modelAndView)
    {

        List<CommonArea> searchAreaOptions = commonService.getAreaByCode("00");

        log.info("searchAreaOptions : {}", searchAreaOptions);

        modelAndView.addObject("searchAreaOptions", searchAreaOptions);
        modelAndView.setViewName("/map/map");

        return modelAndView;
    }

    @GetMapping("/map/getPosition")
    public ResponseEntity<Map<String, Object>> getPosition(@RequestParam("searchKeyword")     String searchKeyword,
                                                           @RequestParam("searchContentType") String searchContentType
                                                          )
    { 
        System.out.println("searchContentType : " + searchContentType + "\nsearchKeyword : " + searchKeyword);
        
        Map<String, Object> map = new HashMap<String, Object>();

        List<PositionInfo> positions = mapService.getPoisitions(searchContentType, searchKeyword);

        map.put("positions", positions);

        return ResponseEntity.ok(map);
    }
}
