<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!-- css 연결 -->
<link rel="stylesheet" href="${path}/css/common/bootstrap.css">
<link rel="stylesheet" href="${path}/css/common/templatemo.css">
<link rel="stylesheet" href="${path}/css/common/pawpawCommon.css">
<link rel="stylesheet" href="${path}/css/trip/stay.css">

<!-- 헤더 -->
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<!-- 바디 -->
<section class="content">
    <div class="container">
    
        <!-- 페이지 타이틀 -->
        <div class="common-title"><p>숙소</p></div>

        <!-- 사이드 메뉴 -->
        <div class="common-sideMenu">
            <ul>
                <li class="community-text">포포트립</li>
                <li class="notice-text"><a href="${ path }/trip/spot">관광지</a></li>
                <li class="board-text"><a href="${ path }/trip/stay">숙소</a>
            </ul>
        </div>
        <!-- 내부 콘텐츠 -->
        <div class="common-list">
            <!-- ***************************************** 검색바 ******************************************* -->
            <div class="common-search">
				<div>
					TOTAL <span>${ pageInfo.listCount }</span>건
				</div>
				<div>
					<div>
						<select name="selectArea" id="selectArea">
							<option value="">지역</option>
								<c:forEach var="area" items="${ searchAreaOptions }">							
			                        <option value="${ area.cityCode }" <c:if test="${ selectAndSearch.selectArea == area.cityCode }" >selected</c:if>>
			                        	${ area.areaName }
			                        </option>
								</c:forEach>
