<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
    prefix="security"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp" />

<link rel="stylesheet" href="${path}/css/findstay/FindStay.css">
<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" /> -->
<link rel="stylesheet" href="https://fastly.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />

<style>
	.disable {
		color: green !important;
		font-weight: bold;
	}

	.swiper {
        display: block;
        width: 350px;
        height: 230px;
        position: absolute;
        width: 350px;
        height: 230px;
        right: 0;
        top: 54px;
        border: 0;
        padding-top: 0;
        clear: both;
    }

    .swiper-slide {
        display: flex;
        text-align: center;
        font-size: 18px;
        background: #fff;
        justify-content: center;
        align-items: center;
    }

    .swiper-slide img {
        display: block;
        width: 100%;
        height: 100%;
        object-fit: cover;
    }

    .swiper {
        margin-left: auto;
        margin-right: auto;
    }

    .swiper-button-next {
        color: #fff;
    }

    .swiper-button-prev {
        color: #fff;
    }

    :root {
        -swiper-theme-color: #fff;
    }
    .likeStayBtn{
        background-color: transparent;
        position:absolute;
        cursor: pointer;
        color:white;
        z-index:10;
        left:5px;
        top:5px;
    }
</style>

<main>
<input type="hidden" id="contextPath" value="${path}"/>
<svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
  <symbol id="bootstrap" viewBox="0 0 118 94">
    <path fill-rule="evenodd" clip-rule="evenodd" d="M24.509 0c-6.733 0-11.715 5.893-11.492 12.284.214 6.14-.064 14.092-2.066 20.577C8.943 39.365 5.547 43.485 0 44.014v5.972c5.547.529 8.943 4.649 10.951 11.153 2.002 6.485 2.28 14.437 2.066 20.577C12.794 88.106 17.776 94 24.51 94H93.5c6.733 0 11.714-5.893 11.491-12.284-.214-6.14.064-14.092 2.066-20.577 2.009-6.504 5.396-10.624 10.943-11.153v-5.972c-5.547-.529-8.934-4.649-10.943-11.153-2.002-6.484-2.28-14.437-2.066-20.577C105.214 5.894 100.233 0 93.5 0H24.508zM80 57.863C80 66.663 73.436 72 62.543 72H44a2 2 0 01-2-2V24a2 2 0 012-2h18.437c9.083 0 15.044 4.92 15.044 12.474 0 5.302-4.01 10.049-9.119 10.88v.277C75.317 46.394 80 51.21 80 57.863zM60.521 28.34H49.948v14.934h8.905c6.884 0 10.68-2.772 10.68-7.727 0-4.643-3.264-7.207-9.012-7.207zM49.948 49.2v16.458H60.91c7.167 0 10.964-2.876 10.964-8.281 0-5.406-3.903-8.178-11.425-8.178H49.948z"></path>
  </symbol>
	<svg xmlns="http://www.w3.org/2000/svg" fill="white" class="bi bi-balloon-heart" viewBox="0 0 16 16" id="likeBalloon">
	  <path fill-rule="evenodd" d="m8 2.42-.717-.737c-1.13-1.161-3.243-.777-4.01.72-.35.685-.451 1.707.236 3.062C4.16 6.753 5.52 8.32 8 10.042c2.479-1.723 3.839-3.29 4.491-4.577.687-1.355.587-2.377.236-3.061-.767-1.498-2.88-1.882-4.01-.721zm-.49 8.5c-10.78-7.44-3-13.155.359-10.063q.068.062.132.129.065-.067.132-.129c3.36-3.092 11.137 2.624.357 10.063l.235.468a.25.25 0 1 1-.448.224l-.008-.017c.008.11.02.202.037.29.054.27.161.488.419 1.003.288.578.235 1.15.076 1.629-.157.469-.422.867-.588 1.115l-.004.007a.25.25 0 1 1-.416-.278c.168-.252.4-.6.533-1.003.133-.396.163-.824-.049-1.246l-.013-.028c-.24-.48-.38-.758-.448-1.102a3 3 0 0 1-.052-.45l-.04.08a.25.25 0 1 1-.447-.224l.235-.468ZM6.013 2.06c-.649-.18-1.483.083-1.85.798-.131.258-.245.689-.08 1.335.063.244.414.198.487-.043.21-.697.627-1.447 1.359-1.692.217-.073.304-.337.084-.398"/>
	</svg> 
	<svg xmlns="http://www.w3.org/2000/svg" fill="red" class="bi bi-balloon-heart-fill" viewBox="0 0 16 16" id="likeBalloon-filled">
	  <path fill-rule="evenodd" d="M8.49 10.92C19.412 3.382 11.28-2.387 8 .986 4.719-2.387-3.413 3.382 7.51 10.92l-.234.468a.25.25 0 1 0 .448.224l.04-.08c.009.17.024.315.051.45.068.344.208.622.448 1.102l.013.028c.212.422.182.85.05 1.246-.135.402-.366.751-.534 1.003a.25.25 0 0 0 .416.278l.004-.007c.166-.248.431-.646.588-1.115.16-.479.212-1.051-.076-1.629-.258-.515-.365-.732-.419-1.004a2 2 0 0 1-.037-.289l.008.017a.25.25 0 1 0 .448-.224l-.235-.468ZM6.726 1.269c-1.167-.61-2.8-.142-3.454 1.135-.237.463-.36 1.08-.202 1.85.055.27.467.197.527-.071.285-1.256 1.177-2.462 2.989-2.528.234-.008.348-.278.14-.386"/>
	</svg>
