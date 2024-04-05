<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"              prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"               prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"         prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags"   prefix="security" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<link rel="stylesheet" href="${path}/css/common/error.css">

<div class="container content">
	<div class="error-title">
		<p id="errMsg" style="font-size:200px;opacity:0.3; font-weight: 900;"></p>
		<p>요청하신 페이지를 찾을 수 없습니다.<br>${errorCode}</p>
	</div>
	
	<div class="btn-wrap">
		<button id="mainBtn" onclick="location.href='${ path }/'">메인페이지</button>
		<button id="prevBtn" onclick="history.back()">이전페이지</button>
	</div>
</div>

<script>

	let random = Math.floor((Math.random() * 7));
	let arr = ['( ͡° ᴥ ͡°)', 'U ´ᴥ` U', 'υ´• ﻌ •`υ', '*ฅ^•ﻌ•^ฅ*', '(ﾐⓛᆽⓛﾐ)', '▼・ᴥ・▼', 'ʕ´•ᴥ•`ʔ'];
	
	let errMsg = document.getElementById('errMsg');
	
	errMsg.innerHTML = arr[random];
	
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />