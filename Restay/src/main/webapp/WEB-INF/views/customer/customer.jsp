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
				<li class="customer-restay-menu-li" id="notice-menu">공지사항</li>
				<li class="customer-restay-menu-li" id="board-menu">자유게시판</li>
				<li class="customer-restay-menu-li" id="question-menu">자주 묻는 질문</li>
				<li class="customer-restay-menu-li" id="inquiry-menu">1:1문의</li>
			</ul>
		</div>
		
		<!-- 공지사항 -->
		<div class="customer-restay-notice-list">
			<input type="hidden" id="role" value="${ loginMember.memberRole }" />
			<c:if test="${ empty noticeList }">
				<div style="text-align: center;">
					<p style="font-size: 18px;">조회된 데이터가 없습니다.</p>
				</div>
			</c:if>
			
			<ul class="customer-restay-notice-ul">
				<c:forEach var="notice" items="${ noticeList }">
					<li class="customer-restay-notice-li">
						<p class="customer-restay-notice-title">${ notice.customerCategory } ${ notice.customerTitle }</p>
					</li>
				</c:forEach>
			</ul>
		</div>
		
		<!-- 자유게시판 -->
		<div class="customer-restay-board-list">
			<c:if test="${ empty boardList }">
				<div style="text-align: center;">
					<p style="font-size: 18px;">조회된 데이터가 없습니다.</p>
				</div>
			</c:if>
			
			<ul class="customer-restay-board-ul">
				<c:forEach var="board" items="${ boardList }">
					<li class="customer-restay-board-li">
						<p class="customer-restay-board-title">${ board.customerCategory } ${ board.customerTitle }</p>
					</li>
				</c:forEach>
			</ul>
		</div>
		
		<!-- 자주 묻는 질문 -->
		<div class="customer-restay-question-list">
			<input type="hidden" id="role" value="${ loginMember.memberRole }" />
			<c:if test="${ empty questionList }">
				<div style="text-align: center;">
					<p style="font-size: 18px;">조회된 데이터가 없습니다.</p>
				</div>
			</c:if>
			
			<ul class="customer-restay-question-ul">
				<c:forEach var="question" items="${ questionList }">
					<li class="customer-restay-question-li">
						<p class="customer-restay-question-title">${ question.customerCategory } $[ question.customerTitle ]</p>
					</li>
				</c:forEach>
			</ul>			
		</div>
		
		<!-- 1:1 문의 -->
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
		
		<!-- 고객센터 글 작성 -->
		<div class="customer-submit-btn">
			<button onclick="location.href='${ path }/customer/write'">등록</button>
		</div>
		
		<!-- 페이징 -->
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
    	
    	let role = $('#role').val();
    	
    	console.log(role);
    	
    	if(role === 'ROLE_ADMIN') {
        	$('.customer-submit-btn').css({
        		'display': 'block'
        	})
    	} else {
    		$('.customer-submit-btn').css({
        		'display': 'none'
        	})
    	}
    	
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
    		let role = $('#role').val();
    		
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
        	
        	// 관리자만 공지사항 등록 가능
        	if(role === 'ROLE_ADMIN') {
	        	$('.customer-submit-btn').css({
	        		'display': 'block'
	        	})
        	} else {
        		$('.customer-submit-btn').css({
	        		'display': 'none'
	        	})
        	}
        	
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
        	
        	$('.customer-submit-btn').css({
        		'display': 'block'
        	})
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
        	
        	$('.customer-submit-btn').css({
        		'display': 'block'
        	})
        	
        	// 관리자만 자주 묻는 질문 등록 가능
        	if(role === 'ROLE_ADMIN') {
	        	$('.customer-submit-btn').css({
	        		'display': 'block'
	        	})
        	} else {
        		$('.customer-submit-btn').css({
	        		'display': 'none'
	        	})
        	}
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
        	
        	$('.customer-submit-btn').css({
        		'display': 'none'
        	})
    	});
    	
    	// 공지사항 내용 토글 효과
//     	$('.customer-restay-notice-title').click((e) => {
//     		$(e.target).next().toggle();
//     	});
    	
//     	// 자유게시판 내용 토글 효과
//     	$('.customer-restay-board-title').click((e) => {
//     		$(e.target).next().toggle();
//     	});
    	
//     	// 자주 묻는 질문 토글 효과
//     	$('.customer-restay-question-title').click((e) => {
//     		$(e.target).next().toggle();
//     	});
    	
    });
</script>