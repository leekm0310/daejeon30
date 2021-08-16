<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title><tiles:insertAttribute name="title" /></title>
<style>
* {
  margin: 0;
  padding: 0;
  text-decoration: none;
  list-style: none;
}
#nav-btn {
  fill: white;
  height: 40px;
  position: absolute;
  right: 10px;
  top: 7px;
  display: none;
}
.vertical-line {
  margin-top: 30px;
  margin-bottom: 30px;
  width: 35px;
  border-bottom: #f7f7f7 4px solid;
}

body {
  -webkit-font-smoothing: antialiased;
  font: normal 15px/1.5 "Helvetica Neue", Helvetica, Arial, sans-serif;
  color: #232525;
}

aside {
  position: fixed;
  float: left;
  width: 280px;
  padding-top: 30px;
  padding-left: 25px;
  top: 0;
  bottom: 0;
  background-color: #474958;
  z-index: 400;
}

header {
  float: left;
  width:90%;
 
  padding-left: calc(230px + 7%);
  padding-left: -moz-calc(230px + 7%);
  padding-left: -webkit-calc(230px + 7%);
  padding-top: 30px;
  padding-bottom: 30px;
  background-color: white;
  position: fixed;
  z-index: 300;
}

article {
  float: left;

  margin-left: calc(230px + 9%);
  margin-left: -moz-calc(230px + 9%);
  margin-left: -webkit-calc(230px + 9%);

  margin-right: 9%;
  padding-top: 200px;

  width: calc(82% - 230px);
  width: -moz-calc(82% - 230px);
  width: -webkit-calc(82% - 230px);

  padding-bottom: 150px;
}

nav {
  display: block;
}

nav ul {
}

nav ul li {
  line-height: 30px;
}

nav ul li a {
  color: #e3e2e2;
}

nav ul li a:hover {
  color: #2b99ff;
}

#products {
  padding-top: 40px;
  font-weight: bold;
  color: #f7f7f7;
}

h1 {
  font-family: Arial, Helvetica, sans-serif;
  color: white;
  margin-bottom: 50px;
  font-size: 1.5em;
}

h2 {
  font-family: Arial, Helvetica, sans-serif;
  font-size: 2.4em;
  font-weight: bold;
  color: #474958;
  -webkit-transition: font-size 0.3s;
  -moz-transition: font-size 0.3s;
  -o-transition: font-size 0.3s;
  transition: font-size 0.3s;
}

@media (max-width: 730px) {
  h2 {
    font-size: 2em;
  }
  aside {
    float: left;
    width: 100%;
    padding-left: 5%;
    position: relative;
    float: left;
    padding-top: 10px;
    padding-bottom: 10px;
  }
  header {
    float: left;
    position: relative;
    width: 95%;
    padding-left: 5%;
  }
  nav {
    display: none;
  }
  #nav-btn {
    fill: white;
    height: 40px;
    width: 40px;
    position: absolute;
    right: 7px;
    top: 7px;
    display: block;
    cursor: pointer;
  }
  h1 {
    margin-bottom: 0px;
  }
  .vertical-line {
    margin-top: 20px;
    margin-bottom: 20px;
    display: none;
  }
  #products {
    padding-top: 0;
  }
  article {
    float: left;
    width: 90%;
    margin-left: 5%;
    margin-right: 5%;
    padding-top: 50px;
  }
}
</style>
</head>
<body>


	
	
			<tiles:insertAttribute name="header" />
	
	
			<tiles:insertAttribute name="localmenu" />




			<tiles:insertAttribute name="body" />



</body>
		<div class="footer">
			<tiles:insertAttribute name="footer" />
		</div>
</html>