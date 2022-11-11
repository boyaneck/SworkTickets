<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>관리자 모드</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link href="../css/style_admin.css" rel="stylesheet" />
<link href="../css/admin.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	crossorigin="anonymous"></script>
<script src="../js/scripts.js"></script>
<title>쿠폰 목록</title>

<script>
	function notlogin() {
		alert("로그인 후 진행 해 주시기 바랍니다.");
		location.href = "/login.jsp"
	};
</script>

<%-- <%@ include file="/header.jsp"%> --%>
</head>
<body>
	<div>
		<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
			<!-- Navbar Brand-->
			<a class="navbar-brand logoimg" href="../index.jsp"
				style="text-align: center;"> <img style="width: 140px;"
				src="../images/logo.png">&nbsp&nbsp
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
						<nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion" style="height: 1200px;">
							<div class="sb-sidenav-menu">
								<div class="nav">
									<div class="sb-sidenav-menu-heading"></div>
									<a class="nav-link collapsed" href="#"
										data-bs-toggle="collapse" data-bs-target="#collapseLayouts"
										aria-expanded="false" aria-controls="collapseLayouts">
										<div class="sb-nav-link-icon">
											<i class="fas fa-columns"></i>
										</div> 회원관리
										<div class="sb-sidenav-collapse-arrow">
											<i class="fas fa-angle-down"></i>
										</div>
									</a>
									<div class="collapse" id="collapseLayouts"
										aria-labelledby="headingOne"
										data-bs-parent="#sidenavAccordion">
										<nav class="sb-sidenav-menu-nested nav">
											<!-- 											<a class="nav-link" -->
											<!-- 												href="/registerTerm?agree1=true&agree2=true&agreeAll=true';">회원등록</a> -->
											<a class="nav-link" href="/admin/member">회원등록</a> <a
												class="nav-link" href="/getMemberList">회원목록</a> <a
												class="nav-link" href="/getAllPayList">회원결제</a>
										</nav>
									</div>

									<a class="nav-link collapsed" href="#"
										data-bs-toggle="collapse"
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
										aria-labelledby="headingOne"
										data-bs-parent="#sidenavAccordion">
										<nav class="sb-sidenav-menu-nested nav">
											<a class="nav-link" href="/insertmoveExhibition">전시등록</a> <a
												class="nav-link " href="/getExhibitionList">전시목록</a>
										</nav>
									</div>

									<a class="nav-link collapsed" href="#"
										data-bs-toggle="collapse"
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
										aria-labelledby="headingOne"
										data-bs-parent="#sidenavAccordion">
										<nav class="sb-sidenav-menu-nested nav">
											<a class="nav-link" href="/insertCouponForm">쿠폰등록 </a> <a
												class="nav-link" href="/admin/CouponList">쿠폰목록</a>
										</nav>
									</div>
									<a class="nav-link collapsed" href="#"
										data-bs-toggle="collapse"
										data-bs-target="#collapseLayouts_service"
										aria-expanded="false" aria-controls="collapseLayouts_service">
										<div class="sb-nav-link-icon">
											<i class="fas fa-columns"></i>
										</div> 고객센터
										<div class="sb-sidenav-collapse-arrow">
											<i class="fas fa-angle-down"></i>
										</div>
									</a>
									<div class="collapse" id="collapseLayouts_service"
										aria-labelledby="headingOne"
										data-bs-parent="#sidenavAccordion">
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
			<div id="container_box">
				<div class="wrap" style="padding: 40px;">
					<div class="container border-bottom border-dark">
						<h2 style= "font-weight: bold;">쿠폰목록</h2>
					</div>
					<fmt:parseDate var="startDate_D" value="${today }"
						pattern="yyyy-MM-dd" />
					<fmt:parseNumber var="startDate_N"
						value="${startDate_D.time / (1000*60*60*24)}" integerOnly="true" />

					<!-- 	<div class="container" style="text-align: -webkit-center;"> -->
					<!-- 		<h1 style="text-align: center; ">쿠폰 목록</h1> -->
					<!-- 		<br> -->


					<div class="container">
						<div
							class="row row-cols-1 row-cols-sm-1 row-cols-md-1 row-cols-xl-2">
							<c:forEach items="${couponList}" var="coupon">
								<fmt:parseDate var="endDate_D" value="${coupon.c_date }"
									pattern="yyyy-MM-dd" />
								<fmt:parseNumber var="endDate_N"
									value="${endDate_D.time / (1000*60*60*24)}" integerOnly="true" />
								<div class="col">
									<div class="rectangle"
										style="-webkit-mask-image: radial-gradient(circle at 18px 50%, transparent 18px, red 18.5px); -webkit-mask-position: -18px;">
										<div class="row ">
											<div class="col-3">
												<h1 class="text-center"
													style="transform: translate(0, 80%); font-weight: bolder; padding-left: 17px">${coupon.c_per}%</h1>
											</div>
											<div class="col"
												style="font-size: 18px; padding-left: 15px; transform: translate(0, 30%); text-align: left;">
												<b id="c_name" style="font-size: 23px">${coupon.c_name}</b><br>
												${coupon.c_date}까지<br> <span class="text-danger"><small>
														${endDate_N-startDate_N}일 남음 &nbsp;</small></span>
											</div>

											<div class="col" style="transform: translate(0, 15%);">
												<c:choose>
													<c:when test="${mb_Id eq 'admin'}">
														<button class="btn-coupon2"
															onclick="location.href='/getCoupon?c_num=${coupon.c_num}'">수정</button>
														<button class="btn-coupon1"
															onclick="location.href='/deleteCoupon?c_num=${coupon.c_num}'">삭제
														</button>
													</c:when>
													<c:when test="${mb_Id ne null}">
														<c:choose>
															<c:when test="${error!=1}">
																<button class="btn-coupon3"
																	style="transform: translate(0, 65%);"
																	onclick="location.href='/insertCouponBox?c_num=${coupon.c_num}'">쿠폰받기</button>
															</c:when>
														</c:choose>

													</c:when>
													<c:otherwise>
														<button class="btn-coupon3"
															style="transform: translate(0, 65%);"
															onclick="notlogin()">쿠폰받기</button>
													</c:otherwise>
												</c:choose>
											</div>
										</div>
									</div>
								</div>

							</c:forEach>
						</div>
						<div class="container text-center">

							<!--       맨처음 -->
							<c:if test="${paging.nowPageBtn > 1 }">
								<a class="page-st" href="/admin/CouponList?nowPageBtn=1">&laquo;</a>
							</c:if>
							<c:if test="${paging.nowPageBtn > 1 }">
								<a class="page-st"
									href="/admin/CouponList?nowPageBtn=${paging.nowPageBtn-1}">&lt;</a>
							</c:if>

							<!-- 반복처리 태그 -->
							<c:forEach begin="${paging.startBtn}" end="${paging.endBtn }"
								step="1" var="i">
								<c:choose>
									<c:when test="${paging.nowPageBtn==i}">
										<a class="page-st" style="font-weight: bold; color: #7329f7;" href="/admin/CouponList?nowPageBtn=${i}">${i}</a>
									</c:when>
									<c:otherwise>
										<a class="page-st" href="/admin/CouponList?nowPageBtn=${i}">${i}</a>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<!--       반복 끝 -->
							<c:if test="${paging.nowPageBtn < paging.totalBtnCnt }">
								<a class="page-st"
									href="/admin/CouponList?nowPageBtn=${paging.nowPageBtn+1}">&gt;</a>
							</c:if>
							<!--       맨끝 -->
							<c:if test="${paging.nowPageBtn < paging.totalBtnCnt }">
								<a class="page-st"
									href="/admin/CouponList?nowPageBtn=${paging.totalBtnCnt}">&raquo;</a>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
</body>
</html>