</svg>
	
    <!-- 1. 페이지 상단 -->
    <section class="section1">
        <div class="subTitle_img"></div>
    </section>

    <!-- 2. 페이지 중앙 -->
    <section class="container_findstay_bottom">
        <div class="flist_wrap">
            <c:forEach var="house" items="${houseList}">
                <div class="flist_box" id="${house.houseCode}">
                    <div class="flist_box_contents">
                        <div class="stay_Info_wrapper">
                            <div class="stayName" id="stay1_name">${house.houseName}</div>
                            <div class="stay_info">
                                <p class="address_info">
                                    <span>${house.houseArea} / ${house.houseSigungu}</span> <br> 기준 2명 (최대 4명) <br> 
                                    <span style="font-weight: 300; font-size: 14px" class="houseMinPrice" id="houseMinPrice">
                                        ${house.houseMinPrice}
                                    </span>
                                </p>
                                <p class="btn_more" onclick="location.href='${path}/findstay/room?houseCode=${house.houseCode}&checkIn=${checkIn}&checkOut=${checkOut}'">예약하기</p>
                            </div>
                        </div>

                        <div class="swiper flist_slider">
                            <div class="swiper-wrapper flist_slider_wrap">
                                <button class="likeStayBtn" houseCode="${house.houseCode}">
                                    <svg width="30" height="24"><use xlink:href="#likeBalloon"/></svg>
                                </button>
                                <c:forEach var="houseImage" items="${house.houseImages}">
                                    <div class="swiper-slide">
                                        <img src="${path}/upload/findstay/${houseImage.houseImageRenamedFileName}" alt="슬라이드 이미지1">
                                    </div>
                                </c:forEach>
                            </div>
                            <div class="swiper-button-next"></div>
                            <div class="swiper-button-prev"></div>
                            <div class="swiper-pagination"></div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <!-- 숙소 등록 버튼 -->
        <c:if test="${ loginMember.memberRole == 'ROLE_ADMIN' }">
	        <div class="add-restay-btn">
	            <button onclick="location.href='${path}/findstay/write'">등록</button>
	        </div>
        </c:if>
    </section>

    <!-- 3. 페이지 넘버 -->
    <section class="container_pageNum">
        <ul class="pageNum_box">
            <!-- 이전 페이지 -->
            <li id="pageNum_before">
                <a href="${path}/findstay?page=${pageInfo.prevPage}&checkIn=${checkIn}&checkOut=${checkOut}">&lt;</a></li>

            <!-- 5개 페이지 목록 -->
            <c:forEach var="current" begin="${pageInfo.startPage}" end="${pageInfo.endPage}">
                <c:choose>
                    <c:when test="${current == pageInfo.currentPage}">
                        <li><a class="disable">${current}</a></li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="${path}/findstay?page=${current}&checkIn=${checkIn}&checkOut=${checkOut}">${current}</a></li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>

            <!-- 다음 페이지 -->
            <li id="pageNum_next">
                <a href="${path}/findstay?page=${pageInfo.nextPage}&checkIn=${checkIn}&checkOut=${checkOut}">&gt;</a></li>
        </ul>
    </section>
</main>

<!-- <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script> -->
<script src="https://fastly.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

<script>
    let houseMinPrice = document.querySelectorAll('.houseMinPrice');
    
    for (let i = 0; i < houseMinPrice.length; i++) {
        houseMinPrice[i].innerHTML = '₩' + parseInt(houseMinPrice[i].innerHTML).toLocaleString() + ' ~';
    }

    var swiper = new Swiper(".flist_slider", {
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
    
    $('button.likeStayBtn>svg>use,button.likeStayBtn>svg,button.likeStayBtn>svg>use').on('click',(event)=>
    {
        let targetNodeName = $(event.target)[0].nodeName;
        //use일때는 다시 버블링이 일어나서 이벤트 버블을 제거
        if(targetNodeName==='use')
        {
            event.stopPropagation();
        }
        let targetEl  = targetNodeName==='use'?$(event.target): $(event.target).find('use');
        let houseCode = targetEl.parents('button.likeStayBtn').attr('houseCode');
        let action    = '';
        
        
        if(targetEl.attr('xlink:href') == '#likeBalloon')
        {
            targetEl.attr('xlink:href', '#likeBalloon-filled');
            action    = 'insert';
        }
        else
        {
            targetEl.attr('xlink:href', '#likeBalloon');
            action    = 'delete';
        }
        
        let path = $('#contextPath').val();

        $.ajax(
        {
            url         : path + '/findstay/saveInterestStay',
            type        : 'POST',
            contentType : 'application/json',
            dataType    : 'json',
            data        : JSON.stringify({
                houseCode,
                action
            }),
            success : (data)=>
            {
                if(data.result == 0)
                {
                    alert(data.resultMsg);
                    location.replace("${ pageContext.request.contextPath }"+ data.failLocation);
                }
            }
        });
    });
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
