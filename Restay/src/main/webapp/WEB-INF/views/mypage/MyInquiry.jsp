<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp" />
<link rel="stylesheet" href="${ path }/css/mypage/Edit.css">

<style>
	.disable {
		color: green !important;
		font-weight: bold;
	}
</style>

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
				<table border="1" class="myInquiry-table">
					<tr>
						<th style="width: 50px;">번호</th>
						<th>제목</th>
						<th style="width: 120px;">작성자</th>
						<th style="width: 120px;">등록일</th>
					</tr>
					<c:if test="${ empty myInquiryList }">
						<tr>
							<td colspan="4">조회된 데이터가 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${ not empty myInquiryList }">
						<c:forEach var="myInquiry" items="${ myInquiryList }">
							<tr>
								<td>${ myInquiry.rowNumber }</td>
								<td style="text-align: left;">
									<a href="${ path }/customer/inquiry/${ myInquiry.customerNo}">${ myInquiry.customerTitle }</a>
								</td>
								<td>${ loginMember.memberId }</td>
								<td>${ myInquiry.customerEnrollDate }</td>
							</tr>
						</c:forEach>
					</c:if>
				</table>
				
				<!-- 페이징 -->
				<div class="myinquiry-restay-page-number">
					<ul class="myinquiry-restay-page-number-ul">
						<!-- 이전 페이지 -->
						<li><a href="${ path }/mypage/customer/myinquiry?page=${ pageInfo.prevPage }">&lt;</a></li>
						
						<!-- 5개 페이지 -->
						<c:forEach var="current" begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }">
							<c:choose>
								<c:when test="${ current == pageInfo.currentPage }">
									<li><a class="disable">${ current }</a></li>
								</c:when>
								<c:otherwise>
									<li><a href="${ path }/mypage/customer/myinquiry?page=${ current }">${ current }</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						
						<!-- 다음 페이지 -->
						<li><a href="${ path }/mypage/customer/myinquiry?page=${ pageInfo.nextPage }">&gt;</a></li>
					</ul>
				</div>
			</div>
			
			
		</div>
	</section>
</main>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />