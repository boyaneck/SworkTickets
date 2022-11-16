<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- <%@ include file="../../header.jsp"%> --%>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>관리자 모드</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
<!-- jQuery CDN --->
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<link href="css/style_admin.css" rel="stylesheet" />
<link href="css/admin.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="js/scripts.js"></script>
<script>
var chk = false;
$(document).ready(function() {
	var IMP = window.IMP; // 생략가능
	IMP.init('${impKey}');
	$("#cancel_module").click(function() {
		$.ajax({
			url : "paycan",
			data : {
				"mid" : $("#merchant_uid").val()
			},
			method : "POST",
			success : function(val) {
				console.log(val);
				if (val == 1)
					alert("취소 완료");
				else
					alert("취소 실패\n이미 취소되었거나 잘못된 정보입니다.");
			},
			error : function(request, status) {
				alert("취소가 실패하였습니다.");
			}
		});
});
$("#list_module").click(function(){
	$.ajax({
		url : "payamount",
		data : {"mid" : $("#merchant_uid").val()},
		method : "GET",
		contentType : 'application/json; charset=UTF-8',
		success : function(val) {
			console.log(val);
			$("#paylist").empty();
			if (val.msg != null) {
				$("#paylist").append(val.msg);
			} else {
				$("#paylist").append("고유ID: "+ val.imp_uid);
				$("#paylist").append("상점 거래ID: "+ val.merchant_uid);
				$("#paylist").append("주문상품: "+ val.name);
				$("#paylist").append("주문자: "+ val.buyer_name);
				$("#paylist").append("결제금액: "+ val.amount);
				$("#paylist").append("결제수단: "+ val.pay_method);
				$("#paylist").append("구매처: "+ val.pg_provider);
				$("#paylist").append("결제시각: "+ val.started_at);
				$("#paylist").append("취소시각: "+ val.cancelled_at);
			}
		},
		error : function(request, status) {
			alert("목록 가져오기를 할 수 없습니다.");
		}
	});
});
$("#all_module").click(function() {
	$.ajax({
		url : "paylist",
		method : "GET",
		contentType : 'application/json; charset=UTF-8',
		success : function(val) {
		console.log(val);
		$("#paylist").empty();
		$.each(val,function(i,v) {
			$("#paylist").append("고유ID: "+ v.imp_uid);
			$("#paylist").append("상점 거래ID: "+ v.merchant_uid);
			if (v.status == 'cancelled')
				$("#paylist").append("<span style=\"color:red;font-weight:bold;\">주문취소</span>");
			else if (v.status == 'ready')
				$("#paylist").append("<span style=\"color:pink;font-weight:bold;\">결제오류</span>");
			else if (v.status == 'failed')
				$("#paylist").append("<span style=\"color:pink;font-weight:bold;\">결제오류</span>");
			else
				$("#paylist").append("<span style=\"color:blue;font-weight:bold;\">결제완료</span>");
			$("#paylist").append("주문상품: "+ v.name);
			$("#paylist").append("주문자: "+ v.buyer_name);
			$("#paylist").append("결제금액: "+ v.amount);
			$("#paylist").append("결제수단: "+ v.pay_method);
			$("#paylist").append("구매처: "+ v.pg_provider);
			$("#paylist").append("결제시각: "+ v.started_at);
			$("#paylist").append("취소시각: "+ v.cancelled_at);
			});
		},
		error : function(request, status) {
			alert("목록 가져오기를 할 수 없습니다.");
		}
		});
	});
});

	function orderList() {
		alert('주문내역 처리할 곳. 컨트롤러 호출');
		let fm = document.fm;
		fm.action = "pay";
		fm.method = "post";
		fm.submit();
	}
</script>
</head>
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
									<div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
										<nav class="sb-sidenav-menu-nested nav">
