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
			           
<!-- 상품 카드부분 -->  				
		  <div class="row row-cols-1 row-cols-md-4 g-6">
			 <div class="col">
				<div class="card h-100">
				  <img src="data:image/png;base64,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" class="card-img-top" alt="...">
				  <div class="card-body">
				    <h5 class="card-title">제목</h5>
				    <p class="card-text">주요 메뉴</p>
				    <hr>
				       
				        <!-- 카드 내부 버튼 -->
					<nav class="navbar navbar-light bg-grey" border=1>
					  <form class="container-fluid justify-content-start">
						  <a href="./rlist2.jsp" class="btn btn-danger" align=left>상세>></a>
						  	&ensp;&ensp; &ensp;&ensp; &ensp;&ensp;&ensp;  
						  <div id="btn_group" align=right><button id="test_btn2" style="width:40px" onclick="like()">♥</button>
						 </form>
					  </nav>			
				 </div>
			 </div>
		</div>
		
		
		<div class="col">
			<div class="card h-100">
			  <img src="data:image/png;base64,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" class="card-img-top" alt="...">
			  <div class="card-body">
			  
				    <h5 class="card-title">제목</h5>
				    <p class="card-text">주요 메뉴</p>
				    <hr>
				       
			        <!-- 카드 내부 버튼 -->
				<nav class="navbar navbar-light bg-grey" border=1>
				  <form class="container-fluid justify-content-start">
					  <a href="./rlist2.jsp" class="btn btn-danger" align=left>상세>></a>
					  	&ensp;&ensp; &ensp;&ensp; &ensp;&ensp;&ensp;  
					  <div id="btn_group" align=right><button id="test_btn2" style="width:40px" onclick="like()">♥</button>
					 </form>
				</nav>			
				</div>
			</div>
		</div>
	
		<div class="col">
			<div class="card h-100">
			  <img src="data:image/png;base64,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" class="card-img-top" alt="...">
			  <div class="card-body">
			  
				    <h5 class="card-title">제목</h5>
				    <p class="card-text">주요 메뉴</p>
				    <hr>
				       
			        <!-- 카드 내부 버튼 -->
				<nav class="navbar navbar-light bg-grey" border=1>
				  <form class="container-fluid justify-content-start">
					  <a href="./rlist2.jsp" class="btn btn-danger" align=left>상세>></a>
					  	&ensp;&ensp; &ensp;&ensp; &ensp;&ensp;&ensp;  
					  <div id="btn_group" align=right><button id="test_btn2" style="width:40px" onclick="like()">♥</button>
					 </form>
				</nav>			
				</div>
			</div>
		</div>
	
		<div class="col">
			<div class="card h-100">
			  <img src="data:image/png;base64,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" class="card-img-top" alt="...">
			  <div class="card-body">
			  
				    <h5 class="card-title">제목</h5>
				    <p class="card-text">주요 메뉴</p>
				    <hr>
				       
			        <!-- 카드 내부 버튼 -->
					<nav class="navbar navbar-light bg-grey" border=1>
					  <form class="container-fluid justify-content-start">
						  <a href="./rlist2.jsp" class="btn btn-danger" align=left>상세>></a>
						  	&ensp;&ensp; &ensp;&ensp; &ensp;&ensp;&ensp;  
						  <div id="btn_group" align=right><button id="test_btn2" style="width:40px" onclick="like()">♥</button>
					  </form>
					</nav>			
				</div>
			</div>
		</div>
	</div>
<br>
<hr>
<br>
			           
<!-- 방문후기부 -->
<p align=center>-- 방문후기 --</p><br> 
 <!-- 카드리스트 -->
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