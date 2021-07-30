<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
 <meta name="viewport" content="width=device-width, initial-scale=1">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
 
 <!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
	
	
<title>마이페이지메인</title>
 
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
		
		}
		.main-content{
			min-height: 100%;

		}	
		.container {
		
			padding:0 0 2% 0;	
		} 
		
		</style>
  	
  		<style>
  		
		 .information{
	 	padding: 10px 20px;
	 	border-radius: 1px;
	 	background-color: #f3f3f3;
	 	boarder: solid 1px #000000;
	 	text-align: center;
	 	width: 750px;
	 	height: 100%;
	 	margin-top:50px
	 	}
	 	
	 	.footer{
		position:fixed;
		bottom: 0;
		width:100%;
		}
 		</style>
 
 
</head>

<body>
 <!-- 메인코드부 -->
 <div class="wrap">
<!-- 헤더입니다 -->
	<%@ include file="header.jsp" %>
	<div class="main-content">
	<div class="container">

<!-- 로컬네비게이션 -->
<hr>
  <div class="btn-group">
  <button class="btn btn-outline-danger" type="button" id="defaultDropdown" onclick="location.href='./mymain1.jsp'"aria-expanded="false">
    마이페이지
  </button>
</div>

<div class="btn-group">
  <button class="btn btn-outline-danger" type="button" id="dropdownMenuClickableOutside" onclick="location.href='./modify1.jsp'" aria-expanded="false">
   회원정보수정
  </button>
</div>

<div class="btn-group">
  <button class="btn btn-outline-danger" type="button" id="dropdownMenuClickableOutside" onclick="location.href='./res1.jsp'" aria-expanded="false">
    예약내역
  </button>
</div>

<div class="btn-group">
  <button class="btn btn-outline-danger" type="button" id="dropdownMenuClickableOutside" onclick="location.href='./like1.jsp'" aria-expanded="false">
    찜한리스트
  </button>
</div>

<div class="btn-group">
  <button class="btn btn-outline-danger" type="button" id="dropdownMenuClickableOutside" onclick="location.href='./myboard1.jsp'" aria-expanded="false">
    내 게시판
  </button>
</div>
<hr>

<!-- 본문 내용 -->
<div class="row">
<h3>마이 페이지</h3>
	<br>
	<br>
	<div class="information">
	저희 사이트를 이용해주셔서 감사합니다. 000님의 마이페이지 입니다.
	</div>
</div>
<br>

	<div class="row">
      <h6>나의 예약 현황 (최근 <em>3개월</em> 기준)</h6>
     
      <ul class="list-group list-group-horizontal" style="font-size:25px">
      	<li class="list-group-item" style="width:50%; height:120%"><p class="text-center" style="margin-top:50px"><strong>예약완료</strong><br> 
      	<a href="./res1.jsp" class="count">0</a></p></li>
     	 <li class="list-group-item" style="width:50%; height:120%"><p class="text-center" style="margin-top:50px"><strong>취소</strong><br>
        <a href="./res1.jsp" class="count">0</a></p></li>
     	 <li class="list-group-item" style="width:50%; height:120%"><p class="text-center"  style="margin-top:50px"><strong>찜한곳</strong><br>
        <a href="./like1.jsp" class="count">0</a></p></li>
      </ul>
     </div>
</div>
<br>
<br>
<br>
<br>
</div>
</div>

<!-- 푸터입니다 -->
<div class="footer">
 <%@ include file="footer.jsp" %>
</div>



</body>
</html>