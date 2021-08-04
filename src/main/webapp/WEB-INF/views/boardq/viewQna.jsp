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
	
	<!-- 전체 레이아웃 -->
		
	<!-- 삭제 경고창 -->
	<script text="text/javascript">
		function del() {
		if (confirm("삭제 하시겠습니까?"))
		form.submit();
		}
	</script>

</head>

<body>
 <!-- 메인코드부 -->
 <div class="wrap">


	<div class="main-content">

	<div class="container">
		<div class="dark border"><!-- 테두리 안 -->
			<div class="col g-0 position-relative"> <!-- 간격조절 -->		
				<div class="col md-0 p-md-4"><!-- 간격조절 -->
				<form action="${contextPath}/boardq/updateQna.do?num=${bVO.num }" method="post">
					<div class="mb-3">
					<p class="fs-3">
					<input name = title value="${bVO.title}" style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;">
					</p>
					작성일: ${bVO.date}
					</div>
					<hr>
					문의종류: ${bVO.sort}
					작성자: ${bVO.name}
						
					<hr>	 				
					
					<div class="mb-3">
  					<textarea class="form-control" name="content" rows="20">${bVO.content }</textarea>
					</div>
					<br>
					<p> </p>
					<hr>
									
					<div class="d-grid gap-2 d-md-flex justify-content-md-end">
						
						<input class="btn btn-danger me-md-2" type="submit" value="수정"></button>
						<button class="btn btn-danger" type="button" onclick="location.href='${contextPath}/boardq/deleteQna.do?num=${bVO.num }'">삭제</button>
					
				</form>
					</div>
					<br>					
									
				
							
			</div>
		</div>
	</div>	
	<!-- 글쓰기 버튼 -->
	<br>
	<div class="row justify-content-end">
		<button type="button" class="btn btn-danger" style="width:100px;" onclick="location.href='${contextPath}/boardq/qna.do'">글목록</button>
	</div>							
</div>
<br>
</div>
</div>


</body>
</html>