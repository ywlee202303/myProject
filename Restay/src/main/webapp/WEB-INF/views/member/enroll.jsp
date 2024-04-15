<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>

<c:set var="path" value="${ pageContext.request.contextPath }" />

<jsp:include page="/WEB-INF/views/common/header.jsp" />
<link rel="stylesheet" href="${ path }/css/member/enroll.css">

<style>
.duplication_check {
	background-color: black;
	color: white;
	width: 70px;
	height: 45px;
	cursor: pointer;
	border: 1px solid lightgray;
}

.availableId, .notAvailableId, .duplicateId {
	display: none;
	font-size: 14px;
}

#passwordCheck {
	display: none;
	color: red;
	font-size: 14px;
}

#nameCheck {
	display: none;
	color: red;
	font-size: 14px;
}
</style>

<main>
	<section class="section1">
		<div class="join_title"></div>
		<hr>
	</section>

	<!-- 회원가입 사용자 정보 입력 부분  -->
	<section class="section2">
		<form action="${ path }/enroll" method="post">
			<div class="input_wrap">

				<!-- 아이디 -->
				<div>
					<div class="input_box">
						<label for="userId">아이디</label>
						<div style="display: flex; justify-content: space-between;">
							<input style="width: 500px;" type="text" name="memberId"
								id="userId" placeholder="아이디를 입력하세요." required>
							<button type="button" id="idCheckBtn" class="duplication_check">중복확인</button>
						</div>
					</div>
					<span class="availableId">사용 가능한 아이디입니다.</span> <span
						class="notAvailableId">아이디: 5~20자의 영문 소문자, 숫자만 사용 가능합니다.</span> <span
						class="duplicateId">중복된 아이디입니다.</span>
				</div>

				<div>
					<div class="input_box">
						<!-- 이름 -->
						<label for="userName">이름</label> <input type="text"
							name="memberName" id="userName" placeholder="이름을 입력하세요." required>
					</div>
					<span id="nameCheck">공백을 제외한 이름을 입력해주세요.</span>
				</div>

				<div>
					<div class="input_box">
						<!-- 비밀번호 -->
						<label for="userPwd">비밀번호</label> <input type="password"
							name="memberPw" id="userPwd" maxlength="20" minlength="8"
							placeholder="비밀번호를 입력하세요." required> <input
							type="button" class="img-button">
					</div>
					<span id="passwordCheck">비밀번호: 8~20자의 영문, 숫자를 사용해주세요.</span>
				</div>



				<div class="input_box">
					<!-- 비밀번호 조건 pwd_checked -->
					<ul class="pwd_checked">
						<li id="enCheck">영문</li>
						<li id="noCheck">숫자</li>
						<li id="sizeCheck">8자 이상 20자 이하</li>
					</ul>
					<input type="password" name="memberPw2" id="userPwd2"
						maxlength="20" minlength="8" placeholder="비밀번호를 한 번 더 입력하세요."
						required> <input type="button" class="img-button">
				</div>
				<div id="passwordMismatch">비밀번호가 일치하지 않습니다.</div>


				<div class="input_box">
					<!-- 휴대폰 번호 -->
					<label for="userPhone">휴대폰번호</label> <input type="tel"
						name="memberPhone" id="userPhone" placeholder="- 없이 휴대폰번호를 입력하세요."
						required>
				</div>
			</div>

			<!-- 인증번호 버튼 -->
			<button type="button" onclick="" class="btn_phoneChecked">인증번호
				발송</button>

			<!-- 약관 동의 -->
			<div class="agree">
				<ul class="agree_wrap">
					<li class="agree_all"><label class="check_skin"
						for="check_all"> <input class="agree_check"
							type="checkbox" id="check_all" value="all"> 사용자 약관 전체 동의
					</label></li>

					<li><label class="check_skin" for="check_service"> <input
							class="agree_check" type="checkbox" id="check_service"
							value="serviceAgree"> 서비스 이용 약관 동의(필수)
					</label></li>

					<li><label class="check_skin" for="check_privacy"> <input
							class="agree_check" type="checkbox" id="check_privacy"
							value="privacyAgree"> 개인정보 수집 이용 동의 (필수)
					</label></li>

					<li><label class="check_skin" for="check_above"> <input
							class="agree_check" type="checkbox" id="check_above"
							value="aboveAree"> 만 14세 이상 확인 (필수)
					</label></li>
				</ul>
			</div>

			<!-- 회원가입 버튼 -->
			<button type="submit" class="btn_join">회원가입</button>
		</form>
	</section>
</main>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

