<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8" isELIgnored="false" %>
<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
		
	<!-- 부트스트랩 Bundle -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
		
	<!-- 부트스트랩 Separate  -->
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js" integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT" crossorigin="anonymous"></script>
	

		<!-- 전체 레이아웃 -->

	
	<title>회원리뷰게시판</title>
		
		
</head>
<body>
  
 <!-- 메인코드부 -->
 <div class="wrap">
 
  
  <div class="main-content">
	<div class="container">
	
		<!-- 로컬네비게이션 -->
		<hr>
		  <div class="btn-group">
			  <button class="btn btn-outline-danger" type="button" id="defaultDropdown" onclick="location.href='./board3.jsp'"aria-expanded="false">
			    공지사항
			  </button>
		</div>
		
		<div class="btn-group">
			  <button class="btn btn-outline-danger" type="button" id="dropdownMenuClickableOutside" onclick="location.href='./review1.jsp'" aria-expanded="false">
			    후기공유
			  </button>
		</div>
	
		<div class="btn-group">
			  <button class="btn btn-outline-danger" type="button" id="dropdownMenuClickableOutside" onclick="location.href='./board2.jsp'" aria-expanded="false">
			    추천게시판
			  </button>
		</div>
	
		<hr>
	<br>
<br>

<!-- 카드리스트 -->
<div class="row row-cols-1 row-cols-md-4 g-4">

 <div class="col">
    <div class="card h-100">
      <img src="data:image/jpeg;base64,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" class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title">Card title</h5>
        <p class="card-text">너무 맛있어요 최고~ 무야호~~ 그만큼 맛있으시다는거지~~</p>
     	<button type="button" class="btn btn-danger" onclick="location.href='./view_r1.jsp'">읽기</button>
      </div>
    </div>
  </div>


    
  </div>
<br>


<!-- 글쓰기 버튼 -->
<div class="row justify-content-end">
<button type="button" class="btn btn-danger" style="width:100px;" onclick="location.href='./writeform1.jsp'">글쓰기</button>
</div>

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


<!-- 페이지 번호 -->
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
		    <li class="page-item"><a class="page-link" href="#">4</a></li>
		    <li class="page-item"><a class="page-link" href="#">5</a></li>
		    <li class="page-item">
		      <a class="page-link" href="#" aria-label="Next">
		        <span aria-hidden="true">&raquo;</span>
		      </a>
		    </li>
		  </ul>
		</nav>
	  <br>
	</div>


</div>

    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->  
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js" integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT" crossorigin="anonymous"></script>
    
    

	 </div>
	 </div>
  </body>
</html>