<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp" />
<link rel="stylesheet" href="${ path }/css/customer/Customer.css">

<style>
	.disable {
		color: green !important;
		font-weight: bold;
	}
</style>

<main>
	<div class="customer-logo">
		<img src="${ path }/img/CUSTOMER_LOGO.png" alt="">
	</div>
	<div class=customer-restay-container>
		<div class=customer-restay-menu>
			<ul class="customer-restay-menu-ul">
				<li class="customer-restay-menu-li" id="notice-menu"
					onclick="location.href='${ path }/customer?menu=notice'">공지사항</li>
				<li class="customer-restay-menu-li" id="board-menu"
					onclick="location.href='${ path }/customer?menu=board'">자유게시판</li>
				<li class="customer-restay-menu-li" id="question-menu"
					onclick="location.href='${ path }/customer?menu=question'">자주 묻는 질문</li>
				<li class="customer-restay-menu-li" id="inquiry-menu">1:1문의</li>
			</ul>
		</div>
		
		<!-- 1:1 문의 -->
		<!-- 관리자 -->
		<c:if test="${ loginMember.memberRole eq 'ROLE_ADMIN' }">
			<div class="customer-restay-customer-list">
				<c:if test="${ empty customerInquiryList }">
					<div style="text-align: center;">
						<p style="font-size: 18px;">조회된 데이터가 없습니다.</p>
					</div>
				</c:if>
				
				<ul class="customer-restay-customer-ul">
					<c:forEach var="customer" items="${ customerInquiryList }">
						<li class="customer-restay-customer-li">
							<p class="customer-restay-customer-title">${ customer.customerCategory } ${ customer.customerTitle }</p>
						</li>
					</c:forEach>
				</ul>
			</div>
		</c:if>
		
		<!-- 일반 사용자 -->
		<c:if test="${ loginMember.memberRole eq 'ROLE_USER' }">
			<div class="customer-restay-inquiry-list">
				<form action="${ path }/customer/inquiry" method="post">
					<table border="1" class="customer-restay-inquiry-table">
						<tr>
							<th style="height: 50px;">
								<label for="inquiry-title">제목</label>
							</th>
							<td>
								<input type="text" name="customerTitle" id="inquiry-title" style="width: 945px;" />
							</td>
						</tr>
						<tr>
							<th style="height: 345px;">
								<label for="inquiry-content">내용</label>
							</th>
							<td>
								<textarea name="customerContent" id="inquiry-content"></textarea>
							</td>
						</tr>
					</table>
					<div class="inquiry-btn">
						<button type="submit">등록</button>
					</div>
				</form>
			</div>
		</c:if>
		
		<!-- 페이징 -->
		<div class="customer-restay-page-number">
			<ul class="customer-restay-page-number-ul">
				<!-- 이전페이지 -->
				<li><a href="${ path }/customer/inquiry?page=${ pageInfo.prevPage }">&lt;</a></li>
				
				<!-- 5개 페이지 -->
				<c:forEach var="current" begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }">
					<c:choose>
						<c:when test="${ current == pageInfo.currentPage }">
							<li><a class="disable">${ current }</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="${ path }/customer/inquiry?page=${ current }">${ current }</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				
				<!-- 다음페이지 -->
				<li><a href="${ path }/customer/inquiry?page=${ pageInfo.nextPage }">&gt;</a></li>
			</ul>
		</div>
		
	</div>
</main>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

<script>
	$(document).ready(() => {
		$('#inquiry-menu').css({
			'color': 'green',
			'font-weight': 'bold'
		});
	})
</script>