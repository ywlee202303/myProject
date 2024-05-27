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
	
	.fileName {
		display: inline-block;
	    width: 100px;
	    height: 28px;
	    text-align: center;
	    margin-right: 10px;
	    padding-top: 5px;
	    background-color: black;
	    color: white;
	    font-weight: 300;
	    cursor: pointer;
	}
	
	.fileDelete {
	    width: 80px;
	    height: 35px;
	    margin-left: 10px;
	    background-color: black;
	    color: white;
	    font-weight: 300;
	    font-size: 16px;
	    cursor: pointer;
	}
	
	#file {
		display: none;
	}
</style>

<main>
	<div class="customer-logo">
		<img src="${ path }/img/CUSTOMER_LOGO.png" alt="">
	</div>
	
	<div class="customerWrite-containter">
		<form action="${ path }/customer/update" method="POST" enctype="multipart/form-data">
			<input type="hidden" id="role" value="${ loginMember.memberRole }" />
			<input type="hidden" id="customerNo" name="customerNo" value="${ customer.customerNo }" />
			<table border="1">
				<tr>
					<th>
						<label for="customer-category">카테고리</label>
					</th>
					<td>
						<select id="customer-category" name="customerCategory">
							<c:if test="${ customer.customerCategory == '[공지사항]' }">
								<option value="[공지사항]">공지사항</option>
							</c:if>
							<c:if test="${ customer.customerCategory == '[자유게시판]' }">
								<option value="[자유게시판]">자유게시판</option>
							</c:if>
							<c:if test="${ customer.customerCategory == '[자주 묻는 질문]' }">
								<option value="[자주 묻는 질문]">자주 묻는 질문</option>
							</c:if>
							<c:if test="${ customer.customerCategory == '[1:1문의]' }">
								<option value="[1:1문의]">1:1문의</option>
							</c:if>
						</select>
					</td>
				</tr>
				<tr>
					<th>
						<label for="customer-title">제목</label>
					</th>
					<td>
						<input type="text" id="customer-title" name="customerTitle" value="${ customer.customerTitle }" />
					</td>
				</tr>
				<tr>
					<th>
						<label>작성자</label>
					</th>
					<td>
						<input style="color: gray;" type="text" id="customer-id" value="${ customer.member.memberId }" readonly />
					</td>
				</tr>
				<tr>
					<th>
						<label>내용</label>
					</th>
					<td>
						<textarea id="editor" name="customerContent">${ customer.customerContent }</textarea>
					</td>
				</tr>
				<tr>
					<th>
						<label>첨부파일</label>
					</th>
					<td>
						<c:if test="${ customer.customerOriginalFileName != null }">
							<label class="fileName" for="file">파일 선택</label>
							<input type="file" name="fileName" id="file" />
							<span id="fileChange">${ customer.customerOriginalFileName }</span>
							<button class="fileDelete" type="button">삭제</button>
						</c:if>
						<c:if test="${ customer.customerOriginalFileName == null }">
							<label class="fileName" for="file">파일 선택</label>
							<input type="file" name="fileName" id="file" />
							<span id="fileChange"> - </span>
						</c:if>
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
    
    console.log(document.getElementById('role').value);
    
    // 파일 변경
    $('#file').on('change', () => {
    	console.log($('#file').val().split('\\')[2]);
    	
    	$('#fileChange').text($('#file').val().split('\\')[2]);
    });
    
    // 첨부 파일 삭제
    $('.fileDelete').on('click', () => {
    	let customerNo = $('#customerNo').val();
    	
    	$.ajax({
    		url: '${ path }/customer/deleteFile',
    		type: 'post',
    		data: {
    			customerNo
    		},
    		success: (res) => {
    			console.log(res);
    			
    			alert("파일 삭제 성공!");
    			
    			$('#fileChange').text(' - ');
    		}
    	});
    });
</script>