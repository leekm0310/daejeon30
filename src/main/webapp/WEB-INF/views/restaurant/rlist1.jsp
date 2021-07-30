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
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="http://resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<title>맛집리스트</title>

<!-- 카드 내부 BUTTON STYLE -->
<style>
#test_btn2 {border-radius: 5px; border-radius: 5px; margin-left: -3px;}

#btn_group button {border: 1px solid grey; background-color: rgba(0, 0, 0, 0); color: grey; padding: 5px;}

#btn_group button:hover {color: red; background-color: white;}

.like-btn {	color: #fff;}
</style>

<!-- 찜하기 버튼 경고창  -->

	<script type="text/javascript">
 
    function addlike(resNum){
    	$.ajax({
			url:"${contextPath}/favo/addfavo.do",
			type:"POST",
			data: {resNum : resNum},
			success: function(fav){
				alert("성공");
				console.log(fav);
				
				let heart = fav.likeNum;
				$(".rec_count").text(heart);
				
				}
			});
    	
 		   }
	  </script>

</head>

<body>
<!-- 메인코드부 -->
<div class="wrap">


	<div class="main-content">
		<div class="container" style="margin-bottom: 300px;">
			
				<br> <br>
<!-- 
${resList }
	<div>--------------------------------------------</div>
	${fav } -->

	<!--  <div class="row row-cols-1 row-cols-md-4 g-6">-->
	<!--  <div class="d-flex bd-highlight flex-wrap mb-3">-->
	<div class="d-flex align-content-stretch flex-wrap">
	
		<c:choose>
			<c:when test="${!empty resList}">
				<c:forEach var="res" items="${resList}">

					<div class="p-2 bd-highlight">
						<div class="card h-100">
							<img src="${contextPath}/download.do?resNum=${res.resNum}&resImageFileName=${res.resImageFileName}" width="250" height="250" alt="${res.resImageFileName}">
								<div class="card-body">${res.resNum}
									<h5 class="card-title">${res.resName}</h5>
									<p class="card-text">${res.resMenu}</p>
									<hr>
						<!-- 카드 내부 버튼 -->
						<nav class="navbar navbar-light bg-grey" border=1>
							<form class="container-fluid justify-content-start">
								<a href="${contextPath}/res/rlist2.do?resNum=${res.resNum}" class="btn btn-danger" align=left>상세>></a> 
								&ensp;&ensp;&ensp;&ensp; 
								<input type="hidden" name="resNum" value="${res.resNum }">
													<!--   <div id="btn_group" align=right><button id="like" name="like" style="width:40px">♥</button>
						  </div>  <button id="like" name="like" style="width:40px">♥</button>
												</form>
					<div id="btn_group" align=right><button id="test_btn2" style="width:40px" onclick="like()">♥</button></div>-->


						<!-- 1 -->
						<form name="fav" method="post" action="${contextPath}/favo/addfavo.do">
							<input type="hidden" id="resNum1" name="resNum" value="${res.resNum }"> 
							<input type="submit" value="찜하기">
						</form>

												<!-- 2	   
						 <form name="FavoForm" method="post">
						 <input type="hidden" id="resNum1" name="resNum" value="${res.resNum }">
						 <input type="hidden" id="id" name="id" value="${member.id}">
						   <input type="button" value="♥1" onclick="javascript:like1()">
						   </form> -->

						<!-- 3 -->
						<div>
						<div class="w3-border w3-center w3-padding">
						<c:if test="${ member.id == null }">
					.<br/>
						<i class="fa fa-heart" style="font-size: 16px; color: red"></i>
						<span class="rec_count"></span>
						</c:if>
						<c:if test="${ member.id != null }">
						<button class="w3-button w3-black w3-round" onclick="javascript:addlike('${res.resNum}')">
						<i class="fa fa-heart" style="font-size: 16px; color: red"></i> &nbsp;
						<span class="rec_count"></span></button>
						</c:if>
						</div>
						</div>


											</nav>
										</div>
									</div>
								</div>
							</c:forEach>
						</c:when>
					</c:choose>


				</div>




				<br>


				<!-- 페이지네이션 -->

				<div class="text-center">
					<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center">
							<li class="page-item"><a class="page-link" href="#"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a></li>

							<li class="page-item"><a class="page-link" href="#">1</a></li>
							<li class="page-item"><a class="page-link" href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item"><a class="page-link" href="#">4</a></li>
							<li class="page-item"><a class="page-link" href="#">5</a></li>
							<li class="page-item"><a class="page-link" href="#"
								aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a></li>
						</ul>
					</nav>

					<br>
				</div>


			</div>

			<!-- Optional JavaScript; choose one of the two! -->

			<!-- Option 1: Bootstrap Bundle with Popper -->
			<script
				src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
				integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
				crossorigin="anonymous"></script>

			<!-- Option 2: Separate Popper and Bootstrap JS -->

			<script
				src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
				integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
				crossorigin="anonymous"></script>
			<script
				src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js"
				integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT"
				crossorigin="anonymous"></script>


		</div>
	</div>


	  
</body>
</html>