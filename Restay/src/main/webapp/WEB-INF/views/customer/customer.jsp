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
				<li class="customer-restay-menu-li" id="notice-menu">공지사항</li>
				<li class="customer-restay-menu-li" id="board-menu">자유게시판</li>
				<li class="customer-restay-menu-li" id="question-menu">자주 묻는 질문</li>
				<li class="customer-restay-menu-li" id="inquiry-menu">1:1문의</li>
			</ul>
		</div>
		<div class="customer-restay-notice-list">
			<ul class="customer-restay-notice-ul">
				<li class="customer-restay-notice-li">
					<p class="customer-restay-notice-title">[공지사항] 공지사항 테스트1</p>
					<p class="customer-restay-notice-content">공지사항 내용 테스트1</p>
				</li>
				<li class="customer-restay-notice-li">
					<p class="customer-restay-notice-title">[공지사항] 공지사항 테스트2</p>
					<p class="customer-restay-notice-content">공지사항 내용 테스트2</p>
				</li>
				<li class="customer-restay-notice-li">
					<p class="customer-restay-notice-title">[공지사항] 공지사항 테스트3</p>
					<p class="customer-restay-notice-content">공지사항 내용 테스트3</p>
				</li>
				<li class="customer-restay-notice-li">
					<p class="customer-restay-notice-title">[공지사항] 공지사항 테스트4</p>
					<p class="customer-restay-notice-content">공지사항 내용 테스트4</p>
				</li>
				<li class="customer-restay-notice-li">
					<p class="customer-restay-notice-title">[공지사항] 공지사항 테스트5</p>
					<p class="customer-restay-notice-content">공지사항 내용 테스트5</p>
				</li>
			</ul>
		</div>
		<div class="customer-restay-board-list">
