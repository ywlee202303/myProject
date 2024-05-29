<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
    prefix="security"%>

<c:set var="path" value="${ pageContext.request.contextPath }" />

<jsp:include page="/WEB-INF/views/common/header.jsp" />
<link rel="stylesheet" href="${ path }/css/findstay/Room.css">
<link rel="stylesheet"
    href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />

<!-- Demo styles -->
<style>
html, body {
    position: relative;
    height: 100%;
}

body {
    font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
    font-size: 14px;
    color: #000;
    margin: 0;
    padding: 0;
}

.swiper {
    width: 100%;
    height: 100%;
}

.swiper-slide {
    text-align: center;
    font-size: 18px;
    background: #fff;
    display: flex;
    justify-content: center;
    align-items: center;
}

.swiper-slide img {
    display: block;
    width: 100%;
    height: 100%;
    object-fit: cover;
}

.swiper-button-next, .swiper-button-prev {
    color: black;
}
</style>

        <form id="formRoom" action="${path}/findstay/reserveRoom" method="POST">

<!-- 모달(언제) -->
<div class="modal-wrap-3">
    <div class="modal-3">
        <div class="modal-when-title-3">
            <img src="${ path }/img/close.png" alt="" class="modal-when-close-3">
        </div>
        <div class="modal-cal-wrap-3">
            <input type="hidden" name="check-in-3"  value="${chekcIn}"/>
            <input type="hidden" name="check-out-3" value="${chekcOut}"/>
            <input type="hidden" name="houseCode"   value="${houseCode}"/>
        </div>
    </div>
</div>

<main>
    <div class="findstay-logo-wrap">
        <div class="findstay-logo"></div>
    </div>

    <div class="findstayRoom-restay-container">
        <div>
            <p class="findstayRoom-restay-reservtext">BOOKING</p>
            <div class="findstayRoom-restay-title">
                <div class="findstayRoom-restay-title-name">${house.houseName}</div>
                <div class="findstayRoom-restay-title-date" id="selectDate"
                      style="font-size: 16px; color: #000; cursor: pointer; padding: 0 23px 0 0; background: #fff url(${path}/img/arw_select.png) no-repeat 100% 50%; background-size: 20px 20px;">
                      <c:if test="${checkIn eq ''}">
                        <div class="btn_select">날짜를 선택해주세요.</div>
                      </c:if>
                      <c:if test="${checkIn ne ''}">
                        <div class="btn_select">${checkIn} - ${checkOut} <em>${day}박</em></div>
                      </c:if>
                </div>
                <button type="button" id="reserveRoom" class="findstayRoom-restay-title-pay">
                      <c:if test="${checkIn ne ''}">
                            <fmt:formatNumber value="${ day * house.houseMinPrice}" type="currency"/>
                      </c:if>예약하기</button>
            </div>
            <div class="findstayRoom-restay-content">
                <div class="findstayRoom-restay-content-text">
                    <div class="findstayRoom-restay-content-info">
                        <p class="room-tit">ROOM INFORMATION</p>
                        <p class="room-name">${house.houseName}</p>
                        <input type="hidden" id="roomPrice" value="${house.houseMinPrice}"/>
                        <p class="room-price"><fmt:formatNumber value="${house.houseMinPrice}" type="currency"/>/박</p>
                        <p class="room-text">거실, 주방, 침실, 화장실, 테라스로 구성되어 있습니다.</p>
                    </div>
                    <div class="findstayRoom-restay-content-option">
                        <p>체크인 16:00 / 체크아웃 11:00</p>
                        <p>기준 인원 2명(최대 인원 3명)</p>
                        <p>객실면적 73㎡</p>
                        <p>퀸 침대1</p>
                    </div>
                </div>
                <div class="findstayRoom-restay-content-img">
                    <!-- Swiper -->
                    <div class="swiper mySwiper">
                       <div class="swiper-wrapper flist_slider_wrap">
                            <c:forEach var="houseImage" items="${house.houseImages}">
                                <div class="swiper-slide">
                                    <img src="${path}/upload/findstay/${houseImage.houseImageRenamedFileName}" alt="슬라이드 이미지1">
                                </div>
                            </c:forEach>
