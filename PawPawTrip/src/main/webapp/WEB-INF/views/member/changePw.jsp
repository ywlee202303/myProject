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
	<link rel="stylesheet" href="${path}/css/member/changePw.css">
	<link rel="stylesheet" href="${path}/css/member/member.css">
	
<section class="content container-fluid">
	<!-- 메인 -->
	<form class="container" action="${ path }/member/complete-pw" method="post">
        <!-- 비밀번호 변경 -->
        <section class="member-content main-box">
            <!-- navi -->
            <div class="navi">
                <div class="findbyid">
                    <a href="${ path }/member/find-id" style="color: #B29254;">아이디 찾기</a>
                </div>
                <div class="findbypwd">
                    <a href="${ path }/member/find-pw" style="color: #FFF;">비밀번호 찾기</a>
                </div>
            </div>
            
            <!-- 메인 비밀번호 변경 창 -->
            <div class="main-table">
                <div class="findId-table">
                    <div class="findId-tr row">
                        <div class="col-lg-3">새 비밀번호</div>
                        <div class="col-lg-9 findId-contain">
                            <input class="user_info_input_tag1" type="password" name="memberPw" id="password" placeholder="8~15자 영문, 숫자 포함"/>
                        </div>
                    </div>
                    <div class="findId-tr row">
                        <div class="col-lg-3">비밀번호 확인</div>
                        <div class="col-lg-9 findId-contain">
                            <input class="user_info_input_tag1" type="password" id="password-retype" placeholder="8~15자 영문, 숫자 포함"/>
                        </div>
                    </div>
                    
                <div style="text-align: center">
                    <button class="paw_btn1" id="submit-btn" type="submit">변경하기</button>
                </div>
            </div>
        </section>
    </form>
</section>

	<!-- 푸터 -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	
<script>

$('#submit-btn').on('click', function(event) {
    // 비밀번호 입력값 가져오기
    let password = $('#password').val();
    // 비밀번호 확인 입력값 가져오기
    let passwordRetype = $('#password-retype').val();

    // 비밀번호 정규식 체크
    function strongPassword(str) {
        return /^(?=.*[a-zA-Z])(?=.*[0-9])[a-zA-Z0-9]{8,15}$/.test(str);
    }

    // 비밀번호가 정규식과 일치하는지 확인
    if (!strongPassword(password)) {
        alert("비밀번호는 영문자와 숫자를 포함하여 8~15자여야 합니다.");
        event.preventDefault(); // 폼 제출 막기
        return;
    }

    // 비밀번호와 비밀번호 확인 값이 일치하는지 확인
    if (!isMatch(password, passwordRetype)) {
        alert("비밀번호와 비밀번호 확인 값이 일치하지 않습니다.");
        event.preventDefault(); // 폼 제출 막기
        return;
    }
});

</script>
