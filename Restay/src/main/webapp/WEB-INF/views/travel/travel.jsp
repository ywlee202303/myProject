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

<main>
	<div class="travel-logo">
		<img src="${ path }/img/TRAVEL_LOGO.png" alt="">
	</div>
	<div class="travel-restay-wrap">
            <div class="travel-restay-list2">
            	<div>
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
            	<div>
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
            	<div>
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
            	<div>
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
            </div>
        </div>
</main>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />