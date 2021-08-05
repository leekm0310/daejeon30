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
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

		
	<!-- 삭제 경고창 -->
	<script text="text/javascript">
		function del() {
		if (confirm("삭제 하시겠습니까?"))
		form.submit();
		}
		
		$(function(){
				$("#id").attr("readonly",true);
				$("#id").val("${member.id}");
		});	
		function addQC(){
			
			$.ajax({
				type:"post",
				async:false,
				url: "${contextPath}/boardq/addqcomment.do",
				dataType:"text",
				data:$("#addform").serialize(),
				success:function(data,textStatus){
					if("1"==data){
						$("#addform").submit();
					}
				},
				error:function(data,textStatus){
					alert("에러가 발생했습니다.");
				},
				complete:function(data,textStatus){
					listQC();
				}
			});
			
		}
		
		function listQC(){
			
			$.ajax({
				type: "get",
				contentType: "application/json",
				url: "${contextPath}/boardq/listQcomment.do?num=${bVO.num}",
				success: function(result){
					 var output="<table>";
			            for(var i in result){
			            	 var repl=result[i].content;
			                 repl = repl.replace(/  /gi,"&nbsp;&nbsp;");//공백처리
			                 repl = repl.replace(/</gi,"&lt;"); //태그문자 처리
			                 repl = repl.replace(/>/gi,"&gt;");
			                 repl = repl.replace(/\n/gi,"<br>"); //줄바꿈 처리
			                 
			                 output += "<tr><td>"+result[i].id;
			                 date = changeDate(result[i].date);
			                 output += "("+date+")";
			                 output += "<br>"+repl+"</td></tr>";
			            }
			            output+="</table>";
		                $("#listqcomment").html(output);
				}
			});
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
				<br>
					</div>
					<table class="table table-hover">
			<thead>
				<tr>
					<th>작성자</th>
					<th>내용</th>
					<th>날짜</th>
				</tr>
			</thead>
			<tbody>
			<c:choose>
			<c:when test="${!empty comment }">
			<c:forEach var="c" items="${comment }">
			<tr>
			<td>${c.id }</td>
			<td>${c.content }</a></td>
			<td>${c.date }</a></td>
			</tr>
			</c:forEach>
			</c:when>
			</c:choose>
		
			</tbody>
		</table>
		
		<form name="addform" id="addform" method="post">
		<input type="hidden" name="boardnum" value="${bVO.num }">
		<input type="hidden" name="id" id="id">
 		<textarea class="form-control" name="content" rows="2" placeholder="댓글란 입니다"></textarea>
		
		<button type="button" class="btn btn-danger me-md-2" onclick="javascript:addQC()" value="등록"></button>
			</form>
					<br>					
					<div id="listqcomment"></div>				
				
							
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