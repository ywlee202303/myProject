<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp" />
<link rel="stylesheet" href="${ path }/css/main/home.css">

<!-- Link Swiper's CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />

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
        /* z-index: -1; */
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

<main class="main">
	
	<swiper-container class="mySwiper" pagination="true" pagination-clickable="true" navigation="true" space-between="30"
    loop="true">
            <swiper-slide>
                <img src="${ path }/img/Main_image.png" />
                <div class="main-img-card-1">
                    <p>마음을 돌보는 새해 여행</p>
                    <p>새해에 떠나기 좋은 테마 스테이</p>
                    <p>최대 30% 할인</p>
                    <p>read more</p>
                    <hr class="line-1">
                </div>
            </swiper-slide>
            <swiper-slide>
                <img src="${ path }/img/Mainimg5.png" />
                <div class="main-img-card-2">
                    <p>SPECIAL OFFER</p>
                    <p>1 - 2월 투숙 시</p>
                    <p>최대 30% 할인</p>
                    <p>read more</p>
                    <hr class="line-1">
                </div>
            </swiper-slide>
            <swiper-slide>
                <img src="${ path }/img/Mainimg6.png" />
                <div class="main-img-card-3">
                    <p>따스히 느껴지는</p>
                    <p>진심의 누적</p>
                    <p>MAGAGINE</p>
                    <p>read more</p>
                    <hr class="line-1">
                </div>
            </swiper-slide>
            <swiper-slide>
                <img src="${ path }/img/Mainimg7.png" />
                <div class="main-img-card-4">
                    <p>오직 나다운 답이</p>
                    <p>쌓여있는 곳</p>
                    <p>LAUNCHING</p>
                    <p>read more</p>
                    <hr class="line-1">
                </div>
            </swiper-slide>
        </swiper-container>
	
        
        <div class="promotion">
            <div class="pm-banner"></div>
            <div class="pm-list">
                <div class="pm-card-1">
                    <div class="pm-img-1"></div>
                    <div class="pm-content-1">
                        <p>선현재</p>
                        <p>12월 - 2월 투숙시</p>
                        <p>20% 할인</p>
                    </div>
                    <div class="pm-line-1"></div>
                    <div class="pm-rsv-1">
                        <p>예약하기</p>
                    </div>
                </div>
                <div class="pm-card-2">
                    <div class="pm-img-2"></div>
                    <div class="pm-content-2">
                        <p>까사벽락재</p>
                        <p>12월 - 1월 투숙시</p>
                        <p>10% 할인</p>
                    </div>
                    <div class="pm-line-2"></div>
                    <div class="pm-rsv-2">
                        <p>예약하기</p>
                    </div>
                </div>
                <div class="pm-card-3">
                    <div class="pm-img-3"></div>
                    <div class="pm-content-3">
                        <p>산내원림</p>
                        <p>12월 - 1월 투숙시</p>
                        <p>20% 할인</p>
                    </div>
                    <div class="pm-line-3"></div>
                    <div class="pm-rsv-3">
                        <p>예약하기</p>
                    </div>
                </div>
            </div>
        </div>

        <div class="main-line-1"></div>

        <div class="ocean">
            <div class="oc-banner"></div>
            <div class="oc-list">
                <div class="oc-card-1">
                    <div class="oc-img-1"></div>
                    <div class="oc-content-1">
                        <p>강원 / 강릉시</p>
                        <p>기준 2명 (최대 2명)</p>
                        <p>￦180,000 ~</p>
                    </div>
                    <div class="oc-line-1"></div>
                    <div class="oc-rsv-1">
                        <p>예약하기</p>
                    </div>
                </div>
                <div class="oc-card-2">
                    <div class="oc-img-2"></div>
                    <div class="oc-content-2">
                        <p>제주 / 제주시</p>
                        <p>기준 2명 (최대 4명)</p>
                        <p><s>￦650,000</s>  ￦550,000 ~</p>
                    </div>
                    <div class="oc-line-2"></div>
                    <div class="oc-rsv-2">
                        <p>예약하기</p>
                    </div>
                </div>
                <div class="oc-card-3">
                    <div class="oc-img-3"></div>
                    <div class="oc-content-3">
                        <p>제주 / 서귀포시</p>
                        <p>기준 2명 (최대 2명)</p>
                        <p>￦190,000 ~</p>
                    </div>
                    <div class="oc-line-3"></div>
                    <div class="oc-rsv-3">
                        <p>예약하기</p>
                    </div>
                </div>
            </div>
        </div>

        <div class="main-line-2"></div>

        <div class="hanoak">
            <div class="ho-banner"></div>
            <div class="ho-list">
                <div class="ho-card-1">
                    <div class="ho-img-1"></div>
                    <div class="ho-content-1">
                        <p>제주 / 제주시</p>
                        <p>기준 2명 (최대 4명)</p>
                        <p><s>￦550,000</s> ￦495,000 ~</p>
                    </div>
                    <div class="ho-line-1"></div>
                    <div class="ho-rsv-1">
                        <p>예약하기</p>
                    </div>
                </div>
                <div class="ho-card-2">
                    <div class="ho-img-2"></div>
                    <div class="ho-content-2">
                        <p>서울 / 종로구</p>
                        <p>기준 2명 (최대 4명)</p>
                        <p>￦250,000 ~</p>
                    </div>
                    <div class="ho-line-2"></div>
                    <div class="ho-rsv-2">
                        <p>예약하기</p>
                    </div>
                </div>
                <div class="ho-card-3">
                    <div class="ho-img-3"></div>
                    <div class="ho-content-3">
                        <p>전라 / 전주시</p>
                        <p>기준 2명 (최대 4명)</p>
                        <p><s>￦380,000</s> ￦304,000 ~</p>
                    </div>
                    <div class="ho-line-3"></div>
                    <div class="ho-rsv-3">
                        <p>예약하기</p>
                    </div>
                </div>
                </div>
            </div>
    </main>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-element-bundle.min.js"></script>
