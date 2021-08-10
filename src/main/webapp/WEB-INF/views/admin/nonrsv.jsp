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
 	<link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.css" />
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script> 
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/js/tempusdominus-bootstrap-4.min.js"></script>

	
<title>예약 내역</title>

 
 <!-- 데이트피커 자바스크립트-->
 <script type="text/javascript">
    $(function () {
        $('#datetimepicker7').datetimepicker({format: 'L'});
        $('#datetimepicker8').datetimepicker({
            format: 'L',
        	useCurrent: false
        });
        $("#datetimepicker7").on("change.datetimepicker", function (e) {
            $('#datetimepicker8').datetimepicker('minDate', e.date);
        });
        $("#datetimepicker8").on("change.datetimepicker", function (e) {
            $('#datetimepicker7').datetimepicker('maxDate', e.date);
        });
    });
    </script> 
    
    
<script type="text/javascript">
	function cancel(value) {
		location.href='${contextPath}/admin/cancelnonres.do?rsvNum='+value;
	}
	
	function accept(value) {
		location.href='${contextPath}/admin/acceptnonres.do?rsvNum='+value;
		}
	
    function listStatus(value){
    	$.ajax({
    		type:"post",
    		contentType:"application/json",
    		url:"${contextPath}/admin/nonStatus.do?status="+value,
    		success: function(result){
    			console.log(result);
    			var output="<tr>";
			 	for(var i in result){
			 		if(result[i].status=='예약요청중'){
			 		output += "<tr><td>"+result[i].rsvNum+"</td>";
			 		output +="<td>"+result[i].rsvDate+"<br>"+result[i].rsvTime+"</td>"
			 		output +="<td>"+result[i].name+"</td>"
			 		output +="<td>"+result[i].resName+"</td>"
			 		output +="<td>"+result[i].guestNum+"</td>"
			 		output +="<td>"+result[i].status+"</td>"
			 		output +="<td width='200'>"
			 		output +="<button class='btn btn-outline-success' value='"+result[i].rsvNum+"' onclick='accept(this.value)'>예약요청수락</button></td>";
			 		} else if(result[i].status=='예약완료'){
			 			output += "<tr><td>"+result[i].rsvNum+"</td>";
					 	output +="<td>"+result[i].rsvDate+"<br>"+result[i].rsvTime+"</td>"
					 	output +="<td>"+result[i].name+"</td>"
				 		output +="<td>"+result[i].resName+"</td>"
				 		output +="<td>"+result[i].guestNum+"</td>"
				 		output +="<td>"+result[i].status+"</td>"
			 		} else if (result[i].status=='취소요청중'){
			 			output += "<tr><td>"+result[i].rsvNum+"</td>";
					 	output +="<td>"+result[i].rsvDate+"<br>"+result[i].rsvTime+"</td>"
					 	output +="<td>"+result[i].name+"</td>"
				 		output +="<td>"+result[i].resName+"</td>"
				 		output +="<td>"+result[i].guestNum+"</td>"
				 		output +="<td>"+result[i].status+"</td>"
				 		output +="<td width='200'><button class='btn btn-outline-danger' value='"+result[i].rsvNum+"' onclick='cancel(this.value)'>취소요청수락</button></td>"
			 		} else if(result[i].status=='취소완료'){
			 			output += "<tr><td>"+result[i].rsvNum+"</td>";
					 	output +="<td>"+result[i].rsvDate+"<br>"+result[i].rsvTime+"</td>"
					 	output +="<td>"+result[i].name+"</td>"
				 		output +="<td>"+result[i].resName+"</td>"
				 		output +="<td>"+result[i].guestNum+"</td>"
				 		output +="<td>"+result[i].status+"</td>"
			 		}

			 				
			 	}
			 	output+="</tr>";
			 	$("#list").html(output);
    	
    		}
    	});
    }
	
</script>
</head>
<body>
 <div class="wrap">

		<div class="main-content">

	<div class="container">


<!-- 본문 내용 -->
<div class="row">
	<h3>예약 내역</h3>
</div>
<div class="btn-group" role="group" aria-label="Basic outlined example">
  <button type="button" class="btn btn-outline-primary" onclick="location.href='${contextPath}/admin/allRsv.do'">회원예약건</button>
  <button type="button" class="btn btn-outline-dark" onclick="location.href='${contextPath}/admin/nonRsv.do'">비회원예약건</button>
</div>
<br><br>
<!-- 기간별 검색 -->
<div class="row">
	 <div class='col-8 col-md-6'>
    	 <div class="form-group">
			<button type="button" class="btn btn-light" value="예약요청중" onclick="listStatus(this.value)">(비)예약요청건</button>
			<button type="button" class="btn btn-light" value="취소요청중" onclick="listStatus(this.value)">(비)취소요청건</button>
			<button type="button" class="btn btn-light" value="예약완료" onclick="listStatus(this.value)">(비)예약완료건</button>
			<button type="button" class="btn btn-light" value="취소완료" onclick="listStatus(this.value)">(비)취소완료건</button>
         </div>
     </div>
    
<!-- 달력부 -->
 	<div class='col-8 col-md-2'>
        <div class="form-group">
           <div class="input-group date" id="datetimepicker7" data-target-input="nearest">
                <input type="text" class="form-control datetimepicker-input" data-target="#datetimepicker7"/>
                <div class="input-group-append" data-target="#datetimepicker7" data-toggle="datetimepicker">
                    <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                </div>
            </div>
        </div>
    </div>
    <div class='col-8 col-md-2'>
        <div class="form-group">
           <div class="input-group date" id="datetimepicker8" data-target-input="nearest">
                <input type="text" class="form-control datetimepicker-input" data-target="#datetimepicker8"/>
                <div class="input-group-append" data-target="#datetimepicker8" data-toggle="datetimepicker">
                    <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                </div>
            </div>
        </div>
    </div>
    <div class='col-8 col-md-2'>
        <div class="form-group">
        <button type="button" class="btn btn-light"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
  	<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
	</svg></button>
        </div>
     </div>
</div>



<!-- 테이블 -->
<br>

	<table class="table table-hover">
	<thead>
	<tr>
		<th>예약번호</th>
		<th>날짜</th>
		<th>식당명</th>
		<th>이름</th>
		<th>인원</th>
		<th>처리상태</th>
		<th>선택</th>
	</tr>
	</thead>
	<tbody id ="list">
	<c:choose>
	<c:when test="${!empty rsv1}" >
	<c:forEach  var="r" items="${rsv1}" >
	<tr>
		<td>${r.rsvNum }</td>
		<td>${r.rsvDate}<br>${r.rsvTime}</td>
		<td>${r.name }
		<td>${r.resName }</td>
		<td>${r.guestNum}</td>
		<td>${r.status }</td>
		
		
		
		<c:if test="${r.status == '예약요청중' }">
		<td width="200"><button onclick="location.href='${contextPath}/admin/acceptnonres.do?rsvNum=${r.rsvNum}'" class="btn btn-outline-success">예약요청수락</button><td>
		</c:if>
		<c:if test="${r.status == '취소요청중' }">
		<td width="200"><button onclick="location.href='${contextPath}/admin/cancelnonres.do?rsvNum=${r.rsvNum}'" class="btn btn-outline-danger">취소요청수락</button></td>
		</c:if>
	
	</tr>  
	</c:forEach>
	</c:when>
	</c:choose>
	</tbody>
	</table>
  

<!-- 아래 취소하기 버튼
<div class="row justify-content-end">
<button type="button" class="btn btn-light" style="width:100px" onclick="cancel();">취소하기</button>
</div>
 -->

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