<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
	request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<!-- Bootstrap CSS -->
	
	<title>문의게시판</title>
</head>
<body>
 
  <!-- 메인코드부 -->
 <div class="wrap">
 
	 
	<div class="main-content">	 
	
	<div class="container">
	
		<br>
		<H1>문의게시판</H1>
		<br>
		<br>
		
		<table class="table table-hover">
			<thead>
				<tr style="color:orange;">
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>날짜</th>
			
				</tr>
			</thead>
			<tbody>
			<c:choose>
			<c:when test="${!empty qnaList }">
			<c:forEach var="qna" items="${qnaList }" varStatus="num">
			<tr>
			<td>${num.index+1}</td>
			<td><a href="${contextPath}/passthro.do?num=${qna.num }">${qna.title }</a><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-lock" viewBox="0 0 16 16">
 			 	<path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2zm3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2zM5 8h6a1 1 0 0 1 1 1v5a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V9a1 1 0 0 1 1-1z"/>
				</svg></td>
			<td><!--  <a href="${contextPath}/boardq/viewQna.do?num=${qna.num }">-->${qna.name }</a></td>
			<td>${qna.date }</td>
			</tr>
			</c:forEach>
			</c:when>
			</c:choose>
		
			</tbody>
		</table>
	<br>
	
	<button class="btn btn-danger" type="button" onclick='location.href="${contextPath}/boardq/writeformq.do"'>글쓰기</button>

		<!-- 검색바 -->
		<div class="row justify-content-center">
			<div class="container-fluid" style="width:450px">
				<form class="d-flex" action="${contextPath}/boardq/searchTitle.do" method="post">
				<select style="border: 1px solid lightgrey;" name="sorting1">
				  <option value="title" selected >제목</option>
				  <option value="name" >글쓴이</option>
				</select>
					<input class="form-control me-2" type="text" name="word1" placeholder="검색어를 입력하세요" aria-label="Search">
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
