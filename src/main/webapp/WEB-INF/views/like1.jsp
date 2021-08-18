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

<title>찜한 리스트</title>


 <!-- 체크박스 관련 제이쿼리문 전체선택/전체해제, 삭제경고창-->
 <script type="text/javascript">
	function checkAll(){
		if($("#checkall").is(":checked")){
			$("input[name=chk]").prop("checked",true);
		}else{
			$("input[name=chk]").prop("checked",false);
		}
	}
	
	function del() {
		if (confirm("삭제 하시겠습니까?"))
	      list_ok.submit();
		}
	
	
	
 </script>
 

</head>

<body>
 <!-- 메인코드부 -->
 <div class="wrap">
	
	<div class="main-content">
	<div class="container">



<!-- 본문 내용 -->
<h3>찜한 리스트</h3>
<br>


<table class="table table-hover">
	<thead>
	<tr>
		<th><input type="checkbox" id="checkall" onclick="checkAll();" style="width:20px;height:20px;"/></th>
		<th>번호</th>
		<th>이미지</th>
		<th>식당이름</th>
		<th>전화번호</th>
		<th>선택</th>
	</tr>
	</thead>
	<tbody>
		<c:choose>
	<c:when test="${!empty favolist}">
	<c:forEach var="favo" items="${favolist}">
	<tr>

		<td><input type="checkbox" id="chk" name="chk" style="width:20px;height:20px;"/>
		</td>
		<td>1</td>
		<td class="thumb"><a href="#">
		<img src="${contextPath}/download.do?resNum=${favo.resNum}&resImageFileName=${favo.resImageFileName}" width="100" height="100"></a></td>
		<td>${favo.resName }</td>
		<td>${favo.resPhone }</td>
		<td><button type="button" onclick="location.href='${contextPath}/res/rlist2.do?resNum=${favo.resNum}'" class="btn btn-outline-success">상세보기</button><br>
		<form name="fav" method="post" action="${contextPath}/favo/removeFavo.do">
		 <input type="hidden" id="resNum1" name="resNum" value="${favo.resNum }"> 
		 <button type="submit" onclick="location.href='${contextPath}/favo/removeFavo.do'" class="btn btn-outline-danger">삭제하기</button>
		</form>
		
		
		</td>
		
		
	</c:forEach>
	</c:when>
	</c:choose>
	</tr>
		
	</tbody>
</table>


<!-- 삭제버튼 -->
<div class="row justify-content-end">
<button type="button" class="btn btn-danger" style="width:100px;" onclick="del();">삭제하기</button>
</div>


<!-- 검색바 
<nav class="navbar navbar-light bg-light">
  <div class="container-fluid">
    <form class="d-flex">
      <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success" type="submit">Search</button>
    </form>
  </div>
</nav>
-->




</div>
</div>
</div>
 
</body>
</html>