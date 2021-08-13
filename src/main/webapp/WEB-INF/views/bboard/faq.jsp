<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<!-- Bootstrap CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
	
</head>
<body>

	
	<div class="container" style=margin-bottom:300px;>
	<div style="text-align: center;">
		<H2>FAQ</H2>
		<br>
		<p>자주 묻는 질문들에 대한 답변을 모아둔 공간입니다.<br>
		추가로 문의 사항이 있을 경우에는 문의 게시판을 이용해주세요.</p>
		<BR><BR>
	</div>	

		
	<div class="accordion accordion-flush" id="accordionFlushExample">
	
	<c:choose>
		<c:when test="${!empty bboardList }">
			<c:forEach var="bboard" items="${bboardList }" varStatus="num">
			  <div class="accordion-item">
			    <h2 class="accordion-header" id="flush-heading_${num.index }">
			      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse_${num.index }" aria-expanded="false" aria-controls="flush-collapse_${num.index }">
			        Q.${bboard.title }
			      </button>
			    </h2>
			    <div id="flush-collapse_${num.index }" class="accordion-collapse collapse" aria-labelledby="flush-heading_${num.index }" data-bs-parent="#accordionFlushExample">
			      <div class="accordion-body">${bboard.content }</div>
			    </div>
			  </div>
		  </c:forEach>
		</c:when>
	</c:choose>
	
	

 
</div>
		
		
		<br>
		
		
		
		
	
	</div>
	
	
	 
</body>
</html>
