<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  
<title>내 게시물 관리</title>

 <!-- 전체 레이아웃 -->
	<style type="text/css">

		.html, .body {
		
			margin: 0;
		
			padding: 0;
		
			height: 100%;
		}	
		
		.wrap {
		min-height: 100%;
		position: relative;
		
		}
		.main-content {
		
			min-height: 100%;

		}	
		.container {
		
			padding:0 0 2% 0;	
		} 
		.footer{
		position:fixed;
		bottom: 0;
		width:100%;
		}
		</style>
  	
 
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
	<!-- 헤더입니다 -->
	<%@ include file="header.jsp" %>
 	<div class="main-content">
	<div class="container" >

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

<br>
<br>
<!-- 본문 내용 -->
<h3>내 게시물 관리</h3>
<br>
	<table class="table table-hover">
	<thead>
	<tr>
		<th><input type="checkbox" id="checkall" onclick="checkAll();" style="width:20px;height:20px;"/></th>
		<th>번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>날짜</th>
		<th></th>
	</tr>
	</thead>
	<tbody>
	<tr>
		<td><input type="checkbox" id="chk" name="chk" style="width:20px;height:20px;"/></td>
		<td>1</td>
		<td>테스트입니다</td>
		<td>테스트</td>
		<td>2021.06.07</td>
		<td class="button"><a href="#" onclick="location.href='./writeform1.jsp'" class="btnBasic">수정하기</a><br>
		<a href="#" onclick="del();" class="btnBasic">삭제하기</a></td>
	</tr>
		<tr>
		<td><input type="checkbox" id="chk" name="chk" style="width:20px;height:20px;"/></td>
		<td>2</td>
		<td>테스트입니다2</td>
		<td>테스트</td>
		<td>2021.06.07</td>
		<td class="button"><a href="#" onclick="location.href='./writeform1.jsp'" class="btnBasic">수정하기</a><br>
		<a href="#" onclick="del();" class="btnBasic">삭제하기</a></td>
	</tr>
		<tr>
		<td><input type="checkbox" id="chk" name="chk" style="width:20px;height:20px;"/></td>
		<td>3</td>
		<td>테스트입니다3</td>
		<td>테스트</td>
		<td>2021.06.07</td>
		<td class="button"><a href="#" onclick="location.href='./writeform1.jsp'" class="btnBasic">수정하기</a><br>
		<a href="#" onclick="del();" class="btnBasic">삭제하기</a></td>
	</tr>
	</tbody>
</table>

<!-- 삭제하기버튼 -->
<div class="row justify-content-end">
<button type="button" class="btn btn-danger" style="width:100px;" onclick="del();">삭제하기</button>
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
<!-- 푸터입니다 -->
<div class="footer">
 <%@ include file="footer.jsp" %>
</div>

</body>
</html>