<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"              prefix="c"          %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"               prefix="fmt"        %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"         prefix="fn"         %>
<%@ taglib uri="http://www.springframework.org/security/tags"   prefix="security"   %>

<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp" />

<link rel="stylesheet" href="${path}/css/admin/favoritesite.css">

<style>
    .disable {
        pointer-events: none;
        background-color: #B29254;
        color: white;
    }
</style>

<div class="content">
    <div class="container">
        <div class="common-title">
            <p>인추장 선정</p>
        </div>
        <div class="common-sideMenu">
            <ul>
                <li>관리자</li>
                <li class=""><a href="${path}/admin/dashboard">대시보드</a></li>
                <li class=""><a href="${path}/admin/tripList">포포트립 매핑      </a></li>
                <li class=""><a href="${path}/admin/noticeWrite">공지사항 입력   </a></li>
                <li class="on"><a href="${path}/admin/favoritesite">인추장 선정    </a></li>
                <li class=""><a href="${path}/admin/plannedDevelop">개발예정 기능</a></li>
            </ul>
        </div>
        <div class="common-list">
            <div class="common-search">
                <div>
                    TOTAL <span>${ pageInfo.listCount }</span>건
                </div>
                <div>
                    <div>
                        <select name="searchContentType" id="searchContentType">
                            <option value=""   >전체</option>
                            <option value="12" <c:if test="${ searchInfoMap.select == '12' }">selected</c:if>>관광지</option>
                            <option value="32" <c:if test="${ searchInfoMap.select == '32' }">selected</c:if>>숙소</option>
                        </select>
                    </div>
                    <div style="width: 234px;">
                        <img src="${ path }/img/community/search.png"> 
                        <input style="width: 200px;"
                               type       ="text" 
                               name       ="searchKeyword" 
                               id         ="searchKeyword"
                               placeholder="장소명을 입력해주세요."
                               value      ="${ searchMap.search }">
                    </div>
                    <div><button onClick="search();">검색</button> </div>
                </div>
            </div>
            <div class="common-detail-list no-row">
                <div class="row" id="topThreeSites">
                </div>
            </div>
                
              <div class="common-detail-list ">
            <table border="1">
                <thead>
                <tr style="background-color: #FDFAEF;">
                    <td></td>
                    <td>컨텐츠ID</td>
                    <td>구분</td>
                    <td style="text-align:left; cursor: default;">장소명</td>
                    <td style="text-align: center;">주소</td>
                </tr>
                </thead>
                <tbody>
                <c:if test="${ empty sites }">
                    <tr>
                        <td colspan="5">조회된 데이터가 없습니다.</td>
                    </tr>
                </c:if>
                <c:if test="${ not empty sites }">
                    <c:forEach var="site" items="${ sites }">
                        <tr>
                           <td><input type="checkbox" name="favorSiteCheck" value="${ site.contentid }" <c:if test="${site.favorRcmdYn == 'Y'}">checked</c:if>/></td>
                           <td>${ site.contentid }</td>
                           <td>${ site.contenttype }</td>
                           <td class="common-text-left" style="display: block; padding-top: 20px; padding-left: 5px; border-style: none;width: 190px;">
                               <a href="${ path }/trip/${site.contenttype=='관광지'?'spot/spotDetail':'stay/stayDetail'}?id=${site.contentid}" style="font-size: 16px;">${ site.title }</a>
                           </td>
                           <td class="common-text-left" style="border: 1px solid #E8E8E8; padding-left: 5px; width: 200px;" >${ site.address }</td>
                        </tr>
                    </c:forEach>
                </c:if>
                </tbody>
            </table>
              </div>
            <div class="common-page-number">
                <ul>
                    <!-- 페이징 처리 -->
                    <!-- 이전 페이지 -->
                    <c:if test="${ empty searchInfoMap.search }">
                        <li><a href="${ path }/admin/favoritesite?page=${ pageInfo.prevPage }">&lt;</a></li>
                    </c:if>
                    <c:if test="${ not empty searchInfoMap.search }">
                        <li><a href="${ path }/admin/favoritesite?page=${ pageInfo.prevPage }&select=${searchInfoMap.select}&search=${searchInfoMap.search}">&lt;</a></li>
                    </c:if>
                    <!-- 5개 페이지 목록 -->
                    <c:if test="${ empty sites }">
                        <li class="disable"><a>1</a></li>
                    </c:if>
                    <c:forEach var="current" begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }">
                        <c:choose>
                            <c:when test="${ current == pageInfo.currentPage }">
                                <li class="disable"><a>${ current }</a></li>
                            </c:when>
                            <c:otherwise>
                                <c:if test="${ empty searchInfoMap.search }">
                                    <li><a href="${ path }/admin/favoritesite?page=${ current }">${ current }</a></li>
                                </c:if>
                                <c:if test="${ not empty searchInfoMap.search }">
                                    <li><a href="${ path }/admin/favoritesite?page=${ current }&select=${searchInfoMap.select}&search=${searchInfoMap.search}">${ current }</a></li>
                                </c:if>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    
                    <!-- 다음페이지 -->
                    <c:if test="${ empty searchInfoMap.search }">
                        <li><a href="${ path }/admin/favoritesite?page=${ pageInfo.nextPage }">&gt;</a></li>
                    </c:if>
                    <c:if test="${ not empty searchInfoMap.search }">
                        <li><a href="${ path }/admin/favoritesite?page=${ pageInfo.nextPage }&select=${searchInfoMap.select}&search=${searchInfoMap.search}">&gt;</a></li>
                    </c:if>
                </ul>
            </div>
        </div>
    </div>
</div>

<script>

var contentIdsArr = new Array();

$('input[name=favorSiteCheck]').on('change', (event)=>
{
    let maxCount    = 3;
    let selCount    = $('input[name=favorSiteCheck]:checked').length;
    let saveDelFlag = $(event.target).prop('checked'); 
    let contentid   = $(event.target).val();
    
    //체크박스 개수 체크
    if((maxCount < selCount || maxCount <= contentIdsArr.length) && saveDelFlag)
    {
        alert('최대개수는 3개입니다.');
        $(event.target).prop('checked', false);
        return false;
    }
    
    addTopThreefunc(saveDelFlag, contentid);
})


//카드 클릭시 이벤트를 위해 함수 생성
function addTopThreefunc(saveDelFlag, contentid)
{
    if(!confirm('선택한 컨텐츠를 '+ (saveDelFlag?'수정':'삭제') +'하시겠습니까?'))
    {
        return false;
    }

    //체크박스 체크 여부로 배열에 뺄지 말지 결정
    //체크됐을때
    if(saveDelFlag)
    {
        contentIdsArr.push(contentid);
    }
    else
    {
        let tempArr = new Array();
        for(let i = 0; i < contentIdsArr.length; i++)
        {
            if(contentIdsArr[i] != contentid)
            {
                tempArr.push(contentIdsArr[i]);
            }
        }
        contentIdsArr = tempArr;
    }
    console.log(contentIdsArr);
    
    let data = {contentIdsArr};
    
    $.ajax(
    {
        type : 'POST',
        url  : '${path}/admin/addTopThreeAjax',
        data : data,
        success:function(data)
        {
            console.log(data);
            alert('화면이 새로고침됩니다.');
            location.href = location.href;
        },
        error: function(error){
            console.log(`error : ${error}`);
        }
     });
    }

//카드를 클릭하면 삭제 처리를 한다.
function clickCard(contentId)
{
    addTopThreefunc(false, contentId);
}

