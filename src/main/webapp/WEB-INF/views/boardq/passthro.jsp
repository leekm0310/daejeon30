<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
	request.setCharacterEncoding("utf-8");
	String num = request.getParameter("num");
%>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<!-- Bootstrap CSS -->
	
	<title>확인</title>
</head>
<body>
 
  <!-- 메인코드부 -->
 <div class="wrap">
 
	 
	<div class="main-content">	 
	
	<div class="container">
 <form name="passck" action="${contextPath}/boardq/passthro.do?" method="post" >
        <div class="pwbox" style="border:1px solid; padding:10px; padding-top: 100px; width:400px; height:300px;">
            <p style="text-align: center;">
	        이 글은 비밀글입니다. 비밀번호를 입력해 주세요.
             <br><Br>
              비밀번호   <input type="password" name ="password">
              <br><br>
              <input type="hidden" name="num" value="<%=num%>">
              <input type="button" value="목록"onclick="location.href='${contextPath}/boardq/qna.do'">
              <input type ="submit" value="확인">
            </p>
           
        </div>
		  </form>
		<br>
		      
		
	<c:if test="${param.check==1}">
	<script>
	window.onload=function(){
		alert("비밀번호를 확인해주세요");
	}
	</script>
	</c:if>
		
		
	</div>
</div>
</div>	

	 
</body>
</html>
