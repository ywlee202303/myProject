<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>

<c:set var="path" value="${ pageContext.request.contextPath }" />

<jsp:include page="/WEB-INF/views/common/header.jsp" />
<link rel="stylesheet" href="${ path }/css/mypage/Reservation.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />

<style>
	.swiper {
        display: block;
        width: 410px;
        height: 250px;
        position: absolute;
        right: 0;
        top: 10px;
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

    .swiper-button-prev {
        color: #fff;
    }

    :root {
        -swiper-theme-color: #fff;
    }
</style>

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
	                <li class="active"><a>예약정보</a></li>
	                <li><a href="${ path }/mypage/cancel">취소 내역</a></li>
	                <li><a href="${ path }/mypage/interest">관심 스테이</a></li>
	                <li><a href="${ path }/mypage/customer/myinquiry">나의 문의 내역</a></li>
	                <li><a href="${ path }/mypage/member/check">회원 정보 수정</a></li>
	            </ul>
	        </nav>
        	<c:if test="${ empty myResHouseList }">
        		<div class="mypage_content">
        			<div class="find_stay_for_empty">
	                    <img class="findstay_image" src="${ path }/img/mypage_blank.png" />
	                    <p class="text">아직 예약 정보가 없습니다. 새로운 스테이를 찾아 떠나보세요.</p>
	                    <button type="button" class="find_stay_button"  onclick="location.href='${ path }/findstay'">FIND STAY</button>
	                </div>
        		</div>
        	</c:if>
        	
        	<c:if test="${ not empty myResHouseList }">
		        <div class="mypage_content">
		        	<c:forEach var="myResHouse" items="${ myResHouseList }">
			            <div class="list_screen">
			                <div class="list1">
			                    <div class="reserv_stay_info">
			                        <span class="name">${ myResHouse.house.houseName }</span>
			                        <br>
			                        <span class="location">${ myResHouse.house.houseArea } / ${ myResHouse.house.houseSigungu }</span>
			                    </div>
			                    <div class="stay_view">
			                    	<div class="swiper flist_slider">
					                    <div class="swiper-wrapper flist_slider_wrap">
			                                <c:forEach var="houseImage" items="${myResHouse.houseImages}">
			                                    <div class="swiper-slide">
			                                        <img src="${path}/upload/findstay/${houseImage.houseImageRenamedFileName}" alt="슬라이드 이미지1">
			                                    </div>
			                                </c:forEach>
			                            </div>
			                            <div class="swiper-button-next"></div>
			                            <div class="swiper-button-prev"></div>
			                            <div class="swiper-pagination"></div>
		                            </div>
			                    </div>
			                    <button type="button" class="btn_reserv_cencel"
			                    	onclick="location.href='${ path }/payment/cancel/${ myResHouse.resCode }'">취소하기</button>
			                    <div class="reserv_info">
			                        <span class="checkIn">${ myResHouse.resCheckin }</span> 
			                        <span> ~ </span> 
			                        <span class="checkOut">${ myResHouse.resCheckout }</span> 
			                        <span class="bak">(1박)</span>
			                        <div class="option">성인 ${ myResHouse.resNop }명</div>
			                        <div class="price">${ myResHouse.totalPrice }</div>
			                    </div>
			                    <br>
			                    <button type="button" class="btn_reserv_detail"
			                    	onclick="location.href='${ path }/payment/detail/${ myResHouse.resCode }'">
			                    	예약 상세 확인
			                    </button>
			                </div>
			            </div>
		        	</c:forEach>
<!-- 		            <div class="paging"> -->
<!-- 		                <a href="/" class="prev" title="이전 페이지">&lt;</a> -->
<!-- 		                <a href="/" class="on">1</a> -->
<!-- 		                <a href="/" class="next" title="다음 페이지">&gt;</a> -->
<!-- 		            </div> -->
		        </div>
        	</c:if>
	    </div>
	</section>
</main>

<%-- <jsp:include page="/WEB-INF/views/common/footer.jsp" /> --%>

<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

<script>
	// n박 표시, 가격 원화표시 + 콤마처리
	let price = document.querySelectorAll('.price');
	let checkIn = document.querySelectorAll('.checkIn');
	let checkOut = document.querySelectorAll('.checkOut');
	let bak = document.querySelectorAll('.bak');
	
	console.log(checkIn)
	
	for(let i = 0; i < price.length; i++) {
		let ckIn = moment(checkIn[i].innerHTML);
		let ckOut = moment(checkOut[i].innerHTML);
		
		let duration = ckOut.diff(ckIn, 'days');
		
		console.log("날짜 차이 (일): " + duration);
		
		price[i].innerHTML = '₩' + parseInt(price[i].innerHTML).toLocaleString();
		bak[i].innerHTML = '(' + duration + '박)';

	}
	
	// 슬라이드
	var swiper = new Swiper(".flist_slider", {
        slidesPerView: 1,
        spaceBetween: 30,
        loop: true,
        loopedSlides: 1,
        pagination: {
            el: ".swiper-pagination",
            clickable: true
        },
        navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev"
        }
    });
</script>