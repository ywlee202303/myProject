<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>

<c:set var="path" value="${ pageContext.request.contextPath }" />

<jsp:include page="/WEB-INF/views/common/header.jsp" />
<link rel="stylesheet" href="${ path }/css/payment/Payment.css">

<style>
	.payMethod-label {
		width: 100px;
		margin-right: 10px;
		padding: 10px;
		background-color: #a9b3a9;
		color: white;
		border: 1px solid;
		text-align: center;
		font-weight: 300;
		cursor: pointer;
		border: 3px solid gray;
	}
	
	.highlight {
        background-color: yellow;
        font-weight: bold;
    }
</style>

<main>
	<div class="payment-banner">
		<img alt="" src="${ path }/img/RESERVATION_BANNER.png">
	</div>
	
	<div class="payment-info">
	<input type="hidden" name="resCode" value="${ reservation.resCode }" />
		<table>
			<tr>
				<th>예약 스테이</th>
				<td>${ reservation.house.houseName }</td>
			</tr>
			<tr>
				<th>예약일</th>
				<td>${ reservation.resDate }</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>${ reservation.member.memberName }</td>
			</tr>
			<tr>
				<th>휴대폰 번호</th>
				<td>${ reservation.member.memberPhone }</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>${ reservation.member.memberEmail }</td>
			</tr>
			<tr>
				<th>예약일</th>
				<td>${ reservation.resCheckin } ~ ${ reservation.resCheckout }</td>
			</tr>
			<tr>
				<th>결제방법</th>
				<td>
					<c:if test="${ payment.payMethod eq 'card' }">신용카드</c:if>
					<c:if test="${ payment.payMethod eq 'naverPay' }">네이버 페이</c:if>
					<c:if test="${ payment.payMethod eq 'kakaoPay' }">카카오 페이</c:if>
				</td>
			</tr>
			<tr>
				<th>결제금액</th>
				<td id="price">${ reservation.totalPrice }</td>
			</tr>
		</table>
		
		<div class="move-btn">
			<button onclick="location.href='${ path }/'">메인페이지로 이동</button>
			<button onclick="location.href='${ path }/mypage/reservation'">마이페이지로 이동</button>
		</div>
	</div>
</main>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

<script>
	$(document).ready(() => {
		
		// 가격 원화표시 + 콤마처리
		let price = $('#price')
		
		price.text('₩' + parseInt(price.text()).toLocaleString());
		
	})
</script>