<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="res" value="${resMap.res }" />
<c:set var="resImageFileList" value="${resMap.resImageFileList }"/>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
	request.setCharacterEncoding("utf-8");
%>


<!DOCTYPE html>
<head></head>


	<link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
<style>
	
@import 'https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600&display=swap" rel="stylesheet';

:root {
  --dk-gray-100: #f3f4f6;
  --dk-gray-200: #e5e7eb;
  --dk-gray-300: #d1d5db;
  --dk-gray-400: #9ca3af;
  --dk-gray-500: #6b7280;
  --dk-gray-600: #4b5563;
  --dk-gray-700: #374151;
  --dk-gray-800: #1f2937;
  --dk-gray-900: #111827;
  --dk-dark-bg: #f3f4f6;
  --dk-darker-bg: #2a2b3d;
  --navbar-bg-color: #6f6486;
  --sidebar-bg-color: #252636;
  --sidebar-width: 250px;
}

* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body {
  font-family: "Inter", sans-serif;
  background-color: var(--dk-darker-bg);
  font-size: 0.925rem;
}

#wrapper {
  margin-left: var(--sidebar-width);
  transition: all 0.3s ease-in-out;
}

#wrapper.fullwidth {
  margin-left: 0;
}

/** --------------------------------
 -- Sidebar
-------------------------------- */
.sidebar {
  background-color: var(--sidebar-bg-color);
  width: var(--sidebar-width);
  transition: all 0.3s ease-in-out;
  transform: translateX(0);
  z-index: 9999999;
}

.sidebar .close-aside {
  position: absolute;
  top: 7px;
  right: 7px;
  cursor: pointer;
  color: #eee;
}

.sidebar .sidebar-header {
  border-bottom: 1px solid #2a2b3c;
}

.sidebar .sidebar-header h5 a {
  color: var(--dk-gray-300);
}

.sidebar .sidebar-header p {
  color: var(--dk-gray-400);
  font-size: 0.825rem;
}

.sidebar .search .form-control ~ i {
  color: #2b2f3a;
  right: 40px;
  top: 22px;
}

.sidebar > ul > li {
  padding: 0.7rem 1.75rem;
}

.sidebar ul > li > a {
  color: var(--dk-gray-400);
  text-decoration: none;
}

/* Start numbers */
.sidebar ul > li > a > .num {
  line-height: 0;
  border-radius: 3px;
  font-size: 14px;
  padding: 0px 5px;
}

.sidebar ul > li > i {
  font-size: 18px;
  margin-right: 0.7rem;
  color: var(--dk-gray-500);
}

.sidebar ul > li.has-dropdown > a:after {
  content: "\eb3a";
  font-family: unicons-line;
  font-size: 1rem;
  line-height: 1.8;
  float: right;
  color: var(--dk-gray-500);
  transition: all 0.3s ease-in-out;
}

.sidebar ul .opened > a:after {
  transform: rotate(-90deg);
}

/* Start dropdown menu */
.sidebar ul .sidebar-dropdown {
  padding-top: 10px;
  padding-left: 30px;
  display: none;
}
.sidebar ul .sidebar-dropdown.active {
  display: block;
}

.sidebar ul .sidebar-dropdown > li > a {
  font-size: 0.85rem;
  padding: 0.5rem 0;
  display: block;
}
/* End dropdown menu */

.show-sidebar {
  transform: translateX(-270px);
}

@media (max-width: 767px) {
  .sidebar ul > li {
    padding-top: 12px;
    padding-bottom: 12px;
  }

  .sidebar .search {
    padding: 10px 0 10px 30px;
  }
}

/** --------------------------------
 -- welcome
-------------------------------- */
.welcome {
  color: var(--dk-gray-300);
}

.welcome .content {
  background-color: var(--dk-dark-bg);
}

.welcome p {
  color: var(--dk-gray-400);
}

/** --------------------------------
 -- Statistics
-------------------------------- */
.statistics {
  color: var(--dk-gray-200);
}

.statistics .box {
  background-color: var(--dk-dark-bg);
}

.statistics .box i {
  width: 60px;
  height: 60px;
  line-height: 60px;
}

.statistics .box p {
  color: var(--dk-gray-400);
}

/** --------------------------------
 -- Charts
-------------------------------- */
.charts .chart-container {
  background-color: var(--dk-dark-bg);
}

.charts .chart-container h3 {
  color: var(--dk-gray-400);
}

/** --------------------------------
 -- users
-------------------------------- */
.admins .box .admin {
  background-color: var(--dk-dark-bg);
}

.admins .box h3 {
  color: var(--dk-gray-300);
}

.admins .box p {
  color: var(--dk-gray-400);
}

/** --------------------------------
 -- statis
-------------------------------- */
.statis {
  color: var(--dk-gray-100);
}

.statis .box {
  position: relative;
  overflow: hidden;
  border-radius: 3px;
}

.statis .box h3:after {
  content: "";
  height: 2px;
  width: 70%;
  margin: auto;
  background-color: rgba(255, 255, 255, 0.12);
  display: block;
  margin-top: 10px;
}

.statis .box i {
  position: absolute;
  height: 70px;
  width: 70px;
  font-size: 22px;
  padding: 15px;
  top: -25px;
  left: -25px;
  background-color: rgba(255, 255, 255, 0.15);
  line-height: 60px;
  text-align: right;
  border-radius: 50%;
}

.main-color {
  color: #ffc107;
}

/** --------------------------------
 -- Please don't do that in real-world projects!
 -- overwrite Bootstrap variables instead.
-------------------------------- 

.navbar {
  background-color: var(--navbar-bg-color) !important;
  border: none !important;
}
.navbar .dropdown-menu {
  right: auto !important;
  left: 0 !important;
}
.navbar .navbar-nav > li > a {
  color: #eee !important;
  line-height: 55px !important;
  padding: 0 10px !important;
}
.navbar .navbar-brand {
  color: #fff !important;
}
.navbar .navbar-nav > li > a:focus,
.navbar .navbar-nav > li > a:hover {
  color: #eee !important;
}

.navbar .navbar-nav > .open > a,
.navbar .navbar-nav > .open > a:focus,
.navbar .navbar-nav > .open > a:hover {
  background-color: transparent !important;
  color: #fff !important;
}

.navbar .navbar-brand {
  line-height: 55px !important;
  padding: 0 !important;
}
.navbar .navbar-brand:focus,
.navbar .navbar-brand:hover {
  color: #fff !important;
}
.navbar > .container .navbar-brand,
.navbar > .container-fluid .navbar-brand {
  margin: 0 !important;
}
@media (max-width: 767px) {
  .navbar > .container-fluid .navbar-brand {
    margin-left: 15px !important;
  }
  .navbar .navbar-nav > li > a {
    padding-left: 0 !important;
  }
  .navbar-nav {
    margin: 0 !important;
  }
  .navbar .navbar-collapse,
  .navbar .navbar-form {
    border: none !important;
  }
}

.navbar .navbar-nav > li > a {
  float: left !important;
}
.navbar .navbar-nav > li > a > span:not(.caret) {
  background-color: #e74c3c !important;
  border-radius: 50% !important;
  height: 25px !important;
  width: 25px !important;
  padding: 2px !important;
  font-size: 11px !important;
  position: relative !important;
  top: -10px !important;
  right: 5px !important;
}
.dropdown-menu > li > a {
  padding-top: 5px !important;
  padding-right: 5px !important;
}
.navbar .navbar-nav > li > a > i {
  font-size: 18px !important;
}*/

/* Start media query */

@media (max-width: 767px) {
  #wrapper {
    margin: 0 !important;
  }
  .statistics .box {
    margin-bottom: 25px !important;
  }
  .navbar .navbar-nav .open .dropdown-menu > li > a {
    color: #ccc !important;
  }
  .navbar .navbar-nav .open .dropdown-menu > li > a:hover {
    color: #fff !important;
  }
  .navbar .navbar-toggle {
    border: none !important;
    color: #eee !important;
    font-size: 18px !important;
  }
  .navbar .navbar-toggle:focus,
  .navbar .navbar-toggle:hover {
    background-color: transparent !important;
  }
}