<script>
	$(document).ready(() => {
		let userId = '';
		let userPwd = '';
		let userPwd2 = '';
		let userName = '';
		let userPhone = '';
		
		let idRegex = '';
		let checkcheck = '';
		
		function duplicationIdCheck() {
			userId = $('#userId').val();
			
			// 공백 체크
			let spaceCheck = /\s/g;
			
			// 아이디: 5~20자의 영문 소문자, 숫자만 사용 가능
			idRegex = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{5,20}$/;
			
			console.log(userId);
			
			if(userId && !userId.match(spaceCheck)) {
				if(idRegex.test(userId)) {
					$.ajax({
						url: '${ path }/enroll/duplication_check',
						type: 'post',
						data: {
							userId
						},
						success: function(data) {
							if(data === 'available') {
								$('.availableId').css({
									'display': 'block',
									'color': 'green'
								});
								
								$('.duplicateId').css({'display': 'none'});
								$('.notAvailableId').css({'display': 'none'});
								
								checkcheck = true;
							} else {
								$('.duplicateId').css({
									'display': 'block',
									'color': 'red'
								});
								
								$('.availableId').css({'display': 'none'});
								$('.notAvailableId').css({'display': 'none'});
								
								checkcheck = false;
							}
						}
					});
				} else {
					$('.notAvailableId').css({
						'display': 'block',
						'color': 'red'
					});
					
					$('.availableId').css({'display': 'none'});
					$('.duplicateId').css({'display': 'none'});
					
					checkcheck = false;
				}
				
			} else {
				alert('공백을 제외한 아이디를 입력해주세요.');
				
				checkcheck = false;
			}
		}
		
		// 아이디 중복 체크
		$('.duplication_check').click(() => {
			duplicationIdCheck();
		});
		
		// 패스워드 필터링
		$('#userPwd').keyup(() => {
			userPwd = $('#userPwd').val();
			
			const enResult = userPwd.match(/[a-zA-Z]/);
			const noResult = userPwd.match(/[0-9]/g);
			const sizeResult = userPwd.match(/^[a-zA-Z0-9]{8,20}$/);
			
			// 영문
			if(enResult) {
				$('#enCheck').css({'color': 'green'});
			} else {
				$('#enCheck').css({'color': 'black'});
			}
			
			// 숫자
			if(noResult) {
				$('#noCheck').css({'color': 'green'});
			} else {
				$('#noCheck').css({'color': 'black'});
			}
			
			// 8자이상 20자이하
			if(sizeResult) {
				$('#sizeCheck').css({'color': 'green'});
			} else {
				$('#sizeCheck').css({'color': 'black'});
			}
		});
		
		// 체크박스
		$('#check_all').click(() => {
			
			let checkAll = $('#check_all');
			
			console.log(checkAll.is(':checked'));
			
			if(checkAll.is(':checked')) {
				$('.agree_check').attr('checked', true);
			} else {
				$('.agree_check').attr('checked', false);
			}
			
		})
		
		// 입력란에 공백 유/무 체크
		$('.btn_join').click(() => {
			userPwd = $('#userPwd').val();
			userPwd2 = $('#userPwd2').val();
			userName = $('#userName').val();
			userPhone = $('#userPhone').val();
			
			let checkService = $('#check_service');
			let checkPrivacy = $('#check_privacy');
			let checkAbove = $('#check_above');
			
			
			
			console.log('동의 : ' + $('.agree_check').prop("checked"));
			
			let nameSpaceCheck = /\s/g;
			
			// 5~20자의 영문 소문자, 숫자
			idRegex = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{5,20}$/;
			
			// 영문, 숫자 8~20자
			let passwordRegex = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,20}$/;
			
			// 아이디 정규표현식
			if(!checkcheck || checkcheck === '') {
				alert('아이디를 확인해주세요.');
				
				return false;
			}
			
			// 이름 확인
			if(userName.match(nameSpaceCheck) || userName === '') {
				$('#nameCheck').css({'display': 'block'});
				
				return false;
			}
			
			// 비밀번호 정규표현식
			if(!passwordRegex.test(userPwd)) {
				$('#passwordCheck').css({'display': 'block'});
				
				return false;
			}
			
			// 비밀번호 재확인
			if(userPwd !== userPwd2) {
				$('#passwordMismatch').css({'display': 'block', 'padding-top': '10px'});
				
				return false;
			}
			
			// 휴대폰번호 확인
			if(userPhone === '') {
				alert('휴대폰 번호를 입력해주세요.');
				
				return false;
			}
			
			// 체크리스트 체크 여부 확인
			if(!checkService.is(':checked') || !checkPrivacy.is(':checked') || !checkAbove.is(':checked')) {
				alert('필수 동의 사항을 체크해주세요.');
				
				return false;
			}
			
		});
		
	});
</script>
