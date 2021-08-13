<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
request.setCharacterEncoding("utf-8");
%>
<!doctype html>
<html>
<head>
</head>
<body>
<div class="localmenu">
<!-- 로컬네비게이션 -->
				<hr>
		<div class="btn-group">
			<button class="btn btn-outline-danger" type="button" id="defaultDropdown" onclick="location.href='${contextPath}/bboard/faq.do'"aria-expanded="false">
				FAQ
			</button>
		</div>
		
		<div class="btn-group">
			<button class="btn btn-outline-danger" type="button" id="dropdownMenuClickableOutside" onclick="location.href='${contextPath}/boardq/qna.do'" aria-expanded="false">
				문의게시판
			</button>
		</div>

				<hr>

</div>
</body>
</html>