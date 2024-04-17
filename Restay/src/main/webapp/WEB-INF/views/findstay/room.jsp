<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>

<c:set var="path" value="${ pageContext.request.contextPath }" />

<jsp:include page="/WEB-INF/views/common/header.jsp" />
<link rel="stylesheet" href="${ path }/css/findstay/Room.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />

<!-- Demo styles -->
<style>
html, body {
	position: relative;
	height: 100%;
}

body {
	font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
	font-size: 14px;
	color: #000;
	margin: 0;
	padding: 0;
}

.swiper {
	width: 100%;
	height: 100%;
}

.swiper-slide {
	text-align: center;
	font-size: 18px;
	background: #fff;
	display: flex;
	justify-content: center;
	align-items: center;
}

.swiper-slide img {
	display: block;
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.swiper-button-next, .swiper-button-prev {
	color: black;
}
</style>

<main>
	<div class="findstay-logo-wrap">
		<div class="findstay-logo"></div>
	</div>

	<div class="findstayRoom-restay-container">
		<div>
			<p class="findstayRoom-restay-reservtext">BOOKING</p>
			<div class="findstayRoom-restay-title">
				<div class="findstayRoom-restay-title-name">선현재</div>
				<div class="findstayRoom-restay-title-date">날짜를 선택해주세요.</div>
				<button class="findstayRoom-restay-title-pay">결제하기</button>
			</div>
			<div class="findstayRoom-restay-content">
				<div class="findstayRoom-restay-content-text">
					<div class="findstayRoom-restay-content-info">
						<p class="room-tit">ROOM INFORMATION</p>
						<p class="room-name">선현재</p>
						<p class="room-price">-</p>
						<p class="room-text">거실, 주방, 침실, 화장실, 테라스로 구성되어 있습니다.</p>
					</div>
					<div class="findstayRoom-restay-content-option">
						<p>체크인 16:00 / 체크아웃 11:00</p>
						<p>기준 인원 2명(최대 인원 3명)</p>
						<p>객실면적 73㎡</p>
						<p>퀸 침대1</p>
					</div>
				</div>
				<div class="findstayRoom-restay-content-img">
					<!-- Swiper -->
					<div class="swiper mySwiper">
						<div class="swiper-wrapper">
							<div class="swiper-slide">
								<img src="${ path }/img/house/sunhyeonjae/sunhyeonjae1.jpg"
									alt="슬라이드 이미지1">
							</div>
							<div class="swiper-slide">
								<img src="${ path }/img/house/sunhyeonjae/sunhyeonjae2.jpg"
									alt="슬라이드 이미지2">
							</div>
							<div class="swiper-slide">
								<img src="${ path }/img/house/sunhyeonjae/sunhyeonjae3.jpg"
									alt="슬라이드 이미지3">
							</div>
							<div class="swiper-slide">
								<img src="${ path }/img/house/sunhyeonjae/sunhyeonjae4.jpg"
									alt="슬라이드 이미지3">
							</div>
							<div class="swiper-slide">
								<img src="${ path }/img/house/sunhyeonjae/sunhyeonjae5.jpg"
									alt="슬라이드 이미지3">
							</div>
							<div class="swiper-slide">
								<img src="${ path }/img/house/sunhyeonjae/sunhyeonjae6.jpg"
									alt="슬라이드 이미지3">
							</div>
						</div>
						<div class="swiper-button-next"></div>
						<div class="swiper-button-prev"></div>
					</div>
				</div>
			</div>
			<div class="findstayRoom-restay-content2">
				<div class="room-service">FEATURES</div>
				<ul class="room-service-ul">
					<li>야외가구</li>
					<li>실내 스파</li>
					<li>정원</li>
					<li>테라스</li>
					<li>독립 키친</li>
					<li>독립 화장실</li>
					<li>썬베드</li>
					<li>주차</li>
				</ul>
			</div>
			<div class="findstayRoom-restay-content3">
				<div class="room-service">AMENITIES</div>
				<ul>
					<li>TV</li>
					<li>냉장고</li>
					<li>헤어드라이어</li>
					<li>스피커</li>
					<li>전기포트</li>
					<li>전자레인지</li>
					<li>인덕션<br>(하이라이트)</li>
					<li>샴푸</li>
					<li>컨디셔너</li>
					<li>바디워시</li>
					<li>핸드워시</li>
					<li>치약</li>
					<li>칫솔</li>
					<li>타월</li>
					<li>샤워가운</li>
					<li>빗</li>
					<li>바디스펀지</li>
					<li>입욕제</li>
					<li>와인오프너</li>
					<li>와인잔</li>
					<li>생수</li>
					<li>토스터기</li>
					<li>캡슐커피머신</li>
					<li>티백</li>
					<li>조리도구</li>
					<li>룸슬리퍼</li>
					<li>빅테이블</li>
				</ul>
			</div>
		</div>
	</div>
</main>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

<script
	src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

<script>
	var swiper = new Swiper(".mySwiper", {
	  navigation: {
	    nextEl: ".swiper-button-next",
	    prevEl: ".swiper-button-prev",
	  },
	});
</script>