<!--                        <div class="swiper-wrapper"> -->
<!--                            <div class="swiper-slide"> -->
<%--                                <img src="${ path }/img/house/sunhyeonjae/sunhyeonjae1.jpg" --%>
<!--                                    alt="슬라이드 이미지1"> -->
<!--                            </div> -->
<!--                            <div class="swiper-slide"> -->
<%--                                <img src="${ path }/img/house/sunhyeonjae/sunhyeonjae2.jpg" --%>
<!--                                    alt="슬라이드 이미지2"> -->
<!--                            </div> -->
<!--                            <div class="swiper-slide"> -->
<%--                                <img src="${ path }/img/house/sunhyeonjae/sunhyeonjae3.jpg" --%>
<!--                                    alt="슬라이드 이미지3"> -->
<!--                            </div> -->
<!--                            <div class="swiper-slide"> -->
<%--                                <img src="${ path }/img/house/sunhyeonjae/sunhyeonjae4.jpg" --%>
<!--                                    alt="슬라이드 이미지3"> -->
<!--                            </div> -->
<!--                            <div class="swiper-slide"> -->
<%--                                <img src="${ path }/img/house/sunhyeonjae/sunhyeonjae5.jpg" --%>
<!--                                    alt="슬라이드 이미지3"> -->
<!--                            </div> -->
<!--                            <div class="swiper-slide"> -->
<%--                                <img src="${ path }/img/house/sunhyeonjae/sunhyeonjae6.jpg" --%>
<!--                                    alt="슬라이드 이미지3"> -->
<!--                            </div> -->
<!--                        </div> -->
                        </div>
                        <div class="swiper-button-next"></div>
                        <div class="swiper-button-prev"></div>
                        <div class="swiper-pagination"></div>
                    </div>
                </div>
            </div>
            <div class="findstayRoom-restay-content2">
                <div class="room-service">FEATURES</div>
                <ul class="room-service-ul">
                    <li>야외가구</li>
                    <li>실내 스파</li>
                    <li>정원</li>
                    <li>테라스</li>
                    <li>독립 키친</li>
                    <li>독립 화장실</li>
                    <li>썬베드</li>
                    <li>주차</li>
                </ul>
            </div>
            <div class="findstayRoom-restay-content3">
                <div class="room-service">AMENITIES</div>
                <ul>
                    <li>TV</li>
                    <li>냉장고</li>
                    <li>헤어드라이어</li>
                    <li>스피커</li>
                    <li>전기포트</li>
                    <li>전자레인지</li>
                    <li>인덕션</li>
                    <li>샴푸</li>
                    <li>컨디셔너</li>
                    <li>바디워시</li>
                    <li>핸드워시</li>
                    <li>치약</li>
                    <li>칫솔</li>
                    <li>타월</li>
                    <li>샤워가운</li>
                    <li>빗</li>
                    <li>바디스펀지</li>
                    <li>입욕제</li>
                    <li>와인오프너</li>
                    <li>와인잔</li>
                    <li>생수</li>
                    <li>토스터기</li>
                    <li>캡슐커피머신</li>
                    <li>티백</li>
                    <li>조리도구</li>
                    <li>룸슬리퍼</li>
                    <li>빅테이블</li>
                </ul>
            </div>
        </div>
    </div>
</main>

        </form>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />

<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
<!-- <script src="https://fastly.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script> -->

<script>
    let houseMinPrice = document.querySelectorAll('.houseMinPrice');
    
    for (let i = 0; i < houseMinPrice.length; i++) {
        houseMinPrice[i].innerHTML = '₩' + parseInt(houseMinPrice[i].innerHTML).toLocaleString() + ' ~';
    }

    var swiper = new Swiper(".mySwiper", {
        slidesPerView: 1,
        spaceBetween: 30,
        loop: true,
        loopedSlides: 1,
        pagination: {
            el: ".swiper-pagination",
            clickable: true
        },
        navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev"
        }
    });
    $('#selectDate').on('click',()=>
    {
        $(".modal-wrap-3").fadeIn();
    });
    
    $(".modal-when-close-3").on('click', () => {
        $(".modal-wrap-3").fadeOut();
    });

    // 달력
    $('input[name=check-in-3]').daterangepicker({
        autoUpdateInput: true,
        autoApply: true,
        autoClose: true,
        format: 'YYYY-MM-DD',
        inline:true,
        isShowing: true,
        alwaysShowCalendars:true,
        alwaysOpen:true,
        parentEl:'div.modal-cal-wrap-3',
        container:'div.check-in-3',
        locale: {
//         "separator": " ~ ",                     // 시작일시와 종료일시 구분자
        "format": 'YYYY-MM-DD',     // 일시 노출 포맷
        "applyLabel": "확인",                    // 확인 버튼 텍스트
        "cancelLabel": "취소",                   // 취소 버튼 텍스트
        "daysOfWeek": ["일", "월", "화", "수", "목", "금", "토"],
        "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"]
        }
    });
    
    $('input[name="check-in-3"]').on('apply.daterangepicker', function(ev, picker) {
        
        let startDate = picker.startDate.format('YYYY-MM-DD');
        let endDate   = picker.endDate.format('YYYY-MM-DD');
        let diff   = (new Date(endDate) - new Date(startDate))/(1000 * 3600 * 24);
        let roomPrice = $('#roomPrice').val();
        $(this).val(startDate);
        $('input[name="check-out-3"]').val(endDate);
        $('.btn_select').html(startDate + ' - ' + endDate + '<em>' + diff + '박</em>');
        $('.findstayRoom-restay-title-pay').html('₩ ' + (diff * roomPrice+'').replace(/\B(?=(\d{3})+(?!\d))/gi, ',') + '' + ' 예약하기');
        
        $(".modal-wrap-3").fadeOut();
    });
    
    
    $('#reserveRoom').on('click',()=>
    {
        if(!confirm('예약하시겠습니까?'))
        {
            return ;
        }
        let btnSelect = $('.btn_select').text();
        
        console.log(btnSelect);
        if(btnSelect === '날짜를 선택해주세요.') {
        	alert('날짜를 선택해주세요.');
        	
        	return false;
        } else {
	        let checkIn  = btnSelect.split(' ')[0];
	        let checkOut = btnSelect.split(' ')[2].slice(0, 10);
	        
	        console.log(checkIn);
	        console.log(checkOut);
	
	        $('input[name=check-in-3]').val(checkIn);
	        $('input[name=check-out-3]').val(checkOut);
	
	        
	        $('#formRoom').submit();
        }
    });
</script>