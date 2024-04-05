<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"              prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"               prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"         prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags"   prefix="security" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<title>PawPawTrip</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="icon" type="image/png" href="${path}/img/common/favicon.png">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${path}/css/common/bootstrap.css" >
    <link rel="stylesheet" href="${path}/css/common/templatemo.css"> 
    <link rel="stylesheet" href="${path}/css/common/pawpawHeader.css">
	<link rel="stylesheet" href="${path}/css/common/pawpawCommon.css">

    <script src="https://kit.fontawesome.com/36aedea311.js" crossorigin="anonymous"></script>

    <script src="${path}/js/common/jquery-3.7.1.min.js"></script>
    <script src="${path}/js/common/jquery-migrate-1.2.1.min.js"></script>
    <script src="${path}/js/common/bootstrap.bundle.min.js"></script>
    <script src="${path}/js/common/templatemo.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="${path}/js/common/pawpawHeader.js"></script>
	<script src="${path}/js/common/pawpawCommon.js"></script>
 	 	  
	<!-- summernote cdn -->
<!--     <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.css" rel="stylesheet"> -->
<!--     <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.js"></script> -->
</head>
<body>
    <div class="afterWeather"><a href="${path}/common/todayWeather"><img src="${path}/img/common/todayWeather.png"></a></div>
    <!-- Header -->
    <nav class="navbar navbar-expand-lg navbar-light shadow">
        <div class="container d-flex justify-content-between align-items-center">
            <a class="navbar-brand logo h1 align-self-center" href="${path}/">
                <img src="${path}/img/common/pawpawLogo.png"/>
                <span>포포</span><span>트립</span>
            </a>

            <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#templatemo_main_nav" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="align-self-center collapse navbar-collapse  d-lg-flex justify-content-lg-between" id="templatemo_main_nav">
                <div class="flex-fill">
                    <ul class="nav navbar-nav d-flex justify-content-between mx-lg-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="${path}/map">포포맵</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${path}/trip/spot">포포트립</a>
                            <ul class="menu-sub" id="menuUlsecond">
                                <li class="on"><a href="${path}/trip/spot">관광지</a></li>
                                <li class=""><a href="${path}/trip/stay">숙소</a></li>
                            </ul>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${path}/community/notice">커뮤니티</a>
                            <ul class="menu-sub" id="menuUlthird">
                                <li class=""><a href="${path}/community/notice">공지사항</a></li>
                                <li class=""><a href="${path}/community/board">자유게시판</a></li>
                            </ul>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${path}/about">소개</a>
                        </li>
                    </ul>
                </div>
                <div class="navbar align-self-center d-flex">
                
                    <div class="d-lg-none flex-sm-fill mt-3 mb-4 col-7 col-sm-auto pr-3">
                    </div>
					<c:if test="${empty loginMember}">
 	                    <a class="nav-icon d-lg-inline text-decoration-none common" href="${path}/login">로그인</a> 
 	                    <a class="nav-icon position-relative text-decoration-none common" href="${path}/enroll">회원가입</a>
<%-- 	                    <a class="nav-icon d-lg-inline text-decoration-none common"       href="${path}/logout">로그아웃</a>--%>
<%--	                    <a class="nav-icon position-relative text-decoration-none common" href="${path}/admin/dashboard">관리자</a>--%>
					</c:if>
					<c:if test="${not empty loginMember and loginMember.memberRole == 'ROLE_USER'}">
	                    <a class="nav-icon d-lg-inline text-decoration-none common" href="${path}/logout">로그아웃</a>
	                    <a class="nav-icon position-relative text-decoration-none common" href="${path}/member/mypage/my-info">마이페이지</a>
					</c:if>
					<c:if test="${not empty loginMember and loginMember.memberRole == 'ROLE_ADMIN'}">
	                    <a class="nav-icon d-lg-inline text-decoration-none common"       href="${path}/logout">로그아웃</a>
	                    <a class="nav-icon position-relative text-decoration-none common" href="${path}/admin/dashboard">관리자</a>
					</c:if>
                </div>
            </div>
        </div>
    </nav>
    <!-- Close Header -->
    <div id="submenu_bg" class="container-fluid shadow"></div>
