<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

	<!-- 헤더 -->
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<link rel="stylesheet" href="${path}/css/member/findPwComplete.css">
	<link rel="stylesheet" href="${path}/css/member/member.css">
	
	<!-- 메인 -->
	<div class="content container-fluid">
	    <section class="container find-box">
	        <div class="member-content first_div">
	            <img src="${ path }/img/member/big_logo.png" alt="" />
	            <div class="second_div">
	                <h2>변경 완료</h2>
	                <br />
	                <p>
	                    당신의 반려동물과 함께하는<br>
	                    새로운 여행 경험을 환영합니다! 
	                </p>
	                <input class="paw_btn_long" type="button" value="로그인 하기" onclick="location.href='${ path }/login'" />
	            </div>
	        </div>
	    </section>
	</div>
    
    <!-- 푸터 -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
