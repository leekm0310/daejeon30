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

 
 <!-- 데이트피커 자바스크립트 -->
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
 
 <!-- 취소 경고창 -->
 <script type="text/javascript">
	function cancel() {
	if (confirm("취소 하시겠습니까?"))
	   list_ok.submit();
	}
 </script>
 
</head>

<body>
 <!-- 메인코드부 -->
 <div class="wrap">

		<div class="main-content">

	<div class="container">


<!-- 로컬네비게이션 -->
<hr>
  <div class="btn-group">
  	<button class="btn btn-outline-danger" type="button" id="defaultDropdown" onclick="location.href='./mymain1.jsp'"aria-expanded="false">
  	  마이페이지
  	</button>
  </div>
  <div class="btn-group">
 	 <button class="btn btn-outline-danger" type="button" id="dropdownMenuClickableOutside" onclick="location.href='./modify1.jsp'" aria-expanded="false">
 	  회원정보수정
 	 </button>
  </div>
  <div class="btn-group">
 	 <button class="btn btn-outline-danger" type="button" id="dropdownMenuClickableOutside" onclick="location.href='./res1.jsp'" aria-expanded="false">
    	예약내역
  	</button>
  </div>
  <div class="btn-group">
  	<button class="btn btn-outline-danger" type="button" id="dropdownMenuClickableOutside" onclick="location.href='./like1.jsp'" aria-expanded="false">
    	찜한리스트
    </button>
  </div>
  <div class="btn-group">
  	<button class="btn btn-outline-danger" type="button" id="dropdownMenuClickableOutside" onclick="location.href='./myboard1.jsp'" aria-expanded="false">
    	내 게시판
  	</button>
  </div>
<hr>


<!-- 본문 내용 -->
<div class="row">
	<h3>예약 내역</h3>
</div>
<br>
<br>

<!-- 기간별 검색 -->
<div class="row">
	 <div class='col-6 col-md-3'>
    	 <div class="form-group">
			<button type="button" class="btn btn-light">오늘</button>
			<button type="button" class="btn btn-light">1주일</button>
			<button type="button" class="btn btn-light">1개월</button>
         </div>
     </div>
    
<!-- 달력부 -->
 	<div class='col-6 col-md-4'>
        <div class="form-group">
           <div class="input-group date" id="datetimepicker7" data-target-input="nearest">
                <input type="text" class="form-control datetimepicker-input" data-target="#datetimepicker7"/>
                <div class="input-group-append" data-target="#datetimepicker7" data-toggle="datetimepicker">
                    <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                </div>
            </div>
        </div>
    </div>
    <div class='col-6 col-md-4'>
        <div class="form-group">
           <div class="input-group date" id="datetimepicker8" data-target-input="nearest">
                <input type="text" class="form-control datetimepicker-input" data-target="#datetimepicker8"/>
                <div class="input-group-append" data-target="#datetimepicker8" data-toggle="datetimepicker">
                    <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                </div>
            </div>
        </div>
    </div>
    <div class='col-6 col-md-1'>
        <div class="form-group">
        <button type="button" class="btn btn-light"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
  	<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
	</svg></button>
        </div>
     </div>
</div>


<!-- 
 <table align="center" border="1" >
      <tr align="center" bgcolor="lightgreen">
         <td width="7%" ><b>111</b></td>
         <td width="7%" ><b>222</b></td>
         
   </tr>
 
<c:choose>
    <c:when test="${empty rsvlist}" >
      <tr>
        <td colspan=5>
          <b>내용이 없습니다.</b>
       </td>  
      </tr>
   </c:when>  
   <c:when test="${!empty rsvlist}" >
      <c:forEach  var="r" items="${rsvlist}" >
        <tr align="center">
          <td>${r.resName }</td>
          <td></td>    
       </tr>
     </c:forEach>
</c:when>
</c:choose>
</table>
-->




<!-- 테이블 -->
<br>

	<table class="table table-hover">
	<thead>
	<tr>
		<th>예약번호</th>
		<th>날짜</th>
		<!--  <th>이미지</th>-->
		<th>식당명</th>
		<th>인원</th>
		<th>처리상태</th>
		<th>선택</th>
	</tr>
	</thead>
	<tbody>
	<c:choose>
	<c:when test="${!empty rsvlist}" >
	 <c:forEach  var="r" items="${rsvlist}" >
	<tr>
		<td>${r.rsvNum }</td>
		<td>${r.rsvDate}<br>${r.rsvTime}</td>
		<!--  <td class="thumb"><a href="#">
		<img src="#" width="100" height="100"></a></td>-->
		<td>${r.resName }</td>
		<td>${r.guestNum}</td>
		<td>${r.status }</td>
		
		
		<c:if test="${r.status == '예약요청중' }">
		<td width="200"><button onclick="location.href='${contextPath}/rsv/cancelRsv.do?rsvNum=${r.rsvNum}'" class="btn btn-outline-danger btn-sm">취소하기</button></td>
		</c:if>
	
		<c:if test="${r.status == '예약완료' }">
		<td width="200"><button onclick="location.href='${contextPath}/rsv/selectOne.do?rsvNum=${r.rsvNum}'" class="btn btn-outline-success btn-sm">변경하기</button>
		<button onclick="location.href='${contextPath}/rsv/cancelRsv.do?rsvNum=${r.rsvNum}'" class="btn btn-outline-danger btn-sm">취소하기</button></td>
		</c:if>
		<c:if test="${r.status == '취소완료' }">
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