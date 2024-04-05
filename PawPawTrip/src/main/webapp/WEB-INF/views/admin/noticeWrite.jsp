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
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.js"></script>

<div class="content">
    <div class="container">
        <div class="common-title">
            <p>공지사항 입력</p>
        </div>
        <div class="common-sideMenu">
            <ul>
                <li>관리자</li>
                <li class="">  <a href="${path}/admin/dashboard"     >대시보드     </a></li>
                <li class="">  <a href="${path}/admin/tripList"      >포포트립 매핑</a></li>
                <li class="on"><a href="${path}/admin/noticeWrite"   >공지사항 입력</a></li>
                <li class="">  <a href="${path}/admin/favoritesite"  >인추장 선정  </a></li>
                <li class="">  <a href="${path}/admin/plannedDevelop">개발예정 기능</a></li>
            </ul>
        </div>
        <div class="common-list">
            <div class="community-detail-list">
                <form action="${ path }/admin/noticeWrite" method="post" enctype="multipart/form-data" id="submitCheck">
                    <table border="1">
                        <tr>
                            <td class="community-td-header">제목</td>
                            <td class="community-td-title">
                                <select name="noticeImportantYN" id="noticeImportantYN">
                                        <option value="">공지구분</option>
                                        <option value="Y">중요공지</option>
                                        <option value="N">일반공지</option>
                                </select> 
                                <input type="text" name="communityTitle" id="communityTitle" placeholder="제목을 입력해주세요." />
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
                                <input type="button" id="deleteFile" value="삭제" />
                            </td>
                        </tr>
                    </table>
                    <div class="btn-wrap">
                        <button type="submit" class="community-add-btn">등록</button>
                        <button type="button" class="community-list-btn" onclick="location.href='${ path }/community/notice'">목록</button>
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
        let noticeImportantYN = $('#noticeImportantYN option:selected').val();
        
        
        if(noticeImportantYN == '') {
            alert('공지구분을 선택해주세요.');
            return false;
        }
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
        
        if(!(file === 'jpg' || file === 'png' || file === 'gif' || file === '')) {
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