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

<link rel="stylesheet" href="${path}/css/member/enroll.css">
<link rel="stylesheet" href="${path}/css/member/member.css">

<!-- 메인 -->
<section class="content container-fluid">
	<div class="container">
		<div class="member-content">
	    <!-- navi -->
	    <div class="navi">
	        <div class="findbyid">
	            <a href="${ path }/enroll" style="color: #FFF;">회원가입</a>
	        </div>
	    </div>
	    <form action="${ path }/enroll" method="POST" id="enroll-form">
	     <div class="main_div">
	    	<!-- 약관동의 -->
	         <h3>약관 동의</h3>
	         <div class="inner_top_div">
	             <input type="checkbox" name="all_Agree" id="all_Agree" />
	             <label for="all_Agree">전체 동의하기</label> <br />
	             <input type="checkbox" class="options" id="required_option1" />
	             <label for="required_option1"
	                 ><span class="required_option">(필수)</span> 만 15세 이상입니다. <span class="manual"><a href="#">(약관보기)</a></span></label
	             >
	             <br />
	             <input type="checkbox" class="options" id="required_option2" />
	             <label for="required_option2"
	                 ><span class="required_option">(필수)</span> 서비스 이용약관동의 <span class="manual"><a href="#">(약관보기)</a></span></label
	             >
	             <br />
	             <input type="checkbox" class="options" id="required_option3" />
	             <label for="required_option3"
	                 ><span class="required_option">(필수)</span> 개인정보 수집 및 이용 동의 <span class="manual"><a href="#">(약관보기)</a></span></label
	             >
	             <br />
	             <input type="checkbox" class="options" id="select_option1" name="mrktAgreeYn" value="Y" />
	             <label for="mrktAgreeYn"
	                 ><span class="select_option">(선택)</span> 개인정보수집 및 이용 동의 - 마케팅 <span class="manual"><a href="#">(약관보기)</a></span></label
	             >
	             <br />
	             <input type="checkbox" class="options" id="select_option2" name="recvAgreeYn" value="Y"/>
	             <label for="recvAgreeYn"
	                 ><span class="select_option">(선택)</span> 광고성 정보 이메일/SMS 수신 동의 <span class="manual"><a href="#">(약관보기)</a></span></label
	             >
	             <br />
	             <input type="checkbox" class="options" id="select_option3" name="locaAgreeYn" value="Y" />
	             <label for="locaAgreeYn"
	                 ><span class="select_option">(선택)</span> 위치 정보 수집 및 이용 동의 <span class="manual"><a href="#">(약관보기)</a></span></label
	             >
	             <br />
	         </div>
	         <!-- 회원가입 테이블 -->
	         <div class="enroll-table">
	             <div class="enroll-tr row">
	                 <div class="col-lg-3">이름</div>
	                 <div class="col-lg-9"><input type="text" id="memberName" name="memberName" maxlength='10'/></div>
	             </div>
	             <div class="enroll-tr row">
	                 <div class="col-lg-3">생년월일</div>
	                 <input type="hidden" id="memberBirth" name="memberBirth" value="">
	                 <div class="info enroll-contain col-lg-9" id="info__birth">
	                     <select name="yy" id="birth-year">
	                         <option disabled selected>출생 연도</option>
	                     </select>
	                     <select name="mm" id="birth-month">
	                         <option disabled selected>월</option>
	                     </select>
	                     <select name="dd" id="birth-day">
	                         <option disabled selected>일</option>
	                     </select>
	                 </div>
	             </div>
	             <div class="enroll-tr row">
	                 <div class="col-lg-3">아이디</div>
	                 <div class="col-lg-9 enroll-contain">
	                 	<input type="text" name="memberId" id="memberId" placeholder="5~12자 영문, 숫자 포함" />
	                 	<button type="button" id="checkDuplicate" class="col-12 enroll-btn">중복확인</button>
	                 </div>
	             </div>
	             <div class="enroll-tr row">
	                 <div class="col-lg-3">비밀번호</div>
	                 <div class="col-lg-9">
	                 	<input type="password" name="memberPw" id="password" placeholder="8~15자 영문, 숫자 포함" />
	                 </div>
	             </div>
	             <p class="strongPassword-message hide" style="color:red; font-size: 12px; margin-top: -15px;">8~15자 영문, 숫자를 포함하여 입력하세요.</p>
	             <div class="enroll-tr row">
	                 <div class="col-lg-3">비밀번호 확인</div>
	                 <div class="col-lg-9">
	                 	<input type="password" id="password-retype" placeholder="8~15자 영문, 숫자 포함" />
	                 </div>
	             </div>
	             <p class="mismatch-message hide" style="color:red; font-size: 12px; margin-top: -15px;">비밀번호가 일치하지 않습니다.</p>
	             <div class="enroll-tr row">
	                 <div class="col-lg-3">휴대폰 번호</div>
	                 <div class="col-lg-9 enroll-contain">
	                 	<input type="text" id="phoneNumber" name="memberPhone" placeholder="휴대폰 번호 '-' 제외하고 입력" />
	                 	<button type="button" class="col-12 enroll-btn" id="sendVerificationCodeBtn">인증받기</button>
	                 </div>
	             </div>
	             <div class="enroll-tr row">
	                 <div class="col-lg-3"></div>
	                 <div class="col-lg-9 enroll-contain">
	                 	<!-- 인증번호를 히든으로 저장해서 보낸다 -->	                 	
	                 	<input type="hidden" name="generatedCode" id="generatedCode">
	                 	<input type="text" id="verificationCode" placeholder="인증번호 입력" />
	                 	<button type="button" class="col-12 enroll-btn" id="verifyCodeBtn">확인</button>
	                 </div>
	             </div>
	             <div id="verificationResult"></div>
	             <div class="enroll-tr row">
	                 <div class="col-lg-3">이메일</div>
	                 <input type="hidden" id="memberEmail" name="memberEmail" value="">
	                 <div class="e-mail enroll-contain col-lg-9">
	                     <input id="email-id" type="text" />
	                     <span>@</span>
	                     <input id="domain-txt" type="text"/>
	                     <select id="domain-list">
	                         <option value="type">직접 입력</option>
	                         <option value="naver.com">naver.com</option>
	                         <option value="gmail.com">gmail.com</option>
	                         <option value="hanmail.net">hanmail.net</option>
	                         <option value="nate.com">nate.com</option>
	                         <option value="kakao.com">kakao.com</option>
	                     </select>
	                 </div>
	             </div>
	             <div class="enroll-tr row">
	                 <div class="col-lg-3">마이펫 이름</div>
	                 <div class="col-lg-9">
	                 	<input type="text" name="memberPetName" id="memberPetName" minlength="1" maxlength="10"/>
	                 </div>
	             </div>
	             <div class="enroll-tr row">
	                 <div class="col-lg-3">마이펫 타입</div>
	                 <div class="pet-type col-lg-9 enroll-contain">
	                 	<select name="memberPetType" id="memberPetType">
	                         <option value="골든 리트리버">골든 리트리버</option>
	                         <option value="포메라니안">포메라니안</option>
	                         <option value="프렌치 불도그">프렌치 불도그</option>
	                         <option value="비숑 프리제">비숑 프리제</option>
	                         <option value="말티즈">말티즈</option>
	                         <option value="푸들">푸들</option>
	                         <option value="시츄">시츄</option>
	                         <option value="요크셔 테리어">요크셔 테리어</option>
	                         <option value="믹스견">믹스견</option>
	                         <option value="기타">기타</option>
	                    </select>
	                    <button type="button" class="col-12 enroll-btn" style="visibility: hidden;">숨기기</button>
	                 </div>
	             </div>
	         </div>
	     </div>
	     <div class="signInBtn">
			 <button type="submit" id="bottom-btn" class="bottom-btn">회원가입</button>
			 <button type="reset" class="reset-btn">다시작성</button>
	     </div>
	    </form>
		</div>
    </div>
</section>

<!-- 푸터 -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />

<!-- js 추가 -->
<script type="text/javascript" src="${path}/js/member/enroll.js"></script>




