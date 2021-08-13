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
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<title>맛집리스트</title>

<!-- 카드 내부 BUTTON STYLE -->
<style>

#likeoff button {border: 1px solid grey; background-color: rgba(0, 0, 0, 0); color: grey; padding: 5px; border-radius: 5px; border-radius: 5px; margin-left: -3px;}

#likeon button {border: 1px solid grey; background-color: white; color: red; padding: 5px; border-radius: 5px; border-radius: 5px; margin-left: -3px;}

.like-btn {	color: #fff;}
</style>

<!-- 찜하기 버튼 경고창  -->

	<script type="text/javascript">
	
	$(function(){
		$("#id").attr("readonly",true);
		$("#id").val("${member.id}");
});	
 
    function addlike(){
    	$.ajax({
			url:"${contextPath}/favo/addfavo.do",
			type:"POST",
			data:$("#addform").serialize(),
			success: function(data,textStatus){
				if("1"==data){
					$("#addform").submit();
				}
			},
			error:function(data,textStatus){
				alert("에러가 발생했습니다.");
			},
			complete:function(data){
				alert("성공");
				
				}
			});
    	
 		   }
    
    function like(value){
    	$.ajax({
    		url:"${contextPath}/favo/addfavo.do",
			type:"POST",
			data:
				{
				resNum: value
				},
			dataType:"text",
			success:function(result){
				if(result==0){
					alert("에러");
				} else{
					console.log(event.currentTarget.firstElementChild);
					alert("성공");
					
				}
				
				
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





	<!--  <div class="row row-cols-1 row-cols-md-4 g-6">-->
	<!--  <div class="d-flex bd-highlight flex-wrap mb-3">-->
	<div class="d-flex align-content-stretch flex-wrap">
	
		<c:choose>
			<c:when test="${!empty resList}">
				<c:forEach var="res" items="${resList}">

					<div class="p-2 bd-highlight">
						<div class="card h-100">
							<img src="${contextPath}/download.do?resNum=${res.resNum}&resImageFileName=${res.resImageFileName}"  width="310" height="310" alt="${res.resImageFileName}">
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
								
								
					<div class="bb">	
					<div id="likeoff" align=right><button style="width:40px">♥</button>  </div> </div>		
												</form>
										
												
					<div id="likeon" align=right><button  style="width:40px">♥</button></div>

						<!-- 1 -->
						<form name="fav" method="post" action="${contextPath}/favo/addfavo.do">
							<input type="hidden" id="resNum1" name="resNum" value="${res.resNum }"> 
							<input type="submit" value="찜하기">
						</form>

						<!-- 3 -->
						<div>
						<div class="w3-border w3-center w3-padding">
						<c:if test="${ member.id == null }">
						.<br/>
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
				======================================================
				<!-- 페이지네이션 -->
		
	<div class="row">
					<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center">
						<c:if test="${pageMaker.prev }">
							<li class="page-item"><a class="page-link" href='<c:url value="/res/rlist1.do?page=${pageMaker.startPage-1 }"/>'
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a></li>
						</c:if>
						<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">	
							<li class="page-item"><a class="page-link" href='<c:url value="/res/rlist1.do?page=${pageNum }"/>'>${pageNum }</a></li>
						</c:forEach>
						<c:if test="${pageMaker.next && pageMaker.endPage >0 }">
							<li class="page-item"><a class="page-link" href='<c:url value="/res/rlist1.do?page=${pageMaker.endPage+1 }"/>' aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a></li>
						  </c:if>
						</ul>
					</nav>
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