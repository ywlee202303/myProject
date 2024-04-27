<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>

<c:set var="path" value="${ pageContext.request.contextPath }" />
<link rel="stylesheet" href="${ path }/css/findstay/Write.css">

<jsp:include page="/WEB-INF/views/common/header.jsp" />

<main>
	<div class="findstay-logo-wrap">
		<div class="findstay-logo"></div>
	</div>
	
	<div class="findstayWrite-restay-container">
		<form action="${ path }/findstay/write" method="post" enctype="multipart/form-data">
			<table border="1">
				<tr>
					<th>
						<label for="house-name">숙소명</label>
					</th>
					<td>
						<input type="text" id="house-name" name="houseName" />
					</td>
				</tr>
				<tr>
					<th>지역</th>
					<td>
						<select id="area" name="area">
							<option value="">-- 선택 --</option>
							<c:forEach var="area" items="${ areas }">
								<option value="${ area.areaCode }">${ area.areaName }</option>
							</c:forEach>
						</select>
						
						<select id="sigungu" name="sigungu">
							<option value="">-- 선택 --</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>
						<label for="house-address">상세주소</label>
					</th>
					<td>
						<input type="text" id="house-address" name="houseAddress" />
					</td>
				</tr>
				<tr>
					<th>
						<label for="house-tel">전화번호<br>("-포함")</label>
					</th>
					<td>
						<input type="text" id="house-tel" name="houseTel" />
					</td>
				</tr>
				<tr>
					<th>
						<label for="house-email">이메일</label>
					</th>
					<td>
						<input type="email" id="house-email" name="houseEmail" />
					</td>
				</tr>
				<tr>
					<th>
						<label for="house-min-price">최저 가격</label>
					</th>
					<td>
						<input type="number" id="house-min-price" name="houseMinPrice" />
					</td>
				</tr>
				<tr>
					<th>
						이미지
					</th>
					<td style="padding-bottom: 5px;">
						<input type="file" id="house-img1" name="imgFiles" /><br>
						<input type="file" id="house-img2" name="imgFiles" /><br>
						<input type="file" id="house-img3" name="imgFiles" /><br>
						<input type="file" id="house-img4" name="imgFiles" /><br>
						<input type="file" id="house-img5" name="imgFiles" />
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

<script>
	$(document).ready(() => {
		$('#writeBtn').click(() => {
			// 숙소명
			if($('#house-name').val() === '') {
				alert('숙소명을 입력해주세요.');
				
				return false;
			}
			
			// 지역 선택
			if($('#area').val() === '') {
				alert('지역을 선택해주세요.');
				
				return false;
			}
			
			// 상세 주소
			if($('#house-address').val() === '') {
				alert('상세 주소를 입력해주세요.');
				
				return false;
			}
			
			// 전화 번호
			if($('#house-tel').val() === '') {
				alert('전화번호를 입력해주세요.');
				
				return false;
			}
			
			// 이메일
			if($('#house-email').val() === '') {
				alert('이메일을 입력해주세요.');
				
				return false;
			}
			
			// 이미지
			if(
				$('#house-img1').val() === '' &&
				$('#house-img2').val() === '' &&
				$('#house-img3').val() === '' &&
				$('#house-img4').val() === '' &&
				$('#house-img5').val() === ''
			) {
				alert('1개 이상의 파일을 등록해주세요.');
				
				return false;
			}
			
			
		})
		
		$('#area').on('change', (e) => {
			let areaCode = $(e.target).val();
			
			console.log(areaCode);
			
			if($('#area').val() !== '') {
				
				// 시군구 조회
				$.ajax({
					url: '${ path }/findstay/write/sigungus',
					type: 'post',
					data: {
						areaCode
					},
					success: (res) => {
						console.log(res);
						
						let element = $('#sigungu');
						
						element.empty();
						
						for(let i = 0; i < res.length; i++) {
							element.append(
								'<option value="' + res[i].sigunguCode + '">' +
									res[i].sigunguName +
								'</option>'		
							);
						}
					}
				});
			} else {
				let element = $('#sigungu');
				
				element.empty();
				
				element.append(
					'<option value="">' + '--선택--' + '</option>'	
				);
			}
			
		});
	});
</script>

