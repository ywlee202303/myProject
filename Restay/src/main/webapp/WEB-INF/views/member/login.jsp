<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp" />
<link rel="stylesheet" href="${ path }/css/member/login.css">

<main>
	<div class="login-wrap">
		<div>
			<img src="${ path }/img/loginLogo.png" alt="">
		</div>
	</div>
	<div class="login-form">
		<form action="${ path }/login" method="POST">
			<div class="userId">
				<input type="text" name="userId" placeholder="아이디">
			</div>
			<div class="userPw">
				<input type="password" name="userPw" id="userPw" placeholder="비밀번호">
			</div>
			<div class="login-btn-wrap">
				<button class="login-btn">LOGIN</button>
			</div>
			<div class="enroll-btn-wrap">
				<button type="button" class="enroll-btn"
					onclick="location.href='${ path }/enroll'">회원가입</button>
			</div>
			<div class="find-wrap">
				<a href="#">아이디 찾기</a> <a href="#">비밀번호 찾기</a>
			</div>
			<div class="sns-login">
				<div>SNS 계정으로 로그인하기</div>
				<ul>
					<li><a href="#"><img src="${ path }/img/naver.png" alt=""></a></li>
					<li><a href="#"><img src="${ path }/img/kakao.png" alt=""></a></li>
					<li><a href="#"><img src="${ path }/img/google.png" alt=""></a></li>
				</ul>
			</div>
		</form>
	</div>
</main>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />