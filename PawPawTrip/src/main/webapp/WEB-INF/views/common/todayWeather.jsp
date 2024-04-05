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
<link rel="stylesheet" href="${path}/css/admin/plannedDevelop.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<div class="content">
    <div class="container">
        <div class="common-title">
            <p>날씨</p>
        </div>
        <div class="common-sideMenu">
			<img style="margin-top: 57px;" src="${ path }/img/weather/weatherEnd.png" >
        </div>
        <div class="common-list">
            <div class="community-detail-list">
              <!-- Tab panes -->
              <div class="tab-content" style="margin-bottom: 300px;">
                <div id="home" class="container tab-pane active"><br>
                
                    <div class="common-detail-list" style="position:relative;">
                        <div id="spinnerLoading" style="display:none;position:absolute;width:100%;height:100%;background-color:rgb(0 0 0 / 65%);">
                            <div class="spinner-border text-warning" style="position: absolute;width: 80px; height: 80px; border: 16px solid currentcolor; border-right-color: transparent;margin-left: -40px; margin-top: -40px;"></div>
                        </div>
                        <div style="text-align: left; margin-bottom: 10px;">
                        	<select id="regId">
                        		<option value="choice">----- 선택 -----</option>
                        		<c:forEach var="weatherArea" items="${ weatherAreas }" >
	                        		<option value="${weatherArea.areaCode }" grp="${weatherArea.areaGrpCode }">
	                        			<c:out value="${ weatherArea.areaName }" />
	                        		</option>
	                        		
                        		</c:forEach>
                        	</select>
                        </div>
                        <table>
                            <thead>
                            <tr>
								<td style="width: 70px;">3일 후</td>
								<td style="width: 70px;">4일 후</td>
								<td style="width: 70px;">5일 후</td>
								<td style="width: 70px;">6일 후</td>
								<td style="width: 70px;">7일 후</td>
								<td style="width: 70px;">8일 후</td>
                            </tr>
                            </thead>
                            <tbody id="midTogether">
                                <tr>
                                	<td colspan="7">조회된 게시글이 없습니다. 지역을 선택해 주세요.</td>
                                </tr>
								
                            </tbody>
                        </table>
                    </div>
                </div>
                <div id="menu1" class="container tab-pane fade"><br>
                    <!-- 회원 정보 -->
                    <div class="myinfo-inner-content">
                        <div class="myInfo-table">
                            <div class="myInfo-tr row">
                                <div class="col-lg-12">
                                    <div class="myInfo-td col-12">핸드폰 번호</div>
                                    <div class="myInfo-td col-12 padding-bottom">
                                        <input type="text" class="contain-button" id="memberPhone" name="memberPhone" value="" placeholder="ex) 01012345678">
                                        <button class="paw_btn btn-filled" id="sendMessage" type="button">보내기</button>
                                    </div>
                                </div>
                            </div>
                            <div class="myInfo-tr row">
                                <div class="col-lg-12">
                                    <div class="myInfo-td col-12">보낼 내용</div>
                                    <div class="myInfo-td col-12 padding-bottom"><textarea id="sendingMessage" name="sendingMessage" placeholder="[포포트립 안내] " >[포포트립 안내]
포포트립 개발하시느라 고생많으셨습니다~!</textarea></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="menu2" class="container tab-pane fade"><br>
                  <p>구현중이지롱</p>
                </div>
              </div>
            </div>
        </div>
    </div>
</div>

