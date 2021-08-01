<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="UTF-8">
<head>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js" integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT" crossorigin="anonymous"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
	
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
	    
	<!-- 유효성 검사 -->
	<script type="text/javascript">
		function checklogin(){	
		if(id.value==""){
		alert('아이디를 입력해주세요.');
		form.id.focus();
		return false;
		} else if (passwd.value==""){
		alert('비밀번호를 입력해주세요.');
		form.passwd.focus();
		return false;
		}
		form.submit();
		}
	</script>
</head> 
  
<body>
<!-- 메인코드부 -->
	 <div class="wrap">

		<hr>
	 		<div class="main-content">
			<div class="container">
				<div class="row">
				 <div class="col-sm-2"></div>
	
				 <div class="col-sm-8" align=center>
					<h1 class="h3 mb-3 fw-normal">로그인</h1>
					<br>	
					<div class="form-floating" style="width:500px;">
						<input type="id" class="form-control" id="id" placeholder="abc123" name="id">
						<label for="floatingInput">아이디</label>
					</div>
					<br>
					<div class="form-floating" style="width:500px;">
						<input type="password" class="form-control" name="passwd" id="passwd" placeholder="Password">
						<label for="floatingPassword">비밀번호</label>
					</div>   
					<br>
					<button class="w-30 btn btn-lg btn-danger" style="width:300px;" onclick="checklogin()">로그인</button><p></p>
					<button class="w-30 btn btn-lg btn-danger" style="width:300px;" onclick="#">비회원예약</button>    
					<div class="container" style="margin-bottom:150px">  
						<div class="p-3 bg-white btn btn-link text-dark" onclick="location.href='./find1.jsp'">아이디/비밀번호 찾기</div>    
						<div class="p-3 bg-white btn btn-link text-dark" onclick="location.href='./join1.jsp'">회원 가입</div>
				</div>
			</div>
			<div class="col-sm-2"></div>
		</div>
	</div>
</div>
</div>


</body>
</html>