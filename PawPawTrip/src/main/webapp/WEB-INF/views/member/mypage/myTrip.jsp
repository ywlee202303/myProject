<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<!-- **************** 헤더 *************** -->
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<link rel="stylesheet" href="${path}/css/member/mypage/myTrip.css">

<!-- **************** 바디 *************** -->
<div class="content">
   <div class="container">
   
      <!-- 메인 메뉴 -->
      <div class="common-title">
         <p>내가 찜한 장소</p>
      </div>
      
      <!-- 사이드 바 메뉴 -->
      <div class="common-sideMenu">
         <ul>
            <li class="community-text">마이페이지</li>
            <li class="notice-text"><a href="${path}/member/mypage/my-info">회원 정보 수정</a></li>
            <li class="notice-text"><a href="${path}/member/mypage/my-board">내가 쓴 게시글</a></li>
            <li class="board-text"><a href="${path}/member/mypage/my-trip">내가 찜한 장소</a></li>
         </ul>
      </div>
      
      <!-- 컨텐츠 -->
      <div class="common-list" style="margin-top: 28px;">
         <div class="common-detail-list no-row">
            <div class="row">
            
                <!-- 찜한 장소가  없을 때 -->
                    <c:if test="${ empty myTrips }">
                       <div class="emptyTripHeight">
	                       <p style=" height: 200px; font-weight: 500; line-height: 300px; ">조회된 게시물이 없습니다.</p>
	                       <button class="btnGoSpot" onclick="location.href='${ path }/trip/spot'">관광지 둘러보기</button>
	                       <button class="btnGoStay" onclick="location.href='${ path }/trip/stay'">숙소 둘러보기</button>
                       </div>
                    </c:if>
                    
                    <!-- 찜한 장소가 있을 때 -->
                    <c:forEach var="myTrip" items="${ myTrips }">
                    <div class="col-md-4">
                     
                     <!-- 컨텐츠 타입에따라 이동할 URL 변경 -->
                     <c:if test="${ myTrip.contentType == '관광지' }">
                        <a href="${ path }/trip/spot/spotDetail?id=${myTrip.contentId}" style="text-decoration: none;">
                     </c:if>
                     <c:if test="${ myTrip.contentType == '숙소' }">
                        <a href="${ path }/trip/stay/stayDetail?id=${myTrip.contentId}" style="text-decoration: none;">
                     </c:if>
                     
                     <!-- 카드 이미지 -->
                     <div class="card mb-4 product-wap rounded-0">
                         <div class="card rounded-0">
                            <img class="card-img rounded-0 img-fluid" src="${ myTrip.image }" alt="잠시후에 다시 시도해 주세요.">
                             <div class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">
                                 <p class="readMore" style="font-size: 14px !important;">+<br>READ MORE</p>
                             </div>
                         </div>
                         <!-- 카드 내용 -->
                         <div class="card-body">
                            <div class="contentType">${ myTrip.contentType }</div>
                             <p class="text-center mb-4" style="font-size: 18px !important; font-weight: bold; color: #4B4242; height: 54px !important;">
                                 ${ myTrip.title }
                             </p>
                             <p class="text-decoration-none mb-2 !important" style="font-size: 14px !important; display: block; text-align: start !important; word-wrap: break-word; word-break: break-all; padding-left: 22px; top: 0; background: url(${path}/img/trip/map_icon.png)no-repeat; line-height: 19px;">
                                 ${ myTrip.address } 
                             </p>
                         </div>
                     </div>
                     </a>
           		</div>
             </c:forEach>
           </div>   
        </div>
         
         <!-- 페이징 -->
         <div class="common-page-number">
            <ul>
               <!-- 이전 페이지 -->
               <li><a href="${ path }/member/mypage/my-trip?page=${ pageInfo.prevPage }">&lt;</a></li>
			   
			   <!-- 현재 페이지 -->
			   <c:if test="${ empty myTrips }">
				   <li class="disable"><a>1</a></li>
			   </c:if>
			   <c:forEach var="current" begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }">
			       <c:choose>
               			<c:when test="${ current == pageInfo.currentPage }">
			                <li class="disable"><a>${ current }</a></li>
               			</c:when>
               			<c:otherwise>
               				<li><a href="${ path }/member/mypage/my-trip?page=${ current }">${ current }</a></li>
               			</c:otherwise>			   		
			       </c:choose>
			   </c:forEach>
			   
			   <!-- 다음 페이지 -->
			   <li><a href="${ path }/member/mypage/my-trip?page=${ pageInfo.nextPage }">&gt;</a></li>
            </ul>
         </div>      
      </div>      
   </div>
</div>

<!-- **************** 푸터 **************** -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />