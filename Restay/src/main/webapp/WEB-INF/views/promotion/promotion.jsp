<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp" />
<link rel="stylesheet" href="${ path }/css/promotion/promotion.css">

<main>
	<section class="pm1_title">
		<div class="pm1_main_img">프로모션 1 메인이미지</div>
		<div class="pm1_main_expain">
			<p>자연 속 은신처에서 즐기는 럭셔리 스테이</p>
			<p>자연 속에 녹아드는 한적한 분위기를 강원도는 지닌 그 자체로 정원이자 숲이고, 산이며, 자연으로서 존재합니다.
				약수터와 폭포, 산에서 물이 흐르는 계곡, 돌과 거암이 쌓인 유적 같은벽과 담장, 여러 개의 지장과 석상이 놓인 길,
				그리고 터 가장 안쪽에 있는 이끼 낀 대계단 등 강원도에서는 자연을 거닐며 그 소리와 향기, 경치를 만끽할 수 있습니다.
			</p>
		</div>
		<div class="pm1_for">프로모션 대상</div>
	</section>


	<section class="pm1_examples">
		<div class="pm1_exam1">example1</div>
		<div class="pm1_exam2">example2</div>

		<div class="pm1_exam3"></div>
		<div class="pm1_exam_wrap">
			<p>강원도 스페셜 - 스위트 & 트윈룸 객실</p>
			<p>24년 2월 5일 ~ 24년 3월 18일 투숙 고객 혜택</p>
			<p>
				- 트윈룸 2인, 스위트 2인 조식 포함 <br> - 강원도 무료 체험 (시크릿 가든 탐험, 자전거 대여, 무료
				샴페인, 와인 등과 함께하는 아페리티프) <br> - 스위트당 숙박 시 온천 60분 개인 사용
			</p>
		</div>

		<div class="pm1_exam4"></div>
		<div class="pm1_exam_wrap">
			<p>강원도 속초 - 싱글, 더블, 트윈, 스위트</p>
			<p>24년 2월 5일 ~ 24년 3월 18일 투숙 고객 혜택</p>
			<p>
				- 2인 조식 포함 <br> - 객실 3인 이용시 추가 인원에 대한 엑스트라 베드 및 아침 식사 무료로 제공 <br>
				- 강원도 무료 체험 (시크릿 가든 탐험, 자전거 대여, 무료 샴페인, 와인 등과 함께하는 아페리티프) <br>
				- 예약시 한 카테고리 상위 객실로 업그레이드 (트윈룸 및 스위트 제외)
			</p>
		</div>
	</section>

	<!-- 프로모션 안내사항 -->
	<div class="pm_rule">프로모션 안내사항</div>
</main>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />