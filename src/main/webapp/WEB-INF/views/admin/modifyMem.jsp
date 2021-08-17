<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	
<title>회원정보수정</title>
  
 
 
 <!-- 자바스크립트 부분 -->
 <script type="text/javascript">

 	
 	
 	

		
	function memdelete(){
		alert("회원 탈퇴가 완료되었습니다");
		location.href="${contextPath}/admin/deleteMem.do?id=${mem.id}";
		}
	
 	

 </script>
</head>

<body>
<article>
 <!-- 메인코드부 -->
 <div class="wrap">
	<div class="main-content">
		
		<div class="container">
		
			
		<!-- 본문 -->
		<div class="row">
			<div class="col-sm-2">
			</div>
			<div class="col-sm-8">
				<br>
				<div class="shadow p-3 mb-5 bg-body rounded">
				
				<h3>회원 정보 수정 </h3>
				<form name="form1" method="post" action="${contextPath}/admin/modifyMem.do">
				
					<br>회원 구분
					 <select name="memType">
				  <option value="일반회원" selected >일반회원</option>
				  <option value="우수회원" >우수회원</option>
				  <option value="블랙리스트">블랙리스트</option>
					</select>
					<br>
				
						<!--  <label for="inputId1" class="col-sm-2 col-form-label">회원구분</label>
					    <input type="text" class="form-control" value="${mem.memType}" readonly="readonly">-->
					    
					    <label for="inputId1" class="col-sm-2 col-form-label">아이디</label>
					    <input type="id" class="form-control" id="id" name="id" value="${mem.id}" readonly="readonly">
		
					    <label for="inputPassword1" class="form-label">비밀번호</label>
					    <input type="password" class="form-control" id="password" name="password" value="${mem.password }">
		
					    <label for="inputName1" class="form-label">이름</label>
					    <input type="text" class="form-control" id="name" value="${mem.name}" readonly="readonly">
		
					    <label for="inputPhone" class="form-label">휴대전화</label>
					    <input type="text" class="form-control" id="phone" value="${mem.phone}" name="phone">
		
					    <label for="inputEmail" class="form-label">이메일</label>
					    <input type="text" class="form-control" id="email" value="${mem.email}" name="email">
						<br>
						<div class="button-group" align=center>
					    <!--  <button type="button" class="btn btn-danger" onclick="newUpdate()">회원정보수정</button>-->
					    <button type="submit" class="btn btn-danger">수정</button>   
					    <button type="button" class="btn btn-secondary" onclick="location.href='${contextPath }/admin/listMem.do'">취소</button>
					    <button type="button" class="btn btn-secondary" onclick="memdelete()">회원탈퇴</button>
					    </form>
	   				</div>
	   			</div>
 </div>
 <div class="col-sm-2">
					</div>
	
<br>
</div>
</div>
</div>
</div>
</article>

</body>
 