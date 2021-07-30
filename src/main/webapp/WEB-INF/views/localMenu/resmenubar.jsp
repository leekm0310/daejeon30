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
		  <hr>
		  <!-- 로컬버튼그룹 -->
		 			<div class="btn-group">
				<button class="btn btn-outline-danger dropdown-toggle"
					type="button" id="defaultDropdown" data-bs-toggle="dropdown"
					data-bs-auto-close="true" aria-expanded="false">지역</button>
				<ul class="dropdown-menu" aria-labelledby="defaultDropdown">
					<li><a class="dropdown-item" href="${contextPath}/res/sortRes.do?resSort=1">서구</a></li>
					<li><a class="dropdown-item" href="${contextPath}/res/sortRes.do?resSort=2">중구</a></li>
					<li><a class="dropdown-item" href="${contextPath}/res/sortRes.do?resSort=3">동구</a></li>
					<li><a class="dropdown-item" href="${contextPath}/res/sortRes.do?resSort=4">유성구</a></li>
					<li><a class="dropdown-item" href="${contextPath}/res/sortRes.do?resSort=5">대덕구</a></li>
				</ul>
			</div>

			<div class="btn-group">
				<button class="btn btn-outline-danger dropdown-toggle"
					type="button" id="dropdownMenuClickableOutside"
					data-bs-toggle="dropdown" data-bs-auto-close="inside" aria-expanded="false">분류</button>
					<ul class="dropdown-menu" aria-labelledby="dropdownMenuClickableOutside">
						<li><a class="dropdown-item" href="${contextPath}/res/sortFoods.do?resCategory=한식">한식</a></li>
						<li><a class="dropdown-item" href="${contextPath}/res/sortFoods.do?resCategory=일식">일식</a></li>
						<li><a class="dropdown-item" href="${contextPath}/res/sortFoods.do?resCategory=중식">중식</a></li>
						<li><a class="dropdown-item" href="${contextPath}/res/sortFoods.do?resCategory=양식">양식</a></li>
						<li><a class="dropdown-item" href="${contextPath}/res/sortFoods.do?resCategory=분식">분식</a></li>
						<li><a class="dropdown-item" href="${contextPath}/res/sortFoods.do?resCategory=패스트푸드">패스트푸드</a></li>
					</ul>
				</div>

				<div class="btn-group">
					<button class="btn btn-outline-danger dropdown-toggle"
						type="button" id="dropdownMenuClickableOutside"
						data-bs-toggle="dropdown" data-bs-auto-close="inside"
						aria-expanded="false">ETC</button>
					<ul class="dropdown-menu"
						aria-labelledby="dropdownMenuClickableOutside">
						<li><a class="dropdown-item" href="${contextPath}/res/sortRes.do?resSort=6">30년 전통식당</a></li>
						<li><a class="dropdown-item" href="${contextPath}/res/sortRes.do?resSort=7">착한 식당</a></li>
						<li><a class="dropdown-item" href="${contextPath}/res/sortRes.do?resSort=8">경로 우대 식당</a></li>
					</ul>
				</div>
		
		<hr>
</localmenu>
</body>
</html>