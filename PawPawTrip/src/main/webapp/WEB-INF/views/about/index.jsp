<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

	<!-- 헤더 -->
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<link rel="stylesheet" href="${path}/css/about/index.css">
	
	<!-- 메인 -->
	<div class="content">
		<!-- 소개 상단 -->
	    <section class="fir_section">
	        <div class="paw_about">
	            <h1>
	                포포트립 <br>
	                PAWPAWTRIP
	            </h1>
	            <br><br>
	            <p>
	                발자국을 뜻하는 Paw와 여행의 Trip을 합쳐,<br>
	                반려동물의 행복한 여행 발자국이 많아지길<br>
	                소망하는 메시지를 담았습니다.
	            </p>
	        </div>
	        <img class="fir_img" src="${ path }/img/about/dangdang.png" alt="">
	    </section>
	    <!-- 소개 하단 -->
	    <div class="sec_section">
	        <div class="paw_info">
	            <p>
	                포포트립은 사용자들이 반려동물과 함께하는 여행을 보다 즐겁고 안전하게 즐길 수 있도록<br>
	                다양한 리소스와 정보를 제공합니다. 포포트립과 함께 여행을 계획하고 새로운 경험을 만들어보세요!
	            </p>  
	            
	            <div class="circle_img">
	                <div>
	                    <div>
	                        <img src="${ path }/img/about/Map Marker.png" alt="">
	                    </div>
	                    <p>한 눈에 알아볼 수 있는 지도</p>
	                </div>
	                <div>
	                    <div>
	                        <img src="${ path }/img/about/pawpaw.png" alt="">
	                    </div>
	                    <p>숙박 및 관광 여행지 추천</p>
	                </div>
	                <div>
	                    <div>
	                        <img src="${ path }/img/about/Inscription.png" alt="">
	                    </div>
	                    <p>즐거웠던 경험 공유</p>
	                </div>
	            </div>
	        </div>
	        <img class="sec_img" src="${ path }/img/about/fatty-corgi-Zn5chZcnFRA-unsplash 1.png" alt="">
	    </div>
	</div>

	<!-- 푸터 -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
