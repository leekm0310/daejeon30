<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
	request.setCharacterEncoding("utf-8");
%>
<!doctype html>
<html lang="UTF-8">
<head>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
   function readURL(input) {
      if (input.files && input.files[0]) {
	      var reader = new FileReader();
	      reader.onload = function (e) {
	        $('#preview').attr('src', e.target.result);
          }
         reader.readAsDataURL(input.files[0]);
      }
  }  
   
   </script>

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
	<form action="${contextPath}/bboard2/addreview.do" method="post" enctype="multipart/form-data" >
	 <div class="col-sm-8">
	
		<!-- select box -->

			<div class="col g-0 bg-light position-relative">	
		
			
		<br>
		
		<!-- 제목 입력  -->
		
			<input class="form-control" name="id" id ="id" type="hidden" value="${member.id }">
			<input class="form-control" name="title" type="text" placeholder="제목을 입력해주세요.">
		
		<!-- 글 작성 -->
		
		  <label for="exampleFormControlInput1" class="form-label"></label>
		  <textarea class="form-control" id="exampleFormControlTextarea1" name="content" rows="15" placeholder="내용을 입력해주세요."></textarea>
		<!--  파일 업로드  -->
		
		  <label for="formFile" class="form-label"></label>
		  <input class="form-control" type="file" name="imageFileName" onchange="readURL(this);">
				</div>
                <input type="submit" value="등록하기">
					</div>
		</form>		 
						</div>
                      
					<div class="col-sm-2"></div>
				<br>
                

		</div>
	</div>
</div>

</body>
</html>