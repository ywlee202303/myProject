<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp" />
<link rel="stylesheet" href="${ path }/css/customer/customer.css">

<main>
	<div class="customer-logo">
		<img src="${ path }/img/CUSTOMER_LOGO.png" alt="">
	</div>
	<div class=customer-restay-container>
		<div class=customer-restay-menu>
			<ul class="customer-restay-menu-ul">
				<li class="customer-restay-menu-li">공지사항</li>
				<li class="customer-restay-menu-li">자유게시판</li>
				<li class="customer-restay-menu-li">자주 묻는 질문</li>
				<li class="customer-restay-menu-li">1:1문의</li>
			</ul>
		</div>
		<div class="customer-restay-list">
			<ul class="customer-restay-notice-ul">
				<li class="customer-restay-notice-li">[공지사항] 공지사항 테스트1</li>
				<li class="customer-restay-notice-li">[공지사항] 공지사항 테스트2</li>
				<li class="customer-restay-notice-li">[공지사항] 공지사항 테스트3</li>
				<li class="customer-restay-notice-li">[공지사항] 공지사항 테스트4</li>
				<li class="customer-restay-notice-li">[공지사항] 공지사항 테스트5</li>
			</ul>
		</div>
		<div class="customer-restay-page-number">
			<ul class="customer-restay-page-number-ul">
				<li><a href="#">&lt;</a></li>
				<li><a href="#">1</a></li>
				<li><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">&gt;</a></li>
			</ul>
		</div>
	</div>
</main>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

<script>
    
</script>