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

		function del(value) {
			location.href='${contextPath}/boardq/deleteQC.do?num='+value;
			listQC();
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
				complete:function(data){
					listQC();
				}
			});
			
		}
		
		function listQC(){
			
			$.ajax({
				type: "get",
				contentType: "application/json",
				url: "${contextPath}/boardq/listQC.do?num=${map.bVO.num}",
				success: function(result){
					 
					 console.log(result);
					 const last = result[result.length -1];
					 console.log(last)
					 var output="<tr>";
			            for(var i in result){
			        
			                 output += "<tr><td>"+result[i].id+"</td>";
			                 output += "<td width='400'>"+result[i].content;+"</td>";
			                 output += "<td>"+result[i].date+"</td>";
			                 output += "<td width='200'><button class='btn btn-outline-primary btn-sm' onclick='editc()'>수정</button> "
			                 output +="<button class='btn btn-outline-secondary btn-sm' id='delb' onclick='delc(this.value)' value="+result[i].num+">삭제</button></td></tr>"
			                
			            }
			            output+="</tr>";
		                $("#listqcomment").html(output);
				}
			});
		}
				
			
		
		function delc(value){
			$.ajax({
				type: "post",
				url: "${contextPath}/boardq/deleteQC.do?num="+value,
				dataType: "text",
				success:function(result){
					listQC();
				}
			});
		}
		
		//수정창 바뀌는 것 관련 작업중
		function editc(){
			var output="";
			output +="<tr><td></td>"
			output +="<td width='400'><textarea class='form-control' name='content' rows='2'></textarea>"
			output +="<td></td>"
			output +="<td width='200'><button class='btn btn-outline-primary btn-sm'>수정</button> "
			output +="<button class='btn btn-outline-secondary btn-sm' id='delb' onclick='delc(this.value)' value=+result[i].num+>삭제</button></td></tr>"
			output +="</tr>";
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
				<form action="${contextPath}/boardq/updateQna.do?num=${map.bVO.num }" method="post">
					<div class="mb-3">
					<p class="fs-3">
					<input name = title value="${map.bVO.title}" style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;">
					</p>
					작성일: ${map.bVO.date}
					</div>
					<hr>
					문의종류: ${map.bVO.sort}
					작성자: ${map.bVO.name}
						
					<hr>	 				
					
					<div class="mb-3">
  					<textarea class="form-control" name="content" rows="20">${map.bVO.content }</textarea>
					</div>
					<br>
					<p> </p>
					<hr>
									
					<div class="d-grid gap-2 d-md-flex justify-content-md-end">
						
						<input class="btn btn-danger me-md-2" type="submit" value="수정"></button>
						<button class="btn btn-danger" type="button" id="delb" onclick="location.href='${contextPath}/boardq/deleteQna.do?num=${bVO.num }'">삭제</button>
				
				</form>
				<br>
					</div>
					<table class="table table-hover">
			<thead>
				<tr>
					<th>작성자</th>
					<th>내용</th>
					<th>날짜</th>
					<th></th>
				</tr>
			</thead>
			<tbody id="listqcomment">
			<c:choose>
			<c:when test="${!empty map.qcList }">
			<c:forEach var="c" items="${map.qcList }">
			<tr>
			<td>${c.id }</td>
			<td width="400">${c.content }</td>
			<td>${c.date }</td>
			<td width="200"><button class="btn btn-outline-primary btn-sm" onclick="editc()">수정</button>
			<button class="btn btn-outline-secondary btn-sm" onclick ="location.href='${contextPath}/boardq/deleteQC.do?num=${c.num }'">삭제</button></td>
			</tr>
			</c:forEach>
			</c:when>
			</c:choose>
				
			</tbody>
		</table>
	
		
		<form name="addform" id="addform" method="post">
		<input type="hidden" name="boardnum" value="${map.bVO.num }">
		<input type="hidden" name="id" id="id">
 		<textarea class="form-control" name="content" rows="2" placeholder="댓글은 관리자만 작성 가능합니다"></textarea>
		<c:if test="${isLogOn==true && member.id =='admin' }">
		<button type="button" class="btn btn-danger me-md-2" onclick="javascript:addQC()">등록</button>
		</c:if>
			</form>
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