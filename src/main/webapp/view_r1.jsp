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
		.header {
		
		}
		.footer {
		
		}
		
		</style>
	
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
 
	<!-- 헤더입니다 -->
	<%@ include file="header.jsp" %>

	<div class="main-content">

	<div class="container">
		<div class="dark border"><!-- 테두리 안 -->
			<div class="col g-0 bg-light position-relative"> <!-- 간격조절 -->		
				<div class="col md-0 p-md-4"><!-- 간격조절 -->
					<p class="fs-3">새우 일가족 냠냠사건</p>
					<hr>			 				
					<img src="http://image14.hanatour.com/uploads/2019/12/%EC%A0%9C%EC%A3%BC%EB%A1%9C%EC%BB%AC%EB%A7%9B%EC%A7%91_%EB%8B%BB_(2)_88121031.jpg" class="img-thumbnail" width="500px" height="500px">
					<figcaption class="figure-caption">새우를 애껴욧 !</figcaption>
					<br>
					<p> 우리는 한때 바다에서 살았었습니다. 우리는 무엇이였을까요? 저도 잘 모르겠습니다. 하지만 한가지는 알고 있습니다 바로 새우는 맛있다는 사실이지요. 새우란 무엇인가 그렇습니다 새우는 맛있는 녀석. 전생이라는 것이 존재한다면 저는 어쩌면 고래였을지도 모릅니다 새우를 좋아하기 때문이죠 바닷가에 조난당하게 된다면 저는 고래를 만나면 살 수 있을지도 모를 일입니다. 고래와 저는 새우로 통할게 분명했으니까요. 어쩌면 저는 사람으로 변신한 고래가 아닐까요 마녀의 저주를 받아서 기억을 잃어버려서 기억하진 못하는 것일 수도 있지요. 저는 바다를 좋아합니다 그리고 새우도 좋아해요. 이 두가지면 고래라고 하기에 충분합니다. 하지만 제 기름은 별로 좋지 않습니다. 이걸 보면 어쩌면 저는 고래가 아닐 수도 있겠군요. 고래 기름은 비싸니까요. 기름은 피부에 있어서 정말 중요한 역할을 합니다. 세수를 하고 나오면 얼굴이 푸석푸석 해지죠. 지용성 피부가 아니여서 그렇습니다. 이럴때에는 스킨을 바른 뒤에 에센스를 바르는데 저는 말 에센스를 바릅니다 말에게서 나오는 무언가를 활용한 기름입니다. 고래 기름은 바르지 않아요 말 기름을 바릅니다. 그렇습니다 저는 말고래입니다 말은이히힝 하고 우는데 고래는 어떻게 울까요 ? 뿌우우? 말고래인 제가 마지막 말을 남기며 떠납니다 이히힝뿌우우 ~</p>
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

<!-- 푸터입니다 -->
<div class="footer">
	<%@ include file="footer.jsp" %>
</div>
</body>
</html>