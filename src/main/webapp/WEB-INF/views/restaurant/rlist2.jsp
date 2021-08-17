<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="res" value="${resMap.res }" />
<c:set var="resImageFileList" value="${resMap.resImageFileList }"/>
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
	      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
	    
	<style>
	<!-- 버튼 -->
		#test_btn2{ border-radius: 5px; border-radius: 5px; margin-left:-3px; } #btn_group button{ border: 1px solid grey; background-color: rgba(0,0,0,0); color: grey; padding: 5px; } #btn_group button:hover{ color:red; background-color: white; }
		 .like-btn{
	 	 color: #fff;
		  }
		 }
		 
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
		
		table.type05 {
 		 border-collapse: separate;
 		 border-spacing: 1px;
 		 text-align: left;
  		line-height: 1.5;
  		border-top: 1px solid #ccc;
 		 margin: 20px 10px;
		}
		table.type05 th {
		  width: 150px;
 		 padding: 10px;
  		vertical-align: top;
  		border-bottom: 1px solid #ccc;
  		background: #efefef;
		}
		table.type05 td {
 		 width: 350px;
 		 padding: 10px;
  	     vertical-align: top;
 		 border-bottom: 1px solid #ccc;
		}
	</style>
	
	
		<script type="text/javascript">
		
		function fn_rsvForm(){
			if('${isLogOn}' != '' && '${isLogOn}' != 'false'){
				location.href = "${contextPath}/res/rsv2.do?resNum="+${res.resNum};
			}else{
			location.href = "${contextPath}/login2.do";
			}
			}
		
			function like(){
				alert("찜한 리스트에 추가 되었습니다.")
				}
		</script>
	
	<title>상품리스트</title>
	
</head>
 
<body>
 
 
 
 
 <!-- 메인코드부 -->
 <div class="wrap">
 
		 
	    <div class="main-content">
		  <div class="container">
		  
		
			<br><br>
			  <div class="row mb-2">
			    <div class="col-md-20">
			      <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-300 position-relative">
			        <div class="col p-4 d-flex flex-column position-static">
			   	      <div class="row">
		   	  
						<!-- 중간 컨테이너 분할 -->	   	     	  
							<div class="col-sm-4" align=center>
							
							    <img src="${contextPath}/download.do?resNum=${res.resNum}&resImageFileName=${resImageFileList[0].resImageFileName}" class="card-img-top">
							    <br>
							    
							<!-- 좋아요, 소셜버튼 -->
								<header class="navbar navbar-expand-sm justify-content-center">
								     <div class="fb-like" data-href="https://developers.facebook.com/docs/plugins/" data-width="" data-layout="button" data-action="recommend" data-size="large" data-share="true" align=center>
								       </div>
										  <div id="btn_group" align=right> &ensp; &ensp; 
										  	<button id="test_btn2" style="width:40px; height:40px;" onclick="like()" align=right>♥</button>
								 		 </div>
								 </header> 
							</div>

		    
				 	 <!-- 식당네임카드 -->
				  	  <div class="col-sm-8">
				  	  	<h2>${res.resName }</h2><br>
					     <table class="type05">
					     <tbody>
					
							  <tr>
								   <th scope="row">영업시간</th>
								   <td>${res.resOpen }</td>
							  </tr>
							  <tr>
								   <th scope="row">연락처</th>
								   <td>${res.resPhone }</td>
							  </tr>
						      <tr>
								    <th scope="row">주메뉴</th>
								    <td>${res.resMenu }</td>
							  </tr>
							  <tr>
							  		<th scope="row">위치</th>
								    <td>${res.resLocation }</td>
							  </tr>
						</tbody>
			       	    </table> 
			       	    <div class="flex-container"></div>
			       	     <button type="button" class="btn btn-outline-danger" style="width:500"onclick="fn_rsvForm()">
									예약하기</button> 
									</div>
			 		</div>
			 	<br>
		  </div>
		
		<br>
		<br>
		<hr>
		<h3 class="pb-4 mb-4 fst-italic border-bottom">
		</h3>
		<div class="row">
			<div class="col-sm-8">
			  <br>
			    <br>
			    
			
			    <!-- 중간부 분할 -->
			  <div class="row justify-content-center" align=center>
			        <h2 class="blog-post-title" align=left>식당 상세 정보 ::</h2>
			        <hr>
			     <br>

			<div class="col g-0 bg-light" style="width:300px;">
				<table align=left>
			
			<tr>
				<td >위치</td>
				<td>${res.resLocation }</td>
			</tr>
			<tr>
				<td >수용인원수</td>
				<td>${res.resCapacity }</td>
			</tr>
			<tr>
				<td >주재료</td>
				<td>${res.resIngredient }</td>
			</tr>
			<tr>	
				<td >상세설명</td>
				<td>${res.detailInfo }${res.mapLocation}</td>
			</tr>
			
			
			
			<!--<tr>
				  <td >날짜기입할때쓸거</td>
				<td><input  name="#"  type="date" size="40" /></td>
			</tr>-->
			</table>
			</div>
			</div>
			<br>
			
		   <h2 class="blog-post-title" align=left>위치 보기 ::</h2>
		   <hr>
			<br>
			    <div class="row justify-content-center">

					<!-- 지도api -->
						 
						 <div id="map" style="width:600px;height:450px;"></div>
							<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4ef1b5eb100d0b825d5f51c6fbf90ff6">
								</script>
									<script>
										var container = document.getElementById('map');
										var options = {
											center: new kakao.maps.LatLng(${res.mapLocation}),
											level: 3
											};
								
										var map = new kakao.maps.Map(container, options);
										var markerPosition  = new kakao.maps.LatLng(${res.mapLocation}); 
										var marker = new kakao.maps.Marker({
										    position: markerPosition
										});
										marker.setMap(map);
									</script>
			 			</div>
					</div> 

			<div class="col-sm-4">
			   <div class="row justify-content-center" align=center>
				  <br>
				    <br>
				      <br>
				      	<br>
				            <h3>이미지 ::</h3>

				<div class="position-sticky" style="top: 3rem;">
 <!-- 이부분에 클릭시 확대 소스 추가 -->
 <c:if test="${not empty resImageFileList && resImageFileList!='null' }">
 <c:forEach var="item" items="${resMap.resImageFileList }" varStatus="status" begin="1">
				      <h4 class="fst-italic" style="direction: rtl; text-align: start;"></h4>
				     <img src="${contextPath}/download.do?resNum=${item.resNum}&resImageFileName=${item.resImageFileName}" width="200" height="200">

				     <br>
				       <br>
</c:forEach>
</c:if>
			      
 <!-- 이부분에 클릭시 확대 소스 추가 --> 
			     </div>
				   <br>
					 <br>
					   </div>
						 </div>
						   </div>
			  			 </div>
			           </div>
			           
<!-- 상품 카드부분				
		
			<div class="row row-cols-1 row-cols-md-4 g-4">
<c:choose>
<c:when test="${!empty resList}">
<c:forEach var="resL" items="${resList }" begin="0" end="3">
 <div class="col">
    <div class="card h-100">
      <img src="${contextPath}/download.do?resNum=${resL.resNum}&resImageFileName=${resL.resImageFileName}" class="card-img-top" width="310" height="310" alt="${resL.imageFileName}">
      <div class="card-body">
        <h5 class="card-title">${resL.resName}</h5>
        <p class="card-text ellipsis">${resL.resMenu}</p>
     	<button type="button" class="btn btn-danger" onclick="location.href='${contextPath}/res/rlist2.do?resNum=${resL.resNum}'">상세보기</button>
     	
     		
      </div>
    </div>
  </div>
</c:forEach>
</c:when>
</c:choose>
    
  </div> -->  
<hr>
<br>
			           
<!-- 방문후기부 -->
<table style="background-color:white; width:100%;">
<tr><th style="padding: 1px; padding-top:30; ; text-align:center; color:black; font-size:20px;">방문후기</th></tr>
<td style="padding: 5px; padding-bottom:30; text-align:center; color:black;">생생한 후기를 만나보세요!</td>
</table>

<div class="row row-cols-1 row-cols-md-4 g-4">
<c:choose>
<c:when test="${!empty review }">
<c:forEach var="review" items="${review }">
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

			
			
	<!-- 페이스북 연동 자바스크립트 -->
		<div id="fb-root"></div>
			<script async defer crossorigin="anonymous" src="https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v11.0" nonce="FdXCbD66"></script>
						
	 </div>	
		
	</div>
</body>
</html>