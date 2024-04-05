<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"              prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"               prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"         prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags"   prefix="security" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<link rel="stylesheet" href="${path}/css/community/noticedetail.css">

<!-- ******************* 기본 template(사이드메뉴 No  형식) 시작 ******************* -->
<div class="content container-fluid" style="position:relative;background-color:#FFF9E5;height:300px;"><span style="position:absolute;top:0px;left:0px;">content & container-fluid</span>
	<div class="container"           style="position:relative;background-color:skyblue;height:300px;"><span style="position:absolute;top:0px;left:0px;">container</span>
		<div class="common-title" style="position:relative;background-color:lavender;   ">             <span style="position:absolute;top:0px;left:0px;">common-title</span>
			<p>No 사이드메뉴 기본 템플릿</p>
		</div>
	</div>
</div>
<!-- ******************* 기본 template(사이드메뉴 No  형식) 종료 ******************* -->
<!-- ******************* 기본 template(사이드메뉴 Yes 형식) 시작 ******************* -->
<div class="content"              style="position:relative;background-color:lime;  height:300px;"><span style="position:absolute;top:0px;left:0px;">content</span>
	<div class="container"        style="position:relative;background-color:orange;height:300px;"><span style="position:absolute;top:0px;left:0px;">container</span>
		<div class="common-title" style="position:relative;background-color:lavender;   "><span style="position:absolute;top:0px;left:0px;">common-title</span>
			<p>Yes 사이드메뉴 기본 템플릿</p>
		</div>
		
		<div class="common-sideMenu" style="position:relative;background-color:deeppink;height:100px;"><span style="position:absolute;top:0px;left:0px;">common-sideMenu</span>
		</div>
		
		<div class="common-list" style="position:relative;background-color:skyblue;height:100px;"><span style="position:absolute;top:0px;left:0px;">common-list</span>
		</div>
	</div>
</div>
<!-- ******************* 기본 template(사이드메뉴 Yes 형식) 종료 ******************* -->
<!-- <div class="container-fluid"> -->
<div class="content">
	<div class="container">
	
		<!-- ******************* 사이드메뉴 시작 ******************* -->
		<div class="common-title">
			<p>사이드메뉴</p>
		</div>
		<div class="common-sideMenu">
			<ul>
				<li class="">커뮤니티</li>
				<li class="on"><a href="#">공지사항</a></li>
				<li class=""><a href="#">자유 게시판</a>
				<ul class="community-detail-sideMenu">
					<li><a href="#">수다</a></li>
					<li><a href="#">마이펫 자랑</a></li>
				</ul></li>
			</ul>
		</div>
			
		<!-- ******************* 사이드메뉴 종료 ******************* -->
		
		<!-- ******************* 검색바 시작 ******************* -->
		<div class="common-title">
			<p>검색바</p>
		</div>
		<div class="common-list">
			<div class="common-search">
				<div>
					TOTAL <span>26</span>건
				</div>
				<div>
					<div>
						<select name="communitySelect" id="communitySelect">
							<option value="title" selected>제목</option>
							<option value="name">작성자</option>
							<option value="content">내용</option>
						</select>
					</div>
					<div>
						<img src="${ path }/img/community/search.png"> <input type="text"
							name="communitySearch" id="communitySearch"
							placeholder="검색어를 입력해주세요.">
					</div>
					<div>
						<button>검색</button>
					</div>
				</div>
			</div>
		</div>
		<!-- ******************* 검색바 종료 ******************* -->
		<!-- ******************* 테이블 시작 ******************* -->
		<div class="common-title">
			<p>테이블</p>
		</div>
		<div class="common-list">
			<div class="common-detail-list">
				<table border="1">
					<tr style="background-color: #FDFAEF;">
						<td>번호</td>
						<td style="text-align: center; cursor: default;">제목</td>
						<td>작성자</td>
						<td style="text-align: center;">조회수</td>
						<td>등록일</td>
					</tr>
					<tr>
						<td><img src="${ path }/img/community/ant-design_sound-filled.png"
							alt=""></td>
						<td
							style="display: block; padding-top: 20px; padding-left: 5px; border-style: none;"><a
							href="#" style="font-size: 16px;">[공지사항] 2023 영월 댕댕트레인 안내!</a></td>
						<td>관리자</td>
						<td>139</td>
						<td>2023-10-13</td>
					</tr>
					<tr>
						<td><img src="${ path }/img/community/ant-design_sound-filled.png"
							alt=""></td>
						<td
							style="display: block; padding-top: 20px; padding-left: 5px; border-style: none;"><a
							href="#" style="font-size: 16px;">[공지사항] 댕댕트레킹, 프라이빗 반려견 트레킹 코스</a></td>
						<td>관리자</td>
						<td>247</td>
						<td>2023-05-09</td>
					</tr>
					<tr>
						<td><img src="${ path }/img/community/ant-design_sound-filled.png"
							alt=""></td>
						<td
							style="display: block; padding-top: 20px; padding-left: 5px; border-style: none;"><a
							href="#" style="font-size: 16px;">[공지사항] 2023 춘천 반려동물 페스티벌</a></td>
						<td>관리자</td>
						<td>350</td>
						<td>2023-05-04</td>
					</tr>
					<tr>
						<td><img src="${ path }/img/community/ant-design_sound-filled.png"
							alt=""></td>
						<td
							style="display: block; padding-top: 20px; padding-left: 5px; border-style: none;"><a
							href="#" style="font-size: 16px;">[공지사항] '전국댕댕자랑' 수상작 발표~!!!!</a></td>
						<td>관리자</td>
						<td>1236</td>
						<td>2022-12-12</td>
					</tr>
				</table>
			</div>
		</div>
		<!-- ******************* 테이블 종료 ******************* -->
		
		<!-- ******************* 페이징 시작 ******************* -->
		
