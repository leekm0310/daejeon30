<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8" isELIgnored="false" %>
<!doctype html>
<html>
<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<!-- Bootstrap CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
	
	<title>SiteMap</title>
	<!-- 전체 레이아웃 -->
	<style type="text/css">

		.html, .body {
		
			margin: 0;
		
			padding: 0;
		
			height: 100%;
		}	
		
		.wrap {
		min-height: 100%;
		position: relative;
		padding-bottom: 19px; /* footer height */
		}
		
		.main-content {
		
			min-height: 100%;
			
		}	
		.container {
		
			padding:0 0 2% 0;	
		} 
		.header {
		
		}
		.footer{
		position:fixed;
		bottom: 0;
		width:100%;
		}
		
		</style>
</head>
<body>
	    
	<body>
 <!-- 메인코드부 -->
 <div class="wrap">
		 
		<!-- 헤더-->
		<%@ include file="header.jsp" %>
		 <hr>
		<div class="main-content">
		<div class="container">
		<br>
		<div class="row">
		<div class="col-sm-2">
		</div>
		<div class="col-sm-8">
		
		</div>
		<div class="col-sm-2">
		</div>
		
		
		<button type="button" class="btn btn-danger" style="width:200px;">사이트맵</button>
		<div class="container">
			<br>
		</div>
		<h2>INTRO</h2>
		<br>
		<table class="table table-borderless" >   
			<thead>
				<tr>
					<th scope="col">
						<a href="./intro.jsp" class="text-dark">페이지 소개</a>
					</th>      
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row">
						<a href="./sitemap.jsp" class="text-dark">사이트맵</a>
					</th>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="container">
		<hr>
	</div>
	<div class="container">
		<h2>PLACE</h2>
		<br>
		<table class="table table-borderless" >
			<thead>
				<tr>
					<th scope="col">지역별</th>
					<td>
						<a href="./rlist1.jsp" class="text-dark">-동구</a>
					</td>
					<td>
						<a href="./rlist1.jsp" class="text-dark">-서구</a>
					</td>
					<td>
						<a href="./rlist1.jsp" class="text-dark">-유성구</a>
					</td>
				</tr>
				<tr>
					<th scope="row"></th>
					<td>
					<a href="./rlist1.jsp" class="text-dark">-중구</a>
					</td>
					<td>
					<a href="./rlist1.jsp" class="text-dark">-대덕구</a>
					</td>
				</tr>
				<tr>
					<th scope="col">분류별</th>
					<td>
						<a href="./rlist1.jsp" class="text-dark">-한식</a>
					</td>
					<td>
						<a href="./rlist1.jsp" class="text-dark">-일식</a>
					</td>
					<td>
						<a href="./rlist1.jsp" class="text-dark">-중식</a>
					</td>
				</tr>
				<tr>
					<th scope="row"></th>
					<td>
						<a href="./rlist1.jsp" class="text-dark">-일식</a>
					</td>
					<td>
						<a href="./rlist1.jsp" class="text-dark">-분식</a>
					</td>
					<td>
						<a href="./rlist1.jsp" class="text-dark">-패스트푸드</a>
					</td>
				</tr>
				<tr>
					<th scope="col">ETC</th>
					<td>
						<a href="./rlist1.jsp" class="text-dark">-30년 전통 식당</a>
					</td>
					<td>
						<a href="./rlist1.jsp" class="text-dark">-착한 식당</a>
					</td>
					<td>
						<a href="./rlist1.jsp" class="text-dark">-경로 우대 식당</a>
					</td>
				</tr>
			</thead>
		</table>
	</div>
	
	
	<div class="container">
		<hr>
	</div>
	
	
	<div class="container">
		<h2>BOARD</h2>
		<br>
		<table class="table table-borderless" >
			<thead>
				<tr>
					<th scope="col">
						<a href="./board3.jsp" class="text-dark">-공지사항</a>
					</th>
				</tr>
				<tr>
					<th scope="col">
						<a href="./review1.jsp" class="text-dark">-후기 공유</a>
					</th>
				</tr>
				<tr>
					<th scope="col">
						<a href="./board2.jsp" class="text-dark">-추천 게시판</a>
					</th>
				</tr>
			</thead>
		</table>
	</div>
</div>	
</div>
</div>
	<!-- 푸터입니다 -->
	<div class="footer">
		<%@ include file="footer.jsp" %>
	</div>
	
</body>
</html>