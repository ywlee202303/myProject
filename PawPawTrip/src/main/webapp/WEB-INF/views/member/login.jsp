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
<link rel="stylesheet" href="${path}/css/member/login.css">
<link rel="stylesheet" href="${path}/css/member/member.css">



    <!--메인 로그인 창-->
<section class="content container-fluid">
	<div class="container">
		<div class="member-content member-login">
		    <form action="${ path }/login" id="login-form" method="post">
		        <!--로고-->
		        <div id="biglogo" onclick="location.href='${path}/'">
		            <img src="${ path }/img/member/big_logo.png" alt="로고" style="width: 250px" />
		        </div>
		        <!--로그인 창-->
		        <div class="first_div">
		            <div class="login-box">
		                <input type="text" name="memberId" value="${ cookie.saveId.value }" id="input_id" placeholder="아이디" />
		                <br />
		                <input type="password" name="memberPw" id="input_pass" placeholder="비밀번호" />
		                <div class="login_info_save">
		                    <!-- 아이디 저장 체크박스 -->
		                    <input type="hidden" id="saveId" name="saveId" value="${empty cookie.saveId ? "false" : "true"}" />
			                <input type="checkbox" id="login_info_save" ${ empty cookie.saveId ? "" : "checked" }/>
			                <label for="login_info_save">아이디 저장</label>
		                </div>
		                <button type="submit" class="login_btn">로그인</button>
		                <br /><br />
		                <div class="label_signAndIdPass">
		                    <div class="label_signup">
		                        <a class="a_btn" href="${ path }/enroll">회원가입</a>
		                    </div>
		                    <div class="label_id">
		                        <a class="a_btn" href="${ path }/member/find-id">아이디 찾기</a>
		                    </div>
		
		                    <div class="label_pass">
		                        <a class="a_btn" href="${ path }/member/find-pw">비밀번호 찾기</a>
		                    </div>
		                </div>
		    </form>
		                <br>
		                <!--간편 로그인-->
		                <div class="hr-sect">간편 로그인</div>
		                <br>
		                <a class="kakao_btn" href="https://kauth.kakao.com/oauth/authorize?client_id=5e374f58b3157eda0c7846d4ebda25f1&redirect_uri=	
	http://localhost:8080/pawpawtrip/kakaoLogin&response_type=code">
		                    <img src="https://madangs.com/re_public/images/social/kakao_symbol.svg" alt="" width="20px">
		                    <span>카카오 로그인</span>
		                </a>
		                <!--  
		                <div class="kakao_btn" onclick="javascript:loginWithKakao()">
		                </div>
		                -->
		            </div>
		        </div>
		</div>
	</div>
</section>
    
<!-- 푸터 -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />

<script>
$(document).ready(function() {
    $('#login_info_save').change(function() {
        // 아이디 저장 체크박스의 상태에 따라 hidden input의 값을 설정
        $('#saveId').val(this.checked);
    });
});
</script>
	
	


