<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp" />

<link rel="stylesheet" href="${ path }/css/findstay/FindStay.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />

<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

<style>
    .swiper {
        display: block;
        width: 350px;
        height: 230px;
        position: absolute;
        width: 350px; 
        height: 230px;
        right: 0;
        top: 54px; 
        border: 0;
        padding-top: 0;
        clear: both;
        
    }

    .swiper-slide {
        display: flex;
        text-align: center;
        font-size: 18px;
        background: #fff;
        justify-content: center;
        align-items: center;
    }

    .swiper-slide img {
        display: block;
        width: 100%;
        height: 100%;
        object-fit: cover;
    }

    .swiper {
        margin-left: auto;
        margin-right: auto;
    }

    .swiper-button-next {
        color: #fff;
    }

    :root {
        --swiper-theme-color: #fff;
    }
 </style>
 
     <main>
        <!-- 1. 페이지 상단 -->
        <section class="section1">
            <div class="subTitle_img"></div>
            <div class="select_frame">
                <!-- 일정 BOX 클릭시, 날짜 선택  -->
                <div onclick="" class="select_box" id="date">
                    <img src="https://i.ibb.co/F0hjg8H/icon-place.png" alt="icon_place">일정
                </div>
                <!-- 장소 BOX 클릭시, 장소 선택 -->
                <div onclick="" class="select_box" id="place">
                    <img src="https://i.ibb.co/ss25z0k/icon-date.png" alt="icon_date">장소
                </div>
            </div>
            <hr class="line">
        </section>


        <!-- 2. 페이지 중앙 -->
        <section class="container_findstay_bottom">
            <div class="flist_wrap">
            
            	<c:forEach var="stay" items="${ list }">
            	
	               	<div class="flist_box" id="${ stay.stayCode }">
	                    <div class="flist_box_contents">
	                        <!-- 해당 숙소로 이동 -->
	                        <a href="${ path }/findstay/detail?stay=${stay.rowNum}">    
	                            <!-- 숙소이름, 정보 -->
	                            <div class="stay_Info_wrapper">
	                                <!-- 숙소명 -->
	                                <div class="stayName" id="stay1_name">${ stay.stayName }</div>
	                                <!-- 숙소 정보 -->
	                                <div class="stay_info">
	                                    <p class="address_info">
	                                        <span>경상 / 남해군</span> <br>
	                                        기준 2명 (최대 4명) <br> 
	                                        <del>₩ 320,000</del> <!-- 할인 전 금액 -->
	                                        <span style="font-weight: bold; font-size: 16px">
	                                        ₩ ${ stay.stayPrice }</span> <!-- 할인 후 금액 -->
	                                    </p>
	                                    <p class="btn_more">예약하기</p> <!-- 버튼이지만 기능X-->
	                                </div>
	                            </div>
	                            <!-- 숙소 이미지 -->
	                            <div class="swiper flist_slider">
	                                <div class="swiper-wrapper flist_slider_wrap">
	                                    <div class="swiper-slide">
	                                        <img src="${ stay.findImg1 }" alt="슬라이드 이미지1"></div>
	                                    <div class="swiper-slide">
	                                        <img src="${ stay.findImg2 }" alt="슬라이드 이미지2"></div>
	                                    <div class="swiper-slide">
	                                        <img src="${ stay.findImg3 }" alt="슬라이드 이미지3"></div>
	                                </div>
	                                <div class="swiper-button-next"></div>
	                                <div class="swiper-button-prev"></div>
	                                <div class="swiper-pagination"></div>
	                            </div>
	                        </a>
	                    </div>
	                </div>
	                
				</c:forEach>


            </div>
        </section>


        <!-- 3. 페이지 넘버 -->
        <section class="container_pageNum">
            <ul class="pageNum_box">
            
            	<!-- 이전 페이지 -->
                <li id="pageNum_before"><a href="${ path }/findstay?page=${ pageInfo.prevPage }"><</a></li>
                
                <!-- 5개 페이지 목록 -->
                <c:forEach var="current" begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }">
                	<c:choose>
                		<c:when test="${ current == pageInfo.currentPage }">
                			<li><a style="color: forestgreen;">${ current }</a></li>                			
                		</c:when>
                		<c:otherwise>
                			<li><a href="${ path }/findstay?page=${ current }">${ current }</a></li>
                		</c:otherwise>
                	</c:choose>
                </c:forEach>
                
                <!-- 다음 페이지 -->
                <li id="pageNum_next"><a href="${path}/findstay?page=${ pageInfo.nextPage }">></a></li>
            </ul>
        </section>
    </main>


    <script>
        var swiper = new Swiper(".flist_slider", {
            slidesPerView: 1,
            spaceBetween: 30,
            loop: true,
            pagination: {
            el: ".swiper-pagination",
            clickable: true,
            },
            navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
            },
            
        });
    </script>
 
 <jsp:include page="/WEB-INF/views/common/footer.jsp" />