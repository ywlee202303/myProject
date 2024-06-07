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
	            <div class="only-restay-title">
	            	오직 리스테이에서만
	            </div>
	            <div>
	            	<button class="all-view" onclick="location.href='${ path }/findstay'">전체 보기</button>
	            </div>
        	</div>
            <div class="only-restay-list">
            	<div>
            		<div class="only-restay-img">
	            		<img src="${ path }/img/house/sunhyeonjae/sunhyeonjae1.jpg">
            		</div>
            		<div class="only-restay-content">
            			<p>선현재</p>
            			<p>제주 / 제주시 ₩272,000 ~</p>
            			<p>
            				<a href="${ path }/findstay/room?houseCode=H21">예약하기</a>
            			</p>
            		</div>
            	</div>
            	<div>
            		<div>
	            		<img src="${ path }/img/house/sunnysideup/sunnysideup1.jpg" width="410px" height="250px">
            		</div>
            		<div class="only-restay-content">
            			<p>써니사이드</p>
            			<p>강원 / 양양군 ₩400,000 ~</p>
            			<p>
            				<a href="${ path }/findstay/room?houseCode=H23">예약하기</a>
            			</p>
            		</div>
            	</div>
            	<div>
            		<div>
	            		<img src="${ path }/img/house/aboutflow/aboutflow1.jpg" width="410px" height="250px">
            		</div>
            		<div class="only-restay-content">
            			<p>어바웃플로우</p>
            			<p>강원 / 춘천시 ₩300,000 ~</p>
            			<p>
            				<a href="${ path }/findstay/room?houseCode=H22">예약하기</a>
            			</p>
            		</div>
            	</div>
            </div>
        </div>
        <div class="overseas-restay-wrap">
        	<div class="overseas-restay">
            	<div class="overseas-restay-title">
            		해외 여행도 리스테이에서
            	</div>
            	<div>
            		<button class="all-view" onclick="location.href='${ path }/findstay'">전체 보기</button>
            	</div>
        	</div>
            <div class="overseas-restay-list">
            	<div>
            		<div class="overseas-restay-img">
	            		<img src="${ path }/img/Shinjuku.jpg">
            		</div>
            		<div class="overseas-restay-content">
            			<p>온센 료칸 유엔 신주쿠</p>
            			<p>칸토 / 도쿄 ₩101,280 ~</p>
            			<p>
            				<a href="#">예약하기</a>
            			</p>
            		</div>
            	</div>
            	<div>
            		<div class="overseas-restay-img">
	            		<img src="${ path }/img/house/kai-poroto/kai-poroto.jpg">
            		</div>
            		<div class="overseas-restay-content">
            			<p>카이 포로토</p>
            			<p>홋카이도 / 홋카이도 ₩649,505 ~</p>
            			<p>
            				<a href="#">예약하기</a>
            			</p>
            		</div>
            	</div>
            	<div>
            		<div class="overseas-restay-img">
	            		<img src="${ path }/img/house/amanoi/amanoi.png">
            		</div>
            		<div class="overseas-restay-content">
            			<p>아만노이</p>
            			<p>베트남 / 닌투언 ₩1,248,747 ~</p>
            			<p>
            				<a href="#">예약하기</a>
            			</p>
            		</div>
            	</div>
            </div>
        </div>
        <div class="travel-restay-wrap">
        	<div class="travel-restay">
            	<div class="travel-restay-title">
            		TRAVEL
            	</div>
            	<div>
            		<button class="all-view" onclick="location.href='${ path }/travel'">전체 보기</button>
            	</div>
        	</div>
            <div class="travel-restay-list">
            	<div>
            		<div class="travel-restay-img">
	            		<img src="${ path }/img/Gangneung.jpeg">
            		</div>
            		<div class="travel-restay-content">
            			<p>호지 > 강원 / 강릉시</p>
            			<p>자전거 타고 여행하는 스테이 6곳</p>
            			<p>자전거를 준비해 둔 스테이에는 낭만이 있습니다. 친숙한 모습의 골목 모퉁이에서도 작은 모험이 시작된다는 것을 알고 있거든요.</p>
            			<p>by. 리스테이</p>
            		</div>
            	</div>
            	<div>
            		<div class="travel-restay-img">
	            		<img src="${ path }/img/travel/deunhae/deunhae.webp">
            		</div>
            		<div class="travel-restay-content">
            			<p>든해 > 제주 / 제주시</p>
            			<p>곳곳에 드리우는 빛</p>
            			<p>평온한 마음으로 누운 침대마저 허리를 편안히 받쳐주어, 뒤척임 없는 밤을 보냈던 기억까지. 똑같은 길을 따라 '스테이 든해'를 꼭 다시 찾아가고 싶다.</p>
            			<p>by. 리스테이</p>
            		</div>
            	</div>
            	<div>
            		<div class="travel-restay-img">
	            		<img src="${ path }/img/travel/thankyou/thankyou.webp">
            		</div>
            		<div class="travel-restay-content">
            			<p>땡큐드라이버 스테이 > 제주 / 제주시</p>
            			<p>원하는 만큼의 쉼</p>
            			<p>단번에 '미국식 목조주택'을 떠올렸다. 미국에 살아본 적은 없어도, 종종 봐 오던 한적한 외곽지 배경의 전원주택을 그대로 옮겨다 놓은 듯한 느낌이었던 것이다.</p>
            			<p>by. 리스테이</p>
            		</div>
            	</div>
            </div>
        </div>
    </div>
</main>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-element-bundle.min.js"></script>