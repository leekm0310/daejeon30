<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<!-- Bootstrap CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
	<title>공지사항</title>
	<style>
	.footer{
		position:fixed;
		bottom: 0;
		width:100%;
		}
	</style>
</head>
<body>

	<!-- 헤더입니다 -->
	<%@ include file="header.jsp" %>
	 
	 
	
	<div class="container" style=margin-bottom:300px;>
	
	
		<!-- 로컬네비게이션 -->
		<hr>
		<div class="btn-group">
			<button class="btn btn-outline-danger" type="button" id="defaultDropdown" onclick="location.href='./faq.jsp'"aria-expanded="false">
				FAQ
			</button>
		</div>
		
		<div class="btn-group">
			<button class="btn btn-outline-danger" type="button" id="dropdownMenuClickableOutside" onclick="location.href='./qna.jsp'" aria-expanded="false">
				문의게시판
			</button>
		</div>
	
		
		<hr>
		<H1>FAQ</H1>
		<BR><BR>
		
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
				<tr>
					<td>1</td>
					<td>테스트입니다</td>
					<td>테스트</td>
					<td>2021.06.07</td>
					<td>0</td>
				</tr>
				<tr>
					<td>2</td>
					<td>테스트입니다2</td>
					<td>테스트</td>
					<td>2021.06.07</td>
					<td>0</td>
				</tr>
				<tr>
					<td>3</td>
					<td>테스트입니다3</td>
					<td>테스트</td>
					<td>2021.06.07</td>
					<td>0</td>
				</tr>
			</tbody>
		</table>
		
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
	
	
	<!-- 푸터입니다 -->
	<div class="footer">
	<%@ include file="footer.jsp" %>
	</div>
	 
</body>
</html>
