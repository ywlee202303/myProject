<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"              prefix="c"          %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"               prefix="fmt"        %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"         prefix="fn"         %>
<%@ taglib uri="http://www.springframework.org/security/tags"   prefix="security"   %>

<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<div class="content">
	<div class="container">
	    <div id="template-mo-zay-hero-carousel" class="carousel slide" data-bs-ride="carousel">
	        <ol class="carousel-indicators">
	            <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="0" class="active"></li>
	            <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="1"></li>
	            <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="2"></li>
	        </ol>
	        
	        <a class="carousel-control-prev text-decoration-none w-auto ps-3" href="#template-mo-zay-hero-carousel" role="button" data-bs-slide="prev">
	            <i class="fas fa-chevron-left"></i>
	        </a>
	        <a class="carousel-control-next text-decoration-none w-auto pe-3" href="#template-mo-zay-hero-carousel" role="button" data-bs-slide="next">
	            <i class="fas fa-chevron-right"></i>
	        </a>
	        <div class="carousel-inner">
	            <div class="carousel-item active">
	                <div class="max-container">
	                    <div class="row">
	                        <img class="img-fluid" src="${path}/img/common/main-carousel-img1.png" alt="">
	                    </div>
	                </div>
	            </div>
	            <div class="carousel-item">
	                <div class="max-container">
	                    <div class="row">
	                        <img class="img-fluid" src="${path}/img/common/main-carousel-img2.png" alt="">
	                    </div>
	                </div>
	            </div>
	            <div class="carousel-item">
	                <div class="max-container">
	                    <div class="row">
                            <img class="img-fluid" src="${path}/img/common/main-carousel-img3-1.jpg" alt="">
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
    <!-- End Banner Hero -->

    <section class="container py-5 favoriteMenu">
        <div class="row text-center pt-3">
            <div class="col-lg-6 m-auto">
                <h1 class="h1">자주 쓰는 메뉴</h1>
                <p>강아지와 함께 떠나는 특별한 여행</p>
            </div>
        </div>
        <div class="row ">
            <div class="col-lg-4 col-md-12 p-5 mt-3">
                <a href="${path}/map"><img src="${path}/img/common/menuComponent1.png" class="rounded-circle img-fluid border"></a>
                <h5 class="text-center mt-3 mb-3">포포맵</h5>
                <p class="text-center"><a href="${path}/map" class="btn btn-letssee">보러가기</a></p>
            </div>
            <div class="col-lg-4 col-md-12 p-5 mt-3">
                <a href="${path}/trip/stay"><img src="${path}/img/common/menuComponent2.png" class="rounded-circle img-fluid border"></a>
                <h2 class="h5 text-center mt-3 mb-3">포포트립</h2>
                <p class="text-center"><a href="${path}/trip/stay" class="btn btn-letssee">보러가기</a></p>
            </div>
            <div class="col-lg-4 col-md-12 p-5 mt-3">
                <a href="${path}/community/notice"><img src="${path}/img/common/menuComponent3.png" class="rounded-circle img-fluid border"></a>
                <h2 class="h5 text-center mt-3 mb-3">커뮤니티</h2>
                <p class="text-center"><a href="${path}/community/notice" class="btn btn-letssee">보러가기</a></p>
            </div>
        </div>
    </section>

    <section class="bg-pawpaw">
        <div class="py-5 container">
            <div class="row py-3">
                <div class="col-lg-6">
                    <h1 class="favoriteTitle"><img src="${path}/img/common/favSiteMarker.png" style="margin-right: 10px;"/>인기 추천 장소</h1>
                </div>
            </div>
            <div class="row">
                <c:forEach var="site" items="${ sites }">
                <div class="col-lg-4 col-md-12 mb-4">
                    <div class="card h-100">
                        <a href="${ path }/trip/${site.contenttype=='관광지'?'spot/spotDetail':'stay/stayDetail'}?id=${site.contentid}">
                            <c:if test="${site.image== null}">
	                            <img src="${path}/img/common/replacedImage.png" class="card-img-top" alt="...">
                            </c:if>
                            <c:if test="${site.image!= null}">
                                <img src="${site.image}" class="card-img-top" alt="...">
                            </c:if>
                        </a>
                        <div class="card-body">
                            <a href="${ path }/trip/${site.contenttype=='관광지'?'spot/spotDetail':'stay/stayDetail'}?id=${site.contentid}" class="text-decoration-none text-dark stayDivisionSize">${site.contenttype}</a><br>
                            <a href="${ path }/trip/${site.contenttype=='관광지'?'spot/spotDetail':'stay/stayDetail'}?id=${site.contentid}" class="text-decoration-none text-dark stayTitleSize">${site.title}</a>
                            <p class="text-muted stayAddressSize"><img src="${path}/img/common/marker.png" >${site.address}</p>
                        </div>
                    </div>
                </div>
                </c:forEach>
            </div>
        </div>
    </section>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />