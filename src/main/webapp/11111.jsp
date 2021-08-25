<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8" isELIgnored="false" %>
<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">

	<title>예약/결제 페이지 TESTTEST</title>
<style>
	.container{
 	width: 1050px;
 	height: 100%;
 	margin-top:50px
 	

 	}
</style>
</head>
  <body>
<div class="container">
<br>
<br><p .align-center { text-align: center; }>

<table width=800 align=center border=1> 
<tr>
	<h1>예약 페이지</h1>
	<br>
	<div class="shadow p-3 mb-5 bg-body rounded">
	<br>
아이디
<div class="input-group mb-3">
  <input type="text" class="form-control" placeholder="아이디를 입력해주세요." aria-label="Recipient's username" aria-describedby="button-addon2">
</div>
이름
<div class="input-group mb-3">
  <input type="text" class="form-control" placeholder="이름을 입력해주세요." aria-label="Recipient's username" aria-describedby="button-addon2">
</div>
휴대전화
<div class="input-group mb-3">
  <input type="text" class="form-control" placeholder="연락처를 입력해주세요." aria-label="Recipient's username" aria-describedby="button-addon2">
</div>
추가사항
<div class="input-group mb-3">
  <input type="text" class="form-control" placeholder="추가 전달사항을 입력해주세요." aria-label="Recipient's username" aria-describedby="button-addon2">
</div>
</tr>
<tr>
<br>
</tr>
</table>
<table width=800 align=center border=1> 
<tr>
	<h1>예약내역 요약</h1>
	
<div class="shadow p-3 mb-5 bg-body rounded">
장소명
<div class="input-group mb-3">
  <input type="text" class="form-control" placeholder="장소명-data" aria-label="Recipient's username" aria-describedby="button-addon2">
</div>
예약일
<div class="input-group mb-3">
<%=request.getParameter("date") %>

</div>
시간
<div class="input-group mb-3">
 <select name="time">
 <option value="오후 12:00">오후 12:00</option>
 <option value="오후 12:30">오후 12:30</option>
 <option value="오후 13:00">오후 13:00</option>
 <option value="오후 13:30">오후 13:30</option>
 <option value="오후 14:00">오후 14:00</option>
 <option value="오후 17:00">오후 17:00</option>
 <option value="오후 17:30">오후 17:30</option>
 <option value="오후 18:00">오후 18:00</option>
 <option value="오후 18:30">오후 18:30</option>
 <option value="오후 19:00">오후 19:00</option>
 <option value="오후 19:30">오후 19:30</option>
 <option value="오후 20:00">오후 20:00</option>
 </select>
</div>
인원
<div class="input-group mb-3">
 <select name="people">
 <option value="2">2</option>
 <option value="3">3</option>
 <option value="4">4</option>
 </select>
</div>
</div>
</tr>
</table>


<button type="button" class="btn btn-danger">확인/결제</button>

</div>
</body>
</html>