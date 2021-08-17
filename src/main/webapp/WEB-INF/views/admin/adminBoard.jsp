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
  
  <script type="text/javascript">
 
	  

  function addZero(data){
      return (data<10) ? "0"+data : data;
  }
  function getTimestampToDate(timestamp){
      var date = new Date(timestamp);
      var chgTimestamp = date.getFullYear().toString()+"-"
          +addZero(date.getMonth()+1)+"-"
          +addZero(date.getDate().toString());
      return chgTimestamp;
  }
  
  function deleteQna(value) {
		$.ajax({
			type: "post",
			url: "${contextPath}/admin/deleteQna.do?num="+value,
			dataType: "text",
			success:function(result){
				allqna();
			}
		});
	}
  
  function deleteNotice(value) {
		$.ajax({
			type: "post",
			url: "${contextPath}/admin/deleteNotice.do?num="+value,
			dataType: "text",
			success:function(result){
				location.href="${contextPath}/admin/noticeBoard.do";
			}
		});
	}
  
  function deleteRec(value) {
		$.ajax({
			type: "post",
			url: "${contextPath}/board/removeBoard.do?boardNO="+value,
			dataType: "text",
			success:function(result){
				allrec();
			}
		});
	}

  function deleteReview(value) {
		$.ajax({
			type: "post",
			url: "${contextPath}/bboard2/deleteReview.do?num="+value,
			dataType: "text",
			success:function(result){
				allreview();
			}
		});
	}
  
  function readqna(value){
	  location.href="${contextPath}/admin/viewQna.do?num="+value;
  }
  
  	function allreview(){
  		$.ajax({
  			type:"post",
    		contentType:"application/json",
    		url:"${contextPath}/admin/reviewBoard.do",
    		success: function(result){
    			console.log(result);
    			var output="<tr>";
			 	for(var i in result){
			 		output += "<tr><td>"+result[i].num+"</td>";
			 		output +="<td>"+result[i].title+"</td>"
			 		output +="<td>"+result[i].date+"</td>"
			 		output +="<td>"+result[i].id+"</td>"
			 		output +="<td width='200'>"
			 		output +="<button class='btn btn-outline-success btn-sm' value='"+result[i].num+"' onclick='accept(this.value)'>수정</button> "
				 	output +="<button class='btn btn-outline-secondary btn-sm' value='"+result[i].num+"' onclick='deleteReview(this.value)'>삭제</button></td>";
			 	}
			 	output+="</tr>";
			 	$("#list").html(output);
    		}
  		});
  	}
  
  	function allrec(){
  		$.ajax({
  			type:"post",
    		contentType:"application/json",
    		url:"${contextPath}/admin/recBoard.do",
    		success: function(result){
    			console.log(result);
    			var output="<tr>";
			 	for(var i in result){
			 		var timestamp = result[i].rb_date;
			 		
			 		output += "<tr><td>"+result[i].rb_num+"</td>";
			 		output +="<td>"+result[i].rb_title+"</td>"
			 		output +="<td>"+getTimestampToDate(timestamp)+"</td>"
			 		output +="<td>"+result[i].id+"</td>"
			 		output +="<td width='200'>"
			 		output +="<button class='btn btn-outline-success btn-sm' value='"+result[i].rb_num+"' onclick='accept(this.value)'>수정</button> "
				 	output +="<button class='btn btn-outline-secondary btn-sm' value='"+result[i].rb_num+"' onclick='deleteRec(this.value)'>삭제</button></td>";
			 	}
			 	output+="</tr>";
			 	$("#list").html(output);
    		}
  		});
  	}
  	
  	function allqna(){
  		$.ajax({
  			type:"post",
    		contentType:"application/json",
    		url:"${contextPath}/admin/qnaBoard.do",
    		success: function(result){
    			console.log(result);
    			var output="<tr>";
			 	for(var i in result){
			 		output += "<tr><td>"+result[i].num+"</td>";
			 		output +="<td>"+result[i].title+"</td>"
			 		output +="<td>"+result[i].date+"</td>"
			 		output +="<td>"+result[i].name+"</td>"
			 		output +="<td width='200'>"
			 		output +="<button class='btn btn-outline-success btn-sm' value='"+result[i].num+"' onclick='readqna(this.value)'>수정</button> "
			 		output +="<button class='btn btn-outline-secondary btn-sm' value='"+result[i].num+"' onclick='deleteQna(this.value)'>삭제</button></td>";
			 	
			 	}
			 	output+="</tr>";
			 	$("#list").html(output);
    		}
  		});
  	}
 
  </script>

</head>

<body>
<article>
 <!-- 메인코드부 -->
 <div class="wrap">
 	<div class="main-content">
	<div class="container" >

<!-- 본문 내용 -->
<h3>게시판 관리</h3>
<br>
<div class="btn-group" role="group" aria-label="Basic outlined example">
  <!--  <button type="button" class="btn btn-outline-primary" onclick="location.href='${contextPath}/admin/reviewBoard.do'">리뷰게시판</button>-->
  <button type="button" class="btn btn-outline-primary" onclick="allreview()">리뷰게시판</button>
  <button type="button" class="btn btn-outline-dark" onclick="allrec()">추천게시판</button>
  <button type="button" class="btn btn-outline-dark" onclick="allqna()">문의게시판</button>
  <button type="button" class="btn btn-outline-dark" onclick="location.href='${contextPath}/admin/noticeBoard.do'">공지사항</button>
</div>
 <button type="button" class="btn btn-danger btn-sm" onclick="location.href='${contextPath}/admin/writeform.do'">관리자글쓰기</button>

<br><br>

	<table class="table table-hover">
	<thead>
	<tr>
		<!-- <th><input type="checkbox" id="checkall" onclick="checkAll();" style="width:20px;height:20px;"/></th> -->
		<th>번호</th>
		<th>제목</th>
		<th>일시</th>
		<th>작성자</th>
		<th>비고</th>
		<th></th>
	</tr>
	</thead>
	<tbody id="list">
	   <c:choose>
   <c:when test="${!empty result }" >
   <c:forEach  var="result" items="${result }" >
	<tr>

		<!--  <td><input type="checkbox" id="chk" name="chk" style="width:20px;height:20px;"/></td>-->
		<td>공지</td>
		<td>${result.title}</td>
		<td><fmt:formatDate pattern="yyyy-MM-dd" value="${result.date }" /></td>
		<td>${result.id }</td>
		<td width="200"><button class="btn btn-outline-success btn-sm" onclick="location.href='${contextPath}/admin/oneNo.do?num=${result.num }'">수정</button>
		<button class="btn btn-outline-secondary btn-sm" value="${result.num }" onclick="deleteNotice(this.value)">삭제</button></td>
	</c:forEach>
	</c:when>
	</c:choose>

	</tr>
	</tbody>
</table>

<!-- 삭제하기버튼 -->
<div class="row justify-content-end">

<button type="button" class="btn btn-danger" style="width:100px;" onclick="location.href='${contextPath}/admin/removeRes.do?resNum=${res.resNum }'">삭제하기</button>
</div>

<!-- 페이지번호 
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
</div>-->
	</div>
		</div>
	</div>

</article>
</body>
</html>