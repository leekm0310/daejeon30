<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
	request.setCharacterEncoding("utf-8");
%>
<!doctype html>
<html lang="UTF-8">
<head>	
		<!-- 유효성 검사 -->
		<script type="text/javascript">
			function checklogin(){	
				if(id.value==""){
				alert('아이디를 입력해주세요.');
				form.id.focus();
			return false;
				} else if (password.value==""){
				alert('비밀번호를 입력해주세요.');
				form.password.focus();
			return false;
			}
			form.submit();
			}
	</script>

</head> 
 
<body>
 <!-- 메인코드부 -->
 <div class="wrap">

<hr>
<div class="main-content">
		
	<div class="container">
	 <br>
	 <br>
		<div class="row">
		 	<div class="col-sm-3"></div>
		<br>
		 <div class="col-sm-6" align=center>
			<h1 class="h3 mb-3 fw-normal">로그인</h1>
			<form method="POST" action="${contextPath}/daejeon30/member/login.do">
			<br>	
			<div class="form-floating" style="width:300px;">
				<input type="text" class="form-control" id="id" placeholder="abc123" name="id">
				<label for="floatingInput">아이디</label>
			</div>
			<br>
			<div class="form-floating" style="width:300px;">
				<input type="password" class="form-control" name="password" id="password" placeholder="Password">
				<label for="floatingPassword">비밀번호</label>
			</div>  
			<br> 
			<button class="w-30 btn btn-lg btn-danger" style="width:200px;" onclick="checklogin()">로그인</button> 
			</form>    
				<div class="p-3 bg-white btn btn-link text-dark" onclick="location.href='${contextPath}/find.do'">아이디/비밀번호 찾기</div>    
				<div class="p-3 bg-white btn btn-link text-dark" onclick="location.href='${contextPath}/join.do'">회원 가입</div>
			
			<hr>
		<br>
		<br>
			<h1 class="h3 mb-3 fw-normal">비회원 예약 조회</h1>
			<br>
			<form id="tracknonForm" action="${contextPath}/daejeon30/rsv/selectOneN.do" method="post">
			<div class="form-floating" style="width:300px;">
				<input type="text" class="form-control" id="name" name="name">
				<label for="floatingInput">예약자명</label>
			</div>
			<br>
			<!-- <div class="form-floating" style="width:300px;">
				<input type="password" class="form-control" name="passwd" id="passwd" placeholder="Password">
				<label for="floatingPassword">예약번호</label>
			</div> -->
			<br>
			<div class="form-floating" style="width:300px;">
				<input type="password" class="form-control" name="password" id="password">
				<label for="floatingPassword">비회원 비밀번호</label>
			</div>    
			<br>
			<button class="w-30 btn btn-lg btn-danger" style="width:200px;">조회</button><p></p>   
			</form>	 
		</div>
	<div class="col-sm-3">
	</div>
		
	</div>
</div>
</div>
</div>


</body>
</html>