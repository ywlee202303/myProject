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
	<link rel="stylesheet" href="${path}/css/member/findId.css">
	<link rel="stylesheet" href="${path}/css/member/member.css">
	
<section class="content container-fluid">
	<!-- 메인 -->
	<form class="container" action="${ path }/member/complete-id" method="post">
        <!-- 아이디찾기 -->
        <section class="member-content main-box">
            <!-- navi -->
            <div class="navi">
                <div class="findbyid">
                    <a href="${ path }/member/find-id" style="color: #FFF;">아이디 찾기</a>
                </div>
                <div class="findbypwd">
                    <a href="${ path }/member/find-pw" style="color: #B29254;">비밀번호 찾기</a>
                </div>
            </div>
            
            <!-- 메인 아이디 찾기 창 -->
            <div class="main-table">
                <div class="findId-table">
                    <div class="findId-tr row">
                        <div class="col-lg-3">이름</div>
                        <div class="col-lg-9 findId-contain">
                            <input class="user_info_input_tag1" type="text" name="memberName" id="" />
                           	<button class="col-12 paw_btn2" type="button" style="visibility: hidden;">숨기기</button>
                        </div>
                    </div>
                    <div class="findId-tr row">
                        <div class="col-lg-3">휴대폰 번호</div>
                        <div class="col-lg-9 findId-contain" style="display:inline-flex;">
                            <input class="contain-button" type="text" name="memberPhone" id="phoneNumber" placeholder="휴대폰 번호 '-' 제외하고 입력" />
                            <button class="col-12 paw_btn2" type="button" id="sendVerificationCodeBtn">인증받기</button>
                        </div>
                    </div>
                    <div class="findId-tr row">
                        <div class="col-lg-3"></div>
                        <div class="col-lg-9 findId-contain">
	                        <!-- 인증번호를 히든으로 저장해서 보낸다 -->	                 	
		                 	<input type="hidden" name="generatedCode" id="generatedCode">
                            <input class="user_info_input_tag2" type="text" id="verificationCode" placeholder="인증번호 입력" />
                        	<button class="col-12 paw_btn2" type="button" id="verifyCodeBtn">확인</button>
                        </div>
                    </div>
                </div>
                <div style="text-align: center">
                    <button class="paw_btn1" id="submit-btn" type="submit">아이디 찾기</button>
                </div>
            </div>
        </section>
    </form>
</section>

	<!-- 푸터 -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	
<script>
$(document).ready(function() {
	var generatedCode = Math.floor(Math.random() * 100000) + 100000;
	
	//인증번호 전송 버튼 클릭 시
	$('#sendVerificationCodeBtn').click(function(){

        $("#generatedCode").val(generatedCode);  // 난수로 생성된 인증번호를 hidden name : generatedCode에 숨긴다
		
		let memberPhone = $('#phoneNumber').val(); // 휴대폰 번호 입력란의 값을 가져와 'memberPhone' 변수에 할당
		
		$.ajax({
			type: "POST",
			url:'/pawpawtrip/send-one',
			data: {
				memberPhone,
				generatedCode
			},
			success: function(res){
				alert('인증번호가 전송되었습니다.');
			},
			error: function(error) {
				alert('인증번호 전송에 실패하였습니다.');
			}
		})
	});	
	
	// 확인 버튼 클릭 시   
	$("#verifyCodeBtn").on('click', verifyCode);
	
	// 인증 번호 확인
	function verifyCode() {
	    var inputCode = $("#verificationCode").val();
	    
	    if (parseInt(inputCode) === generatedCode) {
	        alert("인증에 성공하였습니다.");
	    } else {
	        alert("인증에 실패하였습니다. 올바른 인증번호를 입력하세요.");
	    }
	}
	
	// 인증번호 일치 시, 아이디 찾기 폼 submit
	$("#submit-btn").on('click', checkNum);
	
	function checkNum() {
		if (parseInt($("#verificationCode").val()) !== generatedCode) {
	    	// 인증번호가 맞지 않을 시 폼 제출 막기
	        event.preventDefault();
	        alert("인증번호를 확인해주세요.");
		}
	}
});	
</script>
