package com.kr.pawpawtrip;

import java.net.URISyntaxException;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestClientException;
import org.springframework.web.servlet.ModelAndView;

import com.kr.pawpawtrip.admin.model.service.AdminService;
import com.kr.pawpawtrip.admin.model.vo.FavorSite;
import com.kr.pawpawtrip.admin.model.vo.WeatherArea;
import com.kr.pawpawtrip.common.api.CommonWeatherApiClient;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

/**
 * Handles requests for the application home page.
 */
@Controller
@Slf4j
@RequiredArgsConstructor
public class HomeController 
{
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	private final AdminService adminService;
	private final CommonWeatherApiClient commonWeatherApiClient;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(Locale locale, ModelAndView modelAndView) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);

        List<FavorSite> sites = adminService.getFavoriteTopThree();
        
        log.info("sites : {}", sites);
        
		modelAndView.addObject("sites", sites );
		modelAndView.addObject("serverTime", formattedDate );
		modelAndView.setViewName("home");
		
		return modelAndView;
	}

	@GetMapping("/template/main")
	public String main() {
		return "template/main" ;
	}
	@GetMapping("/template/about")
	public String about() {
		return "template/about" ;
	}
	@GetMapping("/template/contact")
	public String contact() {
		return "template/contact" ;
	}
	@GetMapping("/template/shop")
	public String shop() {
		return "template/shop" ;
	}
	@GetMapping("/template/shopSingle")
	public String shopSingle() {
		return "template/shopSingle" ;
	}

    @GetMapping("/common/msg")
    public ModelAndView commonMsg(ModelAndView modelAndView, String msg, String location) {
        
        modelAndView.addObject("location", location);
        modelAndView.addObject("msg", msg);
        modelAndView.setViewName("common/msg" );
        return modelAndView;
    }
    @GetMapping("/common/template")
    public String template() {
        return "common/template" ;
    }
	@GetMapping("/common/error")
	public ModelAndView error(ModelAndView modelAndView) {
		modelAndView.setViewName("common/error") ;
		return modelAndView;
	}
	
	@GetMapping("/common/todayWeather")
	public ModelAndView weather(ModelAndView modelAndView) throws RestClientException, URISyntaxException {
		
		//지점번호 : "11B00000" 발표 시각 : yyyyMMddHHmm - 일 2회(06:00,18:00)회 생성
        String response = commonWeatherApiClient.apiGetMidFcst("11B00000","202403150600");
        
        // 중기 기운 지역별 날씨정보 조회
        List<WeatherArea> weatherAreas = null;
        
        weatherAreas = adminService.getWeatherAreaList();
        
        log.info("WeatherAreas - {}", weatherAreas);
        
        log.info("response : {}" ,response);
        
        modelAndView.addObject("weatherAreas", weatherAreas);
        modelAndView.setViewName("common/todayWeather");

        return modelAndView;
		
	}
	
}