<script>
$(document).ready(function() 
{
    //보내기 버튼 클릭 시
    $('#sendMessage').click(function()
    {
        let memberPhone    = $('#memberPhone').val(); // 휴대폰 번호 입력란의 값을 가져와 'memberPhone' 변수에 할당
        let sendingMessages = $('#sendingMessage').val();
        
        $.ajax({
            type: "POST",
            url:'/pawpawtrip/sendMessages',
            data: {
                memberPhone,
                sendingMessages
            },
            success: function(res){
                alert('메세지가 전송되었습니다.');
            },
            error: function(error) {
                alert('메세지 전송에 실패하였습니다.');
            }
        })
    });     
//     $('#submitCheck').on('submit', (event) => {
//         let category = $('#comunityCate').val();
//         let title = $('#communityTitle').val();
//         let content = $('#summernote').val();
//         let file = $('#talkWriteFile').val().split('.').pop();
//         let noticeImportantYN = $('#noticeImportantYN option:selected').val();
        
        
//         if(noticeImportantYN == '') {
//             alert('공지구분을 선택해주세요.');
//             return false;
//         }
//         if(category === '분류') {
//             alert('카테고리를 선택해주세요.');
//             return false;
//         }
        
//         if(title === '') {
//             alert('제목을 입력해주세요.');
//             return false;
//         }
        
//         if(content === '') {
//             alert('내용을 입력해주세요.');
//             return false;
//         }
        
//         if(!(file === 'jpg' || file === 'png' || file === 'gif' || file === '')) {
//             alert('이미지 파일을 등록해주세요.');
//             return false;
//         }
        
//     });
    
//     $("#summernote").summernote(
//     {
//         width     : 650,
//         // height: 100,
//         maxHeight : 500,
//         minHeight : 500,
//         placeholder : '내용을 입력해주세요.',
//         lang        : 'ko-KR',
//         toolbar   : [
//                     [ 'Font Style', [ 'fontname'      ] ],
//                     [ 'style'     , [ 'bold', 'italic', 'underline' ] ],
//                     [ 'font'      , [ 'strikethrough' ] ],
//                     [ 'fontsize'  , [ 'fontsize'      ] ],
//                     [ 'color'     , [ 'color'         ] ],
//                     [ 'para'      , [ 'paragraph'     ] ],
//                     [ 'height'    , [ 'height'        ] ],
//                     [ 'Insert'    , [ 'picture'       ] ],
//                     [ 'Insert'    , [ 'link'          ] ],
//                     [ 'Misc'      , [ 'fullscreen'    ] ] ],
//         fontNames : [ 'Arial', 
//                       'Arial Black',
//                       'Comic Sans MS',
//                       'Courier New',
//                       '맑은 고딕',
//                       '궁서',
//                       '굴림체',
//                       '굴림',
//                       '돋움체',
//                       '바탕체' 
//                     ],
//         fontSizes : [ '8', '9' , '10', '11', '12',
//                      '14', '16', '18', '20', '22',
//                      '24', '28', '30', '36', '50', '72' ]
//     });
	
	// 중기 예보
	$('#regId').on('change', (e) => {
		let regId = $(e.target).val();
		let regGrpId = $(e.target).children('option:selected').attr('grp');
		
		let result = '';
		let result2 = '';
		
		console.log(regId);
		console.log(regGrpId);
		
		if(regId !== 'choice') {
			
			// 중기 예보(기온, 날씨)
			$.getJSON('${path}/weather/midta', {regId, regGrpId})
			.done((data) => {

				let {regGrpId, regId} = data;
				
				let {resultCode, resultMsg, dataType, numOfRows, pageNo, totalCount, weatherMidLandItems} = regGrpId;
				let {resultCode2, resultMsg2, dataType2, numOfRows2, pageNo2, totalCount2, weatherMidItems} = regId;
				
				let regGrpItem = weatherMidLandItems[0];
				let regItem = weatherMidItems[0];
				
				console.log(regGrpItem);
				console.log(regItem);
				
				
				let fileIndex = {
						'맑음':1, 
						'구름많음':5,
						'구름많고 비':2,
						'구름많고 눈':3,
						'구름많고 비/눈':4,
						'구름많고 소나기':2,
						'흐림':5,
						'흐리고 비':2,
						'흐리고 눈':3,
						'흐리고 비/눈':4,
						'흐리고 소나기':2
				};

				;
				
				let fileName = '${path}/img/weather/weather'+ fileIndex[regGrpItem.wf3Am] + '.png'
				
				console.log(fileName);
				
				result = '<tr><td>' + '<div>' + '<span>' + '오전' + '</span><br>' + '<img width="100px;" src="${path}/img/weather/weather'+ fileIndex[regGrpItem.wf3Am] + '.png">' + '</div>' + '<hr>' + '<div>' + '<span>' + '오후' + '</span><br>' + '<img width="100px;" src="${path}/img/weather/weather'+ fileIndex[regGrpItem.wf3Pm] + '.png">'+  '</div>' + '</td>' +
						  '<td>' + '<div>' + '<span>' + '오전' + '</span><br>' + '<img width="100px;" src="${path}/img/weather/weather'+ fileIndex[regGrpItem.wf4Am] + '.png">' + '</div>' + '<hr>' + '<div>' + '<span>' + '오후' + '</span><br>' + '<img width="100px;" src="${path}/img/weather/weather'+ fileIndex[regGrpItem.wf4Pm] + '.png">'+  '</div>' + '</td>' +
						  '<td>' + '<div>' + '<span>' + '오전' + '</span><br>' + '<img width="100px;" src="${path}/img/weather/weather'+ fileIndex[regGrpItem.wf5Am] + '.png">' + '</div>' + '<hr>' + '<div>' + '<span>' + '오후' + '</span><br>' + '<img width="100px;" src="${path}/img/weather/weather'+ fileIndex[regGrpItem.wf5Pm] + '.png">'+  '</div>' + '</td>' +
						  '<td>' + '<div>' + '<span>' + '오전' + '</span><br>' + '<img width="100px;" src="${path}/img/weather/weather'+ fileIndex[regGrpItem.wf6Am] + '.png">' + '</div>' + '<hr>' + '<div>' + '<span>' + '오후' + '</span><br>' + '<img width="100px;" src="${path}/img/weather/weather'+ fileIndex[regGrpItem.wf6Pm] + '.png">'+  '</div>' + '</td>' +
						  '<td>' + '<div>' + '<span>' + '오전' + '</span><br>' + '<img width="100px;" src="${path}/img/weather/weather'+ fileIndex[regGrpItem.wf7Am] + '.png">' + '</div>' + '<hr>' + '<div>' + '<span>' + '오후' + '</span><br>' + '<img width="100px;" src="${path}/img/weather/weather'+ fileIndex[regGrpItem.wf7Pm] + '.png">'+  '</div>' + '</td>' +
						  '<td>' + '<div>' + '<span>' + '오전' + '</span><br>' + '<img width="100px;" src="${path}/img/weather/weather'+ fileIndex[regGrpItem.wf8]   + '.png">' + '</div>' + '<hr>' + '<div>' + '<span>' + '오후' + '</span><br>' + '<img width="100px;" src="${path}/img/weather/weather'+ fileIndex[regGrpItem.wf8]   + '.png">'+  '</div>' + '</td></tr>';
						  
				result += '<tr><td>' + regItem.taMin3 + '℃ / ' + regItem.taMax3 + '℃</td>' +
						 '<td>' + regItem.taMin4 + '℃ / ' + regItem.taMax4 + '℃</td>' +
						 '<td>' + regItem.taMin5 + '℃ / ' + regItem.taMax5 + '℃</td>' +
						 '<td>' + regItem.taMin6 + '℃ / ' + regItem.taMax6 + '℃</td>' +
						 '<td>' + regItem.taMin7 + '℃ / ' + regItem.taMax7 + '℃</td>' +
						 '<td>' + regItem.taMin8 + '℃ / ' + regItem.taMax8 + '℃</td></tr>';
				
				$('#midTogether').html(result);
// 				$('#midTa').html(result);
			});
		} else {
			result = '<tr><td colspan="6">' + '조회된 날씨정보가 없습니다. 지역을 선택해 주세요.' + '</td></tr>';
// 			$('#midLand').html(result2);
// 			$('#midTa').html(result);
			$('#midTogether').html(result);
		}
		
		
	})
	
	

});
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />