<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp" />
<link rel="stylesheet" href="${ path }/css/customer/Detail.css">

<style>
	.disable {
		color: green !important;
		font-weight: bold;
	}
</style>

<main>
	<div class="customer-logo">
		<img src="${ path }/img/CUSTOMER_LOGO.png" alt="">
	</div>
	
	<div class="customerDetail-restay-container">
		<table border="1">
			<tr>
				<th>제목</th>
				<td colspan="6">${ customer.customerTitle }</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${ customer.member.memberId }</td>
				<th>등록일</th>
				<td>${ customer.customerEnrollDate }</td>
				<th>조회수</th>
				<td>${ customer.customerCount }</td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<c:if test="${ customer.customerOriginalFileName == null }">
					<td colspan="5"> - </td>
				</c:if>
				<c:if test="${ customer.customerOriginalFileName != null }">
					<td colspan="5" id="fileDown">${ customer.customerOriginalFileName }</td>
				</c:if>
			</tr>
			<tr>
				<td colspan="6" class="customer-td-content">${ customer.customerContent }</td>
			</tr>
		</table>
		
		<div class="list-btn">
			<button onclick="location.href='${ path }/customer'">목록</button>
		</div>
		
		<!-- 댓글 리스트 -->
		<div class=customer-comment-list>
			<div class="customer-comment-title">COMMENT</div>
			<c:if test="${ not empty replyList }">
				<c:forEach var="reply" items="${ replyList }">
					<div class="customer-comment-writer">
						<span>${ reply.writerId }</span>
						<span>&nbsp;(${ reply.replyCreateDate })</span>
					</div>
					<div class="customer-comment-content">
						${ reply.replyContent }
					</div>
				</c:forEach>
			</c:if>
		</div>
		
		<c:if test="${ not empty replyList }">
		<!-- 댓글 페이징 -->
		<div class="customer-comment-paging">
			<ul class="customer-comment-paging-ul">
				<!-- 이전페이지 -->
				<li><a href="${ path }/customer/${ customer.customerNo }?page=${ pageInfo.prevPage }">&lt;</a></li>
				
				<!-- 5개 페이지 -->
				<c:forEach var="current" begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }">
					<c:choose>
						<c:when test="${ current == pageInfo.currentPage }">
							<li><a class="disable">${ current }</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="${ path }/customer/${ customer.customerNo }?page=${ current }">${ current }</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				
				<!-- 다음페이지 -->
				<li><a href="${ path }/customer/${ customer.customerNo }?page=${ pageInfo.nextPage }">&gt;</a></li>
			</ul>
		</div>
		</c:if>
		
		<!-- 댓글 작성 -->
		<div style="margin-top: 30px;">
			<form action="${ path }/customer/${ customer.customerNo }/reply" method="post">
				<table border="1">
					<tr>
						<th>내용</th>
						<td>
							<textarea name="replyContent" rows="4" cols="115" maxlength="500" ></textarea>
							<div class="write-btn">
								<button>댓글작성</button>
							</div>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	
</main>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

<script>
	$(document).ready(() => {
		$('#fileDown').on('click', () => {
			let oname = encodeURIComponent('${ customer.customerOriginalFileName }');
			let rname = encodeURIComponent('${ customer.customerRenamedFileName }');
			
			// 파일 다운로드
			location.assign(`${ path }/customer/fileDown?oname=\${oname}&rname=\${rname}`);
		});
	})
</script>