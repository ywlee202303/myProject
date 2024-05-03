<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp" />
<link rel="stylesheet" href="${ path }/css/customer/Write.css">

<main>
	<div class="customer-logo">
		<img src="${ path }/img/CUSTOMER_LOGO.png" alt="">
	</div>
	
	<div class="customerWrite-containter">
		<form action="${ path }/customer/write" method="POST" enctype="multipart/form-data">
			<table border="1">
				<tr>
					<th>
						<label for="customer-category">카테고리</label>
					</th>
					<td>
						<select id="customer-category">
							<option value="notice">공지사항</option>
							<option value="board">자유게시판</option>
							<option value="question">자주 묻는 질문</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>
						<label for="customer-title">제목</label>
					</th>
					<td>
						<input type="text" id="customer-title" />
					</td>
				</tr>
				<tr>
					<th>
						<label>작성자</label>
					</th>
					<td>
						<input style="color: gray;" type="text" value="admim" readonly />
					</td>
				</tr>
				<tr>
					<th>
						<label>내용</label>
					</th>
					<td></td>
				</tr>
				<tr>
					<th>
						<label>첨부파일</label>
					</th>
					<td>
						<input type="file" />
					</td>
				</tr>
			</table>
			<div class="write-btn">
				<button id="writeBtn" type="submit">등록</button>
			</div>
		</form>
	</div>
</main>