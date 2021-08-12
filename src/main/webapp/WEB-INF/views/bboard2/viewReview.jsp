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
	function del(obj) {
		if (confirm("삭제 하시겠습니까?"))
			location.href="${contextPath}/bboard2/deleteReview.do?num="+obj;
		
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
							<form method="post" action="${contextPath}/bboard2/updateReview.do" enctype="multipart/form-data">
							
							<input type="hidden" name="num" value="${review.num}"/>
							<p class="fs-3" ><input type=title value="${review.title}" name="title" id="title" style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;"/></p>
							<hr>
							<br>
							
							<textarea rows="20"name="content" class="form-control">${review.content}</textarea>
							
							
							<hr>
							<c:if test="${not empty review.imageFileName &&  review.imageFileName != 'null'}">
								<tr>
									<td width="150" align="center" rowspan="2"></td>
										<td>
											<input type="hidden" name="originalFileName" value="${review.imageFileName}" />
											<img class="img1" src="${contextPath}/downloadreview.do?num=${review.num}&imageFileName=${review.imageFileName}" id="preview" />
										<br>
										</td>
									</tr>
									<tr>
									<td>
										<input type="file" name="imageFileName" id="i_imageFileName" onchange="readURL(this);" />
									</td>
								</tr>
							</c:if>
							<div class="d-grid gap-2 d-md-flex justify-content-md-end">
								
							
									
									<c:if test="${member.id == review.id}">
										<input class="btn btn-outline-danger" type="submit" value="수정하기">
										<button class="btn btn-outline-danger" type="button" onclick="del('${review.num}')">삭제</button>	
									</c:if>
									<c:if test="${ member.id == 'admin' }">
										<button class="btn btn-outline-danger" type="button" onclick="del('${review.num}')">삭제</button>
									</c:if>
								
								
							
							</div>
							</form>
							
							<!-- ----------------------- -->
							
							
							<!-- ----------------------- -->
							
							<br>

					

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