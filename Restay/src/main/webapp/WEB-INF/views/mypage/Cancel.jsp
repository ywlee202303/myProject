<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>

<c:set var="path" value="${ pageContext.request.contextPath }" />

<jsp:include page="/WEB-INF/views/common/header.jsp" />
<link rel="stylesheet" href="${ path }/css/mypage/Cancel.css">

<main>
	<section class="section1">
	    <div class="mypagetitle">
	        <div class="mypage_title"><img class="mypage_title_img" src="${ path }/img/MYPAGE_LOGO.png" /></div>
	        <p class="subtitle">${ loginMember.memberName }님 반가워요!</p>
	    </div>
	</section>
	<section class="sction2">
	    <div class="container_mypage_contents">
	        <nav class="navi">
	            <ul class="menu">
	                <li><a href="${ path }/mypage/reservation">예약정보</a></li>
	                <li class="active"><a>취소 내역</a></li>
	                <li><a href="${ path }/mypage/interest">관심 스테이</a></li>
	                <li><a href="${ path }/mypage/member/check">회원 정보 수정</a></li>
	            </ul>
	        </nav>
	        <div class="mypage_content">
	            <div class="list_screen">
	                <div class="list1">
	                    <div class="reserv_stay_info">
	                        <span class="name">숙소 이름</span>
	                        <br>
	                        <span class="location">제주 / 제주시</span>
	                    </div>
	                    <div class="stay_view">
	                        <div class="stay_img"></div>
	                    </div>
	                    <div class="reserv_info">
	                        <div class="date">2024.05.01 ~ 2024.05.02 (1박)</div>
	                        <div class="option">성인 2명</div>
	                        <div class="canceled">취소 완료</div>
	                    </div>
	                    <br>
	                </div>
	            </div>
	            <div class="paging">
	                <a href="/" class="prev" title="이전 페이지">이전 페이지</a>
	                <a href="/" class="on">1</a>
	                <a href="/" class="next" title="다음 페이지">다음 페이지</a>
	            </div>
	        </div>
	    </div>
	</section>
</main>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />