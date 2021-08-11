<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
request.setCharacterEncoding("utf-8");
%>
<!doctype html>
<html>
<head>
</head>
<body>
<localmenu class="localmenu">
<!-- 로컬네비게이션 -->
<hr>
			  <div class="btn-group">
			  <button class="btn btn-outline-danger" type="button" id="defaultDropdown" onclick="location.href='${contextPath}/mypage/mymain.do'"aria-expanded="false">
			    마이페이지
			  </button>
			</div>
			
			<div class="btn-group">
			  <button class="btn btn-outline-danger" type="button" id="dropdownMenuClickableOutside" onclick="location.href='${contextPath}/modify.do'" aria-expanded="false">
			   회원정보수정
			  </button>
			</div>
			
			<div class="btn-group">
			  <button class="btn btn-outline-danger" type="button" id="dropdownMenuClickableOutside" onclick="location.href='${contextPath}/rsv/res1.do'" aria-expanded="false">
			    예약내역
			  </button>
			</div>
			
			<div class="btn-group">
			  <button class="btn btn-outline-danger" type="button" id="dropdownMenuClickableOutside" onclick="location.href='${contextPath}/favo/list1.do'" aria-expanded="false">
			    찜한리스트
			  </button>
			</div>
			
			<div class="btn-group">
			  <button class="btn btn-outline-danger" type="button" id="dropdownMenuClickableOutside" onclick="location.href='./myboard1.jsp'" aria-expanded="false">
			    내 게시판
			  </button>
			</div>
			<hr>
</localmenu>
</body>
</html>