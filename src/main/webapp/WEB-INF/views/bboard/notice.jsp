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
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<!-- Bootstrap CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
	<title>공지사항</title>
</head>
<body>
 
  <!-- 메인코드부 -->
 <div class="wrap">
 
	 
	<div class="main-content">	 
	
	<div class="container">
	
	<div class="row" style="text-align: center; margin: 50 auto; ">
		<H3>공지사항</H3>
		<br><hr style="width:300; margin:auto;"><br>
		<p>공지사항입니다.<br></p>
		<BR><BR>
	</div>	
		
		<table class="table table-hover">
			<thead>
				<tr>
					<th>번호</th>
					<th style="width:700;">제목</th>
					<th>작성자</th>
					<th>날짜</th>
				
				</tr>
			</thead>
			<tbody>
			<c:choose>
			<c:when test="${!empty noticeList }">
			<c:forEach var="notice" items="${noticeList }" varStatus="num">
			<fmt:formatDate var="ndate" value="${notice.date }" pattern="yyyy-MM-dd"/>
			<tr>
			<td style="padding:14px">${num.index+1 }</td>
			<td><a href="${contextPath}/bboard/oneNo.do?num=${notice.num }">${notice.title }</a></td>
			<td>${notice.id }</td>
			<td>${ndate }</td>
			</tr>
			</c:forEach>
			</c:when>
			</c:choose>
		
			</tbody>
		</table>
	<br>
	<c:if test="${isLogOn==true && member.id =='admin' }">
	<button class="btn btn-danger" type="button" onclick='location.href="${contextPath}/writeform1.do"'>글쓰기</button>
	</c:if>
	
		<br>
		
		
		
		
	
	</div>
</div>
</div>	

	 
</body>
</html>
