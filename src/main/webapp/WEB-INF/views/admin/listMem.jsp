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
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  
<title>회원관리</title>

 
</head>

<body>

 <!-- 메인코드부 -->
 <div class="wrap">
 	<div class="main-content">
	<div class="container" >

<!-- 본문 내용 -->
<h3>회원 관리</h3>
<br>
<div class="row">
<div class="col-8">
<div class="btn-group" role="group" aria-label="Basic outlined example">
  <button type="button" class="btn btn-outline-primary" onclick="location.href='${contextPath}/admin/listMem.do'">모든회원보기</button>
  <button type="button" class="btn btn-outline-dark" onclick="location.href='${contextPath}/admin/selectMemType.do?memType=일반회원'">일반회원</button>
  <button type="button" class="btn btn-outline-dark" onclick="location.href='${contextPath}/admin/selectMemType.do?memType=우수회원'">우수회원</button>
  <button type="button" class="btn btn-outline-dark" onclick="location.href='${contextPath}/admin/selectMemType.do?memType=블랙리스트'">블랙리스트</button>
</div></div>

<!-- 검색바 -->

<div class="col-4" >
				<form class="d-flex" action="${contextPath}/admin/searchMember.do" method="post">
				<select style="border: 1px solid lightgrey;" name="sorting1">
				  <option value="id" selected >아이디</option>
				  <option value="name" >이름</option>
				</select>
					<input class="form-control me-2" type="text" name="word1" aria-label="Search">
					<button class="btn btn-outline-success" type="submit">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
							<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
						</svg>
					</button>
				</form>
			</div>
</div>

<br><br>
	<table class="table table-hover">
	<thead>
	<tr>
		<th><input type="checkbox" id="checkall" onclick="checkAll();" style="width:20px;height:20px;"/></th>
		<th>구분</th>
		<th>아이디</th>
		<th>이름</th>
		<th>전화번호</th>
		<th>이메일</th>
		<th>가입일</th>
		<th></th>
	</tr>
	</thead>
	<tbody>
	   <c:choose>
   <c:when test="${!empty memList}" >
   <c:forEach  var="mem" items="${memList}" >
	<tr>

		<td><input type="checkbox" id="chk" name="chk" style="width:20px;height:20px;"/></td>
		<td>${mem.memType }</td>
		<td>${mem.id }</td>
		<td>${mem.name }</td>
		<td>${mem.phone}</td>
		<td>${mem.email }</td>
		<td>${mem.joindate}</td>
		<td width="200"><button class="btn btn-outline-success btn-sm" onclick="location.href='${contextPath}/admin/memDetail.do?id=${mem.id}'">수정</button>
		<button class="btn btn-outline-danger btn-sm" onclick="location.href='${contextPath}/admin/deleteMem.do?id=${mem.id}'">탈퇴</button></td>
	</c:forEach>
	</c:when>
	</c:choose>

	</tr>
	</tbody>
</table>

<!-- 페이지네이션 -->
		
	<div class="row">
					<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center">
						<c:if test="${pageMaker.prev }">
							<li class="page-item"><a class="page-link" href='<c:url value="listMem.do?page=${pageMaker.startPage-1 }"/>'
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a></li>
						</c:if>
						<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">	
							<li class="page-item"><a class="page-link" href='<c:url value="listMem.do?page=${pageNum }"/>'>${pageNum }</a></li>
						</c:forEach>
						<c:if test="${pageMaker.next && pageMaker.endPage >0 }">
							<li class="page-item"><a class="page-link" href='<c:url value="listMem.do?page=${pageMaker.endPage+1 }"/>' aria-label="Next"> <span aria-hidden="true">&raquo;</span>
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