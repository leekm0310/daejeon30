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
 	
 	
    function fn_remove(url,resNum){
 	   var form = document.createElement("form");
 	   form.setAttribute("method", "post");
 	   form.setAttribute("action", url);
 	   var resNumInput = document.createElement("input");
 	   resNumInput.setAttribute("type", "hidden");
 	   resNumInput.setAttribute("name", "resNum");
 	   resNumInput.setAttribute("value", resNum);
 	   
 	   form.appendChild(resNumInput);
 	   document.body.appendChild(form);
 	   form.submit();
    }
    
  </script>
  
 
</head>

<body>

 <!-- 메인코드부 -->
  <article>
 <div class="wrap">
 	<div class="main-content">
	<div class="container" >


<!-- 본문 내용 -->
<div class="row">
	<div class="col-md-8">
		<h3>식당 관리</h3>
	</div>


<!-- 검색바 -->
	<div class="col-md-4">
	<form class="d-flex justify-content-center py-3" action="${contextPath}/admin/searchRes.do" method="post">
	<input type="text" class="form-control" name="word1" id="word1" placeholder="검색어를 입력하세요" style="text-align:center; width:250px;">
		&ensp;<input type="submit" class="btn btn-danger" value="검색">
	</form>
	</div>
</div>
	
	
	<br>
	<table class="table table-hover">
	<thead>
	<tr>
		<th><input type="checkbox" id="checkall" onclick="checkAll();" style="width:20px;height:20px;"/></th>
		<th style="width:100;">등록번호</th>
		<!--  <th>식당분류</th>-->
		<th style="width:100;" >식당사진</th>
		<th style="width:500;">식당명</th>
		<th>옵션</th>
		<th></th>
	</tr>
	</thead>
	<tbody>
	   <c:choose>
   <c:when test="${!empty resList}" >
   <c:forEach  var="res" items="${resList}" >
	<tr>

		<td><input type="checkbox" id="chk" name="chk" style="width:20px;height:20px;"/></td>
		<td>${res.resNum }</td>
	<!--	<td>${res.resSort }</td> -->
		<th><img src="${contextPath}/download.do?resNum=${res.resNum}&resImageFileName=${res.resImageFileName}" width="100" height="100"></th>
		<td><a href="${contextPath}/admin/viewRes.do?resNum=${res.resNum}">${res.resName }</td>
		<!--  <td>${res.resLocation }</td>-->
		<td class="button"><a href="#" onclick="location.href='${contextPath}/admin/viewRes.do?resNum=${res.resNum}'" class="btn btn-outline-success">수정하기</a><br>
	 <a href="#" class="btn btn-outline-danger" onclick="fn_remove('${contextPath}/admin/removeRes.do', ${res.resNum})">삭제하기</a></td>
	</c:forEach>
	</c:when>
	</c:choose>

	</tr>
	</tbody>
</table>

<!-- 삭제하기버튼 -->
<div class="row justify-content-end">
<button type="button" class="btn btn-danger" style="width:100px;" onclick="location.href='${contextPath}/addRes.do'">등록하기</button>
<!-- <button type="button" class="btn btn-danger" style="width:100px;" onclick="location.href='${contextPath}/admin/removeRes.do?resNum=${res.resNum }'">삭제하기</button> -->
</div>


<!-- 페이지네이션 -->
		
	<div class="row">
					<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center">
						<c:if test="${pageMaker.prev }">
							<li class="page-item"><a class="page-link" href='<c:url value="/admin/listRes1.do?page=${pageMaker.startPage-1 }"/>'
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a></li>
						</c:if>
						<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">	
							<li class="page-item"><a class="page-link" href='<c:url value="/admin/listRes1.do?page=${pageNum }"/>'>${pageNum }</a></li>
						</c:forEach>
						<c:if test="${pageMaker.next && pageMaker.endPage >0 }">
							<li class="page-item"><a class="page-link" href='<c:url value="/admin/listRes1.do?page=${pageMaker.endPage+1 }"/>' aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a></li>
						  </c:if>
						</ul>
					</nav>
				</div>




	</div>
		</div>
	</div>

</article>
</body>
</html>