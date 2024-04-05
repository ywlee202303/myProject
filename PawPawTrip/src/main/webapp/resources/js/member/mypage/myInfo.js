
$(document).ready(function() {
	// 카카오 계정 접속 시, 버튼 비활성화
    if (/^\d+$/.test("${loginMember.memberId}")) {
        $("#sendVerificationCodeBtn").prop("disabled", true);
        $("#verifyCodeBtn").prop("disabled", true);
    }

/**** 탈퇴 버튼 클릭 *****/
	$('#delete-btn').on('click', () => {
			if (confirm('정말로 탈퇴하시겠습니까?')) {
				location.replace('${ path }/member/mypage/delete');
			}
		});

/**** 비밀번호 확인 *****/		
	// 1. 비밀번호 입력창 정보 가져오기
    let elInputPassword = $('#password');
    // 2. 비밀번호 확인 입력창 정보 가져오기
    let elInputPasswordRetype = $('#password-retype');
    // 3. 실패 메시지 정보 가져오기 (비밀번호 불일치)
    let elMismatchMessage = $('.mismatch-message');
    // 4. 실패 메시지 정보 가져오기 (8글자 이상, 영문, 숫자 미사용)
    let elStrongPasswordMessage = $('.strongPassword-message');

    // 비밀번호 정규식 체크
    function strongPassword(str) {
        return /^(?=.*[a-zA-Z])(?=.*[0-9])[a-zA-Z0-9]{8,15}$/.test(str);
    }
    // 비번 일치 확인
    function isMatch(password1, password2) {
		return password1 === password2;
    }
    
	// 비밀번호 조건에 맞게 입력했는지 체크
	elInputPassword.on('keyup', function() {
	    if (elInputPassword.val().length !== 0) {
	        if (strongPassword(elInputPassword.val())) {
	            elStrongPasswordMessage.addClass("hide"); // 실패 메시지가 가려져야 함
	        } else {
	            elStrongPasswordMessage.removeClass("hide"); // 실패 메시지가 보여야 함
	        }
	    }
	    else {
	        elStrongPasswordMessage.addClass("hide");
	    }
	});
	
	// 비밀번호, 비밀번호 확인 일치여부 체크
	elInputPasswordRetype.on('keyup', function() {
	    if (elInputPasswordRetype.val().length !== 0) {
	        if (isMatch(elInputPassword.val(), elInputPasswordRetype.val())) {
	            elMismatchMessage.addClass('hide'); // 실패 메시지가 가려져야 함
	        }
	        else {
	            elMismatchMessage.removeClass('hide'); // 실패 메시지가 보여야 함
	        }
	    }
	    else {
	        elMismatchMessage.addClass('hide'); // 실패 메시지가 가려져야 함
	    }
	});
	
/**** 번호 인증하기 *****/
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

/**** 이메일 정규식 *****/	
	// 이메일 정규식 체크
	function emailCheck(str) {
		return /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-za-z0-9\-]+/.test(str);
	}
	
/**** 수정 활성화 *****/
	// 회원가입 버튼 클릭 시
	$('#modify-btn').on('click', allcheck);
	
	// 최종 회원가입 활성화
	function allcheck(event) {
	    // 필드가 모두 채워져 있는지 확인
	    if (!validateForm()) {
	        // 필드가 모두 채워지지 않았을 경우 폼 제출 막기
	        event.preventDefault();
	        // 경고창 표시
	        alert('모든 항목을 작성해주세요.');
    	} else if (!emailCheck($("#email").val())) {
	        // 이메일 형식이 올바르지 않으면 폼 제출 막기
	        event.preventDefault(); 
	        alert('올바른 이메일을 입력해주세요.');
		} 
	}
	
	// 모든 필드가 채워져 있는지 확인하는 함수
	function validateForm() {
	    let memberPhone = $('#phoneNumber').val();
	    let memberEmail = $('#email').val();
	    let memberPetName = $('#memberPetName').val();
	    let memberPetType = $('#memberPetType').val();

	
	    // 필드가 모두 채워져 있는지 확인
	    if (memberPhone && 
	        memberEmail && 
	        memberPetName && 
	        memberPetType
	    ) {
	        // 모든 필드가 채워져 있으면 true 반환
	        return true;
	    } else {
	        // 하나라도 비어있으면 false 반환
	        return false;
	    }
	}

});	

