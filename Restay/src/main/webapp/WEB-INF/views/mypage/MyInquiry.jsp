<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp" />
<link rel="stylesheet" href="${ path }/css/mypage/Edit.css">

<main>
	<section class="section1">
		<div class="mypagetitle">
			<div class="mypage_title">
				<img class="mypage_title_img"
					src="${ path }/img/MYPAGE_LOGO.png" />
			</div>
			<p class="subtitle">${ loginMember.memberName }님 반가워요!</p>
		</div>
	</section>
	<section class="sction2">
		<div class="container_mypage_check_contents">
			<nav class="navi">
				<ul class="menu">
					<li><a href="${ path }/mypage/reservation">예약정보</a></li>
					<li><a href="${ path }/mypage/cancel">취소 내역</a></li>
					<li><a href="${ path }/mypage/interest">관심 스테이</a></li>
					<li class="active"><a>나의 문의 내역</a></li>
					<li><a href="${ path }/mypage/member/check">회원 정보 수정</a></li>
				</ul>
			</nav>
			<div class="myInquiry_check_content">
				<table border="1">
					<tr>
						<th style="width: 50px;">번호</th>
						<th>제목</th>
						<th style="width: 120px;">작성자</th>
						<th style="width: 120px;">등록일</th>
					</tr>
					<tr>
						<td>1</td>
						<td style="text-align: left;">
							<a href="#">테스트 제목</a>
						</td>
						<td>user</td>
						<td>2023-05-26</td>
					</tr>
				</table>
		</div>
		</div>
	</section>
</main>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />