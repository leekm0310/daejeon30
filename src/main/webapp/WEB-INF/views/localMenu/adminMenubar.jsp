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
  <button class="btn btn-outline-danger" type="button" id="defaultDropdown" onclick="location.href='${contextPath}/admin/listMem.do'"aria-expanded="false">
    회원관리
  </button>
</div>

<div class="btn-group">
  <button class="btn btn-outline-danger" type="button" id="dropdownMenuClickableOutside" onclick='location.href="${contextPath}/admin/listRes1.do"' aria-expanded="false">
   식당관리
  </button>
</div>

<div class="btn-group">
  <button class="btn btn-outline-danger" type="button" id="dropdownMenuClickableOutside" onclick="location.href='${contextPath}/admin/allRsv.do'" aria-expanded="false">
    예약관리
  </button>
</div>

<div class="btn-group">
  <button class="btn btn-outline-danger" type="button" id="dropdownMenuClickableOutside" onclick="location.href='${contextPath}/admin/noticeBoard.do'" aria-expanded="false">
    게시판관리
  </button>
</div>

<div class="btn-group">
  <button class="btn btn-outline-danger" type="button" id="dropdownMenuClickableOutside" onclick="location.href='${contextPath}/adminMenu.do'" aria-expanded="false">
    #
  </button>
</div>
<hr>

</localmenu>
</body>
</html>