showFavorites();
function showFavorites()
{
    $.ajax(
    {
        type : 'GET',
        url  : '${path}/admin/favoriteTopThreeAjax',
        success:function(data)
        {
            console.log(data);
            console.log(data.sites.length);
            let resultStr = '';
            let sites = data.sites;
            let startRowNo = 0;

            //조회된 site만큼 for문을 돌린다.
            for(let i = 0; i< sites.length ; i ++)
            {
                let site = sites[i]; // '+ site. + '

                contentIdsArr.push(site.contentid);
                let imageUrl = site.image;
                if(imageUrl =='' || imageUrl == null)
                {
                    imageUrl = 'https://i.ibb.co/6wHGL3T/Kakao-Talk-20240215-211419884.jpg';
                }
                
                resultStr += '<div class="col-md-4">';
                resultStr += '    <a href="javascript:clickCard('+ site.contentid +');" name="" style="text-decoration: none;">';
                resultStr += '        <div class="card mb-4 product-wap rounded-0">';
                resultStr += '            <div class="card rounded-0">';
                resultStr += '                <img class="card-img rounded-0 img-fluid" src="'+ imageUrl +'">';
                resultStr += '                <div class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">';
                resultStr += '                    <p class="readMore" style="font-size: 14px !important;color:white;">+<br>DELETE</p>';
                resultStr += '                </div>';
                resultStr += '            </div>';
                resultStr += '            <div class="card-body">';
                resultStr += '                <p class="text-center mb-4" style="font-size: 18px !important; font-weight: bold; color: #4B4242; height: 54px !important;">';
                resultStr += site.title + '</p>';
                resultStr += '                <p class="text-decoration-none mb-2 !important" style="font-size: 14px !important; display: block; text-align: start !important; word-wrap: break-word; word-break: break-word; padding-left: 22px; top: 0; background: url(${path}/img/trip/map_icon.png)no-repeat; line-height: 19px;">';
                resultStr += site.address + '</p>';
                resultStr += '                <p class="text-decoration-none mb-2 !important" style="font-size: 14px !important; display: block;  text-align: start !important; word-wrap: break-word; word-break: break-word; padding-left: 22px; top: 0; background: url(${path}/img/trip/tel_icon.png)no-repeat; line-height: 19px;">';
                resultStr += (site.tel==null?'방문접수':site.tel) + '</p>';
                resultStr += '            </div>';
                resultStr += '        </div>';
                resultStr += '    </a>';
                resultStr += '</div>';
            }
            for(let i = 0; i< (3-sites.length) ; i ++)
            {
                resultStr += '<div class="col-md-4">';
                resultStr += '    <a  style="text-decoration: none;">';
                resultStr += '        <div class="card mb-4 product-wap rounded-0">';
                resultStr += '            <div class="card rounded-0">';
                resultStr += '                <img class="card-img rounded-0 img-fluid" src="https://i.ibb.co/6wHGL3T/Kakao-Talk-20240215-211419884.jpg">';
                resultStr += '                <div class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">';
                resultStr += '                    <p class="readMore" style="font-size: 14px !important;color:white;">+<br>INSERT CONTENT</p>';
                resultStr += '                </div>';
                resultStr += '            </div>';
                resultStr += '            <div class="card-body">';
                resultStr += '                <p class="text-center mb-4" style="font-size: 18px !important; font-weight: bold; color: #4B4242; height: 54px !important;">';
                resultStr += '                    추가 필요';
                resultStr += '                </p>';
                resultStr += '                <p class="text-decoration-none mb-2 !important" style="font-size: 14px !important; display: block; text-align: start !important; word-wrap: break-word; word-break: break-word; padding-left: 22px; top: 0; background: url(${path}/img/trip/map_icon.png)no-repeat; line-height: 19px;">';
                resultStr += '                    추천장소를 선택해주세요';
                resultStr += '                </p>';
                resultStr += '                <p class="text-decoration-none mb-2 !important" style="font-size: 14px !important; display: block;  text-align: start !important; word-wrap: break-word; word-break: break-word; padding-left: 22px; top: 0; background: url(${path}/img/trip/tel_icon.png)no-repeat; line-height: 19px;">';
                resultStr += '                     콜미';
                resultStr += '                </p>';
                resultStr += '            </div>';
                resultStr += '        </div>';
                resultStr += '    </a>';
                resultStr += '</div>';
            }
            $('#topThreeSites').empty();
            $('#topThreeSites').append(resultStr);
        },
        error: function(error){
            console.log(`error : ${error}`);
            let resultStr = '';

            for(let i = 0; i< 3 ; i ++)
            {
                resultStr += '<div class="col-md-4">';
                resultStr += '    <a  style="text-decoration: none;">';
                resultStr += '        <div class="card mb-4 product-wap rounded-0">';
                resultStr += '            <div class="card rounded-0">';
                resultStr += '                <img class="card-img rounded-0 img-fluid" src="https://i.ibb.co/6wHGL3T/Kakao-Talk-20240215-211419884.jpg">';
                resultStr += '                <div class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">';
                resultStr += '                    <p class="readMore" style="font-size: 14px !important;color:white;">+<br>INSERT CONTENT</p>';
                resultStr += '                </div>';
                resultStr += '            </div>';
                resultStr += '            <div class="card-body">';
                resultStr += '                <p class="text-center mb-4" style="font-size: 18px !important; font-weight: bold; color: #4B4242; height: 54px !important;">';
                resultStr += '                    오류';
                resultStr += '                </p>';
                resultStr += '                <p class="text-decoration-none mb-2 !important" style="font-size: 14px !important; display: block; text-align: start !important; word-wrap: break-word; word-break: break-word; padding-left: 22px; top: 0; background: url(${path}/img/trip/map_icon.png)no-repeat; line-height: 19px;">';
                resultStr += '                    새로고침 해주세요';
                resultStr += '                </p>';
                resultStr += '                <p class="text-decoration-none mb-2 !important" style="font-size: 14px !important; display: block;  text-align: start !important; word-wrap: break-word; word-break: break-word; padding-left: 22px; top: 0; background: url(${path}/img/trip/tel_icon.png)no-repeat; line-height: 19px;">';
                resultStr += '                     콜미';
                resultStr += '                </p>';
                resultStr += '            </div>';
                resultStr += '        </div>';
                resultStr += '    </a>';
                resultStr += '</div>';

            }
            $('#topThreeSites').empty();
            $('#topThreeSites').append(resultStr);
        }
     });
    
    console.log(contentIdsArr);
}
function search() {
    var selectValue = document.getElementById('searchContentType').value;
    var searchValue = document.getElementById('searchKeyword').value;

    let data              = {searchKeyword , searchContentType};

    if(searchValue.trim() != '' || selectValue.trim() != '') {
        var url = "${path}/admin/favoritesite?select=" + selectValue + "&search=" + encodeURIComponent(searchValue);
    }
    else {
        var url = "${path}/admin/favoritesite";
    }
    
    window.location.href = url;
}
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />