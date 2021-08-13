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
    
   
	<title>메인</title>
	<style>
	<!-- 버튼 -->
		#test_btn2{ border-radius: 5px; border-radius: 5px; margin-left:-3px; } #btn_group button{ border: 1px solid grey; background-color: rgba(0,0,0,0); color: grey; padding: 5px; } #btn_group button:hover{ color:red; background-color: white; }
		 .like-btn{color: #fff;} }
		 
 	<!-- 이미지 크기 -->
 		.scale {
		  transform: scale(1);
		  -webkit-transform: scale(1);
		  -moz-transform: scale(1);
		  -ms-transform: scale(1);
		  -o-transform: scale(1);
		  transition: all 0.3s ease-in-out;   /* 부드러운 모션을 위해 추가*/
		}
		
		.scale:hover {
		  transform: scale(1.2);
		  -webkit-transform: scale(1.2);
		  -moz-transform: scale(1.2);
		  -ms-transform: scale(1.2);
		  -o-transform: scale(1.2);
		}
		.img {width:325px; height:280px; overflow:hidden } 
		

	</style>


	
	
</head>

<body>

 <!-- 메인코드부 -->
	<div class="wrap">
 
<hr>
	<div class="main-content">
	<div class="container">

<!-- 본문시작, 전환형 사진부 -->
<div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
  	<div class="carousel-indicators">
    	<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    	<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
    	<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
  	</div>
  	
  	<div class="carousel-inner">
	    <div class="carousel-item active">
      	<img src="https://www.daejeon.go.kr/FileUpload/FOD/201402/representative_food08_b(1).jpg" class="d-block w-100" alt="..." style=" filter: alpha(opacity=20); opacity: 0.5;">
	      <div class="carousel-caption text-start">
        	<h1 style="color:black;">대전 맛집 기행</h1>
        	<p style="color:black;">대슐랭가이드와 맛있는 하루 보내세요</p>
        	<p>
        	<a class="btn btn-lg btn-primary" href="${contextPath}/join.do">회원가입</a>
        	</p>
      	  </div>
    </div>
    	<div class="carousel-item">
      		<img src="https://www.daejeon.go.kr/FileUpload/FOD/201402/representative_food07_b(1).jpg" class="d-block w-100" alt="...">
      		<div class="carousel-caption d-none d-md-block">
        		<h5>zzz</h5>
        		<p>zzz</p>
      		</div>
    	</div>
    	<div class="carousel-item">
      		<img src="https://www.daejeon.go.kr/FileUpload/FOD/201402/representative_food01_b(1).jpg" class="d-block w-100" alt="...">
      		<div class="carousel-caption d-none d-md-block">
        		<h5></h5>
        		<p></p>
      		</div>
    	</div>
  	</div>
  	
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>

<br>
<hr>
<!-- 상품 카드부분 -->  	
<p align=center>-- 인기맛집 --</p>			
<div class="row row-cols-1 row-cols-md-4 g-4">
<c:choose>
<c:when test="${!empty resList}">
<c:forEach var="res" items="${resList }" begin="0" end="3">
 <div class="col">
    <div class="card h-100">
      <img src="${contextPath}/download.do?resNum=${res.resNum}&resImageFileName=${res.resImageFileName}" class="card-img-top" width="310" height="310" alt="${review.imageFileName}">
      <div class="card-body">
        <h5 class="card-title">${res.resName}</h5>
        <p class="card-text ellipsis">${res.resMenu}</p>
     	<button type="button" class="btn btn-danger" onclick="location.href='${contextPath}/res/rlist2.do?resNum=${res.resNum}'">상세보기</button>
     	
     		<div class="w3-border w3-center w3-padding">
						<c:if test="${ member.id == null }">
						
						<i class="fa fa-heart" style="font-size: 16px; color: red"></i>
						<span class="rec_count"></span>
						</c:if>
						<c:if test="${ member.id != null }">
						<!-- <button class="w3-button w3-black w3-round" onclick="javascript:addlike('${res.resNum}')">테스트 -->
						<!--  <form name="addform" id="addform" method="post">
						<input type="hidden" name="resNum" id="resNum" value="${res.resNum}">
						<input type="hidden" name="id" id="id">-->
						
						<button id="likebutton" name="resNum" value="${res.resNum}" onclick="javascript:like(this.value)">♥
						</button>
					
						</c:if>
						</div>
      </div>
    </div>
  </div>
</c:forEach>
</c:when>
</c:choose>
    
  </div>
<br>
<hr>


<!-- 본문 - 방문후기부 -->
<p align=center>-- 방문후기 --</p>




<!-- 카드리스트 -->
<div class="row row-cols-1 row-cols-md-4 g-4">
<c:choose>
<c:when test="${!empty revlist }">
<c:forEach var="review" items="${revlist }" begin="0" end="3">
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
<br>
</div>
</div>
</div>



</body>
</html>