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
	 	padding: 50px 10px;
	 	border-radius: 1px;
	 	background-color: #f3f3f3;
	 	boarder: solid 1px #000000;
	 	text-align: center;
	 	width: 100%;
	 	height: 100%;
	 	margin-top:50px
	 	}
 		</style>
 
 
</head>

<body>
<article>
 <div class="wrap">

	<div class="main-content">
	<div class="container">

<div class="row">
<h3>관리자 메인페이지</h3>
	<br>
	<br>
	<div class="information">
	${member.name}님 접속하셨습니다.
	</div>
</div>
<br>

	<div class="row">
      <h6>현황</h6>
     
      <ul class="list-group list-group-horizontal" style="font-size:25px; color:white;">
    	<li class="list-group-item" style="width:50%; height:120%; background-color:white;"><p class="text-center" style="margin-top:50px">
    	<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="white" class="bi bi-shop-window" viewBox="0 0 16 16">
 		<path d="M2.97 1.35A1 1 0 0 1 3.73 1h8.54a1 1 0 0 1 .76.35l2.609 3.044A1.5 1.5 0 0 1 16 5.37v.255a2.375 2.375 0 0 1-4.25 1.458A2.371 2.371 0 0 1 9.875 8 2.37 2.37 0 0 1 8 7.083 2.37 2.37 0 0 1 6.125 8a2.37 2.37 0 0 1-1.875-.917A2.375 2.375 0 0 1 0 5.625V5.37a1.5 1.5 0 0 1 .361-.976l2.61-3.045zm1.78 4.275a1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0 1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0 1.375 1.375 0 1 0 2.75 0V5.37a.5.5 0 0 0-.12-.325L12.27 2H3.73L1.12 5.045A.5.5 0 0 0 1 5.37v.255a1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0zM1.5 8.5A.5.5 0 0 1 2 9v6h12V9a.5.5 0 0 1 1 0v6h.5a.5.5 0 0 1 0 1H.5a.5.5 0 0 1 0-1H1V9a.5.5 0 0 1 .5-.5zm2 .5a.5.5 0 0 1 .5.5V13h8V9.5a.5.5 0 0 1 1 0V13a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V9.5a.5.5 0 0 1 .5-.5z"/>
		</svg>
    	<strong>신규예약요청</strong><br>
      	<a href="${contextPath}/admin/allRsv.do" class="count" >${newrm }</a></p></li>
      	
      	
      	<li class="list-group-item" style="width:50%; height:120%;"><p class="text-center" style="margin-top:50px">
		<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="red" class="bi bi-x-circle" viewBox="0 0 16 16">
  		<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
  		<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
		</svg>
      	<strong>취소요청</strong><br> 
      	<a href="${contextPath}/admin/allRsv.do" class="count">${newcm }</a></p></li>
      	
      	
      	
      	<li class="list-group-item" style="width:50%; height:120%"><p class="text-center" style="margin-top:50px">
      	<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="#ffc508" class="bi bi-person" viewBox="0 0 16 16">
  		<path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
		</svg>
      	<strong>신규가입회원</strong><br>
        <a href="${contextPath}/admin/listMem.do" class="count">${newmem }</a></p></li>
        
        
        
     	 <li class="list-group-item" style="width:50%; height:120%"><p class="text-center" style="margin-top:50px">
     	 <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-headset" viewBox="0 0 16 16">
  		 <path d="M8 1a5 5 0 0 0-5 5v1h1a1 1 0 0 1 1 1v3a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V6a6 6 0 1 1 12 0v6a2.5 2.5 0 0 1-2.5 2.5H9.366a1 1 0 0 1-.866.5h-1a1 1 0 1 1 0-2h1a1 1 0 0 1 .866.5H11.5A1.5 1.5 0 0 0 13 12h-1a1 1 0 0 1-1-1V8a1 1 0 0 1 1-1h1V6a5 5 0 0 0-5-5z"/>
		 </svg>
     	 <strong>신규문의</strong><br>
        <a href="${contextPath}/admin/noticeBoard.do" class="count">${newqna }</a></p></li>

      </ul>
     </div>
</div>
<br>
<br>
<br>
<br>
</div>
</div>


</article>


</body>
</html>