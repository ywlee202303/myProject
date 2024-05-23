<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>

<c:set var="path" value="${ pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RE_STAY</title>

<!-- MainPage -->
<link rel="stylesheet" href="${ path }/css/common/header.css">
<link rel="stylesheet" href="${ path }/css/common/footer.css">

<!-- bootstrap -->
<!-- <link rel="stylesheet" type="text/css" href="https://fastly.jsdelivr.net/npm/daterangepicker/daterangepicker.css" /> -->
<link rel="stylesheet" type="text/css" href="${ path }/css/daterangepicker/daterangepicker.css" />

<!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script> -->
<script type="text/javascript" src="https://fastly.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script> -->
<script type="text/javascript" src="https://fastly.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script> -->
<!-- <script type="text/javascript" src="https://fastly.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script> -->
<script type="text/javascript" src="${ path }/js/daterangepicker/daterangepicker.js"></script>

<script type="text/javascript" src="${ path }/js/common/header.js"></script>
</head>
<body>
	<header class="header">
		<div class="wrap">
			<div class="logo">
				<a href="${ path }/">img</a>
			</div>
			<div class="menu-wrap">
				<ul>
					<li><a href="${ path }/about">ABOUT</a></li>
					<li><a href="${ path }/findstay">FIND STAY</a></li>
					<li><a href="${ path }/travel">TRAVEL</a></li>
					<li><a href="${ path }/customer">CUSTOMER</a></li>
				</ul>
			</div>
			<div class="search-1">
				<img src="${ path }/img/search.png" alt=""> 
				<span>어디로 떠날까요?</span>
			</div>
			<div class="search-2">
				<img src="${ path }/img/cal.png" alt=""> 
				<span>언제 떠날까요?</span>
			</div>
			<div class="main-login-wrap">
				<c:if test="${ empty loginMember }">
					<!-- 로그인 전 -->
					<div class="login-before" onclick="location.href='${ path }/login'">
						<img src="${ path }/img/login.png" alt=""> <span>Login</span>
					</div>
				</c:if>

				<c:if test="${ not empty loginMember }">
					<!-- 로그인 후 -->
					<div class="login-after" onclick="location.href='${ path }/mypage/reservation'">
						<img src="${ path }/img/mypage.png" alt=""> 
						<span>Mypage</span>
						<ul class="myPage">
							<li><a href="${ path }/mypage/reservation">예약 정보</a></li>
							<li><a href="${ path }/mypage/cancel">취소 내역</a></li>
							<li><a href="${ path }/mypage/like">관심 스테이</a></li>
							<li><a href="${ path }/mypage/memberPage">회원 정보 수정</a></li>
							<li><a href="${ path }/logout">로그아웃</a></li>
						</ul>
					</div>
				</c:if>
			</div>
		</div>
	</header>
	

        <!-- 모달 -->
        <div class="modal-wrap">
            <div class="modal">
                <div class="modal-title">
                    <h1>어디로 떠날까요?</h1>
                    <img src="${ path }/img/close.png" alt=""
                        class="modal-close">
                </div>
                <div class="modal-search">
                    <form id="formSearch" action="${ path }/findstay" method="GET">
                        <div class="modal-search-where">
                            <img src="${ path }/img/search2.png" alt="" />
                            <input type="text" name="inputSearch" id="input-search"
                                placeholder="원하는 스테이 혹은 지역을 검색해 보세요." />
                        </div>
                        <div class="modal-locabrand">
                            <div class="modal-location">
                                <div
                                    style="font-size: 22px; margin-bottom: 20px; font-weight: bold;">국내</div>
                                <ul>
                                    <li><button type="button" class="item">전체</button></li>
                                    <li><button type="button" class="item">제주</button></li>
                                    <li><button type="button" class="item">서울</button></li>
                                    <li><button type="button" class="item">강원</button></li>
                                    <li><button type="button" class="item">부산</button></li>
                                    <li><button type="button" class="item">경기</button></li>
                                    <li><button type="button" class="item">충청</button></li>
                                    <li><button type="button" class="item">경상</button></li>
                                    <li><button type="button" class="item">전라</button></li>
                                    <li><button type="button" class="item">인천</button></li>
                                    <li><button type="button" class="item">광주</button></li>
                                    <li><button type="button" class="item">대전</button></li>
                                    <li><button type="button" class="item">대구</button></li>
                                </ul>
                            </div>
                            <div class="modal-brand">
                                <div style="font-size: 22px; margin-bottom: 20px; font-weight: bold;">브랜드</div>
                                <ul>
                                    <li><button type="button" class="item">아만</button></li>
                                    <li><button type="button" class="item">호시노 리조트</button></li>
                                    <li><button type="button" class="item">UDS</button></li>
                                </ul>
                            </div>
                        </div>
                        <div class="modal-btn-img">
                            <img src="${ path }/img/refresh.png" alt="" onclick="clearSelected()">
                            <button type="button" id="btnSearch"><img src="${ path }/img/searchClick.png" alt=""></button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- 모달(언제) -->
        <div class="modal-wrap-2">
            <div class="modal-2">
                <div class="modal-when-title">
                    <h1>언제 떠날까요?</h1>
                    <img src="${ path }/img/close.png" alt="" class="modal-when-close">
                </div>
                <form action="" method="">
                    <div class="modal-cal-wrap">
<!--                         <div class="modal-cal"> -->
<!--                             <input type="text" name="datefilter" value="" placeholder="날짜를 선택해주세요." /> -->
<!--                         </div> -->
                        <div class="datefilter" style="width:100px;height:100px;background-color:aqua;"></div>
                    </div>
                    <div class="modal-btn-img-2">
                        <img src="${ path }/img/refresh.png" alt="" onclick="location.reload()">
                        <button>
                            <img src="${ path }/img/searchClick.png" alt="">
                        </button>
                    </div>
                </form>
            </div>
        </div>