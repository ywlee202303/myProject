<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>

<c:set var="path" value="${ pageContext.request.contextPath }" />

<jsp:include page="/WEB-INF/views/common/header.jsp" />
<link rel="stylesheet" href="${ path }/css/mypage/Edit.css">

<main>
	<section class="section1">
		<div class="mypagetitle">
			<div class="mypage_title">
				<img class="mypage_title_img"
					src="${ path }/img/MYPAGE_LOGO.png" />
			</div>
			<p class="subtitle">${ loginMember.memberName }님 반가워요!</p>
		</div>
	</section>
	<section class="sction2">
		<div class="container_mypage_check_contents">
			<nav class="navi">
				<ul class="menu">
					<li><a href="${ path }/mypage/reservation">예약정보</a></li>
					<li><a href="${ path }/mypage/cancel">취소 내역</a></li>
					<li><a href="${ path }/mypage/interest">관심 스테이</a></li>
					<li><a href="${ path }/mypage/customer/myinquiry">나의 문의 내역</a></li>
					<li class="active"><a>회원 정보 수정</a></li>
				</ul>
			</nav>
			<div class="mypage_check_content">
				<div class="mypage_passwordCk">
					<p>고객님의 개인정보 보호를 위해 본인확인을 진행합니다.</p>
					<p>패스워드를 입력해주세요.</p>
				</div>
				
				<div class="mypage_passwordCk_input">
					<form action="${ path }/mypage/member/check" method="post">
						<table style="padding-top: 28px; padding-left: 110px;">
							<tr>
								<td>
									<label for="memberPw" style="font-weight: 300;">비밀번호 확인</label>
								</td>
								<td>
									<input type="password" name="memberPw" id="memberPw" />
								</td>
								<td>
									<button class="check">확인</button>
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</section>
</main>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />