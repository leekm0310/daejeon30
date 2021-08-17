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
     <!-- Bootstrap core CSS -->
<link href="/docs/5.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">

    <!-- Favicons -->
<link rel="apple-touch-icon" href="/docs/5.1/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/5.1/assets/img/favicons/manifest.json">
<link rel="mask-icon" href="/docs/5.1/assets/img/favicons/safari-pinned-tab.svg" color="#7952b3">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon.ico">
<meta name="theme-color" content="#7952b3">
    
   
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
		
		
	   .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
		

	</style>


	
	
</head>

<body>

 <!-- 메인코드부 -->
	<div class="wrap">
 
<hr>
	<div class="main-content">
	<div class="container">

<!-- 본문시작 -->
<div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
  	<div class="carousel-indicators">
    	<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    	<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
    	<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
  	</div>
  	
  	<div class="carousel-inner">
	    <div class="carousel-item active">
      	<img src="https://www.daejeon.go.kr/FileUpload/FOD/201402/representative_food08_b(1).jpg" class="d-block w-100" alt="..." style=" filter: alpha(opacity=20); opacity: 0.7;">
	      <div class="carousel-caption text-start" >
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

<table style="background-color:white; width:100%;">
<tr><th style="padding: 1px; text-align:center; color:black; font-size:20px;">인기맛집</th></tr>
<td style="padding: 5px; text-align:center; color:black;">가장 인기 있는 맛집을 소개해드립니다!</td>
</table>
<br>	
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


<!--  test  -->
<!-- Three columns of text below the carousel -->
<div class="container marketing">
    <div class="row" style=" margin:auto;">
      <div class="col-4" style=" display:inline-block;zoom:1;.display:inline;">
        <svg class="bd-placeholder-img rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 140x140" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#777"/><text x="50%" y="50%" fill="#777" dy=".3em">대전관광</text></svg>

        <h2>대전관광</h2>
        <p>S</p>
        <p><a class="btn btn-secondary" href="https://www.daejeon.go.kr/tou/index.do">View details &raquo;</a></p>
        
      </div><!-- /.col-lg-4 -->
      <div class="col-4">
        <svg class="bd-placeholder-img rounded-circle" img src="https://helpx.adobe.com/content/dam/help/en/photoshop/using/convert-color-image-black-white/jcr_content/main-pars/before_and_after/image-before/Landscape-Color.jpg"width="140" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 140x140" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#777"/><text x="50%" y="50%" fill="#777" dy=".3em">140x140</text></svg>

        <h2>H</h2>
        <p>A</p>
        <p><a class="btn btn-secondary" href="#">View details &raquo;</a></p>
      </div><!-- /.col-lg-4 -->
      <div class="col-4">
        <svg class="bd-placeholder-img rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 140x140" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#777"/><text x="50%" y="50%" fill="#777" dy=".3em">140x140</text></svg>

        <h2>H</h2>
        <p>A</p>
        <p><a class="btn btn-secondary" href="#">View details &raquo;</a></p>
      </div><!-- /.col-lg-4 -->
    </div><!-- /.row -->
</div>









<hr>
<!-- 본문 - 방문후기부 -->
<table style="background-color:white; width:100%;">
<tr><th style="padding: 1px; padding-top:30; ; text-align:center; color:black; font-size:20px;">방문후기</th></tr>
<td style="padding: 5px; padding-bottom:30; text-align:center; color:black;">생생한 후기를 만나보세요!</td>
</table>


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