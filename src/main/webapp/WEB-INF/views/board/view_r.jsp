<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<%
	request.setCharacterEncoding("UTF-8");
%>
<!doctype html>
<html lang="UTF-8">
<head>


<!-- 삭제 경고창 -->
<script text="text/javascript">
	function del() {
		if (confirm("삭제 하시겠습니까?"))
			list_ok.submit();
	}
	
	function backToList(obj){
		obj.action="${contextPath}/board2.do";
		obj.submit();
	}
	
	function fn_enable(obj){
		document.getElementById("i_title").disabled=false;
		document.getElementById("i_content").disabled=false;
		document.getElementById("i_imageFileName").disabled=false;
		document.getElementById("tr_btn_modify").style.display="block";
		document.getElementById("tr_btn").style.display="none";
	}
	
	//수정
	function fn_modify_board(obj){
		obj.action="${contextPath}/modBoard.do";
		obj.submit();
	}
	
	//삭제
	function fn_remove_board(url,boardNO){
		var form = document.createElement("form");
		form.setAttribute("method","post");
		form.setAttribute("action",url);
		var boardNOInput = document.createElement("input");
		boardNOInput.setAttribute("type","hidden");
		boardNOInput.setAttribute("name","boardNO");
		boardNOInput.setAttribute("value",boardNO);
		
		form.appendChild(boardNOInput);
		document.body.appendChild(form);
		form.submit();
	}
	
	
	
	function readURL(input){
		if(input.files && input.files[0]){
			var reader = new FileReader();
			reader.onload = function(e){
				$('#preview').attr('src',e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}	
	}
</script>
<style>
	.img1{
	width:auto;
	height:auto;
	max-width: 500px;
	max-height: 500px;
	}
</style>

</head>

<body>

	<!-- 메인코드부 -->
	<div class="wrap">



		<div class="main-content">

			<div class="container">
				<div class="dark border">
					<!-- 테두리 안 -->
					<div class="col g-0 position-relative">
						<!-- 간격조절 -->
						<div class="col md-0 p-md-4">
							<!-- 간격조절 -->
							<form name="frmBoard" method="post" action="${contextPath}" enctype="multipart/form-data">
							
							<input type="hidden" name="boardNO" value="${board.rb_num}"/>
							<p class="fs-3" ><input type=text value="${board.rb_title}" name="rb_title" id="i_title" disabled/></p>
							<hr>
							
							
							<br>
							<p/>
							<p><textarea class="form-control" rows="20" cols="120" name="rb_content" id="i_content" disabled >${board.rb_content}</textarea></p>
							
							<p/>
							<hr>
							<c:if test="${not empty board.imageFileName && board.imageFileName != 'null'}">
								<tr>
									<td width="150" align="center" rowspan="2"></td>
										<td>
											<input type="hidden" name="originalFileName" value="${board.imageFileName}" />
											<img class="img1" src="${contextPath}/downloadBoard.do?boardNO=${board.rb_num}&imageFileName=${board.imageFileName}" id="preview" />
										<br>
										</td>
									</tr>
									<tr>
									<td>
										<input type="file" name="imageFileName" id="i_imageFileName" disabled onchange="readURL(this);" />
									</td>
								</tr>
							</c:if>
							<div class="d-grid gap-2 d-md-flex justify-content-md-end">
								
								<tr id="tr_btn">
									<td colspan="2" align="center">
									<c:if test="${member.id == board.id}">
										<input type=button value="수정하기" onClick="fn_enable(this.form)">
										<button class="btn btn-danger" type="button" onclick="fn_remove_board('${contextPath}/board/removeBoard.do',${board.rb_num})">삭제</button>
										<tr id="tr_btn_modify">
											<td colspan="2" align="center">
												<input type="button" value="수정반영하기" onClick="fn_modify_board(frmBoard)">
											</td>
										</tr>
									</c:if>
									</td>
								</tr>
							</div>
							</form>
							
							<!-- ----------------------- -->
							
							
							<!-- ----------------------- -->
							
							<br>

							<!-- 덧글 요소입니다 -->
							<div class="card mb-2">
								<div class="card-header bg-light">댓글</div>

								<div class="card-body">

									<!-- ============================================================================================================ -->

									<table class="table caption-top">
										<tbody>
											<tr>
												<th scope="row"><img
													src="https://dthezntil550i.cloudfront.net/g6/latest/g61907181504345070004054586/1280_960/c159c126-d845-4fde-815f-a3a60bc53796.png"
													alt="mdo" width="40" height="40" class="rounded-circle">
												</th>
												<td class="fw-bolder">비둘기</td>
												<td>구구 !! 구구구??</td>
												<td>2021.06.11 16:47</td>
												<td><button type="button"
														class="btn btn-outline-danger">수정</button>&nbsp;
													<button type="button" class="btn btn-outline-danger">삭제</button></td>
											</tr>

											<tr>
												<th scope="row"><img
													src="https://i.pinimg.com/originals/06/1b/12/061b12ba824633a4364d2b3e67481613.png"
													alt="mdo" width="40" height="40" class="rounded-circle">
												</th>
												<td class="fw-bolder">닭</td>
												<td>꼬곡고꼮 꼮끼옹~~</td>
												<td>2021.06.11 16:56</td>
												<td><button type="button"
														class="btn btn-outline-danger">수정</button>&nbsp;
													<button type="button" class="btn btn-outline-danger">삭제</button></td>
											</tr>

											<tr>
												<th scope="row"><img
													src="https://img1.daumcdn.net/thumb/R800x0/?scode=mtistory2&fname=https%3A%2F%2Ft1.daumcdn.net%2Fcfile%2Ftistory%2F99D0EE3B5D24304836"
													alt="mdo" width="40" height="40" class="rounded-circle">
												</th>
												<td class="fw-bolder">시간을 못보는 사람</td>
												<td>지금 몇시죠? 시계가 이상해요</td>
												<td>2021.06.11 46:78</td>
												<td><button type="button"
														class="btn btn-outline-danger">수정</button>&nbsp;
													<button type="button" class="btn btn-outline-danger">삭제</button></td>
											</tr>
										</tbody>
									</table>

									<!-- =================================================================================================== -->

									<br>
									<p class="fw-bolder">댓글 작성</p>
									<textarea class="form-control" id="exampleFormControlTextarea1"
										rows="3"></textarea>
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
					<button type="button" class="btn btn-danger" style="width: 100px;"
						onclick="location.href='./review1.jsp'">글목록</button>
				</div>
			</div>
			<br>
		</div>
	</div>


</body>
</html>