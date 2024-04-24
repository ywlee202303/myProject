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
						<label for="house-tel">전화번호</label>
					</th>
					<td>
						<input type="tel" id="house-tel" name="houseTel" />
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
						이미지
					</th>
					<td style="padding-bottom: 5px;">
						<input type="file" name="house-img-1" /><br>
						<input type="file" name="house-img-2" /><br>
						<input type="file" name="house-img-3" /><br>
						<input type="file" name="house-img-4" /><br>
						<input type="file" name="house-img-5" />
					</td>
				</tr>
			</table>
			<div class="write-btn">
				<button type="submit">등록</button>
			</div>
		</form>
	</div>
</main>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

<script>
	$(document).ready(() => {
		$('#area').on('change', (e) => {
			let areaCode = $(e.target).val();
			
			console.log(areaCode);
			
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
		});
	});
</script>

