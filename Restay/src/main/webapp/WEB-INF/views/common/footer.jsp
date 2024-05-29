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
            <div class="bottom">
                <hr>
                <div style="float:left;">
                    <p>
                        (주)리스테이 주소 : 서울특별시 중구 남대문로 120 그레이츠 청계(구 대일빌딩) 2F, 3F<br> 
                        대표이사 : 영우찬<br>
                        사업자등록번호 : 000-00-00000<br>
                        (주)리스테이는 통신판매중개자로서 통신판매의 당사자가 아니며, 상품의 예약, 이용 및 환불 등과 관련한 의무와 책임은
                        각 판매자에게 있습니다.
                    </p>
                </div>
                <div class="logo">
                    <img src="${ path }/img/RESTAY.png" alt="">
                </div>
            </div>
        </div>

    </div>
</footer>
</body>
</html>