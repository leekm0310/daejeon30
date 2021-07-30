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
		} else if (passwd.value==""){
		alert('비밀번호를 입력해주세요.');
		form.passwd.focus();
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
				 <div class="col-sm-2"></div>
	
				 <div class="col-sm-8" align=center>
					<h1 class="h3 mb-3 fw-normal">로그인</h1>
					<br>	
					<form method="POST" action="${contextPath}/member/login2.do">
					<div class="form-floating" style="width:500px;">
						<input type="text" class="form-control" id="id" name="id">
						<label for="floatingInput">아이디</label>
					</div>
					<br>
					<div class="form-floating" style="width:500px;">
						<input type="password" class="form-control" name="password" id="password" placeholder="Password">
						<label for="floatingPassword">비밀번호</label>
					</div>   
					<br>
					<button class="w-30 btn btn-lg btn-danger" style="width:300px;" onclick="checklogin()">로그인</button><p></p>
					<button class="w-30 btn btn-lg btn-danger" style="width:300px;" onclick="location.href='${contextPath}/res/rsv3.do'">비회원예약</button>    
					<div class="container" style="margin-bottom:150px">  
						<div class="p-3 bg-white btn btn-link text-dark" onclick="location.href='./find1.jsp'">아이디/비밀번호 찾기</div>    
						<div class="p-3 bg-white btn btn-link text-dark" onclick="location.href='./join1.jsp'">회원 가입</div>
				</div>
				</form>
			</div>
			<div class="col-sm-2"></div>
		</div>
	</div>
</div>
</div>


</body>
</html>