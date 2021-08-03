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

</head>

<body>
 <!-- 메인코드부 -->
	 <div class="wrap">

		<hr>
	 		<div class="main-content">
				<div class="container">
			<h2>글쓰기</h2>
			<hr>
		<br>
	<br>
	
	<!-- 게시판 등록 -->
	<div class="row">
		 <div class="col-sm-2"></div>
	<form action="${contextPath}/boardq/addQna.do" method="post" >
	 <div class="col-sm-8">
	
		<!-- select box -->

			<div class="col g-0 bg-light position-relative">
			<div class="input-group">
			  <select name="sort" class="form-select">
			    <option selected>문의 종류를 선택해주세요.</option>
			    <option value="예약문의">예약문의</option>
			    <option value="취소/환불문의">취소/환불문의</option>
			    <option value="기타문의">기타문의</option>
			  </select>
			  <input type="submit" value="등록하기">
			</div>
		<br>
		
		<!-- 제목 입력  -->
			<input class="form-control" name="id" type="hidden" value="${mem.id }">
			<input class="form-control" name="title" type="text" placeholder="제목을 입력해주세요.">
			<input class="form-control" name="name" type="text" placeholder="성함을 입력해주세요.">
			<input class="form-control" name="password" type="text" placeholder="비밀번호를 입력해주세요.">
		
		<!-- 글 작성 -->
		
		  <label for="exampleFormControlInput1" class="form-label"></label>
		  <textarea class="form-control" id="exampleFormControlTextarea1" name="content" rows="15" placeholder="내용을 입력해주세요."></textarea>
	
				</div>
					</div>
			</form>		
						</div>
					<div class="col-sm-2"></div>
				<br>

		</div>
	</div>
</div>

</body>
</html>