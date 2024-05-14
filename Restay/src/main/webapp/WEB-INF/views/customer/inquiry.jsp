<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp" />
<link rel="stylesheet" href="${ path }/css/customer/Customer.css">

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
		<div class="customer-restay-inquiry-list">
			<form action="${ path }/customer/inquiry" method="post">
				<table border="1" class="customer-restay-inquiry-table">
					<tr>
						<th style="height: 50px;">
							<label for="inquiry-title">제목</label>
						</th>
						<td>
							<input type="text" name="inquiry-title" id="inquiry-title" style="width: 945px;" />
						</td>
					</tr>
					<tr>
						<th style="height: 345px;">
							<label for="inquiry-content">내용</label>
						</th>
						<td>
							<textarea name="inquiry-content" id="inquiry-content"></textarea>
						</td>
					</tr>
				</table>
				<div class="inquiry-btn">
					<button type="submit">등록</button>
				</div>
			</form>
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