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
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  
<title>회원관리</title>

 
</head>

<body>

 <!-- 메인코드부 -->
 <div class="wrap">
 	<div class="main-content">
	<div class="container" >

<br>
<br>


<!-- 본문 내용 -->
<h3>회원 관리</h3>
<br>
	<table class="table table-hover">
	<thead>
	<tr>
		<th><input type="checkbox" id="checkall" onclick="checkAll();" style="width:20px;height:20px;"/></th>
		<th>아이디</th>
		<th>이름</th>
		<th>전화번호</th>
		<th>이메일</th>
		<th></th>
	</tr>
	</thead>
	<tbody>
	   <c:choose>
   <c:when test="${!empty memList}" >
   <c:forEach  var="mem" items="${memList}" >
	<tr>

		<td><input type="checkbox" id="chk" name="chk" style="width:20px;height:20px;"/></td>
		<td>${mem.id }</td>
		<td>${mem.name }</td>
		<td>${mem.phone}</td>
		<td>${mem.email }</td>
		<td width="200"><button class="btn btn-outline-success btn-sm" onclick="location.href='${contextPath}/admin/memDetail.do?id=${mem.id}'">수정</button>
		<button class="btn btn-outline-danger btn-sm" onclick="location.href='${contextPath}/admin/deleteMem.do?id=${mem.id}'">탈퇴</button></td>
	</c:forEach>
	</c:when>
	</c:choose>

	</tr>
	</tbody>
</table>

<!-- 삭제하기버튼 -->
<div class="row justify-content-end">
<button type="button" class="btn btn-danger" style="width:100px;" onclick="location.href='${contextPath}/addRes.do'">등록하기</button>
<button type="button" class="btn btn-danger" style="width:100px;" onclick="location.href='${contextPath}/admin/removeRes.do?resNum=${res.resNum }'">삭제하기</button>
</div>

<!-- 페이지번호 -->
<div class ="row">
<nav aria-label="Page navigation example">
  <ul class="pagination justify-content-center">
    <li class="page-item">
      <a class="page-link" href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    <li class="page-item"><a class="page-link" href="#">1</a></li>
    <li class="page-item"><a class="page-link" href="#">2</a></li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    <li class="page-item">
      <a class="page-link" href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</nav>
</div>
	</div>
		</div>
	</div>


</body>
</html>