<!-- 											<a class="nav-link" -->
<!-- 												href="/registerTerm?agree1=true&agree2=true&agreeAll=true';">회원등록</a> -->
											<a class="nav-link" href="/admin/member">회원등록</a>
											<a class="nav-link" href="/getMemberList">회원목록</a>
											<a class="nav-link" href="/getAllPayList">회원결제</a>
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
					<div class="container border-bottom border-dark">
						<h2 style="font-weight: bold;">회원결제</h2>
					</div>
					<div class="res_tbl_wrap">
						<nav id="searchNav" class="navbar navbar-expand-sm navbar-dark">
							<form class="form-inline" action="getAllPayList" method="post">
								<select class="form-control" id="sel1" name="searchCondition" style="display: inline-block !important; margin-right: 10px; appearance:auto;">
									<c:forEach items="${conditionMap}" var="option">
										<option value="${option.value}" <c:if test ="${searchCondition eq option.value}">selected="selected"</c:if>>${option.key}</option>
									</c:forEach>
								</select> <input class="form-control mr-sm-2" type="text"
									name="searchKeyword" placeholder="검색어를 입력하세요." value="${searchKeyword }">
								<button class="btn-purple" type="submit">검색</button>
							</form>
						</nav>
					</div>
					<table class="table">
							<thead>
								<tr class="text-center">
									<th>상품명</th>
									<th>금액</th>
									<th>구매자</th>
									<th>전화번호</th>
									<th>결제일시</th>
									<th>전시종료일</th>
									<th>취소여부</th>
								</tr>
							</thead>
					<tbody>
					<c:forEach items="${allPayList}" var="allPayList">
						<%-- <img src="/images/${allPayList.exh_img}" alt="이미지"
							style="width: 100px; height: 130px;"> --%>
						<tr style="cursor: pointer;" class="text-center">
						<td data-label="상품명"> ${allPayList.exh_title}</td>
						<td data-label="금액"> ${allPayList.amount}</td>
						<td data-label="구매자"> ${allPayList.buyer}</td>
						<td data-label="전화번호"> ${allPayList.buyer_tel}</td>
						<td data-label="결제일시"> ${allPayList.p_date}</td>
						<%-- 결제고유ID : ${allPayList.p_id}<br> --%>
				<%-- 		상점거래ID : ${allPayList.p_mer}<br> --%>
						<td data-label="전시 종료일">${allPayList.exh_end_date}</td>
						<%-- 	환불 여부 : ${myPayList.p_chk}<br> --%>
						<td data-label="취소여부">
						<c:set var="today" value="<%=new java.util.Date()%>" />
						<c:set var="sysYear">
							<fmt:formatDate value="${today}" pattern="yyyy-MM-dd" />
						</c:set>
						<form action="paycan" method="POST">
							<input type="hidden" name="mid" id="merchant_uid" value="${allPayList.p_mer}">
							<c:if test="${allPayList.exh_end_date < sysYear}">
								<button class="btn btn-outline-danger" onclick="" type="button">종료된
									전시</button>
							</c:if>

							<c:if test="${allPayList.exh_end_date > sysYear}">
								<c:choose>
									<c:when test="${allPayList.p_chk eq 0}">
										<button id="cancel_module" type="submit" class="btn-cancel">취소하기</button>
									</c:when>
									<c:otherwise>
										<button type="button" class="btn btn-outline-success">환불완료</button>
									</c:otherwise>
								</c:choose>
							</c:if>
						</form>
						</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
					<!-- 		반복처리할 태그 시작 -->
					<div class="container">
			<div id="btnBox_parent">
				<div id="btnBox"  style="text-align:center;">
								<!-- 		맨처음 -->
								<c:if test="${paging.nowPageBtn > 1 }">
									<a href="getAllPayList?nowPageBtn=1&searchKeyword=${searchKeyword }&searchCondition=${searchCondition }">&laquo;</a>
								</c:if>
								<c:if test="${paging.nowPageBtn > 1 }">
									<a  href="getAllPayList?nowPageBtn=${paging.nowPageBtn-1}&searchKeyword=${searchKeyword }&searchCondition=${searchCondition }">&lt;</a>
								</c:if>

								<!-- 반복처리 태그 -->
								<c:forEach begin="${paging.startBtn}" end="${paging.endBtn }" step="1" var="i">
									<c:choose>
										<c:when test="${paging.nowPageBtn==i}">
											<a style="font-weight:400; color:#7832f7;" href="getAllPayList?nowPageBtn=${i}&searchKeyword=${searchKeyword }&searchCondition=${searchCondition }">${i}</a>
										</c:when>
										<c:otherwise>
											<a  href="getAllPayList?nowPageBtn=${i}&searchKeyword=${searchKeyword }&searchCondition=${searchCondition }">${i}</a>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<!-- 		반복 끝 -->
								<c:if test="${paging.nowPageBtn < paging.totalBtnCnt }">
									<a href="getAllPayList?nowPageBtn=${paging.nowPageBtn+1}&searchKeyword=${searchKeyword }&searchCondition=${searchCondition }">&gt;</a>
								</c:if>
								<!-- 		맨끝 -->
								<c:if test="${paging.nowPageBtn < paging.totalBtnCnt }">
									<a href="getAllPayList?nowPageBtn=${paging.totalBtnCnt}&searchKeyword=${searchKeyword }&searchCondition=${searchCondition }">&raquo;</a>
								</c:if>
					</div>
					</div>
					</div>
			<!-- 		반복처리할 태그 끝 -->
					<div id="footer"></div>
				</div>
			</div>
		</section>
	</div>
</body>
</html>
