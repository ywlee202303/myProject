<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp" />
<link rel="stylesheet" href="${ path }/css/customer/Detail.css">

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