<!-- 	                        <option value="area-1">서울특별시</option> -->
<!-- 	                        <option value="area-2">인천광역시</option> -->
<!-- 	                        <option value="area-3">대전광역시</option> -->
<!-- 	                        <option value="area-4">대구광역시</option> -->
<!-- 	                        <option value="area-5">광주광역시</option> -->
<!-- 	                        <option value="area-6">부산광역시</option> -->
<!-- 	                        <option value="area-7">울산광역시</option> -->
<!-- 	                        <option value="area-8">세종특별자치시</option> -->
<!-- 	                        <option value="area-31">경기도</option> -->
<!-- 	                        <option value="area-32">강원특별자치도</option> -->
<!-- 	                        <option value="area-33">충청북도</option> -->
<!-- 	                        <option value="area-34">충청남도</option> -->
<!-- 	                        <option value="area-35">경상북도</option> -->
<!-- 	                        <option value="area-36">경상남도</option> -->
<!-- 	                        <option value="area-37">전북특별자치도</option> -->
<!-- 	                        <option value="area-38">전라남도</option> -->
<!-- 	                        <option value="area-39">제주특별자치도</option> -->
						</select>
					</div>
					<div style="width: auto;">
						<img src="${ path }/img/community/search.png"> 
						<input type="text"
							   name="searchKeyword" 
							   id=  "searchKeyword"
							   placeholder="주소 또는 장소를 입력해주세요."
							   value="${ selectAndSearch.searchKeyword }">
					</div>
					<div>
						<!-- 검색버튼 클릭 시, search()함수 실행 -->
						<button id="btnSearch" onclick="search();">검색</button>
					</div>
				</div>
			</div>

            <!-- 콘텐츠 내용 -->
            <div class="common-detail-list no-row">
                <div class="row">
                
                	<!-- 조회된 게시물이 없을 시 -->
                    <c:if test="${ empty stays }">
                    	<p>조회된 게시물이 없습니다.</p>
                    </c:if>
                    
                    <!-- 조회된 게시물이 있을 시, 카드 반복 생성 -->
                    <c:forEach var="stay" items="${ stays }">
	                    <div class="col-md-4">
	                        <a href="${ path }/trip/stay/stayDetail?id=${stay.stayContentId}" style="text-decoration: none;">
	                            <!-- 카드 이미지 -->
	                            <div class="card mb-4 product-wap rounded-0">
	                                <div class="card rounded-0">
		                                <img class="card-img rounded-0 img-fluid" src="${ stay.stayImage }" alt="잠시후에 다시 시도해 주세요.">
	                                    <div class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">
	                                        <p class="readMore" style="font-size: 14px !important;">+<br>READ MORE</p>
	                                    </div>
	                                </div>
	                                <!-- 카드 내용 -->
	                                <div class="card-body">
	                                    <p class="text-center mb-4" style="font-size: 18px !important; font-weight: bold; color: #4B4242; height: 54px !important;">
	                                        ${ stay.stayTitle }
	                                    </p>
	                                    <p class="text-decoration-none mb-2 !important" style="font-size: 14px !important; display: block; text-align: start !important; word-wrap: break-word; word-break: break-all; padding-left: 22px; top: 0; background: url(${path}/img/trip/map_icon.png)no-repeat; line-height: 19px;">
	                                        ${ stay.stayAddress } 
	                                    </p>
	                                    <c:if test="${ stay.stayTel == '-' }">
		                                    <p class="text-decoration-none mb-2 !important" style="font-size: 14px !important; display: block;  text-align: start !important; word-wrap: break-word; word-break: break-word; padding-left: 22px; top: 0; background: url(${path}/img/trip/tel_icon.png)no-repeat; line-height: 19px;">
		                                         별도 문의
		                                    </p>	                                    	
	                                    </c:if>
	                                    <c:if test="${ stay.stayTel != '-' }">
		                                    <p class="text-decoration-none mb-2 !important" style="font-size: 14px !important; display: block;  text-align: start !important; word-wrap: break-word; word-break: break-word; padding-left: 22px; top: 0; background: url(${path}/img/trip/tel_icon.png)no-repeat; line-height: 19px;">
		                                         ${ stay.stayTel }
		                                    </p>
	                                    </c:if>	                                    
	                                </div>
	                            </div>
	                        </a>
	                    </div>
                	</c:forEach>
                </div>
            </div>

            <!-- ***************************************** 페이징 ******************************************** -->
            <div class="common-page-number">
                <ul>
                	<!-- 이전 페이지 --> 
					<c:if test="${ empty selectAndSearch.selectArea  and empty selectAndSearch.searchKeyword }">
	                    <li><a href="${ path }/trip/stay?page=${ pageInfo.prevPage }">&lt;</a></li>
					</c:if>
					<c:if test="${ not empty selectAndSearch.selectArea or not empty selectAndSearch.searchKeyword}">
						<li><a href="${ path }/trip/stay?page=${ pageInfo.prevPage }&selectArea=${selectAndSearch.selectArea}&searchKeyword=${selectAndSearch.searchKeyword}">&lt;</a></li>
					</c:if>
						                    
                	<!-- 현재 페이지 -->
                	<!-- 첫 페이지부터 마지막페이지까지 반복(5페이지씩 보이게 설정함) -->
					<c:if test="${ empty stays }">
						<li class="disable"><a>1</a></li>
					</c:if>                 	
                	<c:forEach var="currentPage" begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }">
                		<c:choose>
                			<c:when test="${ currentPage == pageInfo.currentPage }">
				                <li class="disable"><a>${ currentPage }</a></li>
                			</c:when>
                			<c:otherwise>
                				<c:if test="${ empty selectAndSearch.selectArea and empty selectAndSearch.searchKeyword }">
				                    <li><a href="${ path }/trip/stay?page=${ currentPage }">${ currentPage }</a></li>                					
                				</c:if>
                				<c:if test="${ not empty selectAndSearch.selectArea or not empty selectAndSearch.searchKeyword }">
				                    <li><a href="${ path }/trip/stay?page=${ currentPage }&selectArea=${ selectAndSearch.selectArea }&searchKeyword=${ selectAndSearch.searchKeyword }">${ currentPage }</a></li>                					                					
                				</c:if>
                			</c:otherwise>
                		</c:choose>
                	</c:forEach>
                	
                    <!-- 다음 페이지 -->
					<c:if test="${ empty selectAndSearch.selectArea and empty selectAndSearch.searchKeyword }">
	                    <li><a href="${ path }/trip/stay?page=${ pageInfo.nextPage }">&gt;</a></li>
					</c:if>
					<c:if test="${ not empty selectAndSearch.selectArea or not empty selectAndSearch.searchKeyword }">
						<li><a href="${ path }/trip/stay?page=${ pageInfo.nextPage }&selectArea=${selectAndSearch.selectArea}&searchKeyword=${selectAndSearch.searchKeyword}">&gt;</a></li>
					</c:if>                    
                </ul>
            </div>
            <!-- </div> -->
        </div>
    </div>
</section>

<script>
	// 검색바의 '검색버튼' 클릭시 실행할 함수
	function search() {
	    var selectArea = document.getElementById("selectArea").value;
	    var searchKeyword = document.getElementById("searchKeyword").value;
	    
	    console.log(selectArea, searchKeyword);
	    
		// trim() : 양쪽에 있는 공백을 제거
		if (searchKeyword.trim() != ''||selectArea.trim() != '') {
			var url = "${path}/trip/stay?selectArea=" + selectArea + "&searchKeyword=" + encodeURIComponent(searchKeyword);
		} else {
			var url = "${path}/trip/stay";
		}
	    window.location.href = url;		
	}	
</script>

<!-- 푸터 -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />