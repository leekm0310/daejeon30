<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
 <meta name="viewport" content="width=device-width, initial-scale=1">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
 
 <!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
	
	
<title>관리자페이지메인</title>

  		<style>
		 .information{
	 	padding: 10px 20px;
	 	border-radius: 1px;
	 	background-color: #f3f3f3;
	 	boarder: solid 1px #000000;
	 	text-align: center;
	 	width: 750px;
	 	height: 100%;
	 	margin-top:50px
	 	}
 		</style>
 
 
</head>

<body>

 <div class="wrap">

	<div class="main-content">
	<div class="container">

<div class="row">
<h3>관리자 메인페이지</h3>
	<br>
	<br>
	<div class="information">
	${member.name}
	</div>
</div>
<br>

	<div class="row">
      <h6>현황</h6>
     
      <ul class="list-group list-group-horizontal" style="font-size:25px">
    	<li class="list-group-item" style="width:50%; height:120%"><p class="text-center" style="margin-top:50px"><strong>신규예약요청</strong><br> 
      	<a href="#" class="count">#</a></p></li>
      	<li class="list-group-item" style="width:50%; height:120%"><p class="text-center" style="margin-top:50px"><strong>신규취소요청</strong><br> 
      	<a href="#" class="count">#</a></p></li>
      	<li class="list-group-item" style="width:50%; height:120%"><p class="text-center" style="margin-top:50px"><strong>전체내역</strong><br>
        <a href="#" class="count">#</a></p></li>
     	 <li class="list-group-item" style="width:50%; height:120%"><p class="text-center" style="margin-top:50px"><strong>취소</strong><br>
        <a href="#" class="count">#</a></p></li>

      </ul>
     </div>
</div>
<br>
<br>
<br>
<br>
</div>
</div>





</body>
</html>