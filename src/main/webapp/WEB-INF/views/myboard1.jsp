<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  
<title>내 게시물 관리</title>

  	
 
 <!-- 체크박스 관련 제이쿼리문 전체선택/전체해제, 삭제경고창-->
 <script type="text/javascript">
 	function checkAll(){
		if($("#checkall").is(":checked")){
			$("input[name=chk]").prop("checked",true);
		}else{
			$("input[name=chk]").prop("checked",false);
		  }
		}
 	
 	function del() {
		  if (confirm("삭제 하시겠습니까?"))
	    	list_ok.submit();
		  }
  </script>
  
 
</head>

<body>

 <!-- 메인코드부 -->
 <div class="wrap">

 	<div class="main-content">
	<div class="container" >



<br>
<br>
<!-- 본문 내용 -->
<h3>내 게시물 관리</h3>
<br>
	<table class="table table-hover">
	<thead>
	<tr>
		<!-- <th><input type="checkbox" id="checkall" onclick="checkAll();" style="width:20px;height:20px;"/></th> -->
		<th>번호</th>
		<th>분류</th>
		<th>제목</th>
		<th>작성자</th>
		<th>날짜</th>
		<th></th>
	</tr>
	</thead>
	<tbody>
	<tr>
	<c:choose>
			<c:when test="${!empty myqna }">
			<c:forEach var="qna" items="${myqna }" varStatus="num">
			<tr>
			<td>${num.index+1}</td>
			<td>문의</td>
			<td><a href="${contextPath}/passthro.do?num=${qna.num }">${qna.title }</a><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-lock" viewBox="0 0 16 16">
 			 	<path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2zm3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2zM5 8h6a1 1 0 0 1 1 1v5a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V9a1 1 0 0 1 1-1z"/>
				</svg></td>
			<td><!--  <a href="${contextPath}/boardq/viewQna.do?num=${qna.num }">-->${qna.name }</a></td>
			<td>${qna.date }</td>
			</tr>
			</c:forEach>
			</c:when>
			</c:choose>
	</tr>

	</tbody>
</table>

<!-- 삭제하기버튼 -->
<div class="row justify-content-end">
<button type="button" class="btn btn-danger" style="width:100px;" onclick="del();">삭제하기</button>
</div>




 <!-- 카드리스트 -->
<div class="row row-cols-1 row-cols-md-4 g-4">
<c:choose>
<c:when test="${!empty myreview }">
<c:forEach var="review" items="${myreview }">
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



<!-- 페이지번호 -->
<div class ="row">
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
		</div>
	</div>


</body>
</html>