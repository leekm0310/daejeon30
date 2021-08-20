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
	function fn_writeform(isLogOn,writeform,login){
		if(isLogOn != '' && isLogOn != 'false'){
			location.href = writeform; 
		} else {
			alert("로그인 후 글쓰기가 가능합니다.")
			location.href = login + '?action=/board/writeform.do';
		
		}
	}
</script>

</head>
<body>
	<!-- 메인코드부 -->
	<div class="wrap">

		<div class="main-content">
			<div class="container">

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

				<c:if test="${prev}">
					<span>[ <a href="/board/listPage.do?num=${startPageNum - 1}">이전</a>
						]
					</span>
				</c:if>

				<c:forEach begin="${startPageNum}" end="${endPageNum}" var="num">
					<span> 
						<c:if test="${select != num}">
							<a href="/board/listPage.do?num=${num}">${num}</a>
						</c:if>
						
						<c:if test="${select == num}">
							<b>${num}</b>
						</c:if>
					</span>
				</c:forEach>

				<c:if test="${next}">
					<span>[ <a href="/board/listPage.do?num=${endPageNum + 1}">다음</a>
						]
					</span>
				</c:if>





				<!-- 글쓰기 버튼 -->
				<div class="row justify-content-end ">
					<button type="button" class="btn btn-danger " style="width: 100px;" onclick="javascript:fn_writeform('${isLogOn}','${contextPath}/board/writeform.do','${contextPath}/member/login.do')">
					글쓰기
				</button>
				</div>
				
				<input class="btn btn-danger " href="javascript:fn_writeform('${isLogOn}','${contextPath}/board/writeform.do','${contextPath}/member/login.do')">글쓰기</a>
				


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
							<li class="page-item"><a class="page-link" href="#" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a></li>
							<li class="page-item"><a class="page-link" href="#">1</a></li>
							<li class="page-item"><a class="page-link" href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item"><a class="page-link" href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a></li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>


</body>
</html>