<!-- 			<ul class="customer-restay-board-ul"> -->
<!-- 				<li class="customer-restay-board-li">[자유게시판] 자유게시판 테스트1</li> -->
<!-- 				<li class="customer-restay-board-li">[자유게시판] 자유게시판 테스트2</li> -->
<!-- 				<li class="customer-restay-board-li">[자유게시판] 자유게시판 테스트3</li> -->
<!-- 				<li class="customer-restay-board-li">[자유게시판] 자유게시판 테스트4</li> -->
<!-- 				<li class="customer-restay-board-li">[자유게시판] 자유게시판 테스트5</li> -->
<!-- 			</ul> -->
			<table border="1" class="customer-restay-board-table">
				<tr>
					<th style="width: 50px;">번호</th>
					<th>제목</th>
					<th style="width: 150px;">작성자</th>
					<th style="width: 110px;">등록일</th>
				<tr>
				<tr>
					<td>5</td>
					<td>자유게시판 테스트5</td>
					<td>test5</td>
					<td>2024-04-13</td>
				<tr>
				<tr>
					<td>4</td>
					<td>자유게시판 테스트4</td>
					<td>test4</td>
					<td>2024-04-13</td>
				<tr>
				<tr>
					<td>3</td>
					<td>자유게시판 테스트3</td>
					<td>test3</td>
					<td>2024-04-13</td>
				<tr>
				<tr>
					<td>2</td>
					<td>자유게시판 테스트2</td>
					<td>test2</td>
					<td>2024-04-13</td>
				<tr>
				<tr>
					<td>1</td>
					<td>자유게시판 테스트1</td>
					<td>test1</td>
					<td>2024-04-13</td>
				<tr>
			</table>
		</div>
		<div class="customer-restay-question-list">
			<ul class="customer-restay-question-ul">
				<li class="customer-restay-question-li">
					<p class="customer-restay-question-title">[자주 묻는 질문] 자주 묻는 질문 테스트1</p>
					<p class="customer-restay-question-content">자주 묻는 질문 내용 테스트1</p>
				</li>
				<li class="customer-restay-question-li">
					<p class="customer-restay-question-title">[자주 묻는 질문] 자주 묻는 질문 테스트2</p>
					<p class="customer-restay-question-content">자주 묻는 질문 내용 테스트2</p>
				</li>
				<li class="customer-restay-question-li">
					<p class="customer-restay-question-title">[자주 묻는 질문] 자주 묻는 질문 테스트3</p>
					<p class="customer-restay-question-content">자주 묻는 질문 내용 테스트3</p>
				</li>
				<li class="customer-restay-question-li">
					<p class="customer-restay-question-title">[자주 묻는 질문] 자주 묻는 질문 테스트4</p>
					<p class="customer-restay-question-content">자주 묻는 질문 내용 테스트4</p>
				</li>
				<li class="customer-restay-question-li">
					<p class="customer-restay-question-title">[자주 묻는 질문] 자주 묻는 질문 테스트5</p>
					<p class="customer-restay-question-content">자주 묻는 질문 내용 테스트5</p>
				</li>
			</ul>			
		</div>
		<div class="customer-restay-inquiry-list">
			<form action="" method="post">
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
    $(document).ready(() => {
    	
    	// 고객센터 페이지 최초 화면
    	$('.customer-restay-board-list').css('display', 'none');
    	$('.customer-restay-question-list').css('display', 'none');
    	$('.customer-restay-inquiry-list').css('display', 'none');
    	
    	$('#notice-menu').css({
    		'color': 'green',
    		'font-weight': 'bold'
    	});
    	
    	// 공지사항 클릭
    	$('#notice-menu').click(() => {
    		$('.customer-restay-board-list').css('display', 'none');
        	$('.customer-restay-question-list').css('display', 'none');
        	$('.customer-restay-inquiry-list').css('display', 'none');
        	
        	$('.customer-restay-notice-list').css('display', 'block');
        	
        	$('.customer-restay-page-number').css('display', 'block');
        	
        	$('#notice-menu').css({
        		'color': 'green',
        		'font-weight': 'bold'
        	});
        	
        	$('#board-menu').css({
        		'color': 'black',
        		'font-weight': 'normal'
        	});
        	
        	$('#question-menu').css({
        		'color': 'black',
        		'font-weight': 'normal'
        	});
        	
        	$('#inquiry-menu').css({
        		'color': 'black',
        		'font-weight': 'normal'
        	});
    	});
    	
    	// 자유게시판 메뉴 클릭
    	$('#board-menu').click(() => {
    		$('.customer-restay-notice-list').css('display', 'none');
        	$('.customer-restay-question-list').css('display', 'none');
        	$('.customer-restay-inquiry-list').css('display', 'none');
        	
        	$('.customer-restay-board-list').css('display', 'block');
        	
        	$('.customer-restay-page-number').css('display', 'block');
        	
        	$('#notice-menu').css({
        		'color': 'black',
        		'font-weight': 'normal'
        	});
        	
        	$('#board-menu').css({
        		'color': 'green',
        		'font-weight': 'bold'
        	});
        	
        	$('#question-menu').css({
        		'color': 'black',
        		'font-weight': 'normal'
        	});
        	
        	$('#inquiry-menu').css({
        		'color': 'black',
        		'font-weight': 'normal'
        	});
    	});
    	
    	// 자주 묻는 질문 메뉴 클릭
    	$('#question-menu').click(() => {
    		$('.customer-restay-notice-list').css('display', 'none');
    		$('.customer-restay-board-list').css('display', 'none');
    		$('.customer-restay-inquiry-list').css('display', 'none');
    		
        	$('.customer-restay-question-list').css('display', 'block');
        	
        	$('.customer-restay-page-number').css('display', 'block');
        	
        	$('#notice-menu').css({
        		'color': 'black',
        		'font-weight': 'normal'
        	});
        	
        	$('#board-menu').css({
        		'color': 'black',
        		'font-weight': 'normal'
        	});
        	
        	$('#question-menu').css({
        		'color': 'green',
        		'font-weight': 'bold'
        	});
        	
        	$('#inquiry-menu').css({
        		'color': 'black',
        		'font-weight': 'normal'
        	});
    	});
    	
    	// 1:1문의 메뉴 클릭
    	$('#inquiry-menu').click(() => {
    		$('.customer-restay-notice-list').css('display', 'none');
    		$('.customer-restay-board-list').css('display', 'none');
        	$('.customer-restay-question-list').css('display', 'none');
        	
    		$('.customer-restay-inquiry-list').css('display', 'block');
    		
    		$('.customer-restay-page-number').css('display', 'none');
    		
    		$('#notice-menu').css({
        		'color': 'black',
        		'font-weight': 'normal'
        	});
        	
        	$('#board-menu').css({
        		'color': 'black',
        		'font-weight': 'normal'
        	});
        	
        	$('#question-menu').css({
        		'color': 'black',
        		'font-weight': 'normal'
        	});
        	
        	$('#inquiry-menu').css({
        		'color': 'green',
        		'font-weight': 'bold'
        	});
    	});
    	
    	// 공지사항 내용 토글 효과
    	$('.customer-restay-notice-title').click((e) => {
    		$(e.target).next().toggle();
    	});
    	
    	// 자주 묻는 질문 토글 효과
    	$('.customer-restay-question-title').click((e) => {
    		$(e.target).next().toggle();
    	});
    	
    });
</script>