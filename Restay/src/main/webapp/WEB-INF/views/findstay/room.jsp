<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp" />
<link rel="stylesheet" href="${ path }/css/findstay/Room.css">

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
		</div>
	</div>
</main>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />