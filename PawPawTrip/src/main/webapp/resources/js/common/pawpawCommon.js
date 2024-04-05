//페이징 정보를 반환해주는 객체
//pageNo      : 현재 페이지 번호
//numOfRows   : 리스트에 출력할 행의 개수
//totalCount  : 조회된 총 행의개수
//pagingNum   : 페이징 요소에 보여줄 페이지 개수
function calcPaging(pageNo , numOfRows, totalCount, pagingNum)
{
	/*
	* 용어
	페이지 : 페이지
	페이징 : 페이지들의 그룹
	
	* 필드 설명
	this.maxPagingNo    : 조회된 행들의 마지막 페이지 번호
	this.pageNo         : 현재 페이지 번호
	this.multipleChkNum : this.pageNo / pagingNum 몫 
	this.modNum         : this.pageNo / pagingNum 나머지
	this.strPagingNo    : 시작페이징번호
	this.endPagingNo    : 종료페이징번호

	* 기본원리
	: 시작페이지 번호와 종료페이지 번호를 구해서 for문으로 페이징 요소를 문자열로 완성한다.

	* 예외발생 경우
	
	- pageNo가 0이거나 음수 일때	
	- pageNo가 최대 페이지 번호를 초과할 때	
	
	*/
	
	//필드 선언 순서 중요!
	this.maxPagingNo    = Math.ceil(totalCount/numOfRows);
	this.pageNo         = pageNo<1?1:pageNo>this.maxPagingNo?this.maxPagingNo:pageNo;
	this.multipleChkNum = Math.floor(this.pageNo / pagingNum);
	this.modNum         = this.pageNo % pagingNum;
	this.strPagingNo    = Math.floor(this.pageNo / pagingNum)*pagingNum + (this.modNum==0? (pagingNum*-1)+1:1);
	this.endPagingNo    = (this.strPagingNo + pagingNum - 1)>this.maxPagingNo?this.maxPagingNo:(this.strPagingNo + pagingNum - 1);
}

//페이징 요소를 만들어주는 함수
//pageNo      : 현재 페이지 번호
//numOfRows   : 리스트에 출력할 행의 개수
//totalCount  : 조회된 총 행의개수
//pagingNum   : 페이징 요소에 보여줄 페이지 개수
//clickPaging : <li> 를 클릭했을때 실행할 함수 이름 (html 요소를 생성하면 기존의 클릭 이벤트가 사라진다.) 
function showPaging(pageNo , numOfRows, totalCount, pagingNum, clickPaging)
{
    console.log(pageNo , numOfRows, totalCount, pagingNum);

	let pagingTagResult = '';//페이징 요소를 만들 문자열
	let calcedPage      = new calcPaging(pageNo , numOfRows, totalCount, pagingNum);//페이징 정보를 반환해줄 객체
	pageNo = calcedPage.pageNo; //pageNo 가 1 미만이거나 maxPage를 초과할때 범위내로 pageNo를 잡아주기 위함 

	//이전 버튼클릭했을때 이동할 pageNo를 설정하기위한 처리
	let prevPageCalc = new calcPaging((calcedPage.strPagingNo - pagingNum) , numOfRows, totalCount, pagingNum);
	//다음 버튼클릭했을때 이동할 pageNo를 설정하기위한 처리
	let nextPageCalc = new calcPaging((calcedPage.endPagingNo + pagingNum) , numOfRows, totalCount, pagingNum);
	
	$('div.common-page-number').empty();
	pagingTagResult += '<ul>';
	//pagingTagResult += '    <li pageNo="1"><a href="#">&lt;&lt;</a></li>';
	pagingTagResult += '    <li pageNo="'+ prevPageCalc.endPagingNo +'"><a href="" onclick="return false;">&lt;</a></li>';
	
	//계산된 시작 페이징 번호와 종료 페이징 번호 만큼 pageNo를 만든다.
	for(let idx = calcedPage.strPagingNo; idx<=calcedPage.endPagingNo; idx++)
	{
		pagingTagResult += '    <li pageNo="'+ idx +'"'+ (idx== pageNo?' class="on"':'') +'><a href="" onclick="return false;">'+ idx +'</a></li>';
	}
	
	pagingTagResult += '    <li pageNo="'+ nextPageCalc.strPagingNo +'"><a href="" onclick="return false;">&gt;</a></li>';
	//pagingTagResult += '    <li pageNo="'+ calcedPage.maxPagingNo +'"><a href="#">&gt;&gt;</a></li>';
	pagingTagResult += '</ul>';
	$('div.common-page-number').append(pagingTagResult);

	$('div.common-page-number>ul>li').on('click', clickPaging);
}
$(document).ready(()=>{
	const move = function() {
		const boardText = document.querySelector('#test1');
		
		boardText.style.color = "#B29254";
		
	}
})