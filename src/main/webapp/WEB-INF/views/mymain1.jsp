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
	
	
<title>마이페이지메인</title>
 
 <!-- 전체 레이아웃 -->
  		<style>
  		
		 .information{
	 	padding: 50px 20px;
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
<h3>마이 페이지</h3>
	<br>
	<br>
	<div class="information">
	저희 사이트를 이용해주셔서 감사합니다. ${member.name}님의 마이페이지 입니다.
	</div>
</div>
<br>

	<div class="row">
      <h6>나의 예약 현황 <!--(최근 <em>3개월</em> 기준)--></h6>
     
      <ul class="list-group list-group-horizontal" style="font-size:25px">
    	<li class="list-group-item" style="width:50%; height:120%"><p class="text-center" style="margin-top:50px"><strong>예약요청중</strong><br> 
      	<a href="${contextPath}/rsv/res1.do" class="count">${requestR }</a></p></li>
      	<li class="list-group-item" style="width:50%; height:120%"><p class="text-center" style="margin-top:50px"><strong>예약완료</strong><br> 
      	<a href="${contextPath}/rsv/res1.do" class="count">${confirm }</a></p></li>
      	<li class="list-group-item" style="width:50%; height:120%"><p class="text-center" style="margin-top:50px"><strong>취소요청중</strong><br>
        <a href="${contextPath}/rsv/res1.do" class="count">${requestC }</a></p></li>
     	 <li class="list-group-item" style="width:50%; height:120%"><p class="text-center" style="margin-top:50px"><strong>취소</strong><br>
        <a href="${contextPath}/rsv/res1.do" class="count">${cancel }</a></p></li>
     	 <li class="list-group-item" style="width:50%; height:120%"><p class="text-center"  style="margin-top:50px"><strong>찜한곳</strong><br>
        <a href="${contextPath}/favo/list1.do" class="count">${favoCount }</a></p></li>
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