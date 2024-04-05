<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
   prefix="security"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<!-- 헤더 -->
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<link rel="stylesheet" href="${path}/css/member/mypage/myBoard.css">

<!-- 메인 -->
<div class="content">
	<div class="container">
		<!-- 메인 메뉴 -->
		<div class="common-title">
			<p>마이페이지</p>
		</div>
		<!-- 사이드 바 메뉴 -->
		<div class="common-sideMenu">
			<ul>
				<li class="community-text">마이페이지</li>
				<li class="notice-text"><a href="${path}/member/mypage/my-info">회원 정보 수정</a></li>
				<li class="board-text" style="border-bottom: 0;"><a href="${path}/member/mypage/my-board">내가 쓴 게시글</a></li>
				<li><a href="${path}/member/mypage/my-trip">내가 찜한 장소</a></li>
			</ul>
		</div>
		<!-- 컨텐츠 -->
		<div class="common-list">
			<div class="common-detail-list myboard-detail-list">
				<table border="1" class="common-table">
					<tr style="background-color: #FDFAEF;">
						<td style="width: 50px;">번호</td>
						<td style="width: 500px; text-align: center; cursor: default;">제목</td>
						<td>작성자</td>
						<td style="width: 60px; text-align: center;">조회수</td>
						<td>등록일</td>
					</tr>
					<c:if test="${ empty community }">
						<tr>
							<td colspan="5">작성된 게시글이 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${ not empty community }">
						<c:forEach var="c" items="${ community }">
							<tr>
								<td>${ c.communityRNUM }</td>
								<c:if test="${ c.communityCategory == '[수다]' }">
									<td class="common-text-left" style="padding-left: 5px;">
										<a href="${ path }/community/board/talkdetail?no=${c.communityNo}">${c.communityCategory} ${ c.communityTitle }</a>
									</td>
								</c:if>
								<c:if test="${ c.communityCategory == '[마이펫 자랑]' }">
									<td class="common-text-left" style="padding-left: 5px;">
											<a href="${ path }/community/board/mypetdetail?no=${c.communityNo}">${c.communityCategory} ${ c.communityTitle }</a>
									</td>
								</c:if>
								<td>${ c.communityWriterId }</td>
								<td class="common-text-right">${ c.communityCount }</td>
								<td>${ c.communityEd }</td>
							</tr>
						</c:forEach>
					</c:if>
					
				</table>
			</div>
			<div class="common-page-number">
				<ul>
					<!-- 페이징 처리 -->
					<!-- 이전 페이지 -->
					<li><a href="${ path }/member/mypage/my-board?page=${ pageInfo.prevPage }">&lt;</a></li>
					<!-- 5개 페이지 목록 -->
					<c:if test="${ empty community }">
						<li class="disable"><a>1</a></li>
					</c:if>
					<c:forEach var="current" begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }">
						<c:choose>
							<c:when test="${ current == pageInfo.currentPage }">
								<li class="disable"><a>${ current }</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="${ path }/member/mypage/my-board?page=${ current }">${ current }</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<!-- 다음 페이지 -->
					<li><a href="${ path }/member/mypage/my-board?page=${ pageInfo.nextPage }">&gt;</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>

<!-- 푸터 -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />