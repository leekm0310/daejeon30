<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title><tiles:insertAttribute name="title" /></title>
<style>

</style>
</head>
<body>
	<div class="container">
		<div class="header">
			<tiles:insertAttribute name="header" />
		</div>
		<div class="localmenu">
			<tiles:insertAttribute name="localmenu" />
		</div> 
	

		<div class="content">
			<tiles:insertAttribute name="body" />
		</div>  

	</div>
</body>
		<div class="footer">
			<tiles:insertAttribute name="footer" />
		</div>
</html>