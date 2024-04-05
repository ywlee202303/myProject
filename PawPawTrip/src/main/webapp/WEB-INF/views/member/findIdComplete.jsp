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
	<link rel="stylesheet" href="${path}/css/member/findIdComplete.css">
	<link rel="stylesheet" href="${path}/css/member/member.css">

	<!-- 메인 -->
	<div class="content container-fluid">
	    <section class="container find-box">
	        <div class="member-content first_div">
	            <img src="${ path }/img/member/big_logo.png" alt="" />
	            <div class="second_div">
	                <h3>보호자님 아이디는 아래와 같습니다.</h3>
	                <br />
	                <h2>
	                <b style="color: #B29254;">${ memberId }</b> <br> 
	                </h2>
	                <input class="paw_btn_long" type="button" value="로그인 하기" onclick="location.href='${ path }/login'"/>
	            </div>
	        </div>
	    </section>
	</div>
    
    <!-- 푸터 -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
