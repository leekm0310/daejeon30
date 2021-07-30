<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var = "contextPath" value="${pageContext.request.contextPath}"/>
<%
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x"
	crossorigin="anonymous">

<title>추천 게시판</title>

<script>
	function fn_writeform(isLogOn,writeform,login){//3개의 값들도 관련된 것과 연결해야하는것 같은데, 나중에 합칠때 수정하자
		if(isLogOn != '' && isLogOn != 'false'){
			location.href = writeform; //로그인 상태이면 글쓰기 창으로 이동
		} else {
			alert("로그인 후 글쓰기가 가능합니다.")
			location.href = login + '?action=/board/writeform.do';
			//로그아웃 상태이면 action 값으로 다음에 수행할 url인 board/writeForm.do 를 전달하면서 
			//로그인 창으로 이동 이건 views에 넣어놨다. 나중에 수정하자.
		}
	}
</script>

</head>
<body>
	<!-- 메인코드부 -->
	<div class="wrap">

		<div class="main-content">
			<div class="container">

				
				<H1>추천 게시판</H1>
				<BR> <BR>

				<table class="table table-hover">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>날짜</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${empty board2list}">
								<tr>
									<td colspan="5" align="center">데이터가 없습니다</td>
								</tr>
							</c:when>
							<c:when test="${!empty board2list}">
								<c:forEach var="list" items="${board2list}">
									<tr>
										<td>${list.rb_num}</td>
										<td>
										
											<a class="nav-link link-light px-2 text-dark" href="${contextPath}/board/view_r.do?
															boardNO=${list.rb_num}">${list.rb_title}</a>
										
										
										</td>
										<td>${list.id}</td>
										<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
												value="${list.rb_date}" /></td>
										<td>${list.rb_views}</td>
									</tr>
								</c:forEach>
							</c:when>
						</c:choose>
					</tbody>
				</table>

				<!-- 글쓰기 버튼 -->
				<div class="row justify-content-end ">
				<button type="button" class="btn btn-danger " style="width: 100px;" 
					onclick='location.href="javascript:fn_writeform(${isLogOn},'${contextPath}/board/writeform.do','${contextPath}/login.do')"'>글쓰기
				</div>
				
				<a class="cls1" href="javascript:fn_writeform('${isLogOn}','${contextPath}/board/writeform.do','${contextPath}/login.do')"><p class="cls2">글쓰기</p></a>



				<!-- 검색바 -->
				<div class="row justify-content-center">
					<div class="container-fluid" style="width: 450px">
						<form class="d-flex">
							<input class="form-control me-2" type="search" placeholder="검색"
								aria-label="Search">
							<button class="btn btn-outline-success" type="submit">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
						<path
										d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
					</svg>
							</button>
						</form>
					</div>
				</div>
				<br>
				<!-- 페이지번호 -->

				<br>
				<div class="row">
					<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center">
							<li class="page-item"><a class="page-link" href="#"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a></li>
							<li class="page-item"><a class="page-link" href="#">1</a></li>
							<li class="page-item"><a class="page-link" href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item"><a class="page-link" href="#"
								aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a></li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>


</body>
</html>