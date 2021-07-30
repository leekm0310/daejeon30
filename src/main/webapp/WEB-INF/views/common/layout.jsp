<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title><tiles:insertAttribute name="title" /></title>
<style>
		.html{
		height: 100%;
		position: relative;
		min-height: 100%;
		margin: 0;
		}
		.body {
		margin: 0;
		padding: 0;
		height: 100%;
		}	
		.wrap {
		min-height: 10%;
		position: relative;

		}
		.main-content {
		min-height: 100%;
		}	
		.container {
		padding:0 0 2% 0;	
		} 
		.ol {
		margin: 0;
		}
		.header {
		top: 0;
		left: 0;
		right: 0;
		color: #666666;
		background-color: #FFFFFF;
		}
		
		.localmenu {
		top: 2000;
		left: 0;
		right: 0;
		color: #666666;
		background-color: #FFFFFF;
		}
		
		.footer {
		bottom: 0;
		left: 0;
		right: 0;
		color: #F16B0C;
		background-color: #333333;
		}
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