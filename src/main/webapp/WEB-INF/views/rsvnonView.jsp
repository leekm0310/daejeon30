<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
	request.setCharacterEncoding("utf-8");
%>
<!doctype html>
<html>
<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<!-- Bootstrap CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
	
	<title>:: 예약 내역 상세 ::</title>
	

</head>
<body>
	<!-- 메인코드부 -->
	<div class="wrap">    

	<hr>
	<div class="main-content">  
	<div class="container" align=center>
		<br>
			<br>
		
	<!-- 예약폼 -->

			<h1 align=center>예약 내역 상세</h1>
				<br>
				<div class="shadow p-3 mb-5 bg-body rounded" style="width:700px;" align=left>
					이름
					<div class="shadow-none p-1 mb-3 bg-light rounded">${rsvOne.name}</div>
					휴대폰번호
					<div class="shadow-none p-1 mb-3 bg-light rounded">${rsvOne.phone }</div>
					장소
					<div class="shadow-none p-1 mb-3 bg-light rounded">${rsvOne.resName }</div>
					날짜
					<div class="shadow-none p-1 mb-3 bg-light rounded">${rsvOne.rsvDate }</div>
					시간
					<div class="shadow-none p-1 mb-3 bg-light rounded">${rsvOne.rsvTime }</div>
					인원
					<div class="shadow-none p-1 mb-3 bg-light rounded">${rsvOne.guestNum }</div>
					추가사항
					<div class="shadow-none p-1 mb-3 bg-light rounded">${rsvOne.addInfo }</div>
					<br>
				<div align="center">
					<button type="button" class="btn btn-danger btn-lg" onclick="location.href='${contextPath}/main.do'">확인</button>
				</div>
			</div>


</div>
</div>
</div>
</body>

</html>