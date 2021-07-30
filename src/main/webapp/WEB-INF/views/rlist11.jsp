<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			
<title>맛집리스트</title>
		
	<!-- 카드 내부 BUTTON STYLE -->
	<style>
	#test_btn2{ border-radius: 5px; border-radius: 5px; margin-left:-3px; } 
	#                                                                                                  button{ border: 1px solid grey; background-color: rgba(0,0,0,0); color: grey; padding: 5px; } 
	#btn_group button:hover{ color:red; background-color: white; }
		 .like-btn{
		color: #fff;
		}	  
	</style>
	
	  <!-- 찜하기 버튼 경고창  -->
	  
	  <script type="text/javascript">
		
		function like(){
			document.fav.submit();
	 		alert("찜한 리스트에 추가 되었습니다.")
	 	}
	  </script>
	  
</head>

<body>
 <!-- 메인코드부 -->
 <div class="wrap">
 
 
  <div class="main-content">
	<div class="container" style=margin-bottom:300px;>
		<!-- navbar dropdown -->
		<hr>
		  <div class="btn-group">
			  <button class="btn btn-outline-danger dropdown-toggle" type="button" id="defaultDropdown" data-bs-toggle="dropdown" data-bs-auto-close="true" aria-expanded="false">
			    지역
			  </button>
				  <ul class="dropdown-menu" aria-labelledby="defaultDropdown">
				    <li><a class="dropdown-item" href="#">서구</a></li>
				    <li><a class="dropdown-item" href="#">중구</a></li>
				    <li><a class="dropdown-item" href="#">동구</a></li>
				    <li><a class="dropdown-item" href="#">유성구</a></li>
				    <li><a class="dropdown-item" href="#">대덕구</a></li>
			  </ul>
		</div>
	
		<div class="btn-group">
		  <button class="btn btn-outline-danger dropdown-toggle" type="button" id="dropdownMenuClickableOutside" data-bs-toggle="dropdown" data-bs-auto-close="inside" aria-expanded="false">
		    분류
		  </button>
			  <ul class="dropdown-menu" aria-labelledby="dropdownMenuClickableOutside">
			    <li><a class="dropdown-item" href="#">한식</a></li>
			    <li><a class="dropdown-item" href="#">일식</a></li>
			    <li><a class="dropdown-item" href="#">중식</a></li>
			    <li><a class="dropdown-item" href="#">일식</a></li>
			    <li><a class="dropdown-item" href="#">분식</a></li>
			    <li><a class="dropdown-item" href="#">패스트푸드</a></li>
			  </ul>
		</div>

		<div class="btn-group">
			  <button class="btn btn-outline-danger dropdown-toggle" type="button" id="dropdownMenuClickableOutside" data-bs-toggle="dropdown" data-bs-auto-close="inside" aria-expanded="false">
			    ETC
			  </button>
				  <ul class="dropdown-menu" aria-labelledby="dropdownMenuClickableOutside">
				    <li><a class="dropdown-item" href="#">30년 전통식당</a></li>
				    <li><a class="dropdown-item" href="#">착한 식당</a></li>
				    <li><a class="dropdown-item" href="#">경로 우대 식당</a></li>
				  </ul>
		</div>
		
		<hr>
	  <br>
	<br>

	
 <!--  
   <table align="center" border="1" >
      <tr align="center" bgcolor="lightgreen">
         <td width="7%" ><b>상호명</b></td>
         <td width="7%" ><b>전화번호</b></td>
         
   </tr>

<c:choose>
    <c:when test="${empty allImg}" >
      <tr>
        <td colspan=5>
          <b>내용이 없습니다.</b>
       </td>  
      </tr>
   </c:when>  
  <c:when test="${!empty allImg}" >
      <c:forEach  var="img" items="${allImg}" >
        <tr align="center">
          <td> <img src="${contextPath}/download.do?resNum=${img.resNum}&resImageFileName=${img.resImageFileName}" width="200" height="200" alt="#"></td>   
       </tr>
     </c:forEach>
</c:when>
</c:choose>
</table>
-->

		  <!--  <div class="row row-cols-1 row-cols-md-4 g-6">-->
		  <div class="d-flex bd-highlight flex-wrap mb-3">
			 
			 	<c:choose>
	   				<c:when test="${!empty resList}" >
	   				<!--<c:forEach  var="img" items="${allImg}"> -->
	   					   <c:forEach  var="res" items="${resList}" >
	   					 
	   					
	   					
	   			<div class="p-2 bd-highlight" width="400">
				<div class="card h-100">
				<!--  
				  <img src="${contextPath}/download.do?resNum=${img.resNum}&resImageFileName=${img.resImageFileName}" width="200" height="200" alt="${allImg[0].resImageFileName}">
		 -->
				  <div class="card-body">${res.resNum}
				    <h5 class="card-title"> ${res.resName}</h5>
				    <p class="card-text">${res.resMenu}</p>
				    <hr>
				   
				        <!-- 카드 내부 버튼 -->
					<nav class="navbar navbar-light bg-grey" border=1>
					  <form class="container-fluid justify-content-start">
						  <a href="${contextPath}/res/rlist2.do?resNum=${res.resNum}" class="btn btn-danger" align=left>상세>></a>
						  	&ensp;&ensp; &ensp;&ensp; 
						  	<form name="fav" method="get" action="${contextPath}/favo/addfavo.do">
						  	<input type="hidden" name="resNum" value="${res.resNum }">
						  <div id="btn_group" align=right><button id="test_btn2" style="width:40px" onclick="like()">♥</button>
						  <input type="submit" value="찜">
						  </form>
						 </form>
					  </nav>			
				 </div>
			 </div>
			 </div>
		</c:forEach>
		<!--  </c:forEach> -->
		</c:when>
		</c:choose>
		
		</div>
		
		  
		  
		 
<br>
	
	
		<!-- 페이지네이션 -->
	
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