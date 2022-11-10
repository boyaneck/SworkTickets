<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ include file="../../header.jsp"%> --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link href="css/style_admin.css" rel="stylesheet" />
<link href="css/admin.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	crossorigin="anonymous"></script>
<script src="js/scripts.js"></script>
</head>
<script>
	function getboard(val) {
		location.href = "getBoard?noti_no=" + val;

	}
	function f_write(val) {
		console.log("noti_writer 받아와야함" + val);
		if (val == '') {
			alert("로그인이 되야 작성 가능합니다");
			location.href = "/getBoardList";
		} else {
			location.href = "/goWriteBoard";
		}
	}

	// function f_write(val){
	//     console.log(val);
	//     if(val == ''){
	//         alert("로그인이 되야 작성 가능합니다");
	//         location.href="/getOneList";
	//     }else{
	//         location.href="/goWrite";
	//     }
	// }
</script>
<body>
	<div>
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
												class="nav-link" href="admin/CouponList">쿠폰목록</a>
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
					<div class="container">
						<h2 style="text-align: center; font-weight: bold;">공지사항</h2>
					</div>
					<%-- <%@ include file="../../menu.jsp" %> --%>
					<br> <br> <br>
					<div class="res_tbl_wrap">
						<nav id="searchNav" class="navbar navbar-expand-sm"
							style="border-bottom: none;">
							<form class="form-inline" action="getOneList.do" method="post">
								<select class="form-control content" id="sel1"
									name="searchCondition"
									style="display: inline-block !important;">
									<c:forEach items="${conditionMap}" var="option">
										<option value="${option.value}">${option.key}</option>
									</c:forEach>
									<option value="${conditionMap['제목']}">${conditionMap['제목']}</option>

								</select> <input class="form-control mr-sm-2 input" type="text"
									name="searchKeyword" placeholder="검색어를 입력하세요.">
								<button class="btn-purple" type="submit"
									style="margin-right: 10px;">검색</button>
							</form>
						</nav>
					</div>
					<div class="container-fluid">
						<table class="table table-hover">
							<thead class="btn-primary">
								<tr>
									<th style="text-align: center;">번호</th>
									<th style="text-align: center;">제목</th>
									<th style="text-align: center;">작성자</th>
									<th style="text-align: center;">등록일</th>

								</tr>
							</thead>
							<tbody>
								<c:forEach items="${boardList}" var="board">
									<tr
										onclick="location.href='getBoard?noti_no=${board.noti_no }'"
										; style="cursor: pointer;">
										<%--                   <tr onclick="getboard(${board.noti_title}) style="cursor:pointer"> --%>
										<td class="tdCenter" style="width: 10%;">${board.noti_no}</td>
										<td class="tdCenter" style="width: 50%;">${board.noti_title}</td>
										<td class="tdCenter" style="width: 20%;">${board.noti_writer}</td>
										<td class="tdCenter" style="width: 20%;"><fmt:formatDate
												value="${board.noti_date}" pattern="yyyy-MM-dd HH:mm"
												var="today" />${today}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div class="d-flex justify-content-center" id="btnBox_parent">
							<div id="btnBox">
								<!-- 반복처리할 태그 시작-->
								<c:if test="${paging.nowPageBtn > 1 }">
									<a href="getBoardList?nowPageBtn=${paging.nowPageBtn -1 }">&lt;</a>
								</c:if>
								<c:forEach begin="${paging.startBtn}" end="${paging.endBtn }"
									step="1" var="i">
									<c:choose>
										<c:when test="${paging.nowPageBtn == i}">
											<a style="font-weight: 400; color: #7832f7;" class="aSel">${i}</a>
										</c:when>
										<c:otherwise>
											<a href="getBoardList?nowPageBtn=${i}">${i}</a>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<c:if test="${paging.nowPageBtn < paging.totalBtnCnt }">
									<a href="getBoardList?nowPageBtn=${paging.nowPageBtn +1 }">&gt;</a>
								</c:if>
								<!-- 반복처리할 태그 끝 -->
							</div>
						</div>
						<div class="d-flex justify-content-flex-start" style="margin: 5%;">
							<button class="btn-purple" onclick="f_write('${mb_Id}')"
								style="cursor: pointer">글쓰기</button>
						</div>
					</div>
					<br> <br>
				</div>
			</div>
		</section>
	</div>
</body>
</html>