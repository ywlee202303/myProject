<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="background-image: url(/pawpawtrip/img/common/main-carousel-img1.png);background-repeat: no-repeat; cover;background-position-x: center;">
	<script>
		// 알림메세지를 띄움
		alert("${ msg }");
	
		// 실행시켜야할 스크립트가 있으면 실행
		if(${ not empty script }) {
			${ script }
		}
		
		// 페이지 이동
		location.replace("${ pageContext.request.contextPath }${ location }");
	</script>
</body>
</html>