<script>
function clickPaging(){
	showPaging(($(this).attr('pageno')*1) , 10, 1009, 10, clickPaging);
};
$(document).ready(() => {
	showPaging(101 , 10, 1009, 10, clickPaging);
	$('div.common-page-number>ul>li').on('click',  clickPaging);
});
</script>
		<div class="common-title">
			<p>페이징 </p>
		</div>
		
		<div class="common-list">
			<div class="common-page-number">
				<ul>
					<li><a href="#">&laquo;</a></li>
					<li><a href="#">&lt;&lt;</a></li>
					<li><a href="#">&lt;</a></li>
					<li class="on"><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
					<li><a href="#">&gt;</a></li>
					<li><a href="#">&gt;&gt;</a></li>
					<li><a href="#">&raquo;</a></li>
				</ul>
			</div>
		</div>
		<!-- ******************* 페이징 종료 ******************* -->
		<!-- ******************* 상세테이블 시작 ******************* -->

		<div class="common-title">
			<p>상세테이블</p>
		</div>
		<div class="common-list">

			<div class="community-detail-list">
				<table border="1">
					<tr>
						<td style="background-color: #FDFAEF;">제목</td>
						<td colspan="5" class="community-td-title" style="text-align: left;">[공지사항] 댕댕트레킹, 프라이빗
							반려견 트레킹 코스</td>
					</tr>
					<tr>
						<td style="background-color: #FDFAEF;">작성자</td>
						<td>관리자</td>
						<td style="background-color: #FDFAEF;">등록일</td>
						<td>2023-05-09</td>
						<td style="background-color: #FDFAEF;">조회수</td>
						<td>251</td>
					</tr>
					<tr>
						<td colspan="6" class="community-td-content"
							style="text-align: left">산을 통째로 빌렸어요!<br>
							댕댕트레킹, 프라이빗 반려견 트레킹 코스<br> <br> 일시 : 2023년 5월 19일(금) ~
							21일(일)<br> 장소 : 하늘길 트레킹 코스 + 정선 하이원 리조트<br> <br>
							주요내용 : 6k, 4k, 3k 코스 자유 선택<br> 보듬 훈련사와 함께 대규모 트레킹 클래스<br>
							트레킹 대장(강형욱 훈련사)과 다양한 프로그램<br> 대상 : 보호자 3,500명 with 반려견<br>
							티켓 : 일반 참가권 49,000원 및 일부 할인적용 할인권 (숙박권 별도)<br> 링크 :
							https://dangdangtrekking.com/<br> <br> 
							<img src="${ path }/img/community/ddtrekking_1.jpg" alt="" width="800px">
						</td>
					</tr>
				</table>
			</div>
		</div>
		<!-- ******************* 상세테이블 종료 ******************* -->
		
        <!-- ******************* 입력컴포넌트 시작 ******************* -->

        <div class="common-title">
            <p>입력 컴포넌트</p>
        </div>
        <div class="common-list">

            <div class="btn-wrap">
                <button class="community-btn">목록</button>
                <button class="community-btn btn-filled">목록</button>
                <input class="common-input-text" type="text" name="" id="">
            </div>
        </div>
        <!-- ******************* 입력컴포넌트 종료 ******************* -->
	</div>
</div>



<!-- ******************* 기본 template(사이드메뉴 Yes 형식) 시작 ******************* -->
<!-- <div class="content"              > -->
<!-- 	<div class="container"> -->
<!-- 		<div class="common-title" > -->
<!-- 			<p>기본 템플릿</p> -->
<!-- 		</div> -->
<!-- 		<div class="common-sideMenu"></div> -->
<!-- 		<div class="common-list"></div> -->
<!-- 	</div> -->
<!-- </div> -->
<!-- ******************* 기본 template(사이드메뉴 Yes 형식) 종료 ******************* -->
<!-- ******************* 기본 template(사이드메뉴 No  형식) 시작 ******************* -->
<!-- <div class="content container-fluid"> -->
<!-- 	<div class="container"> -->
<!-- 	</div> -->
<!-- </div> -->
<!-- ******************* 기본 template(사이드메뉴 No  형식) 종료 ******************* -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />