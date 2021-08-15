<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
	request.setCharacterEncoding("utf-8");
%>


<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<!-- Bootstrap CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
	<title>공지사항</title>
</head>
<body>
 
  <!-- 메인코드부 -->
 <div class="wrap">
 
	 
	<div class="main-content">	 
	
	<div class="container">
	
	<div class="row" style="text-align: center; margin: 50 auto; ">
		<H3>공지사항</H3>
		<br><hr style="width:300; margin:auto;"><br>
		<p>공지사항입니다.<br></p>
		<BR><BR>
	</div>	
		
		<table class="table table-hover">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>날짜</th>
				
				</tr>
			</thead>
			<tbody>
			<c:choose>
			<c:when test="${!empty noticeList }">
			<c:forEach var="notice" items="${noticeList }">
			<fmt:formatDate var="ndate" value="${notice.date }" pattern="yyyy-MM-dd"/>
			<tr>
			<td>공지</td>
			<td><a href="${contextPath}/bboard/oneNo.do?num=${notice.num }">${notice.title }</a></td>
			<td>${notice.id }</td>
			<td>${ndate }</td>
			</tr>
			</c:forEach>
			</c:when>
			</c:choose>
		
			</tbody>
		</table>
	<br>
	<c:if test="${isLogOn==true && member.id =='admin' }">
	<button class="btn btn-danger" type="button" onclick='location.href="${contextPath}/writeform1.do"'>글쓰기</button>
	</c:if>
		<!-- 검색바 -->
		<div class="row justify-content-center">
			<div class="container-fluid" style="width:450px">
				<form class="d-flex">
					<input class="form-control me-2" type="search" placeholder="검색" aria-label="Search">
					<button class="btn btn-outline-success" type="submit">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
							<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
						</svg>
					</button>
				</form>
			</div>
		</div>
		<br>
		
		
		
		<!-- 페이지번호 -->
		<div class ="text-center">
			<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center">
					<li class="page-item">
						<a class="page-link" href="#" aria-label="Previous">
							<span aria-hidden="true">&laquo;</span>
						</a>
					</li>
						<li class="page-item"><a class="page-link" href="#">1</a></li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item">
						<a class="page-link" href="#" aria-label="Next">
							<span aria-hidden="true">&raquo;</span>
						</a>
					</li>
				</ul>
			</nav>
		</div>
	
	</div>
</div>
</div>	

	 
</body>
</html>
