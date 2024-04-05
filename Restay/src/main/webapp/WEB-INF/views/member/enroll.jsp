<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp" />
<link rel="stylesheet" href="${ path }/css/member/enroll.css">

<body>
    <main>
        <section class="section1">
            <div class="join_title"></div>
            <hr>
        </section>

        <!-- 회원가입 사용자 정보 입력 부분  -->
        <section class="section2">
            <form action="${ path }/enroll" method="post">
                <div class="input_wrap">
                    
                    <!-- 이메일 -->
                    <div class="input_box">
                        <label for="userEmail">이메일</label>
                        <input type="email" name="userEmail" id="userEmail" placeholder="'@'까지 정확하게 이메일을 입력하세요." required>
                    </div>


                    <div class="input_box">
                        <!-- 이름 -->
                        <label for="userName">이름</label>
                        <input type="text" name="userName" id="userName" placeholder="이름을 입력하세요." required>
                    </div>


					<div class="input_box">
                            <!-- 비밀번호 -->
                            <label for="userPwd">비밀번호</label>
                            <input type="password" name="userPwd" id="userPwd" maxlength="20" minlength="8" placeholder="비밀번호를 입력하세요." required >
                            <input type="button" class="img-button">
                        </div>
    
    
                        <div class="input_box">
                            <!-- 비밀번호 조건 pwd_checked -->
                            <ul class="pwd_checked">
                                <li>영문</li>
                                <li>숫자</li>
                                <li>8자 이상 20자 이하</li>
                            </ul>
                            <input type="password" name="pwdChecked" id="pwdChecked" maxlength="20" minlength="8" placeholder="비밀번호를 한 번 더 입력하세요." required >
                            <input type="button" class="img-button">
                    </div>
                            <div id="passwordMismatch">비밀번호가 일치하지 않습니다.</div>	


                    <div class="input_box">
                        <!-- 휴대폰 번호 -->
                        <label for="userPhone">휴대폰번호</label>
                        <input type="tel" name="userPhone" id="userPhone" placeholder="- 없이 휴대폰번호를 입력하세요." required>
                    </div>
                </div>

                <!-- 인증번호 버튼 -->
                <button onclick="" class="btn_phoneChecked">인증번호 발송</button>

                <!-- 약관 동의 -->
                <div class="agree">
                    <ul class="agree_wrap">
                        <li class="agree_all">
                            <label class="check_skin" for="check_all">
                                <input class="agree_check" type="checkbox" id="check_all" value="all" required>
                                사용자 약관 전체 동의
                            </label>
                        </li>

                        <li>
                            <label class="check_skin" for="check_service">
                                <input class="agree_check" type="checkbox" id="check_service" value="serviceAgree" required>
                                서비스 이용 약관 동의(필수)
                            </label>
                        </li>

                        <li>
                            <label class="check_skin" for="check_privacy">
                                <input class="agree_check" type="checkbox" id="check_privacy" value="privacyAgree" required>
                                개인정보 수집 이용 동의 (필수)
                            </label>
                        </li>

                        <li>
                            <label class="check_skin" for="check_above">
                                <input class="agree_check" type="checkbox" id="check_above" value="aboveAree" required>
                                만 14세 이상 확인 (필수)
                            </label>
                        </li>
                    </ul>
                </div>

                <!-- 회원가입 버튼 -->
                <button type="submit" class="btn_join">회원가입</button>
            </form>
        </section>
    </main>
</body>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />