<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
	request.setCharacterEncoding("utf-8");
%>
<!doctype html>
<html lang="UTF-8">
<head>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js" integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT" crossorigin="anonymous"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
	
	<!-- 전체 레이아웃 -->
		
	<!-- 삭제 경고창 -->
	<script text="text/javascript">
		function del() {
		if (confirm("삭제 하시겠습니까?"))
		form.submit();
		}
	</script>

</head>

<body>
 <!-- 메인코드부 -->
 <div class="wrap">


	<div class="main-content">

	<div class="container">
		<div class="dark border"><!-- 테두리 안 -->
			<div class="col g-0 position-relative"> <!-- 간격조절 -->		
				<div class="col md-0 p-md-4"><!-- 간격조절 -->
					<p class="fs-3">${bbo.title}</p>
					<hr>			 				
					
					<figcaption class="figure-caption">${bbo.content }</figcaption>
					<br>
					<p> </p>
					<hr>
									
					<div class="d-grid gap-2 d-md-flex justify-content-md-end">
					<form name="del" method="post" action="/bboard/deleteOneNo.do">
					 <input type="hidden" id="num" name="num" value="${bbo.num }"> 
						<button class="btn btn-danger me-md-2" type="button" onclick="location.href='./writeform1.jsp'">수정</button>
						<button class="btn btn-danger" type="button" onclick="del();">삭제</button>
						</form>
					</div>
					<br>					
									
				
							
			</div>
		</div>
	</div>	
	<!-- 글쓰기 버튼 -->
	<br>
	<div class="row justify-content-end">
		<button type="button" class="btn btn-danger" style="width:100px;" onclick="location.href='./review1.jsp'">글목록</button>
	</div>							
</div>
<br>
</div>
</div>


</body>
</html>