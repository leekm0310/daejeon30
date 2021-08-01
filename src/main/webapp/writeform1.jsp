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
		padding-bottom: 19px; /* footer height */
		}
		
		.main-content {
		
			min-height: 100%;

		}	
		.container {
		
			padding:0 0 2% 0;	
		} 

</style>
</head>

<body>
 <!-- 메인코드부 -->
	 <div class="wrap">

		<hr>
	 		<div class="main-content">
				<div class="container">
			<h2>글쓰기</h2>
			<hr>
		<br>
	<br>
	
	<!-- 게시판 등록 -->
	<div class="row">
		 <div class="col-sm-2"></div>
	
	 <div class="col-sm-8">
	
		<!-- select box -->

			<div class="col g-0 bg-light position-relative">
			<div class="input-group">
			  <select class="form-select" id="inputGroupSelect04" aria-label="Example select with button addon">
			    <option selected>게시판을 선택해주세요.</option>
			    <option value="1">자유게시판</option>
			    <option value="2">후기공유</option>
			    <option value="3">추천게시판</option>
			  </select>
			  <button class="btn btn-danger" type="button">등록하기</button>
			</div>
		<br>
		
		<!-- 제목 입력  -->
			<input class="form-control" type="text" placeholder="제목을 입력해주세요." aria-label="default input example">
		
		<!-- 글 작성 -->
		
		  <label for="exampleFormControlInput1" class="form-label"></label>
		  <textarea class="form-control" id="exampleFormControlTextarea1" rows="15" placeholder="내용을 입력해주세요."></textarea>
		<!--  파일 업로드  -->
		
		  <label for="formFile" class="form-label"></label>
		  <input class="form-control" type="file" id="formFile">
				</div>
					</div>
					
						</div>
					<div class="col-sm-2"></div>
				<br>

		</div>
	</div>
</div>

</body>
</html>