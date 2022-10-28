<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
	integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js"
	integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="./css/style.css">
<title>헤더입니다.</title>
</head>

<nav class="navbar navbar-expand-sm navbar-light header-navbar"
	data-toggle="affix">
	<a class="navbar-brand logoimg" href="index.jsp"> <img
		style="width: 200px;" src="./images/kakao_login_medium_narrow.png">&nbsp&nbsp
	</a>

	<button class="navbar-toggler header-toggler" type="button" data-toggle="collapse"
		data-target="#collapsingNavbar">☰</button>
	<div class="collapse navbar-collapse" id="collapsingNavbar">
		<ul class="nav navbar-nav mr-auto">
			<li class="nav-item dropdown header-title">
				<a class="nav-link" href="/getUserExhibitionList" > 전시 </a>
			</li>
			<li class="nav-item dropdown header-title">
				<a class="nav-link" href="#"> 랭킹 </a>
			</li>
			<li class="nav-item dropdown header-title">
				<a class="nav-link" href="#"> 지역 </a>
			</li>
			<li class="nav-item dropdown header-title">
				<a class="nav-link dropdown-toggle header-toggle" data-toggle="dropdown" href="/getBoardList" role="button" aria-haspopup="true" aria-expanded="false"> 고객센터 </a>
				<div class="dropdown-menu header-menu" aria-labelledby="searchtotal">
					<a class="dropdown-item header-item" href="#">공지사항</a>
					<a class="dropdown-item header-item" href="#">자주묻는질문</a>
					<a class="dropdown-item header-item" href="/getBoardList">1:1 문의</a>
				</div>
			</li>
		</ul>
	
	
	
	
	
	<ul class="nav navbar-nav navbar-right">
		<c:choose>
			<c:when test='${mb_Id ne NULL}'>
				<ul class="nav navbar-nav navbar-right">
					<li class="nav-item dropdown header-title">
					<a class="nav-link dropdown-toggle header-toggle" data-toggle="dropdown" href="/getBoardList" role="button" aria-haspopup="true" aria-expanded="false"> 마이페이지 </a>
					<div class="dropdown-menu header-menu" aria-labelledby="searchtotal">
					<a class="dropdown-item header-item" href="mypage?mb_id=${mb_Id}">&nbsp마이페이지</a>
					<a class="dropdown-item header-item" href="/getPayList">&nbsp나의구매내역</a>
					<a class="dropdown-item header-item" href="/MyCoupon">&nbsp내 쿠폰함</a>
					</div>
					</li>
				</ul>
					<a class="nav-link header-logout" href="/logoutGo">로그아웃</a>
			</c:when>
			<c:otherwise>
				<a href="login.jsp">로그인</a>
			</c:otherwise>
		</c:choose>
	</ul>
	</div>
</nav>

</html>