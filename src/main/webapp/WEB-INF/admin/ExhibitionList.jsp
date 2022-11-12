<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>전시 목록</title>
<!-- header -->
<%-- <%@ include file="/header.jsp"%> --%>
<!-- stlye -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<link href="../css/style_admin.css" rel="stylesheet" />
<link href="../css/admin.css" rel="stylesheet" />
<link rel="stylesheet" href="http://cdn.datatables.net/1.10.2/css/jquery.dataTables.min.css">
<!-- stlye -->

<!-- script library -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="../js/scripts.js"></script>
<script type="text/javascript" src="../js/jquery.dataTables.min.js"></script>
<!-- <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"> -->

<!-- script library -->
<!-- header end -->
<style>
div#myTable_length, div#myTable_info{
margin-left:5%;
}
div#myTable_filter{
margin-right:5%;
}
div#myTable_paginate{
margin-right:4%;
}
</style>
</head>
<body>
<div>
		<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
			<!-- Navbar Brand-->
			<a class="navbar-brand logoimg" href="index.jsp" style="text-align: center;"> <img style="width: 140px;"
				src="./images/logo.png">&nbsp&nbsp
			</a>
			<!-- Sidebar Toggle-->
			<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!">
				<i class="fas fa-bars"></i>
			</button>
			<div class="collapse navbar-collapse justify-content-end" id="collapsibleNavbar">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link header-logout" href="/logoutGO">로그아웃</a></li>
				</ul>
			</div>
		</nav>
		<section id="container">
			<aside>
				<div id="layoutSidenav" style="text-align: center;">
					<div id="layoutSidenav_nav">
						<nav class="sb-sidenav accordion sb-sidenav-dark"
							id="sidenavAccordion">
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
											<a class="nav-link" href="/admin/member">회원등록</a>
											<a class="nav-link" href="/getMemberList">회원목록</a> <a
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
											<a class="nav-link" href="/insertmoveExhibition">전시등록</a> <a class="nav-link "
												href="/getExhibitionList">전시목록</a>
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
											<a class="nav-link" href="/insertCouponForm">쿠폰등록 </a>
											<a class="nav-link" href="admin/CouponList">쿠폰목록</a>
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
					<div class="container border-bottom border-dark mb-3">
						<h2 style="font-weight: bold;">전시목록</h2>
					</div>
					<div class="table-responsive">
						<table id="myTable" class="display table" width="100%">
							<thead>
								<tr>
									<th>번호</th>
									<th>전시명</th>
<!-- 									<th>가격</th> -->
									<th>시작일</th>
									<th>종료일</th>
									<th>장소</th>
									<th>등록</th>
									<th>수정</th>
									<th>승인</th>
									<th>종료</th>
								</tr>
							</thead>
		    <%-- 			<td><a href="getExhibition?exh_no=${exhibition.exh_no}&page=${paging.nowPageBtn}">${exhibition.exh_title}</a></td> --%>
			<tbody>
				<c:forEach items="${exhibitionList}" var="exhibition">
					<tr onclick="selTr(${exhibition.exh_no},${paging.nowPageBtn})"
						style="cursor: pointer;">
						<td class="tdCenter">${exhibition.exh_no}</td>
						<td class="tdCenter">${exhibition.exh_title}</td>
<%-- 						<td class="tdCenter"><fmt:formatNumber --%>
<%-- 								value="${exhibition.exh_price}" groupingUsed="true" />원</td> --%>
						<td class="tdCenter">${exhibition.exh_st_date}</td>
						<td class="tdCenter">${exhibition.exh_end_date}</td>
						<td class="tdCenter">${exhibition.exh_hall}</td>
						<td class="tdCenter"><fmt:formatDate value="${exhibition.exh_rge_date}" pattern="yyyy-MM-dd HH:mm:ss" var="todate" />${todate}</td>
						<td class="tdCenter"><fmt:formatDate value="${exhibition.exh_mdf_date}" pattern="yyyy-MM-dd HH:mm:ss" var="mdfdate"/>${mdfdate}</td>
						<jsp:useBean id="now" class="java.util.Date" /> <fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" /> 
						<td class="tdCenter">
						<c:choose>
								<c:when test="${exhibition.exh_approval eq 1}">
									<span>승인</span>
								</c:when>
								<c:when test="${exhibition.exh_st_date <= today}">
									<span>승인불가</span>
								</c:when>
								<c:otherwise>
									<span>대기</span>
								</c:otherwise>
							</c:choose>
							</td>
						<td class="tdCenter">
						<c:if test="${exhibition.exh_end_date < today && exhibition.exh_approval eq 1}">
								<c:out value="종료" />
							</c:if></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<br> <br>
	</div>
	<div id="footer">
		<a href="insertmoveExhibition">
			<button type="button" id="conWrite" class="btn-purple">
				<!-- 			<a class="page-link" href="insertmoveExhibition"> -->
				전시등록
			</button>
		</a>
	</div>
	</div>
	</div>
	</section>
	</div>
<!-- 	<script -->
<!-- 		src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script> -->
<!-- 	<script type="text/javascript" src="../js/jquery.dataTables.min.js"></script> -->
<!-- 	<script type="text/javascript" -->
<!-- 		src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"> -->
		
<!-- 	</script> -->
	<script>
		$(document).ready(function() {
			$('#myTable').dataTable({
				stateSave: true
			});
		});
		
		function selTr(val, val2){
			location.href = "getExhibition?exh_no="+val+"&page="+val2;
		}
	</script>

</body>
</html>