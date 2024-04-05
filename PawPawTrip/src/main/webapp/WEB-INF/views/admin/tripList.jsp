<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
    prefix="security"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp" />
<script>
//페이징 요소를 생성하기 위한 콜백용 함수
function clickPaging(){
    console.log($('numOfRows option:selected').val());
    showList(($(this).attr('pageno')*1), $('#contentId').val(), $('#numOfRows option:selected').val());
};

let contentIdsArr = [];

function showList(pageNo, contentId, numOfRows)
{               
    let data = {};
    contentIdsArr = [];
    
    if(contentId ==''){
        data = {pageNo, numOfRows};
    }
    else
    {
        data = {pageNo, contentId, numOfRows};
    }
    $('#spinnerLoading').fadeIn();
    $('#spinnerLoading>div.spinner-border').css('top', '50%');
    $('#spinnerLoading>div.spinner-border').css('left', '50%');
    
    let pagingNum = 5;
    
    $.ajax(
    {
        type : 'GET',
        url  : '${path}/admin/tripListApi',
        data : data,
        success:function(data)
        {
//             console.log(data);
            let result = '';
            let startRowNo = 0;
            let {pageNo, numOfRows, totalCount, petTourItems} = data;

            startRowNo = totalCount - ((pageNo-1)*numOfRows);//DESC 용
//          startRowNo = ((pageNo-1)*numOfRows) + 1;         //ASC  용
            
            if(petTourItems.length==0){
                result += '<tr><td colspan="5">조회된 게시글이 없습니다.</td></tr>';
            }
            else{
                petTourItems.forEach((element, idx) => {
                	contentIdsArr.push(element.contentid);
                    result += '<tr>';
                    result += '     <td>' + (startRowNo - idx) + '</td>';//DESC 용
//                  result += '     <td>' + (startRowNo + idx) + '</td>';//ASC  용
                    result += '     <td><a href="${path}/admin/tripDetail?contentId=' + element.contentid + '&pageNo='+ pageNo +'">'+ element.contentid + '</a></td>';
                    result += '     <td ' + (element.dbExistYn=='등록'?'class="text-info"':'class="text-danger"') +'>' +   element.dbExistYn   + '</td>';
                    result += '     <td>' + (element.acmpyTypeCd==null?'':element.acmpyTypeCd) + '</td>';
                    result += '</tr>';
                });
            }
            
            $('.common-detail-list>table>tbody').empty();
            $('.common-detail-list>table>tbody').append(result);
            $('.common-search>div:nth-child(1)>span').text(totalCount)
            
            showPaging(pageNo , numOfRows, totalCount, pagingNum,clickPaging);
            $('#spinnerLoading').fadeOut();
        },
        error: function(error){
            console.log(`error : ${error}`);

            let result = '';
            result += '<tr><td colspan="5">요청 오류입니다 다시 시도해 주세요</td></tr>';
            $('.common-detail-list>table>tbody').empty();
            $('.common-detail-list>table>tbody').append(result);
            $('#spinnerLoading').fadeOut();
        }
     });
 };

 //보여준 리스트에서 일괄등록 버튼 클릭했을때
