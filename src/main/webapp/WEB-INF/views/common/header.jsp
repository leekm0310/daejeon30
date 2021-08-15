<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!doctype html>
<html>
<head>
		<!-- 관련 소스입니당, 드랍다운은 기존 소스랑 다르게 이거 3개를 써야 합니다, 기존에 쓰던 소스중 하나를 빼셔야해요 -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>

	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js" integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT" crossorigin="anonymous"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>



</head>
 <!-- 메인코드부 -->
 <div class="wrap">
	<header class="header">
		<div class="container" >
			<div class="row">
			    <div class="col-md-8" align=left style="height:40px;">
							<a href="${contextPath}/main.do">
								<img id="logoImage" src="https://cdn.discordapp.com/attachments/847720300296011812/852774816310362142/bi_4.png" width=200px;>
							</a>
			    	</div>
			    <div class="col-md-4" align=right style="height:40px;">
				<ul class="nav" style="float:right;">
				<c:if test="${isLogOn==true && member.id =='admin' }">
					<button type="button" class="btn btn-outline-success btn-sm" onclick='location.href="${contextPath}/adminMain.do"'>관리자</button>
					</c:if>
					<c:choose>
					<c:when test="${isLogOn == true && member != null}">
					<button type="button" class="btn btn-none btn-sm text-success">"${member.name}님!" 반갑습니다</button>
					<button type="button" class="btn btn-none" onclick='location.href="${contextPath}/member/logout.do"'>로그아웃</button>
					<button type="button" class="btn btn-none" onclick='location.href="${contextPath}/rsv/res1.do"'>예약내역</button>
					</c:when>
					<c:otherwise>
					<button type="button" class="btn btn-none" onclick='location.href="${contextPath}/login.do"'>로그인</button>
					<button type="button" class="btn btn-none" onclick='location.href="${contextPath}/join.do"'>회원가입</button>
					<button type="button" class="btn btn-none" onclick='location.href="${contextPath}/trackorder.do"'>예약내역</button>
					</c:otherwise>
					</c:choose>
					
		 		</ul>
			    </div>
			    </div>
				 <div class="row">
			 	<div class="col-md-4" align=center  style="height:50px;">
			 	
			 	</div>
			 	<!-- 검색바 -->
			 	<div class="col-md-4"  style="height:50px;">
			 		<form class="d-flex justify-content-center py-3" action="${contextPath}/res/searchRes.do" method="post">
						<input type="text" class="form-control" name="word1" id="word1" placeholder="검색어를 입력하세요" style="text-align:center; width:250px;">
						&ensp;<input type="submit" class="btn btn-danger" value="검색">
					</form>
			 	</div>
			 	<div class="col-md-4" align=center  style="height:50px;">
			 	</div>
				 </div>
				 
			<div class="row" style="height:50px;">
			 	<div class="col-md-12" align=center>
			 	
			 	<!-- 메뉴바 -->
			 	<div class="d-flex justify-content-center py-3">
				<ul class="nav nav-pills">
					<div class="dropdown">
						<a class="btn btn-danger dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
							인트로
						</a>
						<ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
							<li>
								<a class="dropdown-item" href="${contextPath}/intro.do">페이지 소개</a>
							</li>
							<li>
								<a class="dropdown-item" href="${contextPath}/sitemap.do">사이트맵</a>
							</li>			 
						</ul>
					</div>&nbsp;
					<div class="dropdown">
						<a class="btn btn-danger dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
							맛집
						</a>
						<ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
							<li>
								<a class="dropdown-item" href="${contextPath}/res/rlist1.do">지역별 맛집</a>
							</li>
							<li>
								<a class="dropdown-item" href="${contextPath}/res/rlist1.do">분류별 맛집</a>
							</li>
							<li>
								<a class="dropdown-item" href="${contextPath}/res/rlist1.do">ETC</a>
							</li>
						</ul>
					</div>&nbsp;
					<div class="dropdown">
						<a class="btn btn-danger dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
							커뮤니티
						</a>
						<ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
							<li>
								<a class="dropdown-item" href="${contextPath}/bboard/notice.do">공지사항</a>
							</li>
							<li>
				  				<a class="dropdown-item" href="${contextPath}/bboard2/reviewList.do">리뷰게시판</a>
							</li>
							<li>
								<a class="dropdown-item" href="${contextPath}/board2.do">추천게시판</a>
							</li>
						</ul>
					</div>&nbsp;
					<div class="dropdown">
  						<a class="btn btn-danger dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
   							고객센터
  						</a>
					  <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
					    <li><a class="dropdown-item" href="${contextPath}/bboard/faq.do">FAQ</a></li>
					    <li><a class="dropdown-item" href="${contextPath}/boardq/qna.do">문의게시판</a></li>
					    </ul>
					</div>&nbsp;
					<c:if test="${isLogOn == true && member != null}">
					<div class="dropdown">
						<a class="btn btn-danger dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
							회원
						</a>
						<ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
							<li>
								<a class="dropdown-item" href="${contextPath}/mypage/mymain.do">마이페이지</a>
							</li>
							<li>
								<a class="dropdown-item" href="${contextPath}/modify.do">회원정보수정</a>
							</li>
							<li>
								<a class="dropdown-item" href="${contextPath}/rsv/res1.do">예약내역</a>
							</li>
							<li>
								<a class="dropdown-item" href="${contextPath}/favo/list1.do">찜한 리스트</a>
							</li>
							<li>
								<a class="dropdown-item" href="${contextPath}/mypage/myqna.do">내 게시판</a>
							</li>
						</ul>
					</div>
					</c:if>
				</ul>
			</search>
	</div>
</div>
</div>
</header>
</div>
</html>