::-webkit-scrollbar {
  background: transparent;
  width: 5px;
  height: 5px;
}

::-webkit-scrollbar-thumb {
  background-color: #3c3f58;
}

::-webkit-scrollbar-thumb:hover {
  background-color: rgba(0, 0, 0, 0.3);
}


</style>
</head>
<body>
	<aside class="sidebar position-fixed top-0 left-0 overflow-auto h-100 float-left" id="show-side-navigation1">
		<i class="uil-bars close-aside d-md-none d-lg-none" data-close="show-side-navigation1"></i>
		<div class="sidebar-header d-flex justify-content-center align-items-center px-3 py-4">
		  <img class="rounded-pill img-fluid" width="65" src="https://uniim1.shutterfly.com/ng/services/mediarender/THISLIFE/021036514417/media/23148907008/medium/1501685726/enhance" alt="">
		  <div class="ms-2">
			<h5 class="fs-6 mb-0">
			  <a class="text-decoration-none" href="#">관리자</a>
			</h5>
			<p class="mt-1 mb-0">.....</p>
		  </div>
		</div>
	  
		<div class="search position-relative text-center px-4 py-3 mt-2">
		  <input type="text" class="form-control w-100 border-0 bg-transparent" placeholder="Search here">
		  <i class="fa fa-search position-absolute d-block fs-6"></i>
		</div>
	  
		<ul class="categories list-unstyled">
		  <li class="has-dropdown">
			<i class="uil-estate fa-fw"></i><a href="#"> 관리자메인</a>
			<ul class="sidebar-dropdown list-unstyled">
			  <li><a href="#">Lorem ipsum</a></li>
			  <li><a href="#">ipsum dolor</a></li>
			  <li><a href="#">dolor ipsum</a></li>
			  <li><a href="#">amet consectetur</a></li>
			  <li><a href="#">ipsum dolor sit</a></li>
			</ul>
		  </li>
		
		  <li class="has-dropdown">
			<i class="uil-calendar-alt"></i><a href="#"> Calender</a>
			<ul class="sidebar-dropdown list-unstyled">
			  <li><a href="#">Lorem ipsum</a></li>
			  <li><a href="#">ipsum dolor</a></li>
			  <li><a href="#">dolor ipsum</a></li>
			  <li><a href="#">amet consectetur</a></li>
			  <li><a href="#">ipsum dolor sit</a></li>
			</ul>
		  </li>
	
		  <li class="has-dropdown">
			<i class="uil-shopping-cart-alt"></i><a href="#"> Ecommerce</a>
			<ul class="sidebar-dropdown list-unstyled">
			  <li><a href="#">Lorem ipsum</a></li>
			  <li><a href="#">ipsum dolor</a></li>
			  <li><a href="#">dolor ipsum</a></li>
			  <li><a href="#">amet consectetur</a></li>
			  <li><a href="#">ipsum dolor sit</a></li>
			</ul>
		  </li>
		  <li class="has-dropdown">
			<i class="uil-bag"></i><a href="#"> Projects</a>
			<ul class="sidebar-dropdown list-unstyled">
			  <li><a href="#">Lorem ipsum</a></li>
			  <li><a href="#">ipsum dolor</a></li>
			  <li><a href="#">dolor ipsum</a></li>
			  <li><a href="#">amet consectetur</a></li>
			  <li><a href="#">ipsum dolor sit</a></li>
			</ul>
		  </li>
		  <li class="">
			<i class="uil-setting"></i><a href="#"> Settings</a>
			<ul class="sidebar-dropdown list-unstyled">
			  <li><a href="#">Lorem ipsum</a></li>
			  <li><a href="#">ipsum dolor</a></li>
			  <li><a href="#">dolor ipsum</a></li>
			  <li><a href="#">amet consectetur</a></li>
			  <li><a href="#">ipsum dolor sit</a></li>
			</ul>
		  </li>
	

		  <li class="">
			<i class="uil-map-marker"></i><a href="#"> Maps</a>
		  </li>
		</ul>
	  </aside>
</body>
</html>