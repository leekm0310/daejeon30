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
		
	<div class="row" style="text-align: center; margin: 50 auto; ">
		<H3>문의게시판</H3>
		<br><hr style="width:300; margin:auto;"><br>
		<p>해당되는 카테고리를 설정 후 문의 부탁드립니다.<br></p>
		<BR><BR>
	</div>	
	
	
		
		<table class="table table-hover">
			<thead>
				<tr style="color:orange;">
					<th>번호</th>
					<th style="width:700;">제목</th>
					<th >작성자</th>
					<th>날짜</th>
			
				</tr>
			</thead>
			<tbody>
			<c:choose>
			<c:when test="${!empty qnaList }">
			<c:forEach var="qna" items="${qnaList }" varStatus="num">
			<fmt:formatDate var="ndate" value="${qna.date }" pattern="yyyy-MM-dd"/>
			<tr>
			<td style="padding:14px">${qna.num}</td>
			<td>
			<a href="${contextPath}/passthro.do?num=${qna.num }">${qna.title }</a><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-lock" viewBox="0 0 16 16">
 			 	<path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2zm3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2zM5 8h6a1 1 0 0 1 1 1v5a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V9a1 1 0 0 1 1-1z"/>
				</svg></td>
			<td><!--  <a href="${contextPath}/boardq/viewQna.do?num=${qna.num }">-->${qna.name }</a></td>
			<td>${ndate }</td>
			<td>
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
		
		<!-- 페이지네이션 -->
		
	<div class="row">
					<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center">
						<c:if test="${pageMaker.prev }">
							<li class="page-item"><a class="page-link" href='<c:url value="/boardq/qna.do?page=${pageMaker.startPage-1 }"/>'
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a></li>
						</c:if>
						<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">	
							<li class="page-item"><a class="page-link" href='<c:url value="/boardq/qna.do?page=${pageNum }"/>'>${pageNum }</a></li>
						</c:forEach>
						<c:if test="${pageMaker.next && pageMaker.endPage >0 }">
							<li class="page-item"><a class="page-link" href='<c:url value="/boardq/qna.do?page=${pageMaker.endPage+1 }"/>' aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a></li>
						  </c:if>
						</ul>
					</nav>
				</div>
		
		
	
	</div>
</div>
</div>	

	 
</body>
</html>
