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

</head>
<body>
	    
	<body>
 <!-- 메인코드부 -->
 <div class="wrap">
		 

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
		<h2>소개</h2>
		<br>
		<table class="table table-borderless" >   
			<thead>
				<tr>
					<th scope="col">
						<a href="${contextPath}/intro.do" class="text-dark">페이지 소개</a>
					</th>      
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row">
						<a href="${contextPath}/sitemap.do" class="text-dark">사이트맵</a>
					</th>
				</tr>
			</tbody>
		</table>
	</div>

		<hr>


		<h2>맛집</h2>
		<br>
		<table class="table table-borderless" >
			<thead>
				<tr>
					<th scope="col"><a href="${contextPath}/daejeon30/res/rlist1.do"> 지역별</a></th>
					<td class="text-dark"> -동구</td>
					<td class="text-dark"> -서구</td>
					<td class="text-dark"> -유성구</td>
				</tr>
				<tr>
					<th scope="row"></th>
					<td class="text-dark"> -중구</td>
				<td class="text-dark"> -대덕구</td>
				</tr>
				<tr>
					<th scope="col"><a href="${contextPath}/daejeon30/res/rlist1.do"> 분류별</a></th>
					<td class="text-dark"> -한식</td>
					<td class="text-dark"> -일식</td>
					<td class="text-dark"> -중식</td>
				</tr>
				<tr>
					<th scope="row"></th>
					<td class="text-dark"> -일식</td>
					<td class="text-dark"> -분식</td>
					<td class="text-dark"> -패스트푸드</td>
				</tr>
				<tr>
					<th scope="col"><a href="${contextPath}/daejeon30/res/rlist1.do"> ETC</a></th>
					<td class="text-dark"> -30년 전통식당</td>
					<td class="text-dark"> -착한 식당</td>
					<td class="text-dark"> -경로 우대 식당</td>
				</tr>
			</thead>
		</table>

	
	

		<hr>


		<h2>커뮤니티</h2>
		<br>
		<table class="table table-borderless" >
			<thead>
				<tr>
					<th scope="col">
						<a href="${contextPath}/daejeon30/bboard/notice.do" class="text-dark">-공지사항</a>
					</th>
				</tr>
				<tr>
					<th scope="col">
						<a href="${contextPath}/daejeon30/bboard2/reviewList.do" class="text-dark">-리뷰 게시판</a>
					</th>
				</tr>
				<tr>
					<th scope="col">
						<a href="${contextPath}/daejeon30/board2.do" class="text-dark">-추천 게시판</a>
					</th>
				</tr>
			</thead>	
		</table>
		
		<hr>
		
		<h2>고객센터</h2>
		<br>
		<table class="table table-borderless" >
			<thead>
				<tr>
					<th scope="col">
						<a href="${contextPath}/daejeon30/bboard/faq.do" class="text-dark">-FAQ</a>
					</th>
				</tr>
				<tr>
					<th scope="col">
						<a href="${contextPath}/daejeon30/boardq/qna.do" class="text-dark">-문의 게시판</a>
					</th>
				</tr>
			</thead>	
		</table>
	</div>
</div>	
</div>

	
	
</body>
</html>