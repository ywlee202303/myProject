<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp" />
<link rel="stylesheet" href="${ path }/css/notice/notice.css">

<main class="wrap">
	<div class="notice-logo">
		<img src="${ path }/img/PAGE_NAME_NOTICE.png" alt="">
	</div>
	<div class="notice-menu">
		<ul>
			<li><a href="#">숙소/예약</a></li>
			<li><a href="#">환불/취소/결제</a></li>
			<li><a href="#">프로모션/담당자</a></li>
			<li><a href="#">자주 묻는 질문</a></li>
		</ul>
	</div>
	<div class="notice-list">
		<ul>
			<li>
				<p class="p1">[예약 / 숙소] 예약을 확인하고 싶어요.</p>
				<p class="p-content-1">
					ㆍ ​회원 예약 확인<br> &nbsp;&nbsp;&nbsp;&nbsp;스테이폴리오 홈페이지 로그인 - 마이
					페이지 - 예약 정보 - 다가올 예약
				</p>
			</li>
			<li>
				<p class="p2">[예약 / 숙소] 회원으로 예약했는데 예약 내역이 확인되지 않아요.</p>
				<p class="p-content-2">
					ㆍ 혹시 스테이폴리오에 여러 개의 계정이 등록되어 있지 않으신가요?<br>
					&nbsp;&nbsp;&nbsp;&nbsp;예약을 진행하신 계정을 다시 한번 확인해 주세요! (네이버, 지메일, SNS
					간편가입 등)<br>
					<br> ㆍ 리스테이 홈페이지가 아닌 다른 경로를 통해 예약을 진행하셨다면 비회원 예약입니다. 숙소 자체
					홈페이지에서 예약 내역을 확인해 주세요!
				</p>
			</li>
			<li>
				<p class="p3">[취소 / 환불] 예약을 취소하고 싶어요.</p>
				<p class="p-content-3">
					ㆍ ​회원 예약 취소<br> &nbsp;&nbsp;&nbsp;&nbsp;스테이폴리오 홈페이지 로그인 -
					마이페이지 - 예약 정보 - 예약 상세 확인 - [예약취소] 버튼 클릭
				</p>
			</li>
			<li>
				<p class="p4">[취소 / 환불] 예약 취소 요청 시, 호스트의 확인 후 각 숙소의 환불 규정에 따라 환불
					처리가 진행됩니다.</p>
				<p class="p-content-4">
					ㆍ 예약 취소 요청 전, 반드시 예약하신 숙소의 환불 규정을 확인해 주세요!<br> ㆍ 환불 규정은 예약 확정
					메일과 마이페이지의 예약정보, 그리고 숙소 상세페이지 하단의 안내사항에서 확인 가능합니다.<br>
				</p>
			</li>
			<li>
				<p class="p5">[예약 / 숙소] 객실을 변경하고 싶어요.</p>
				<p class="p-content-5">
					<b>'객실' 변경을 원하실 경우, ​기존 예약 취소 후 다시 예약을 진행해 주셔야 합니다.</b><br>
					<br> ㆍ 실시간 예약이 진행됨에 따라 취소 후 재예약 하시는 시점에 다른 예약이 유입될 가능성이 있습니다.<br>
					&nbsp;&nbsp;&nbsp;&nbsp;예약 일자 유지를 위해 예약한 숙소와 소통하신 후, 숙소 측의 예약 취소와
					동시에 재예약을 진행해 주세요.<br> ㆍ 취소 수수료가 발생하는 기간에 예약을 취소하면 스테이 환불 규정에
					따라 수수료가 발생할 수 있습니다.<br> &nbsp;&nbsp;&nbsp;&nbsp;반드시 숙소 측과 사전
					협의 후 예약 취소를 진행해 주세요.
				</p>
			</li>
			<li>
				<p class="p6">[결제 / 영수증] 결제 수단에 따른 영수증 발급 방법이 궁금합니다.</p>
				<p class="p-content-6">
					ㆍ <b>카드결제</b><br> 결제 시점에 예약자의 메일주소로 결제 영수증이 자동 발송됩니다.<br>
					<br> ㆍ <b>​네이버페이/카카오페이/토스페이 결제</b><br> 네이버페이센터/카카오페이에서
					결제내역 및 영수증 확인 가능합니다.
				</p>
			</li>
			<li>
				<p class="p7">[자주 찾는 질문] 예약자 정보는 어떻게 변경하나요?</p>
				<p class="p-content-7">
					<b>예약 및 결제페이지에서 개인정보(이름/휴대전화/이메일) 수정은 불가합니다.</b><br>
					<br> <b>[개인 정보 수정 방법]</b><br> ㆍ 리스테이 로그인 - MY PAGE - 회원
					정보 수정 - 변경 원하는 휴대 전화 번호 인증 - 저장하기 클릭 - 변경된 회원 정보 확인 - 예약 진행
				</p>
			</li>
		</ul>
	</div>
	<div class="notice-number">
		<ul>
			<li><a href="#"><</a></li>
			<li><a href="#">1</a></li>
			<li><a href="#">2</a></li>
			<li><a href="#">3</a></li>
			<li><a href="#">></a></li>
		</ul>
	</div>
</main>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

<script>
    $(document).ready(() => {
        $('.p1').on('click', () => {
            $('.p-content-1').toggle();
        });

        $('.p2').on('click', () => {
            $('.p-content-2').toggle();
        });

        $('.p3').on('click', () => {
            $('.p-content-3').toggle();
        });

        $('.p4').on('click', () => {
            $('.p-content-4').toggle();
        });

        $('.p5').on('click', () => {
            $('.p-content-5').toggle();
        });

        $('.p6').on('click', () => {
            $('.p-content-6').toggle();
        });

        $('.p7').on('click', () => {
            $('.p-content-7').toggle();
        });
    });
</script>