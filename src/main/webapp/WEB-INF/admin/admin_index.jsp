<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ include file="../../header.jsp"%> --%>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>관리자 모드</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<link href="css/style_admin.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="js/scripts.js"></script>
<style>
body {
	font-family: '맑은 고딕', verdana;
	padding: 0;
	margin: 0;
}

ul {
	padding: 0;
	margin: 0;
	list-style: none;
}

div#root {
	width: 90%;
	margin: 0 auto;
}

header#header {
	font-size: 60px;
	padding: 20px 0;
}

header#header h1 a {
	color: #000;
	font-weight: bold;
}

nav#nav {
	padding: 10px;
	text-align: right;
}

nav#nav ul li {
	display: inline-block;
	margin-left: 10px;
}

section#container {
/* 	padding: 20px 0;
	border-top: 2px solid #eee; */
	border-bottom: 2px solid #eee;
}

section#container::after {
	content: "";
	display: block;
	clear: both;
}

aside {
	float: left;
	width: 200px;
}

div#container_box {
	float: right;
	width: calc(100% - 200px - 20px);
}

aside ul li {
	text-align: center;
	margin-bottom: 10px;
}

aside ul li a {
	display: block;
	width: 100%;
	padding: 10px 0;
}

aside ul li a:hover {
	background: #eee;
}

footer#footer {
	background: #f9f9f9;
	padding: 20px;
}

footer#footer ul li {
	display: inline-block;
	margin-right: 10px;
}
/* #searchNav { 
 	-webkit-justify-content: flex-end; 
 	justify-content: flex-end; 
} 

table {
	margin-left: auto;
	margin-right: auto;
	width: 90% !important;
}

.res_tbl_wrap {
	position: relative;
	overflow: hidden;
	margin: 0 auto;
	width: 75%;
}

.res_tbl_wrap table {
	display: table;
	width: 100%;
	border-collapse: collapse;
	border-spacing: 0;
}

/* desktop only */
/* @media screen and (min-width: 1200px) {
	.res_tbl_wrap table thead tr th, .res_tbl_wrap table tbody tr td {
		padding: 12px 20px;
		font-size: 16px;
		line-height: 22px;
	}
}
 */
/* mobile only */
/* @media screen and (max-width: 990px) {
	.res_tbl_wrap table col {
		width: 100% !important;
	}
	.res_tbl_wrap table thead {
		display: none;
	}
	.res_tbl_wrap table tbody tr {
		border-bottom: 1px solid #efefef;
	}
	.res_tbl_wrap table tbody tr td {
		width: 100%;
		display: flex;
		margin-bottom: 2px;
		padding: 5px;
		border-bottom: none;
		font-size: 14px;
		line-height: 18px;
	}
	.res_tbl_wrap table tbody tr td:first-child, .res_tbl_wrap table tbody tr th:first-child
		{
		padding-top: 16px;
	}
	.res_tbl_wrap table tbody tr td:last-child, .res_tbl_wrap table tbody tr th:last-child
		{
		padding-bottom: 15px;
	}
	.res_tbl_wrap table tbody tr td:before {
		display: inline-block;
		margin-right: 12px;
		-webkit-box-flex: 0;
		-ms-flex: 0 0 100px;
		flex: 0 0 100px;
		font-weight: 700;
		content: attr(data-label);
	}
} */

/* tr:hover { */
/* 	background-color: #f8f8ff; */
/* } */

/* html, body {
	height: 100%;
}

.wrap {
	position: relative;
	min-height: 100%;
	padding-bottom: 200px;
} */
</style>
</head>
<body>
	<!-- <br><br><br> -->
	<!-- 		<nav id="nav">
			<div id="nav_box"></div>
		</nav> -->
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<!-- Navbar Brand-->
		<a class="navbar-brand logoimg" href="index.jsp"
			style="text-align: center;"> <img style="width: 140px;"
			src="./images/logo.png">&nbsp&nbsp
		</a>
		<!-- Sidebar Toggle-->
		<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0"
			id="sidebarToggle" href="#!">
			<i class="fas fa-bars"></i>
		</button>
		<div class="collapse navbar-collapse justify-content-end"
			id="collapsibleNavbar">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link header-logout"
					href="/logoutGO">로그아웃</a></li>
			</ul>
		</div>
	</nav>
	<section id="container">
		<aside>
			<div id="layoutSidenav" style="text-align: center;">
				<div id="layoutSidenav_nav">
					<nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
						<div class="sb-sidenav-menu">
							<div class="nav">
								<div class="sb-sidenav-menu-heading"></div>
								<a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false"
									aria-controls="collapseLayouts">
									<div class="sb-nav-link-icon">
										<i class="fas fa-columns"></i>
									</div> 회원관리
									<div class="sb-sidenav-collapse-arrow">
										<i class="fas fa-angle-down"></i>
									</div>
								</a>
								<div class="collapse" id="collapseLayouts"
									aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
									<nav class="sb-sidenav-menu-nested nav">
										<a class="nav-link" href="/registerTerm?agree1=true&agree2=true&agreeAll=true';">회원등록</a> <a
											class="nav-link" href="/getMemberList">회원목록</a> <a
											class="nav-link" href="/getAllPayList">회원결제</a>
									</nav>
								</div>

								<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
									data-bs-target="#collapseLayouts_exh" aria-expanded="false"
									aria-controls="collapseLayouts_exh">
									<div class="sb-nav-link-icon">
										<i class="fas fa-columns"></i>
									</div> 전시관리
									<div class="sb-sidenav-collapse-arrow">
										<i class="fas fa-angle-down"></i>
									</div>
								</a>
								<div class="collapse" id="collapseLayouts_exh"
									aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
									<nav class="sb-sidenav-menu-nested nav">
										<a class="nav-link" href="#">전시등록</a> <a class="nav-link "
											href="/getExhibitionList">전시목록</a>
									</nav>
								</div>

								<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
									data-bs-target="#collapseLayouts_coupon" aria-expanded="false"
									aria-controls="collapseLayouts_coupon">
									<div class="sb-nav-link-icon">
										<i class="fas fa-columns"></i>
									</div> 쿠폰관리
									<div class="sb-sidenav-collapse-arrow">
										<i class="fas fa-angle-down"></i>
									</div>
								</a>
								<div class="collapse" id="collapseLayouts_coupon"
									aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
									<nav class="sb-sidenav-menu-nested nav">
										<a class="nav-link" href="/insertCouponForm">쿠폰등록 </a> <a
											class="nav-link" href="/getCouponList">쿠폰목록</a>
									</nav>
								</div>


								<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
									data-bs-target="#collapseLayouts_service" aria-expanded="false"
									aria-controls="collapseLayouts_service">
									<div class="sb-nav-link-icon">
										<i class="fas fa-columns"></i>
									</div> 고객센터
									<div class="sb-sidenav-collapse-arrow">
										<i class="fas fa-angle-down"></i>
									</div>
								</a>
								<div class="collapse" id="collapseLayouts_service"
									aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
									<nav class="sb-sidenav-menu-nested nav">
										<a class="nav-link" href="/getBoardList">공지사항</a> <a
											class="nav-link" href="/getFaqList">FAQ</a> <a
											class="nav-link" href="/getOneList">1:1 문의</a>
									</nav>
								</div>
							</div>

						</div>

					</nav>
				</div>
			</div>
		</aside>
	</section>

</body>
</html>
