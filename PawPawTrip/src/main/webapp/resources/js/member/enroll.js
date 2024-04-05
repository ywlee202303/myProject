
$(document).ready(function() {
/************************* 약관동의 *************************/
    // 전체 동의하기
    $("#all_Agree").on("click", function() {
        $(".options").prop("checked", this.checked);
    });
    
    $(".options").on("change", function() {
        if ($(".options:checked").length === $(".options").length) {
            $("#all_Agree").prop("checked", true);
        } else {
            $("#all_Agree").prop("checked", false);
        }
    });

    // 체크박스 선택 시 value 값 부여
    $('.options').change(valueChange);
    
    function valueChange() {
        var value = $(this).is(':checked') ? 'Y' : 'N';
        $(this).val(value);
    }

/************************* 이메일 *************************/
	// 도메인 직접 입력 or domain option 선택
    $('#domain-list').on('change', function(event) {
        // option에 있는 도메인 선택 시
        if ($(this).val() !== "type") {
            // 선택한 도메인을 input에 입력하고 disabled
            $('#domain-txt').val($(this).val());
            $('#domain-txt').prop('disabled', true);
        } else {
            // input 내용 초기화 & 입력 가능하도록 변경
            $('#domain-txt').val("");
            $('#domain-txt').prop('disabled', false);
        }
    });
    
    // 이메일 합치기
    $('#enroll-form').on('submit', () => {
        let emailId     = $('#email-id').val();
        let domainId    = $('#domain-txt').val();
        let memberEmail = "";
        
        memberEmail     = emailId + "@" + domainId;
        
        $('#memberEmail').val(memberEmail);
    });
    
/************************* 생년월일 *************************/
    // '출생 연도' 셀렉트 박스 option 목록 동적 생성
    let birthYearEl = $('#birth-year');
    // option 목록 생성 여부 확인
    let isYearOptionExisted = false;
    birthYearEl.on('focus', function () {
      // year 목록 생성되지 않았을 때 (최초 클릭 시)
      if(!isYearOptionExisted) {
        isYearOptionExisted = true;
        for(var i = 1940; i <= 2024; i++) {
          // option element 생성
          let YearOption = $('<option>').attr('value', i).text(i);
          // birthYearEl의 자식 요소로 추가
          $(this).append(YearOption);
        }
      }
    });
    
    // '출생 월' 셀렉트 박스 option 목록 동적 생성
    let birthMonthEl = $('#birth-month');
    // option 목록 생성 여부 확인
    let isMonthOptionExisted = false;
    birthMonthEl.on('focus', function () {
      // month 목록 생성되지 않았을 때 (최초 클릭 시)
      if(!isMonthOptionExisted) {
        isMonthOptionExisted = true;
        for(var i = 1; i <= 12; i++) {
          // option element 생성
          let MonthOption = $('<option>').attr('value', i).text(i);
          // birthMonthEl의 자식 요소로 추가
          $(this).append(MonthOption);
        }
      }
    });
    
    // '출생 일' 셀렉트 박스 option 목록 동적 생성
    let birthDayEl = $('#birth-day');
    // option 목록 생성 여부 확인
    let isDayOptionExisted = false;
    birthDayEl.on('focus', function () {
      // day 목록 생성되지 않았을 때 (최초 클릭 시)
      if(!isDayOptionExisted) {
        isDayOptionExisted = true;
        for(var i = 1; i <= 31; i++) {
          // option element 생성
          let DayOption = $('<option>').attr('value', i).text(i);
          // birthDayEl의 자식 요소로 추가
          $(this).append(DayOption);
        }
      }
    });
 
    // 생년월일 합치기
    $('#enroll-form').on('submit', () => {
        let year = $('#birth-year').val();
        let month = $('#birth-month').val();
        let day = $('#birth-day').val();
        let memberBirth = "";
        
        month = month < 10 ? '0' + month : month;
        day = day < 10 ? '0' + day : day; 
        
        memberBirth = year + month + day;
        
        $('#memberBirth').val(memberBirth);
    });

/************************* 비밀번호/비밀번호 확인 *************************/
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
	
/************************* 아이디 *************************/
	// 아이디 중복체크 & 정규식 확인
	$('#checkDuplicate').on('click', function(event) {
	    checkDuplicate(false); // 아이디 중복확인 및 정규식 확인 실행
	});
	
	function checkDuplicate(enrollFlag) {
	    let memberId = $('#memberId').val().trim();
	    const exp = /^(?=.*[a-zA-Z])(?=.*[0-9])[a-zA-Z0-9]{5,12}$/;
	    const result = exp.test($("#memberId").val());
	    let flag = true; // flag 변수를 사용하여 아이디 중복 여부를 체크
	    
	    if (memberId === '') {
	        alert('아이디를 입력해 주세요.');
	        flag = false; // 아이디가 비어있으면 flag를 false로 설정
	    } else if (!result) {
	        alert('아이디는 영문, 숫자를 포함하여 5~12자 이내로 입력하세요.');
	        flag = false; // 아이디가 비어있으면 flag를 false로 설정
	    } else {
	        $.ajax({
	            type: 'GET',
	            url: '/pawpawtrip/member/idCheck',
	            dataType: 'json',
	            async: false, // 동기적으로 실행되도록 설정하여 flag 변수를 즉시 반환
	            data : {
	                memberId
	            },
	            success : function(obj) {
	                console.log(obj);
	                
	                if (obj.duplicate) {
	                    alert('이미 사용중인 아이디 입니다.');
	                    flag = false; // 아이디가 중복되면 flag를 false로 설정
	                } else 
	                {
	                	// 회원가입일 때만 true가 들어오게했다.
		                if(!enrollFlag)
		                {
		                    alert('사용 가능한 아이디 입니다.');
		                }
	                }
	            },
	            error: function(error) {
	                console.log(error);    
	            }
	        });
	    }
	    return flag; // flag 변수 반환
	}
	
/************************* 휴대폰 번호 인증(랜덤 6자리 수 생성) / 인증번호 일치 확인 *************************/
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
	
	/*
	*/
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

	/*
	// 랜덤 수 생성 변수 선언   
	var generatedCode = null;
	
	// 인증하기 버튼 클릭 시
	$("#sendVerificationCodeBtn").on('click', phoneCode);
	
	// 핸드폰 인증 번호 발송
	function phoneCode() {
	    generatedCode = Math.floor(100000 + Math.random() * 900000);
	    //alert("휴대폰으로 전송된 인증번호 : " + generatedCode);
	}
	*/
	
	
	
/************************* 회원가입 활성화 *************************/
	// 회원가입 버튼 클릭 시
	$('#bottom-btn').on('click', allcheck);
	
	// 최종 회원가입 활성화
	function allcheck(event) {
	    // 필드가 모두 채워져 있는지 확인
	    if (!validateForm()) {
	        // 필드가 모두 채워지지 않았을 경우 폼 제출 막기
	        event.preventDefault();
	        // 경고창 표시
	        alert('모든 항목을 작성해주세요.');
	    } else if (!isMatch(elInputPassword.val(), elInputPasswordRetype.val())) {
	    	// 비밀번호 형식 및 일치하지 않으면 폼 제출 막기
        	event.preventDefault(); 
        	alert('비밀번호를 확인해주세요.');
        } else if (parseInt($("#verificationCode").val()) !== generatedCode) {
        	// 인증번호가 맞지 않을 시 폼 제출 막기
	        event.preventDefault(); 
	        alert("인증번호를 확인해주세요.");
    	} else if (!checkDuplicate(true)) {
	        // 아이디 중복 확인 및 정규식 확인 실행
	        event.preventDefault();
    	}
	}
	

	// 모든 필드가 채워져 있는지 확인하는 함수
	function validateForm() {
	    let option1 = $('#required_option1').prop('checked');
	    let option2 = $('#required_option2').prop('checked');
	    let option3 = $('#required_option3').prop('checked');
	    let memberName = $('#memberName').val();
	    let year = $('#birth-year').val();
	    let month = $('#birth-month').val();
	    let day = $('#birth-day').val();
	    let memberId = $('#memberId').val();
	    let memberPw = $('#password').val();
	    let memberPwCheck = $('#password-retype').val();
	    let memberPhone = $('#phoneNumber').val();
	    let phoneCheck = $('#verificationCode').val();
	    let inputEmail = $('#email-id').val();
	    let selectDomain = $('#domain-txt').val();
	    let memberPetName = $('#memberPetName').val();
	    let memberPetType = $('#memberPetType').val();
	
	    // 필드가 모두 채워져 있는지 확인
	    if (option1 && 
	        option2 && 
	        option3 && 
	        memberName &&
	        year &&
	        month &&
	        day &&
	        memberId && 
	        memberPw && 
	        memberPwCheck && 
	        memberPhone &&
	        phoneCheck && 
	        inputEmail && 
	        selectDomain &&  
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

