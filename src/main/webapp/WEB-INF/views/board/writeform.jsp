<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="UTF-8">
<head>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
	integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js"
	integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
	crossorigin="anonymous"></script>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
request.setCharacterEncoding("UTF-8");
%>
<%@ page import="java.sql.Timestamp"%>
<%@ page import="java.text.SimpleDateFormat" %>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#preview').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}

	function backToList(obj) {
		obj.action = "${contextPath}/board2.do";
		obj.submit();
	}

	var cnt = 1;
	function fn_addFile() {
		$("#d_file").append("<br>" + "<input type='file' name='file" + cnt +"'/>");
		cnt++
	}
	

</script>

</head>

<body>
	<form name="writeform" method="post"
		action="${contextPath}/board/addNewBoard.do"
		enctype="multipart/form-data">
		<!-- 메인코드부 -->
		<div class="wrap">


			<hr>
			<div class="main-content">
				<div class="container">
					<h2>글쓰기</h2>
					<hr>
					<br> <br>

					<!-- 게시판 등록 -->
					<div class="row">
						<div class="col-sm-2"></div>

						<div class="col-sm-8">

							<!-- select box -->

							<div class="col g-0 bg-light position-relative">
								<div class="input-group">
								</div>
								<br>

								<!-- 제목 입력  -->
								<input class="form-control" type="text"
									placeholder="제목을 입력해주세요." aria-label="default input example" name="rb_title">

								<!-- 글 작성 -->

								<label for="exampleFormControlInput1" class="form-label"></label>
								<textarea class="form-control" id="exampleFormControlTextarea1"
									rows="15" placeholder="내용을 입력해주세요." name=rb_content></textarea>
								<!--  파일 업로드  -->

								<label for="formFile" class="form-label"></label> 
								<input class="form-control" type="file" id="formFile" onClick="fn_addFile()"> 
								<p>이미지파일 첨부:</p>
								<input type="file" name="imageFileName" onchange="readURL(this);" />
								<img id="preview" src="#" width=200 height=200 />
								<input type="button" value="파일추가" onClick="fn_addFile()" />
							</div>
							 <div class="row justify-content-end" >
							<input class="btn btn-danger" type="submit"  style="width:100;" value="글쓰기" />
							<input class="btn btn-danger" style="width:100;" value="목록보기" onClick="backToList(this.form)" />
						</div> 
						</div>
						
					</div>
					
					
					<div class="col-sm-2"></div>
					<br>

				</div>
			</div>
		</div>
	</form>
</body>
</html>