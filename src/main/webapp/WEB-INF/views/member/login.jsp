<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
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
		
		
	<!-- 아이디 비번 틀린경우 -->
	<c:choose>
	<c:when test="${param.result=='loginFailed'}">
	<script>
	window.onload=function(){
		alert("아이디나 비밀번호가 틀립니다. 다시 로그인 하세요!")
	}
	</script>
	</c:when>
	</c:choose>
	    
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
	
		<div class="row">
		 	<div class="col-sm-3" style="height:100px;">
		 </div>
	
		 <div class="col-sm-6" align=center style="width:600px; height:400px;">
			<br>
			<br>
			
			
		</table>
		</form>
			<h3>로그인</h3>
			<form method="POST" action="${contextPath}/member/login.do">
			<div class="form-floating" style="width:400px;">
				<input type="id" class="form-control" id="id" placeholder="id" name="id">
				<label for="floatingInput">아이디</label>
			</div>
			<br>
			<div class="form-floating" style="width:400px;">
				<input type="password" class="form-control" name="password" id="password" placeholder="Password">
				<label for="floatingPassword">비밀번호</label>
			</div>   
			<br>
			<button class="w-30 btn btn-lg btn-danger" style="width:300px;" onclick="checklogin()">로그인</button><p></p>
			
			<div class="container" style="margin-bottom:150px">  
				<div class="p-3 bg-white btn btn-link text-dark" onclick="location.href='${contextPath}/find.do'">아이디/비밀번호 찾기</div>    
				<div class="p-3 bg-white btn btn-link text-dark" onclick="location.href='${contextPath}/join.do'">회원 가입</div>
			</div>
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