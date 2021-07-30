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
<localmenu class="localmenu">
<!-- 로컬네비게이션 -->
				<hr>
				<div class="btn-group">
					<button class="btn btn-outline-danger" type="button"
						id="defaultDropdown" onclick="location.href='./board3.jsp'"
						aria-expanded="false">공지사항</button>
				</div>

				<div class="btn-group">
					<button class="btn btn-outline-danger" type="button"
						id="dropdownMenuClickableOutside"
						onclick="location.href='./board2.jsp'" aria-expanded="false">
						추천게시판</button>
				</div>

				<div class="btn-group">
					<button class="btn btn-outline-danger" type="button"
						id="dropdownMenuClickableOutside"
						onclick="location.href='./review1.jsp'" aria-expanded="false">
						리뷰게시판</button>
				</div>

				<hr>

</localmenu>
</body>
</html>