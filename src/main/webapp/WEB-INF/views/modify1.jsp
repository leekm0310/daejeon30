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
 $(document.form1).ready(function(){
	 
	 $("#modify").on("click",function(){
		 if($("input[name='password']").val()==''){
	 			alert("비밀번호를 입력해주세요");
	 			return false;
	 }
		 else{
			 alert("회원 정보가 수정되었습니다")
		 		//location.href="${contextPath}/member/modifyMember.do";
			 document.form1.action="${contextPath}/member/modifyMember.do";
		 }
		 }			 
	 )	 
 })
 
 	function newUpdate(){
 		var form = form1
 		
 		if($("input[name='password']").val()==''){
 			alert("비밀번호를 입력해주세요");
 			//$("#password").focus();
 			location.href ="${contextPath}/modify.do";
 		} else {
 		alert("회원 정보가 수정되었습니다")
 		form.submit();
 		form.action="${contextPath}/member/modifyMember.do";
 	}
 	}
 	
 	
 	
	function goodbye1(){
		var form = form1
		
 		if($("input[name='password']").val()==''){
 			alert("비밀번호를 입력해주세요");
 			//$("#password").focus();
 			//return false;
 		} //else if ($("input[name='password']").val() != $("input[name='passwordOk']").val()){
 		 else if ($("input[name='password']").val() != '${member.password}'){
 			alert("비밀번호가 일치하지 않습니다. 다시한번 확인해주세요");
 			return false;
 		} else{
 		alert("회원 탈퇴가 완료되었습니다")
 		form.action="${contextPath}/member/removeMember.do";
 	
 		}
 	}
 	
 	
 	function no(){
 		alert("메인 메뉴로 이동합니다")
 		location.href = "${contextPath}/main.do";
 	}
 </script>
</head>

<body>

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
				<form name="form1" method="post">
				
					<br>
					    <label for="inputId1" class="col-sm-2 col-form-label">아이디</label>
					    <input type="id" class="form-control" id="id" name="id" value="${member.id}" readonly="readonly">
		
					    <label for="inputPassword1" class="form-label">비밀번호</label>
					    <input type="password" class="form-control" id="password" name="password">
			
				
					    <label for="inputPassword2" class="form-label">비밀번호 확인</label>
					    <input type="password" class="form-control" id="passwordOk" placeholder="" name="passwordOk">
		
					    <label for="inputName1" class="form-label">이름</label>
					    <input type="text" class="form-control" id="name" value="${member.name}" readonly="readonly">
		
					    <label for="inputPhone" class="form-label">휴대전화</label>
					    <input type="text" class="form-control" id="phone" value="${member.phone}" name="phone">
		
					    <label for="inputEmail" class="form-label">이메일</label>
					    <input type="text" class="form-control" id="email" value="${member.email}" name="email">
						<br>
						<div class="button-group" align=center>
					    <!--  <button type="button" class="btn btn-danger" onclick="newUpdate()">회원정보수정</button>-->
					    <button type="submit" class="btn btn-danger" id="modify">수정</button>   
					    <button type="submit" class="btn btn-secondary" onclick="no()">취소</button>
					    <button type="submit" class="btn btn-secondary" onclick="goodbye1()">회원탈퇴</button>
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


</body>
 