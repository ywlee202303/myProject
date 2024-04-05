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
	<link rel="stylesheet" href="${path}/css/member/mypage/myInfo.css">
	
	<!-- 메인 -->
<div class="content">
	<div class="container"> 
	<form action="${ path }/member/mypage/update" method="post">
		<!-- 타이틀 -->
		<div class="common-title">
			<p>마이페이지</p>
		</div>
			
        <!-- 사이드 바 메뉴 -->
		<div class="common-sideMenu">
			<ul>
				<li class="">마이페이지</li>
				<li class="on"><a href="${path}/member/mypage/my-info">회원 정보 수정</a></li>
				<li class=""><a href="${path}/member/mypage/my-board">내가 쓴 게시글</a></li>
				<li class=""><a href="${path}/member/mypage/my-trip">내가 찜한 장소</a></li>
			</ul>
		</div>
		<div class="common-list">
			<div class="myInfo-list">
				<!-- 회원 정보 -->
				<div class="myinfo-inner-content">
					<div class="myInfo-table">
						<div class="myInfo-tr row">
							<div class="col-lg-6">
								<div class="myInfo-td col-12">아이디</div>
								<div class="myInfo-td col-12 padding-bottom"><input type="text" name="memberId" value="${ loginMember.memberId }" readonly></div>
							</div>
							<div class="col-lg-6">
								<div class="myInfo-td col-12">비밀번호</div>
								<div class="myInfo-td col-12 padding-bottom"><input type="password" id="password" name="memberPw" placeholder="8~15자 영문,숫자 포함"
									<c:if test="${loginMember.memberId.matches('[0-9]+')}">readonly</c:if>></div>
								<p class="strongPassword-message hide" style="color:red; font-size: 12px; margin-top: -30px;">8~15자 영문, 숫자를 포함하여 입력하세요.</p>
							</div>
						</div>
						<div class="myInfo-tr row">
							<div class="col-lg-6">
								<div class="myInfo-td col-12">이름</div>
								<div class="myInfo-td col-12 padding-bottom"><input type="text" name="memberName" value="${ loginMember.memberName }" readonly></div>
							</div>
							<div class="col-lg-6">
								<div class="myInfo-td col-12">비밀번호 확인</div>
								<div class="myInfo-td col-12 padding-bottom"><input type="password" id="password-retype" placeholder="8~15자 영문,숫자 포함"
									<c:if test="${loginMember.memberId.matches('[0-9]+')}">readonly</c:if>></div>
								 <p class="mismatch-message hide" style="color:red; font-size: 12px; margin-top: -30px;">비밀번호가 일치하지 않습니다.</p>
							</div>
						</div>
						<div class="myInfo-tr row">
							<div class="col-lg-6">
								<div class="myInfo-td col-12">생년월일</div>
								<div class="myInfo-td col-12 padding-bottom"><input type="text" name="memberBirth" value="${ loginMember.memberBirth }" readonly></div>
							</div>
							<div class="col-lg-6">
								<div class="myInfo-td col-12">핸드폰 번호</div>
								<div class="myInfo-td col-12 padding-bottom">
									<input type="text" class="contain-button" id="phoneNumber" name="memberPhone" value="${ loginMember.memberPhone }"
										<c:if test="${loginMember.memberId.matches('[0-9]+')}">readonly</c:if>>
									<button class="paw_btn btn-filled" id="sendVerificationCodeBtn" type="button"
										<c:if test="${loginMember.memberId.matches('[0-9]+')}">disabled</c:if>>인증받기</button>
								</div>
							</div>
						</div>
						<div class="myInfo-tr row">
							<div class="col-lg-6">
								<div class="myInfo-td col-12">마이펫 이름</div>
								<div class="myInfo-td col-12 padding-bottom"><input type="text" id="memberPetName" name="memberPetName" value="${ loginMember.memberPetName }"></div>
							</div>
							<div class="col-lg-6">
								<div class="myInfo-td col-12">인증번호</div>
								<div class="myInfo-td col-12 padding-bottom">
									<!-- 인증번호를 히든으로 저장해서 보낸다 -->	                 	
		                 			<input type="hidden" name="generatedCode" id="generatedCode">
									<input type="text" id="verificationCode" class="contain-button"
										<c:if test="${loginMember.memberId.matches('[0-9]+')}">readonly</c:if>>
									<button class="paw_btn btn-filled" id="verifyCodeBtn" type="button"
										<c:if test="${loginMember.memberId.matches('[0-9]+')}">disabled</c:if>>확인</button>
								</div>
							</div>
						</div>
						<div class="myInfo-tr row">
							<div class="col-lg-6">
								<div class="myInfo-td col-12">마이펫 타입</div>
								<div class="myInfo-td col-12 padding-bottom">
									<select name="memberPetType" id="memberPetType">
									    <option value="골든 리트리버" <c:if test="${ loginMember.memberPetType eq '골든 리트리버' }">selected</c:if>>골든 리트리버</option>
									    <option value="포메라니안" <c:if test="${ loginMember.memberPetType eq '포메라니안' }">selected</c:if>>포메라니안</option>
									    <option value="프렌치 불도그" <c:if test="${ loginMember.memberPetType eq '프렌치 불도그' }">selected</c:if>>프렌치 불도그</option>
									    <option value="비숑 프리제" <c:if test="${ loginMember.memberPetType eq '비숑 프리제' }">selected</c:if>>비숑 프리제</option>
									    <option value="푸들" <c:if test="${ loginMember.memberPetType eq '푸들' }">selected</c:if>>푸들</option>
									    <option value="말티즈" <c:if test="${ loginMember.memberPetType eq '말티즈' }">selected</c:if>>말티즈</option>
									    <option value="시츄" <c:if test="${ loginMember.memberPetType eq '시츄' }">selected</c:if>>시츄</option>
									    <option value="요크셔 테리어" <c:if test="${ loginMember.memberPetType eq '요크셔 테리어' }">selected</c:if>>요크셔 테리어</option>
									    <option value="믹스견" <c:if test="${ loginMember.memberPetType eq '믹스견' }">selected</c:if>>믹스견</option>
									    <option value="기타" <c:if test="${ loginMember.memberPetType eq '기타' }">selected</c:if>>기타</option>
									</select>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="myInfo-td col-12">이메일</div>
								<div class="myInfo-td col-12 padding-bottom"><input type="text" id="email" name="memberEmail" value="${ loginMember.memberEmail }"
									<c:if test="${loginMember.memberId.matches('[0-9]+')}">readonly</c:if>></div>
							</div>
						</div>
					</div>
				</div>
				<!-- 하단 버튼 -->
				<div class="bottom-btn">
					<button type="submit" class="paw_btn" id="modify-btn">수정</button>
					<button type="button" class="paw_btn btn-filled" id="delete-btn">회원탈퇴</button>
				</div>
			</div>
		</div>
		</form>
    </div>
</div>
    <!-- 푸터 -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	
	<!-- js 추가 -->
	<script type="text/javascript" src="${path}/js/member/mypage/myInfo.js"></script>
		
<script>
    // 알림메세지를 띄움
    if(${ not empty msg }) {
        alert("${ msg }");
    }

    // 실행시켜야할 스크립트가 있으면 실행
    if(${ not empty script }) {
        ${ script }
    }
</script>
	
	

