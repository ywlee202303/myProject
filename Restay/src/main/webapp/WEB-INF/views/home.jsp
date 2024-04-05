<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp" />
<link rel="stylesheet" href="${ path }/css/main/home.css">

<!-- Swiper -->
<style>
	html,
	body {
		position: relative;
        height: 100%;
    }
    
    body {
        background: #fff;
        font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
        font-size: 14px;
        color: #000;
        margin: 0;
        padding: 0;
    }
    
    swiper-container {
        width: 1440px;
        height: 600px;
    }
    
    swiper-slide {
        text-align: center;
        font-size: 18px;
        background: #fff;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    
    swiper-slide img {
        display: block;
        width: 100%;
        height: 100%;
        object-fit: cover;
    }
</style>

<main>
    <swiper-container class="mySwiper" pagination="true" pagination-clickable="true" navigation="true" space-between="30" centered-slides="true" autoplay-delay="2500" autoplay-disable-on-interaction="false">
        <swiper-slide>
            <img src="${ path }/img/Main_image.png" width="1440px" height="600px" />
        </swiper-slide>
        <swiper-slide>
            <img src="${ path }/img/Mainimg5.png" width="1440px" height="600px" />
        </swiper-slide>
        <swiper-slide>
            <img src="${ path }/img/Mainimg6.png" width="1440px" height="600px" />
        </swiper-slide>
        <swiper-slide>
            <img src="${ path }/img/Mainimg7.png" width="1440px" height="600px" />
        </swiper-slide>
    </swiper-container>

    <div>
        <div class="only-restay-wrap">
        	<div class="only-restay">
	            <div class="comm-title">
	            	오직 리스테이에서만
	            </div>
	            <div>
	            	<button class="all-view">전체 보기</button>
	            </div>
        	</div>
            <div class="only-restay-list">
            	<div>
            		<div class="only-restay-img">
	            		<img src="${ path }/img/sunhyeonjae2.jpg">
            		</div>
            		<div class="only-restay-content">
            			<p>선현재</p>
            			<p>제주 / 제주시 ￦272,000 ~</p>
            			<p>
            				<a href="#">예약하기</a>
            			</p>
            		</div>
            	</div>
            	<div>
            		<div>
	            		<img src="${ path }/img/sunhyeonjae2.jpg" width="410px" height="250px">
            		</div>
            		<div class="only-restay-content">
            			<p>선현재</p>
            			<p>제주 / 제주시 ￦272,000 ~</p>
            			<p>
            				<a href="#">예약하기</a>
            			</p>
            		</div>
            	</div>
            	<div>
            		<div>
	            		<img src="${ path }/img/sunhyeonjae2.jpg" width="410px" height="250px">
            		</div>
            		<div class="only-restay-content">
            			<p>선현재</p>
            			<p>제주 / 제주시 ￦272,000 ~</p>
            			<p>
            				<a href="#">예약하기</a>
            			</p>
            		</div>
            	</div>
            </div>
        </div>
    </div>
</main>

<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-element-bundle.min.js"></script>