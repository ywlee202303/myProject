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
		<form action="${ path }/findstay/write" method="post">
			<table border="1">
				<tr>
					<th>
						<label for="house-name">숙소명</label>
					</th>
					<td>
						<input type="text" id="house-name" name="house-name" />
					</td>
				</tr>
				<tr>
					<th>지역</th>
					<td>
						<select id="area" name="area">
							<option value="seoul">서울
							<option value="gyeonggi">경기
							<option value="incheon">인천
						</select>
						<select>
							<option value="gangnam">강남구
							<option value="gangbuk">강북구
							<option value="seocho">서초구
						</select>
					</td>
				</tr>
				<tr>
					<th>
						인원
					</th>
					<td>
						기준 2명 (최대 4명)
					</td>
				</tr>
				<tr>
					<th>
						<label for="house-price">가격</label>
					</th>
					<td>
						<input type="number" id="house-price" name="house-price" min="1" />
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
		$.ajax({
			url: '${ path }/findstay/write/areas',
			type: 'post',
			success: (res) => {
				console.log(res);
			}
		});
	});
</script>

