package com.kr.pawpawtrip.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.kr.pawpawtrip.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

// 컨트롤러에 들어오는 요청과 응답을 가로채는 역할
// 디스패처 서블릿 수행 후 컨트롤러에 요청을 넘기기 전에 실행(servlet-context.xml에 설정)
@Slf4j
public class LoginCheckInterceptor implements HandlerInterceptor
{

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception
    {
        // 반환값이 false면 컨트롤러 실행 x

        log.info("preHandle() 호출");

        Member loginMember = (Member) request.getSession().getAttribute("loginMember");

        if (loginMember == null)
        {
            request.setAttribute("msg", "로그인 후 이용해주세요.");
            request.setAttribute("location", "/login");
            request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
        }
        else
        {
            String servletPath = request.getServletPath();
            if (loginMember.getMemberRole().equals("ROLE_USER") && servletPath.contains("/admin/"))
            {
                request.setAttribute("msg", "접근 권한이 없습니다.");
                request.setAttribute("location", "/");
                request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
            }
        }

        return HandlerInterceptor.super.preHandle(request, response, handler);
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
            ModelAndView modelAndView) throws Exception
    {

        log.info("postHandle() 호출");

        HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
            throws Exception
    {
        // 화면 처리까지 모두 끝나면 실행되는 메소드

        log.info("afterCompletion");

        HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
    }

}
