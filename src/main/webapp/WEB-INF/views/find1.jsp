<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="theme-color" content="#7952b3">
     <!-- Bootstrap core CSS
	 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js" integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
	<link rel="canonical" href="https://getbootstrap.kr/docs/5.0/examples/sign-in/">  -->
    
    <title>아이디/비밀번호찾기</title>
  
 

   
</head>
<body>
 <!-- 메인코드부 -->
 <div class="wrap">  

<hr>
<div class="main-content">
<div class="container">
<div class="row">
<div class="col-sm-3"></div>
<div class="col-sm-6">
<main class="form-signin">
  <form name="formfind" method="post" action="${contextPath}/member/findMember.do">
  <br>
    <h1 class="h3 mb-3 fw-normal">아이디 찾기</h1>
    <div class="form-floating ">
      <input type="text" class="form-control" id="name" name="name">
      <label for="floatingInput">이름</label>
    </div>    
    <div class="form-floating">
      <input type="text" class="form-control" id="email" name="email">
      <label for="floatingPassword">이메일</label>
    </div>
    <br>
    <button class="w-100 btn btn-lg btn-danger" type="submit">찾기</button>
  </form>
  
  <!-- 아이디찾기 -->
 	
	<c:if test="${param.check==0}">
	<script>
	window.onload=function(){
		alert("가입하신 아이디는 ${param.id} 입니다.")
	}
	</script>
	</c:if>
	<c:if test="${param.check==1}">
	<script>
	document.formfind.name.value="";
	document.formfind.email.value="";
	
	window.onload=function(){
		alert("일치하는 정보가 존재하지 않습니다");
	}
	</script>
	</c:if>

	
  
  <br>
  <br>
  <br>
  <br>
  
  <form name="formfind1" method="post" action="${contextPath}/member/findPassword.do">
    <h1 class="h3 mb-3 fw-normal">비밀번호 찾기</h1>
    <div class="form-floating ">
    
    <!-- 이메일로 로그인 하는 방식이여서 우선은 건드리지 않았습니다. 
    	추후에 아이디 로그인 방식으로 바꾸시고 싶으시면 이 부분을 바꾸면 됩니다 -->
    	
      <input type="text" class="form-control" id="id" name="id">
      <label for="floatingInput">아이디</label>
    </div>
    
    <div class="form-floating">
      <input type="text" class="form-control" id="phone" name="phone">
      <label for="floatingPassword">휴대전화</label>
    </div>
    <br>
    <button class="w-100 btn btn-lg btn-danger" type="submit" value="checkPw">찾기</button>  
  </form>
   <!-- 비밀번호찾기 -->
	
	<c:if test="${param.checkPw==0}">
	<script>
	window.onload=function(){
		alert("가입하신 아이디는 ${param.password} 입니다.")
	}
	</script>
	</c:if>
	<c:if test="${param.checkPw==1}">
	<script>
	document.formfind1.name.value="";
	document.formfind1.phone.value="";
	
	window.onload=function(){
		alert("일치하는 정보가 존재하지 않습니다");
	}
	</script>
	</c:if>
	
	
	
  
</main>
</div>
<div class="col-sm-3"></div>
</div>

</div>
</div>
</div>
 
</body>

</body>
</html>