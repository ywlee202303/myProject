<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>

<c:set var="path" value="${ pageContext.request.contextPath }" />

<footer class="footer">
        <div class="footer-wrap">
            <div class="guide">
                <div class="footer-menu-wrap">
                    <p><a href="#">ABOUT</a></p>
                    <p><a href="#">4POINT APPROACH</a></p>
                    <p><a href="#">NEWSLETTER</a></p>
                    <p><a href="#">CAREERS</a></p>
                </div>
                <div class="inquiry-wrap">
                    <p><b>고객센터</b>(10:00 ~ 16:00)</p>
                    <ul>
                        <li><a href="#">1:1문의</a></li>
                        <li><a href="#">입점 문의</a></li>
                        <li><a href="#">컨설팅 문의</a></li>
                        <li><a href="#">마케팅 제휴</a></li>
                        <li><a href="#">B2B 구매</a></li>
                    </ul>
                    <div class="bottom-wrap">
                        <span><a href="#">이용약관</a></span>
                        <span><a href="#"><b>개인정보 처리방침</b></a></span>
                    </div>
                </div>
                <div class="logo">
                    <img src="${ path }/img/RESTAY.png" alt="">
                </div>
                <div class="bottom">
                    <hr>
                    <div>
                        <p>
                            (주)리스테이
                            주소 : 서울특별시 중구 남대문로 120 그레이츠 청계(구 대일빌딩) 2F, 3F | 대표이사 : 정명훈 | 사업자등록번호 : 000-00-00000사업자정보확인<br>
                            전자우편주소 : help@goodchoice.kr | 통신판매번호 : 2017-서울강남-01779 | 관광사업자 등록번호 : 제0000-00호 | 전화번호 : 1234-6666 | 호스팅서비스제공자의 상호 표시 : (주)리스테이<br>
                            (주)리스테이는 통신판매중개자로서 통신판매의 당사자가 아니며, 상품의 예약, 이용 및 환불 등과 관련한 의무와 책임은 각 판매자에게 있습니다.
                        </p>
                    </div>
                </div>
            </div>
            
        </div>
    </footer>
</body>
</html>