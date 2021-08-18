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

	<style>
	.ellipsis {
	  width: form-control;
 	 overflow: hidden;
 	 text-overflow: ellipsis;
 	 display: -webkit-box;
 	 -webkit-line-clamp: 2;
 	 -webkit-box-orient: vertical;
	}
	</style>
    
		<!-- 전체 레이아웃 -->

	
	<title>리뷰게시판</title>
		
		
</head>
<body>
  
 <!-- 메인코드부 -->
 <div class="wrap">
 
  
  <div class="main-content">
	<div class="container">
	
	<div class="row" style="text-align: center; margin: 50 auto; ">
		<H3>리뷰게시판</H3>
		<br><hr style="width:300; margin:auto;"><br>
		<p>대슐랭가이드를 통해 방문한 맛집 리뷰를 남기는 공간입니다.<br>
		매월 소중한 리뷰를 작성해주신 분들 중 추첨을 통해 소정의 사은품을 드립니다!</p>
		<BR><BR>
	</div>	
	<br>
<br>

<!-- 카드리스트 -->
<div class="row row-cols-1 row-cols-md-4 g-4">
<c:choose>
<c:when test="${!empty revlist }">
<c:forEach var="review" items="${revlist }">
 <div class="col">
    <div class="card h-100">
      <img src="${contextPath}/downloadreview.do?num=${review.num}&imageFileName=${review.imageFileName}" class="card-img-top" width="310" height="310" alt="${review.imageFileName}">
      <div class="card-body">
        <h5 class="card-title">${review.title }</h5>
        <p class="card-text ellipsis">${review.content }</p>
     	<button type="button" class="btn btn-danger" onclick="location.href='${contextPath}/bboard2/oneReview.do?num=${review.num}'">읽기</button>
      </div>
    </div>
  </div>
</c:forEach>
</c:when>
</c:choose>

    
  </div>
<br>


<!-- 글쓰기 버튼 
	<c:if test="${isLogOn==true }">
		<div class="row justify-content-end">
		<button type="button" class="btn btn-danger" style="width:100px;" onclick="location.href='${contextPath}/reviewform.do'">글쓰기</button>
		</div>
	</c:if>
	<c:if test="${isLogOn==false }">
	</c:if>-->
		


	<!-- 검색바 -->
		<div class="row justify-content-center">
			<div class="container-fluid" style="width:450px">
				<form class="d-flex" action="${contextPath}/bboard2/search.do" method="post">
				<select style="border: 1px solid lightgrey;" name="sorting1">
				  <option value="title" selected >제목</option>
				  <option value="content" >내용</option>
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


<!-- 페이지네이션 -->
		
	<div class="row">
					<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center">
						<c:if test="${pageMaker.prev }">
							<li class="page-item"><a class="page-link" href='<c:url value="/bboard2/reviewList.do?page=${pageMaker.startPage-1 }"/>'
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a></li>
						</c:if>
						<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">	
							<li class="page-item"><a class="page-link" href='<c:url value="/bboard2/reviewList.do?page=${pageNum }"/>'>${pageNum }</a></li>
						</c:forEach>
						<c:if test="${pageMaker.next && pageMaker.endPage >0 }">
							<li class="page-item"><a class="page-link" href='<c:url value="/bboard2/reviewList.do?page=${pageMaker.endPage+1 }"/>' aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a></li>
						  </c:if>
						</ul>
					</nav>
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