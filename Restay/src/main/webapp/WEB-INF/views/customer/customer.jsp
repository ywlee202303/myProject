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
				<li class="customer-restay-menu-li" id="inquiry-menu"
					onclick="location.href='${ path }/customer/inquiry'">1:1문의</li>
			</ul>
		</div>
		
		<div class="customer-restay-customer-list">
			<input type="hidden" id="role" value="${ loginMember.memberRole }" />
			<input type="hidden" id="menu" value="${ menu }" />
			<c:if test="${ empty customerList }">
				<div style="text-align: center;">
					<p style="font-size: 18px;">조회된 데이터가 없습니다.</p>
				</div>
			</c:if>
			
			<ul class="customer-restay-customer-ul">
				<c:forEach var="customer" items="${ customerList }">
					<li class="customer-restay-customer-li">
						<p class="customer-restay-customer-title" onclick="location.href='${ path }/customer/${ customer.customerNo }'">
							${ customer.customerCategory } ${ customer.customerTitle }
						</p>
					</li>
				</c:forEach>
			</ul>
		</div>
		
		<!-- 고객센터 글 작성 -->
		<div class="customer-submit-btn">
			<button onclick="location.href='${ path }/customer/write'">등록</button>
		</div>
		
		<!-- 페이징 -->
		<div class="customer-restay-page-number">
			<ul class="customer-restay-page-number-ul">
				<!-- 공지사항 -->
				<c:if test="${ menu eq 'notice' }">
					<!-- 이전페이지 -->
					<li><a href="${ path }/customer?menu=notice&page=${ pageInfo.prevPage }">&lt;</a></li>
					
					<!-- 5개 페이지 -->
					<c:forEach var="current" begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }">
						<c:choose>
							<c:when test="${ current == pageInfo.currentPage }">
								<li><a class="disable">${ current }</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="${ path }/customer?menu=notice&page=${ current }">${ current }</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					
					<!-- 다음페이지 -->
					<li><a href="${ path }/customer?menu=notice&page=${ pageInfo.nextPage }">&gt;</a></li>
				</c:if>
				
				<!-- 자유게시판 -->
				<c:if test="${ menu eq 'board' }">
					<!-- 이전페이지 -->
					<li><a href="${ path }/customer?menu=board&page=${ pageInfo.prevPage }">&lt;</a></li>
					
					<!-- 5개 페이지 -->
					<c:forEach var="current" begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }">
						<c:choose>
							<c:when test="${ current == pageInfo.currentPage }">
								<li><a class="disable">${ current }</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="${ path }/customer?menu=board&page=${ current }">${ current }</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					
					<!-- 다음페이지 -->
					<li><a href="${ path }/customer?menu=board&page=${ pageInfo.nextPage }">&gt;</a></li>
				</c:if>
				
				<!-- 자주 묻는 질문 -->
				<c:if test="${ menu eq 'question' }">
					<!-- 이전페이지 -->
					<li><a href="${ path }/customer?menu=question&page=${ pageInfo.prevPage }">&lt;</a></li>
					
					<!-- 5개 페이지 -->
					<c:forEach var="current" begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }">
						<c:choose>
							<c:when test="${ current == pageInfo.currentPage }">
								<li><a class="disable">${ current }</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="${ path }/customer?menu=question&page=${ current }">${ current }</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					
					<!-- 다음페이지 -->
					<li><a href="${ path }/customer?menu=question&page=${ pageInfo.nextPage }">&gt;</a></li>
				</c:if>
			</ul>
		</div>
	</div>
</main>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

<script>
    $(document).ready(() => {
    	
    	// 회원 타입
    	let role = $('#role').val();
    	let menu = $('#menu').val();
    	
    	console.log('로그인 : ' + role);
    	console.log('메뉴 : ' + menu);
    	
    	if(menu === 'notice' || menu === 'question') {
    		if(role === 'ROLE_USER' || role === '') {
    			$(".customer-submit-btn").css({
    				'display': 'none'
    			});
    		}
    	}
    	
    	// menu 파라미터 값
    	let param = window.location.search.substring(6);
    	// "&" 인덱스
    	let paramIndex = param.indexOf("&");
    	// page 파라미터 자른 값
    	let queryParam = param.substring(0, paramIndex);
    	
    	console.log(param);
    	console.log(paramIndex);
    	console.log(queryParam);
    	
    	if(queryParam === '') { // page 파라미더 포함X
    		if(param === '') {
        		$('#notice-menu').css({
        			'color': 'green',
        			'font-weight': 'bold'
        		});
        	} else {
    	   		$('#' + param + '-menu').css({
    	   			'color': 'green',
    	   			'font-weight': 'bold'
    	   		});
        	}
    	} else { // page 파라미터 포함
    		$('#' + queryParam + '-menu').css({
	   			'color': 'green',
	   			'font-weight': 'bold'
	   		});
    	}
    	
    });
</script>