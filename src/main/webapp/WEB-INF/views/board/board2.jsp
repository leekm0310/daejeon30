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

	<div class="row" style="text-align: center; margin: 50 auto; ">
		<H3>추천게시판</H3>
		<br><hr style="width:300; margin:auto;"><br>
		<p>대전의 맛집들을 자유롭게 올려주세요.<br></p>
		<BR><BR>
	</div>	

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
									<td align="center">작성된 글이 없습니다</td>
								</tr>
					
							</c:when>
							
							<c:when test="${!empty board2list}">
								<c:forEach var="list" items="${board2list}">
									<tr>
										<td>${list.rb_num}</td>
										<td>
										<a class="nav-link link-light px-2 text-dark" href="${contextPath}/board/view_r.do?boardNO=${list.rb_num}">${list.rb_title}</a>
										</td>
										<td>${list.id}</td>
										<td><fmt:formatDate pattern="yyyy-MM-dd" value="${list.rb_date}" /></td>
										<td>${list.rb_views}</td>
									</tr>
								</c:forEach>
							</c:when>
						</c:choose>
					</tbody>
				</table>
				
				
				
				
				<!--<c:if test="${prev}">
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
				</c:if>-->
				

				<!-- 글쓰기 버튼 -->
				<div class="row justify-content-end" >
					<a class="btn btn-danger" style="width:100;"href="javascript:fn_writeform('${isLogOn}','${contextPath}/board/writeform.do','${contextPath}/login.do')">글쓰기</a>
				</div>
				
				



				<!-- 검색바 -->
		<div class="row justify-content-center">
			<div class="container-fluid" style="width:450px">
				<form class="d-flex" action="${contextPath}/board/searchTitle.do" method="post">
				<select style="border: 1px solid lightgrey;" name="sorting1">
				  <option value="rb_title" selected >제목</option>
				  <option value="id" >아이디</option>
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

				<br>
				<div class="row">
					<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center">
						<c:if test="${pageMaker.prev }">
							<li class="page-item"><a class="page-link" href='<c:url value="/board2.do?page=${pageMaker.startPage-1 }"/>'
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a></li>
						</c:if>
						<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">	
							<li class="page-item"><a class="page-link" href='<c:url value="/board2.do?page=${pageNum }"/>'>${pageNum }</a></li>
						</c:forEach>
						<c:if test="${pageMaker.next && pageMaker.endPage >0 }">
							<li class="page-item"><a class="page-link" href='<c:url value="/board2.do?page=${pageMaker.endPage+1 }"/>'
								aria-label="Next"> <span aria-hidden="true">&raquo;</span>
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