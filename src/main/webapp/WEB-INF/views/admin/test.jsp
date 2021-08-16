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
</head>
<body>
 <header>
    
        <ul class="list-group list-group-horizontal" style="font-size:25px">
    	<li class="list-group-item" style="width:50%; height:120%"><p class="text-center" style="margin-top:50px"><strong>신규예약요청</strong>
      	<a href="#" class="count">11</a></p></li>
      	<li class="list-group-item" style="width:50%; height:120%"><p class="text-center" style="margin-top:50px"><strong>신규취소요청</strong>
      	<a href="#" class="count">#</a></p></li>
      	<li class="list-group-item" style="width:50%; height:120%"><p class="text-center" style="margin-top:50px"><strong>신규가입회원</strong>
        <a href="#" class="count">11</a></p></li>
     	 <li class="list-group-item" style="width:50%; height:120%"><p class="text-center" style="margin-top:50px"><strong>신규문의</strong>
        <a href="#" class="count">11</a></p></li>

      </ul>
      </header>
      
      <article>

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
      	<a href="#" class="count">${newrm }</a></p></li>
      	<li class="list-group-item" style="width:50%; height:120%"><p class="text-center" style="margin-top:50px"><strong>신규취소요청</strong><br> 
      	<a href="#" class="count">#</a></p></li>
      	<li class="list-group-item" style="width:50%; height:120%"><p class="text-center" style="margin-top:50px"><strong>신규가입회원</strong><br>
        <a href="#" class="count">${newmem }</a></p></li>
     	 <li class="list-group-item" style="width:50%; height:120%"><p class="text-center" style="margin-top:50px"><strong>신규문의</strong><br>
        <a href="#" class="count">${newqna }</a></p></li>

      </ul>
     </div>
     
     <h3>게시판 관리</h3>
<br>
<div class="btn-group" role="group" aria-label="Basic outlined example">
  <!--  <button type="button" class="btn btn-outline-primary" onclick="location.href='${contextPath}/admin/reviewBoard.do'">리뷰게시판</button>-->
  <button type="button" class="btn btn-outline-primary" onclick="allreview()">리뷰게시판</button>
  <button type="button" class="btn btn-outline-dark" onclick="allrec()">추천게시판</button>
  <button type="button" class="btn btn-outline-dark" onclick="allqna()">문의게시판</button>
  <button type="button" class="btn btn-outline-dark" onclick="location.href='${contextPath}/admin/noticeBoard.do'">공지사항</button>
</div>
 <button type="button" class="btn btn-danger btn-sm" onclick="location.href='${contextPath}/writeform1.do'">관리자글쓰기</button>

<br><br>
	<table class="table table-hover">
	<thead>
	<tr>
		<th><input type="checkbox" id="checkall" onclick="checkAll();" style="width:20px;height:20px;"/></th>
		<th>#</th>
		<th>#</th>
		<th>#</th>
		<th>#</th>
		<th>#</th>
		<th></th>
	</tr>
	</thead>
	<tbody id="list">
	   <c:choose>
   <c:when test="${!empty result }" >
   <c:forEach  var="result" items="${result }" >
	<tr>

		<td><input type="checkbox" id="chk" name="chk" style="width:20px;height:20px;"/></td>
		<td>#</td>
		<td>${result.title}</td>
		<td><fmt:formatDate pattern="yyyy-MM-dd" value="${result.date }" /></td>
		<td>${result.id }</td>
		<td width="200"><button class="btn btn-outline-success btn-sm" onclick="location.href='${contextPath}/bboard/oneNo.do?num=${result.num }'">수정</button>
		<button class="btn btn-outline-secondary btn-sm" value="${result.num }" onclick="deleteNotice(this.value)">삭제</button></td>
	</c:forEach>
	</c:when>
	</c:choose>

	</tr>
	</tbody>
</table>
      </article>


</body>
</html>