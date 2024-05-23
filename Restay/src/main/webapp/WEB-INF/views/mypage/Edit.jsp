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
		<div class="container_mypage_contents">
			<nav class="navi">
				<ul class="menu">
					<li><a href="${ path }/mypage/reservation">예약정보</a></li>
					<li><a href="${ path }/mypage/cancel">취소 내역</a></li>
					<li><a href="${ path }/mypage/interest">관심 스테이</a></li>
					<li class="active"><a>회원	정보 수정</a></li>
				</ul>
			</nav>
			<div class="mypage_content">
				<div class="edit_sign">회원 정보 수정</div>
				<form name="edit_form" action="${ path }/mypage/member/edit" method="POST">
					<div class="password">
						<div class="input_box">
							<div class="tit">비밀번호</div>
							<div class="input">
								<label style="display: flex;">
									<input type="password" id="password" name="currentPassword" placeholder="현재 비밀번호">
									<input type="button" class="img-button">
								</label>
							</div>
							<div class="input">
								<label style="display: flex;"> 
									<input type="password" id="newPassword" name="newPassword" placeholder="변경할 비밀번호"> 
									<input type="button" class="img-button">
								</label>
							</div>
							<ul class="checked">
								<li class="off">영문</li>
								<li class="off">숫자</li>
								<li class="off">8자 이상 20자 이하</li>
							</ul>
							<div class="input">
								<label style="display: flex;">
									<input type="password" id="newPasswordConfirm" name="memberPw" placeholder="변경할 비밀번호 확인">
									<input type="button" class="img-button">
								</label>
							</div>
							<div id="result" style="font-size: 14px;"></div>
						</div>
						<button type="button" class="btn_change_pw" onclick="validatePassword()">비밀번호 확인</button>
					</div>
	
					<div class="email_name_pn">
						<div class="input_box">
							<div class="tit">이름</div>
							<div class="input">
								<input type="text" name="memberName" value="${ loginMember.memberName }" readonly>
							</div>
						</div>
						<div class="input_box">
							<div class="tit">휴대전화번호</div>
							<div class="input">
								<input class="mypage_account_edit_phone_number" type="tel" maxlength="20" value="${ loginMember.memberPhone }" readonly>
							</div>
						</div>
					</div>
	
					<button id="btn_save" class="btn_save">저장하기</button>
	
				</form>
			</div>
		</div>
	</section>
</main>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

<script>
	//비밀번호 조건 확인 안내문구
	function validatePassword() {
	
		var newPassword = document.getElementById('newPassword').value;
		var newPasswordConfirm = document.getElementById('newPasswordConfirm').value;
		var resultDiv = document.getElementById('result');
	
		var passwordRegex = /^(?=.*[a-zA-Z])(?=.*[0-9]).{8,20}$/;
	
		if (passwordRegex.test(newPassword)) {
			if (newPassword === newPasswordConfirm) {
				resultDiv.innerHTML = '비밀번호가 일치하며 유효합니다.';
				resultDiv.style.color = 'green';
			} else {
				resultDiv.innerHTML = '비밀번호가 일치하지 않습니다.';
				resultDiv.style.color = 'red';
			}
		} else {
			resultDiv.innerHTML = '형식에 맞지 않는 비밀번호 입니다.';
			resultDiv.style.color = 'red';
		}
	}
	
	// 비밀번호 보이기, 숨김처리
	document.addEventListener('DOMContentLoaded', function() {
		const passwordInput = document.getElementById('password');
		const newPasswordInput = document.getElementById('newPassword');
		const newPasswordConfirmInput = document.getElementById('newPasswordConfirm');
		const passwordToggleButtons = document.querySelectorAll('.img-button');
	
		function togglePasswordVisibility(input) {
			input.type = input.type === 'password' ? 'text' : 'password';
		}
	
		function toggleButtonImage(button) {
			button.classList.toggle('show-password');
		}
	
		function handlePasswordToggle(event) {
			const clickedButton = event.target;
			const targetInput = clickedButton.previousElementSibling;
	
			togglePasswordVisibility(targetInput);
			toggleButtonImage(clickedButton);
		}
	
		passwordToggleButtons.forEach(function(button) {
			button.addEventListener('click', handlePasswordToggle);
		});
	});
	
	
	// 비밀번호 조건창 색상 변경
	document.addEventListener('DOMContentLoaded', function() {
		const newPasswordInput = document.getElementById('newPassword');
		const resultDiv = document.getElementById('result');
		const checkedItems = document.querySelectorAll('.checked .off');
	
		function updatePasswordConditions() {
			const newPassword = newPasswordInput.value;
			const passwordRegex = /^(?=.*[a-zA-Z])(?=.*[0-9]).{8,20}$/;
	
			checkedItems.forEach(function(item) {
				const conditionType = item.innerText.toLowerCase();
				const isConditionMet = conditionType === '영문' ? /[a-zA-Z]/.test(newPassword) :
					conditionType === '숫자' ? /\d/.test(newPassword) :
						conditionType === '8자 이상 20자 이하' ? newPassword.length >= 8 && newPassword.length <= 20 :
							false;
	
				item.classList.toggle('on', isConditionMet);
			});
		}
	
		newPasswordInput.addEventListener('keyup', updatePasswordConditions);
	});
	
	let btnSave = document.getElementById('btn_save');
	
	btnSave.addEventListener('click', () => {
		let newPassword = document.getElementById('newPassword').value;
		let newPasswordConfirm = document.getElementById('newPasswordConfirm').value;
		
		console.log(newPassword);
		console.log(newPasswordConfirm);
		
		if(newPassword !== newPasswordConfirm) {
			alert('비밀번호가 일치하지 않습니다.');
			
			event.preventDefault();
		} else if(newPassword === '' || newPasswordConfirm === '') {
			alert('비밀번호를 입력해주세요.');
			
			event.preventDefault();
		}
		
	})
</script>