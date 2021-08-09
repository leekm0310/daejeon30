<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
request.setCharacterEncoding("utf-8");
%>
<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

    
		<!-- 전체 레이아웃 -->

	
	<title>리뷰게시판</title>
		
		
</head>
<body>
  
 <!-- 메인코드부 -->
 <div class="wrap">
 
  
  <div class="main-content">
	<div class="container">
	<br>
<br>

<!-- 카드리스트 -->
<div class="row row-cols-1 row-cols-md-4 g-4">
<c:choose>
<c:when test="${!empty revlist }">
<c:forEach var="review" items="${revlist }">
 <div class="col">
    <div class="card h-100">
      <img src="${contextPath}/downloadreview.do?num=${review.num}&imageFileName=${review.imageFileName}" class="card-img-top" alt="${review.imageFileName}">
      <div class="card-body">
        <h5 class="card-title">${review.title }</h5>
        <p class="card-text">너무 맛있어요 최고~ 무야호~~ 그만큼 맛있으시다는거지~~</p>
     	<button type="button" class="btn btn-danger" onclick="location.href='${contextPath}/bboard2/oneReview.do?num=${review.num}'">읽기</button>
      </div>
    </div>
  </div>
</c:forEach>
</c:when>
</c:choose>

    
  </div>
<br>


<!-- 글쓰기 버튼 -->
<div class="row justify-content-end">
<button type="button" class="btn btn-danger" style="width:100px;" onclick="location.href='${contextPath}/reviewform.do'">글쓰기</button>
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