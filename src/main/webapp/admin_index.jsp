<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>관리자 모드</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link href="css/style_admin.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>

</head>
<body class="sb-nav-fixed">
       <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
        		<a class="navbar-brand logoimg" href="index.jsp"style="text-align: center;"> <img
							style="width: 140px;" src="./images/logo.png">&nbsp&nbsp
						</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
  <div class="collapse navbar-collapse justify-content-end" id="collapsibleNavbar">
      <ul class="navbar-nav">
   <li class="nav-item">
						 <a class="nav-link header-logout" href="/logoutGO">로그아웃</a>
        </li>
        </ul>
        </div>
        </nav>
	<div id="layoutSidenav" style="text-align: center;">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">

					<div class="nav">
				
						<div class="sb-sidenav-menu-heading"></div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapseLayouts" aria-expanded="false"
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
								<a class="nav-link" href="/insertMember">회원등록</a>
						<a class="nav-link"	href="/getMemberList">회원목록</a>
							<a class="nav-link"	href="/getAllPayList">회원결제</a>
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
								<a class="nav-link" href="#">전시등록</a>
							 <a class="nav-link " href="/getExhibitionList" >전시목록</a>
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
								<a class="nav-link" href="/insertCouponForm">쿠폰등록
								</a>
						<a class="nav-link"	href="/getCouponList">쿠폰목록</a>
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
								<a class="nav-link" href="/getBoardList">공지사항</a> 
								<a class="nav-link"href="/getFaqList">FAQ</a>
								 <a class="nav-link" href="/getOneList">1:1 문의</a>
							</nav>
						</div>
					</div>
					
				</div>
							
			</nav>
		</div>

	</div>
	       
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script src="assets/demo/chart-area-demo.js"></script>
	<script src="assets/demo/chart-bar-demo.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
	<script src="js/datatables-simple-demo.js"></script>
</html>
