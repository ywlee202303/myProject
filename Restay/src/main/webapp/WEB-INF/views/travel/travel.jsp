<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp" />
<link rel="stylesheet" href="${ path }/css/main/home.css">
<link rel="stylesheet" href="${ path }/css/travel/travel.css">

<style>
	.disable {
		color: green !important;
		font-weight: bold;
	}
</style>

<main>
	<div class="travel-logo">
		<img src="${ path }/img/TRAVEL_LOGO.png" alt="">
	</div>
	
	<div class="travel-restay-container">
            <div class="travel-restay-container-list">
           		<c:forEach var="res" items="${ response }">
           			<div class="travel-restay-item">
	            		<div class="travel-restay-img">
	            			<c:if test="${ empty res.firstimage }">
	            				<img src="${ path }/img/travel/alternative/alternativeImg.jpg">
	            			</c:if>
	            			<c:if test="${ not empty res.firstimage }">
	            				<img src="${ res.firstimage }">
	            			</c:if>
	            		</div>
	            		<div class="travel-restay-content">
	            			<c:if test="${ empty res.addr1 }">
	            				<p>준비중..</p>
	            			</c:if>
	            			<c:if test="${ not empty res.addr1 }">
	            				<p>${ res.addr1 }</p>
	            			</c:if>
	            			<p>${ res.title }</p>
	            			<p>자전거를 준비해 둔 스테이에는 낭만이 있습니다. 친숙한 모습의 골목 모퉁이에서도 작은 모험이 시작된다는 것을 알고 있거든요.</p>
	            			<p>by. 리스테이</p>
	            		</div>
	            	</div>
           		</c:forEach>
            	
            	<!--
            	<div class="travel-restay-item">
            		<div class="travel-restay-img">
	            		<img src="${ path }/img/Gangneung.jpeg">
            		</div>
            		<div class="travel-restay-content">
            			<p>호지 > 강원 / 강릉시</p>
            			<p>자전거 타고 여행하는 스테이 6곳</p>
            			<p>자전거를 준비해 둔 스테이에는 낭만이 있습니다. 친숙한 모습의 골목 모퉁이에서도 작은 모험이 시작된다는 것을 알고 있거든요.</p>
            			<p>by. 리스테이</p>
            		</div>
            	</div>
            	<div class="travel-restay-item">
            		<div class="travel-restay-img">
	            		<img src="${ path }/img/Gangneung.jpeg">
            		</div>
            		<div class="travel-restay-content">
            			<p>호지 > 강원 / 강릉시</p>
            			<p>자전거 타고 여행하는 스테이 6곳</p>
            			<p>자전거를 준비해 둔 스테이에는 낭만이 있습니다. 친숙한 모습의 골목 모퉁이에서도 작은 모험이 시작된다는 것을 알고 있거든요.</p>
            			<p>by. 리스테이</p>
            		</div>
            	</div>
            	<div class="travel-restay-item">
            		<div class="travel-restay-img">
	            		<img src="${ path }/img/Gangneung.jpeg">
            		</div>
            		<div class="travel-restay-content">
            			<p>호지 > 강원 / 강릉시</p>
            			<p>자전거 타고 여행하는 스테이 6곳</p>
            			<p>자전거를 준비해 둔 스테이에는 낭만이 있습니다. 친숙한 모습의 골목 모퉁이에서도 작은 모험이 시작된다는 것을 알고 있거든요.</p>
            			<p>by. 리스테이</p>
            		</div>
            	</div>
            	<div class="travel-restay-item">
            		<div class="travel-restay-img">
	            		<img src="${ path }/img/Gangneung.jpeg">
            		</div>
            		<div class="travel-restay-content">
            			<p>호지 > 강원 / 강릉시</p>
            			<p>자전거 타고 여행하는 스테이 6곳</p>
            			<p>자전거를 준비해 둔 스테이에는 낭만이 있습니다. 친숙한 모습의 골목 모퉁이에서도 작은 모험이 시작된다는 것을 알고 있거든요.</p>
            			<p>by. 리스테이</p>
            		</div>
            	</div>
            	<div class="travel-restay-item">
            		<div class="travel-restay-img">
	            		<img src="${ path }/img/Gangneung.jpeg">
            		</div>
            		<div class="travel-restay-content">
            			<p>호지 > 강원 / 강릉시</p>
            			<p>자전거 타고 여행하는 스테이 6곳</p>
            			<p>자전거를 준비해 둔 스테이에는 낭만이 있습니다. 친숙한 모습의 골목 모퉁이에서도 작은 모험이 시작된다는 것을 알고 있거든요.</p>
            			<p>by. 리스테이</p>
            		</div>
            	</div>
            	<div class="travel-restay-item">
            		<div class="travel-restay-img">
	            		<img src="${ path }/img/Gangneung.jpeg">
            		</div>
            		<div class="travel-restay-content">
            			<p>호지 > 강원 / 강릉시</p>
            			<p>자전거 타고 여행하는 스테이 6곳</p>
            			<p>자전거를 준비해 둔 스테이에는 낭만이 있습니다. 친숙한 모습의 골목 모퉁이에서도 작은 모험이 시작된다는 것을 알고 있거든요.</p>
            			<p>by. 리스테이</p>
            		</div>
            	</div>
            	<div class="travel-restay-item">
            		<div class="travel-restay-img">
	            		<img src="${ path }/img/Gangneung.jpeg">
            		</div>
            		<div class="travel-restay-content">
            			<p>호지 > 강원 / 강릉시</p>
            			<p>자전거 타고 여행하는 스테이 6곳</p>
            			<p>자전거를 준비해 둔 스테이에는 낭만이 있습니다. 친숙한 모습의 골목 모퉁이에서도 작은 모험이 시작된다는 것을 알고 있거든요.</p>
            			<p>by. 리스테이</p>
            		</div>
            	</div>
            -->
            </div>
            
            <div class="travel-restay-container-page">
            	<ul>
            		<!-- 맨 처음으로 -->
            		<li><a href="${ path }/travel?pageNo=1">&lt;&lt;</a></li>
            		<!-- 이전 페이지 -->
            		<li><a href="${ path }/travel?pageNo=${ pageInfo.prevPage }">&lt;</a></li>
            		<!-- 5개 페이지 목록 -->
            		<c:forEach var="current" begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }">
            			<c:choose>
            				<c:when test="${ current == pageInfo.currentPage }">
            					<li><a class="disable">${ current }</a></li>
            				</c:when>
            				<c:otherwise>
            					<li><a href="${ path }/travel?pageNo=${ current }">${ current }</a></li>
            				</c:otherwise>
            			</c:choose>
            		</c:forEach>
            		<li><a href="${ path }/travel?pageNo=${ pageInfo.nextPage }">&gt;</a></li>
            		<!-- 맨 끝으로 -->
            		<li><a href="${ path }/travel?pageNo=${ pageInfo.maxPage }">&gt;&gt;</a></li>
            	</ul>
            </div>
        </div>
</main>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />