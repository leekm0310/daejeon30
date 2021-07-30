<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
<div class="row">
			<div class="col-sm-2">
			</div>
			<div class="col-sm-8">
				<br>
				<div class="shadow p-3 mb-5 bg-body rounded">
				
				<h3>회원 상세 정보 </h3>
				<form name="form1" method="post">
				
					<br>
					    <label for="inputId1" class="col-sm-2 col-form-label">아이디</label>
					    <input type="text" class="form-control" id="id" name="id" value="#" readonly="readonly">
						<!-- 
					    <label for="inputPassword1" class="form-label">비밀번호</label>
					    <input type="password" class="form-control" id="password" name="password">
			
				
					    <label for="inputPassword2" class="form-label">비밀번호 확인</label>
					    <input type="password" class="form-control" id="passwordOk" placeholder="" name="passwordOk">
		 				-->
					    <label for="inputName1" class="form-label">이름</label>
					    <input type="text" class="form-control" id="name" value="#" readonly="readonly">
		
					    <label for="inputPhone" class="form-label">휴대전화</label>
					    <input type="text" class="form-control" id="phone" value="#" name="phone">
		
					    <label for="inputEmail" class="form-label">이메일</label>
					    <input type="text" class="form-control" id="email" value="#" name="email">
						<br>
						<div class="button-group" align=center>
					    <button type="submit" class="btn btn-danger" onclick="#">회원정보수정</button>
					    <button type="submit" class="btn btn-secondary" onclic3k="#">취소</button>
					    <button type="submit" class="btn btn-secondary" onclick="#">회원탈퇴</button>
					    </form>
	   				</div>
	   			</div>
 </div>
 </body>
 </html>