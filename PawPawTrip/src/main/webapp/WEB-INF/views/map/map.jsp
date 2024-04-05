<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
    prefix="security"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp" />
<link rel="stylesheet" href="${path}/css/map/map.css"></link>
<script type="text/javascript"
    src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d3729bf88f29d9ac1dd719a6bcd5fd14&libraries=services,clusterer,drawing"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="${path}/js/map/map.js"></script>

<div class="content">
    <div class="container">
        <div class="common-title">
            <p>포포맵</p>
        </div>
        <div class="container-fluid" style="margin-top: 35px;">
                    <div class="common-search">
                        <div></div>
                        <div>
                            <div>
                                <select name="searchContentType" id="searchContentType">
                                    <option value="">전체</option>
                                    <option value="12">관광지</option>
                                    <option value="32">숙소</option>
                                </select>
                            </div>
                            <div style="width: 234px;">
                                <img src="${ path }/img/community/search.png"> <input
                                    style="width: 200px;" type="text" name="searchKeyword"
                                    id="searchKeyword" placeholder="지역/장소명을 입력해주세요.">
                            </div>
                            <div>
                                <button id="searchBtn">검색</button>
                            </div>
                        </div>
                    </div>
	                <div style="padding-bottom: 10px; margin-top: 35px;">
	                    <div id="map" style="width: 100%; height: 400px;"></div>
	                </div>
	                <div class="row">
	                    <div class="col-lg-4" id="clickLatlng" style="background-color: aliceblue;"></div>
	                    <div class="col-lg-4" id="zoomInfo"    style="background-color: aquamarine;"></div>
	                    <div class="col-lg-4" id="addressInfo" style="background-color: bisque;"></div>
	                </div>
    </div>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />