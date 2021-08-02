<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="UTF-8">
<head>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js" integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT" crossorigin="anonymous"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
	
	<!-- 전체 레이아웃 -->
		
	<!-- 삭제 경고창 -->
	<script text="text/javascript">
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
		<div class="dark border"><!-- 테두리 안 -->
			<div class="col g-0 bg-light position-relative"> <!-- 간격조절 -->		
				<div class="col md-0 p-md-4"><!-- 간격조절 -->
					<p class="fs-3">새우 일가족 냠냠사건</p>
					<hr>			 				
					
					<figcaption class="figure-caption">!</figcaption>
					<br>
					<p> </p>
					<hr>
									
					<div class="d-grid gap-2 d-md-flex justify-content-md-end">
						<button class="btn btn-danger me-md-2" type="button" onclick="location.href='./writeform1.jsp'">수정</button>
						<button class="btn btn-danger" type="button" onclick="del();">삭제</button>
					</div>
					<br>					
									
					<!-- 덧글 요소입니다 -->
					<div class="card mb-2">
						<div class="card-header bg-light">
							댓글
						</div>
						
					<div class="card-body">
					
						<!-- ============================================================================================================ -->
													
						<table class="table caption-top">
							<tbody>
								<tr>
								<th scope="row">
									<img src="https://dthezntil550i.cloudfront.net/g6/latest/g61907181504345070004054586/1280_960/c159c126-d845-4fde-815f-a3a60bc53796.png" alt="mdo" width="40" height="40" class="rounded-circle">
								</th>
									<td class="fw-bolder">비둘기</td>
									<td>구구 !! 구구구??</td>
									<td>2021.06.11 16:47</td>
									<td><button type="button" class="btn btn-outline-danger">수정</button>&nbsp;<button type="button" class="btn btn-outline-danger">삭제</button></td>
								</tr>
								    
								<tr>
								<th scope="row">
									<img src="https://i.pinimg.com/originals/06/1b/12/061b12ba824633a4364d2b3e67481613.png" alt="mdo" width="40" height="40" class="rounded-circle">
								</th>
									<td class="fw-bolder">닭</td>
									<td>꼬곡고꼮 꼮끼옹~~</td>
									<td>2021.06.11 16:56</td>
									<td><button type="button" class="btn btn-outline-danger">수정</button>&nbsp;<button type="button" class="btn btn-outline-danger">삭제</button></td>
								</tr>
								    
								<tr>
								<th scope="row">
									<img src="https://img1.daumcdn.net/thumb/R800x0/?scode=mtistory2&fname=https%3A%2F%2Ft1.daumcdn.net%2Fcfile%2Ftistory%2F99D0EE3B5D24304836" alt="mdo" width="40" height="40" class="rounded-circle">
								</th>
									<td class="fw-bolder">시간을 못보는 사람</td>
									<td>지금 몇시죠? 시계가 이상해요</td>
									<td>2021.06.11 46:78</td>
									<td><button type="button" class="btn btn-outline-danger">수정</button>&nbsp;<button type="button" class="btn btn-outline-danger">삭제</button></td>
								</tr>	    
							</tbody>
						</table>
																
						<!-- =================================================================================================== -->
										
						<br>
						<p class="fw-bolder">댓글 작성</p>
						<textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
						<br>
						<div class="d-grid gap-2 d-md-flex justify-content-md-end">
							<button class="btn btn-danger me-md-2" type="button">등록</button>
							<!-- 여기서 me-md-2 라는녀석이 띄어쓰기 기능 같습니다 -->
							<button class="btn btn-danger" type="button">삭제</button>
						</div>
					</div>
				</div>
				<!-- 요기까지 덧글 -->		
							
			</div>
		</div>
	</div>	
	<!-- 글쓰기 버튼 -->
	<br>
	<div class="row justify-content-end">
		<button type="button" class="btn btn-danger" style="width:100px;" onclick="location.href='./review1.jsp'">글목록</button>
	</div>							
</div>
<br>
</div>
</div>


</body>
</html>