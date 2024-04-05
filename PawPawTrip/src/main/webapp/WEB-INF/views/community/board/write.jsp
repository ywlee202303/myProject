<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp" />

<link rel="stylesheet" href="${path}/css/community/boardwrite.css">
<!--  
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.css" rel="stylesheet">
-->
<link rel="stylesheet" href="${path}/css/community/summernote-lite.css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.js"></script>

<div class="content">
	<div class="container">
		<div class="common-title">
			<p>자유 게시판</p>
		</div>
		<div class="common-sideMenu">
			<ul>
				<li class="community-text">커뮤니티</li>
				<li class="notice-text"><a href="${path}/community/notice">공지사항</a></li>
				<li class="board-text"><a href="${path}/community/board">자유
						게시판</a>

					<ul class="community-detail-sideMenu">
						<li><a href="${ path }/community/board/talk">수다</a></li>
						<li><a href="${ path }/community/board/mypet">마이펫 자랑</a></li>
					</ul></li>
			</ul>
		</div>
		<div class="common-list">
			<div class="community-detail-list">
				<form action="${ path }/community/board/write" method="post" enctype="multipart/form-data" id="submitCheck">
					<table border="1">
						<tr>
							<td class="community-td-header">제목</td>
							<td class="community-td-title">
								<select name="communityCategory" id="comunityCate">
										<option selected>분류</option>
										<option value="[수다]">수다</option>
										<option value="[마이펫 자랑]">마이펫 자랑</option>
								</select> 
								<input type="text" name="communityTitle" id="communityTitle" placeholder="제목을 입력해주세요." style="width: 60%;"/>
							</td>
						</tr>
						<tr>
							<td class="community-td-header">작성자</td>
							<td class="community-td-name">
								<input type="text" name="memberId" id="comunityName" value="${ loginMember.memberId }" readonly />
							</td>
						</tr>
						<tr>
							<td class="community-td-header">내용</td>
							<td>
								<textarea resize="none" name="communityContent" id="summernote" class="summernote" cols="30" rows="10"></textarea>
							</td>
						</tr>
						<tr>
							<td class="community-td-file community-td-header">첨부파일<br>
								(10MB까지 첨부 가능)
							</td>
							<td>
								<input type="file" name="talkWriteFile" id="talkWriteFile">
							</td>
						</tr>
					</table>
					<div class="btn-wrap">
						<button type="submit" class="community-add-btn">등록</button>
						<button type="button" class="community-list-btn"
							onclick="location.href='${ path }/community/board'">목록</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<script>
$(document).ready(function() 
{
	$('#submitCheck').on('submit', (event) => {
		let category = $('#comunityCate').val();
		let title = $('#communityTitle').val();
		let content = $('#summernote').val();
		let file = $('#talkWriteFile').val().split('.').pop();
		
		console.log(file);
		
		if(category === '분류') {
			alert('카테고리를 선택해주세요.');
			return false;
		}
		
		if(title === '') {
			alert('제목을 입력해주세요.');
			return false;
		}
		
		if(content === '') {
			alert('내용을 입력해주세요.');
			return false;
		}
		
		if(!(file === 'jpg' || file === 'png' || file === 'gif' || file === 'jpeg' || file === '')) {
			alert('이미지 파일을 등록해주세요.');
			return false;
		}
		
	});
	
    $("#summernote").summernote(
    {
        width     : 650,
        // height: 100,
        maxHeight : 500,
        minHeight : 500,
        placeholder : '내용을 입력해주세요.',
        lang        : 'ko-KR',
        toolbar   : [
                    [ 'Font Style', [ 'fontname'      ] ],
                    [ 'style'     , [ 'bold', 'italic', 'underline' ] ],
                    [ 'font'      , [ 'strikethrough' ] ],
                    [ 'fontsize'  , [ 'fontsize'      ] ],
                    [ 'color'     , [ 'color'         ] ],
                    [ 'para'      , [ 'paragraph'     ] ],
                    [ 'height'    , [ 'height'        ] ],
                    [ 'Insert'    , [ 'picture'       ] ],
                    [ 'Insert'    , [ 'link'          ] ],
                    [ 'Misc'      , [ 'fullscreen'    ] ] ],
        fontNames : [ 'Arial', 
                      'Arial Black',
                      'Comic Sans MS',
                      'Courier New',
                      '맑은 고딕',
                      '궁서',
                      '굴림체',
                      '굴림',
                      '돋움체',
                      '바탕체' 
                    ],
        fontSizes : [ '8', '9' , '10', '11', '12',
                     '14', '16', '18', '20', '22',
                     '24', '28', '30', '36', '50', '72' ]
    });

});
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />