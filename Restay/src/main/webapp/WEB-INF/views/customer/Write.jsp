<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp" />
<link rel="stylesheet" href="${ path }/css/customer/Write.css">

<style>
	.ck-editor__editable {
	   	height: 400px;
	}
</style>

<main>
	<div class="customer-logo">
		<img src="${ path }/img/CUSTOMER_LOGO.png" alt="">
	</div>
	
	<div class="customerWrite-containter">
		<form action="${ path }/customer/write" method="POST" enctype="multipart/form-data">
			<input type="hidden" id="role" value="${ loginMember.memberRole }" />
			<table border="1">
				<tr>
					<th>
						<label for="customer-category">카테고리</label>
					</th>
					<td>
						<select id="customer-category" name="customerCategory">
							<option value="[공지사항]">공지사항</option>
							<option value="[자유게시판]">자유게시판</option>
							<option value="[자주 묻는 질문]">자주 묻는 질문</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>
						<label for="customer-title">제목</label>
					</th>
					<td>
						<input type="text" id="customer-title" name="customerTitle" />
					</td>
				</tr>
				<tr>
					<th>
						<label>작성자</label>
					</th>
					<td>
						<input style="color: gray;" type="text" id="customer-id" value="${ loginMember.memberId }" readonly />
					</td>
				</tr>
				<tr>
					<th>
						<label>내용</label>
					</th>
					<td>
						<textarea id="editor" name="customerContent"></textarea>
					</td>
				</tr>
				<tr>
					<th>
						<label>첨부파일</label>
					</th>
					<td>
						<input type="file" name="fileName" />
					</td>
				</tr>
			</table>
			<div class="write-btn">
				<button id="writeBtn" type="submit">등록</button>
			</div>
		</form>
	</div>
</main>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

<script src="https://cdn.ckeditor.com/ckeditor5/41.3.1/classic/ckeditor.js"></script>

<script>
    ClassicEditor
        .create( document.querySelector( '#editor' ) )
        .catch( error => {
            console.error( error );
        } );
    
    let category = document.getElementById('customer-category')
    let role = document.getElementById('role').value;
    
    // 일반 사용자는 자유게시판만 등록 가능
    if(role ===  'ROLE_USER') {
    	category.innerHTML = '';
    	
    	requestAnimationFrame(function() {
    		category.innerHTML = '<option value="[자유게시판]">자유게시판</option>';
    	});
    }
    
    
    console.log(document.getElementById('role').value);
</script>