function saveList()
{
	if(!confirm('해당 페이지를 일괄 등록 하시겠습니까?'))
	{
		return false;
	}
    $('#spinnerLoading').fadeIn();
    $('#spinnerLoading>div.spinner-border').css('top' , '50%');
    $('#spinnerLoading>div.spinner-border').css('left', '50%');
    $.ajax(
    {
        type    : 'POST',
        url     : '${path}/admin/tripList',
        data    : {contentIdsArr : contentIdsArr},
        success : (data)=>
        {
            console.log(data);
            if(data.petInfoCount == 0)
            {
                alert('일괄등록이 실패 하였습니다.');
            }
            else
            {
                alert('일괄등록 총'+ data.totalCount +'건 중,\n여행 : '+ data.petTripResult +'건 중,\n숙소 : '+ data.petStayResult +'건,\n공통 : '+ data.commonCount +'건,\n동반정보 : '+ data.petInfoCount +'건\n저장 성공 하였습니다.');
            }
            $('#spinnerLoading').fadeOut();
            showList(1, $('#contentId').val());
        },
        error: function(error){
            console.log(`error : ${error}`);

            alert('일괄등록이 실패 하였습니다.');
            $('#spinnerLoading').fadeOut();
        }
    });
};
$(document).ready(() => 
{
    //리스트를 먼저 보여준다.
    showList($('#pageNo').val(), $('#contentId').val(), $('#numOfRows option:selected').val());
    
    //select 박스를 수정했을때 / input:text 내용을 수정했을때 (focus Out 됐을때)
    $('#contentId, #numOfRows').on('change', (event) => {
        showList(1, $(event.target).val(), $('#numOfRows option:selected').val());
    });
    //input:text 내용을 수정했을때 (Enter Key 누를 시)
    $('#numOfRows').on('keyup', (event) => {
        if(event.key == 'Enter')
        {
                    showList(1, $('#contentId').val(), $('#numOfRows option:selected').val());
        }
    });
    //검색버튼 클릭했을때
    $('#btnSearch').on('click', (event) => {
        showList(1, $('#contentId').val(), $('#numOfRows option:selected').val());
    });

    $('div.common-page-number>ul>li').on('click',  clickPaging);
});
</script>
<input type="hidden" name="pageNo" id="pageNo" value="${pageNo}"/>
<div class="content">
    <div class="container">
        <div class="common-title">
            <p>포포트립 매핑</p>
        </div>
        <div class="common-sideMenu">
            <ul>
                <li>관리자</li>
                <li class=""  ><a href="${path}/admin/dashboard"     >대시보드     </a></li>
                <li class=""  ><a href="${path}/admin/tripList"      >포포트립 매핑</a></li>
                <li class=""  ><a href="${path}/admin/noticeWrite"   >공지사항 입력</a></li>
                <li class=""  ><a href="${path}/admin/favoritesite"  >인추장 선정  </a></li>
                <li class="on"><a href="${path}/admin/plannedDevelop">개발예정 기능</a></li>
            </ul>
        </div>
        <div class="common-list">
            <div class="common-search">
                <div style="width:100px;">
                    TOTAL <span>51</span>건
                </div>
                <div>
                    <div>
                        <select name="numOfRows" id="numOfRows">
                            <option value="10"   <c:if test="${numOfRows == '10'}">  selected</c:if>>10개씩</option>
                            <option value="20"   <c:if test="${numOfRows == '20'}">  selected</c:if>>20개씩</option>
                            <option value="30"   <c:if test="${numOfRows == '30'}">  selected</c:if>>30개씩</option>
                        </select>
                    </div>
                    <div style="width:200px;">
                        <img src="${ path }/img/community/search.png"> 
                            <input type="text" name="contentId" id="contentId" placeholder="컨텐츠 ID를 입력해주세요."style="width:160px;" value="${contentId}">
                    </div>
                    <div>
                        <button id="btnSearch">검색</button>
                    </div>
                </div>
            </div>
            <div class="common-detail-list" style="position:relative;">
                <div id="spinnerLoading" style="display:none;position:absolute;width:100%;height:100%;background-color:rgb(0 0 0 / 65%);">
                    <div class="spinner-border text-warning" style="position: absolute;width: 80px; height: 80px; border: 16px solid currentcolor; border-right-color: transparent;margin-left: -40px; margin-top: -40px;"></div>
                </div>
                <table>
                    <colgroup>
                        <col width="60">
                        <col width="250">
                        <col width="250">
                        <col width="250">
                    </colgroup>
                    <thead>
                    <tr>
                        <th>번호</th>
                        <th>콘텐츠 ID</tH>
                        <th>매핑여부</th>
                        <th>동반가능여부</th>
                    </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td colspan="5">
                                조회된 게시글이 없습니다.
                            </td>
                        </tr>   
                    </tbody>
                </table>
            </div>
            <div class="btn-wrap">
                <button class="common-btn" onClick="saveList();">일괄등록</button>
            </div>
            
            <div class="common-page-number">
                <ul>
                    <li pageNo="1"><a href="#">&lt;</a></li>
                    <li pageNo="1"><a href="#">1</a></li>
                    <li pageNo="2"><a href="#">2</a></li>
                    <li pageNo="3"><a href="#">3</a></li>
                    <li pageNo="4"><a href="#">4</a></li>
                    <li pageNo="5"><a href="#">5</a></li>
                    <li pageNo="5"><a href="#">&gt;</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>


<jsp:include page="/WEB-INF/views/common/footer.jsp" />