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

<main>
	<div class="payment-banner">
		<img alt="" src="${ path }/img/RESERVATION_BANNER.png">
	</div>
	
	<form action="${ path }/payment" method="post">
		<div class="payment-info">
			<table>
				<tr>
					<th>예약 스테이</th>
					<td>보아비양</td>
				</tr>
				<tr>
					<th>예약일</th>
					<td>2024-05-29</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>테스트</td>
				</tr>
				<tr>
					<th>휴대폰 번호</th>
					<td>01012341234</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>test@restay.com</td>
				</tr>
				<tr>
					<th>요청사항</th>
					<td>
						<textarea rows="10" cols="100"></textarea>
					</td>
				</tr>
				<tr>
					<th>결제금액</th>
					<td>₩180,000 / 1박</td>
				</tr>
				<tr>
					<th>결제방법</th>
					<td>
						<div class="payment-method">
							<input type="radio" id="card" name="payMethod" value="card" checked="checked" />
							<label for="card" class="card">신용카드</label>
							<input type="radio" id="naverPay" name="payMethod" value="naverPay" />
							<label for="naverPay" class="naverPay">네이버 페이</label>
							<input type="radio" id="kakaoPay" name="payMethod" value="kakaoPay" />
							<label for="kakaoPay" class="kakaoPay">카카오 페이</label>
						</div>
					</td>
				</tr>
			</table>
			
			<div class="payment-checklist">
				<div style="text-align: center; margin-bottom: 30px; padding-bottom: 10px; border-bottom: 1px solid lightgray;">이용자 약관 동의</div>
				
				<div>
					<input type="checkbox" id="allCheck" />
					<label for="allCheck">사용자 약관 전체 동의</label>
				</div>
				<div>
					<input type="checkbox" id="privacyCheck" />
					<label for="privacyCheck">개인정보 제공 동의</label><span class="privacyCheck">&nbsp;▽</span>
					<div class="payment-checklist-content1">
						예약 시스템 제공 과정에서 예약자 동의 하에 서비스 이용을 위한 예약자 개인정보를 수집하며,<br/>
						수집된 개인정보는 제휴 판매자(숙소)에게 제공됩니다.<br/>
						정보 주체는 개인정보의 수집 및 이용 동의를 거부할 권리가 있으나, 이 경우 상품 및 서비스 예약이 제한됩니다.<br/> 
						제공 받는 자 제공 목적: 제휴 판매자(숙소)와 이용자(회원)의 예약에 대한 서비스 제공,<br/> 
						계약의 이행(예약확인, 이용자 확인), 민원 처리 등 소비자 분쟁 해결을 위한 기록 보존- 제공 정보:<br/> 
						예약번호, 아이디, 성명, 휴대전화 번호, 이메일, 인원 정보, 생년월일(필요한 경우),<br/>
						동행 투숙객 정보(필요한 경우)- 보유 및 이용 기간 : 5년
					</div>
				</div>
				<div>
					<input type="checkbox" id="minorCheck" />
					<label for="minorCheck">미성년자 투숙 기준 동의</label><span class="minorCheck">&nbsp;▽</span>
					<div class="payment-checklist-content2">
						만 19세 미만 미성년자(청소년)의 경우 예약 및 투숙이 불가합니다.<br/>
						19세 미만 미성년자가 투숙을 원하는 경우 보호자(법정대리인)가 필수 동행해야 합니다.<br/>
						이용일 당일 미성년자 투숙 기준 위반이 확인되는 경우 환불없이 퇴실 조치됩니다.<br/>
						스테이 소재지 : 대한민국 외1. 스테이가 위치한 국가/지역에 따라 미성년자로 간주되는 경우 예약 및 투숙이 불가합니다.<br/>
						미성년자가 투숙을 원하는 경우 보호자(법정대리인)가 필수 동행해야 합니다.<br/>
						이용일 당일 미성년자 투숙 기준 위반이 확인되는 경우 환불없이 퇴실 조치됩니다.
					</div>
				</div>
				<div>
					<input type="checkbox" id="refundCheck" />
					<label for="refundCheck">환불 규정에 대한 동의</label><span class="refundCheck">&nbsp;▽</span>
					<div class="payment-checklist-content3">
						환불규정기준일환불 금액체크인 20일 전까지총 결제금액의 100% 환불체크인 19일 - 15일 전까지<br/>
						총 결제금액의 80% 환불체크인 14일 - 10일 전까지총 결제금액의 60% 환불체크인 9일 - 5일 전까지<br/>
						총 결제금액의 40% 환불체크인 4일 - 2일 전까지총 결제금액의 20% 환불체크인 1일 전 - 체크인 당일환불 불가<br/><br/>
						
						- 예약 변경은 체크인 20일 전, 1회만 가능합니다.<br/>
						- 천재 지변으로 이용일 당일의 선박 / 항공편이 취소된 경우, 결항 확인서를 보내주시면 전체 환불해 드립니다.<br/>
					</div>
				</div>
			</div>
			
			<div class="payment-btn">
				<button>결제하기</button>
			</div>
		</div>
	</form>
</main>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

<script>
	$(document).ready(() => {
		$('.privacyCheck').on('click', () => {
			$('.payment-checklist-content1').fadeToggle();
		})
		
		$('.minorCheck').on('click', () => {
			$('.payment-checklist-content2').fadeToggle();
		})
		
		$('.refundCheck').on('click', () => {
			$('.payment-checklist-content3').fadeToggle();
		})
		
	})
</script>