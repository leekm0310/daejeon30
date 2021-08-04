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
	
		<H1>FAQ</H1>
		<BR><BR>
		
		<table class="table table-hover">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>날짜</th>
					
				</tr>
			</thead>
			<tbody>
			<c:choose>
			<c:when test="${!empty bboardList }">
			<c:forEach var="bboard" items="${bboardList }">
			<tr>
			<td>${bboard.num }</td>
			<td>${bboard.title }</td>
			<td>${bboard.id }</td>
			<td>${bboard.date }</td>
			</tr>
			</c:forEach>
			</c:when>
			</c:choose>
			
			
			</tbody>
		</table>
		
	<div class="accordion accordion-flush" id="accordionFlushExample">
	
	<c:choose>
	<c:when test="${!empty bboardList }">
	<c:forEach var="bboard" items="${bboardList }">
  <div class="accordion-item">
    <h2 class="accordion-header" id="flush-headingOne">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
        ${bboard.title }
      </button>
    </h2>
    <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body">${bboard.content }</div>
    </div>
  </div>
  </c:forEach>
	</c:when>
	</c:choose>
  <div class="accordion-item">
    <h2 class="accordion-header" id="flush-headingTwo">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
        Accordion Item #2
      </button>
    </h2>
    <div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body">Placeholder content for this accordion, which is intended to demonstrate the <code>.accordion-flush</code> class. This is the second item's accordion body. Let's imagine this being filled with some actual content.</div>
    </div>
  </div>
 
</div>
		
		
		<br>
		
		
		
		
	
	</div>
	
	
	 
</body>
</html>
