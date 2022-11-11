<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ include file="../../header.jsp" %> --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>관리자 모드</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<link href="css/style_admin.css" rel="stylesheet" />
<link href="css/admin.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	crossorigin="anonymous"></script>
<script src="js/scripts.js"></script>
</head>
<script>
   function getone(val){
   location.href="getOne?one_no="+val;

 }
   function f_write(val){
    console.log(val);
    if(val == ''){
        alert("로그인이 되야 작성 가능합니다");
        location.href="/getOneList";
    }else{
        location.href="/goWrite";
    }
 }
</script>
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
					<div class="container">
						<h2 style="text-align: center; font-weight: bold;">1대1문의</h2>
					</div>
						<div class="res_tbl_wrap">
   <nav id="searchNav" class="navbar navbar-expand-sm sub_title" style="border-bottom: none;">
      <form class="form-inline" action="getOneList" method="post">
          <input class="form-control mr-sm-2" type="text" name="searchKeyword"
            placeholder="검색어를 입력하세요.">
         <button class="btn btn-success" type="submit" style="border-radius:4px">검색</button>
      </form>
   </nav>
   <div class="container-fluid">
      <table class="table table-hover">
         <thead class="btn-primary">
            <tr>
               <th style="width:10%; text-align:center;">번호</th>
               <th style="width:50%; text-align:center;">제목</th>
               <th style="width:20%; text-align:center;">작성자</th>
               <th style="width:20%; text-align:center;">등록일</th>
               
            </tr>
         </thead>
         <tbody>

            <c:forEach items="${oneList}" var="one">
               <c:if test="${one.one_secret eq 'true'}">
               <c:choose>
               <c:when test="${one.one_writer eq mb_Id || mb_Id eq 'admin'}">
               
               <tr onclick="getone(${one.one_no})" style="cursor: pointer;" onmouseover="this.style.fontWeight='bold'" onmouseout="this.style.fontWeight=''">
                <td onclick="getone(${one.one_no})" style="cursor: pointer" class="tdCenter">${one.one_no}</td>
                <td class="tdCenter">${one.one_title }<i class = "xi-lock-o" style="padding-top:px; font-size: 17.5px; cursor:pointer;"></i></td>
                <td class="tdCenter">${one.one_writer }</td>
                <td class="tdCenter"><fmt:formatDate value="${one.one_date}" pattern="yyyy-MM-dd HH:mm-ss" var="today" />${today}</td>
                     
                     </c:when>
                     <c:otherwise>
                     
                        <tr><td class="tdCenter" >${one.one_no}</td>
                           <td class="tdCenter aa">비밀게시글은 작성자와 관리자만 볼 수 있습니다.<i class = "xi-lock-o" style="padding-top:px; font-size: 17.5px; cursor:pointer;"></i></td>
                           <td class="tdCenter">${one.one_writer }</td>
                           <td class="tdCenter"><fmt:formatDate value="${one.one_date}" pattern="yyyy-MM-dd HH:mm-ss" var="today" />${today}</td>
                        </tr>
                     </c:otherwise>
                  </c:choose>

               </c:if>

               <c:if test="${one.one_secret eq 'false'}">

                  <tr onclick="getone(${one.one_no})" style="cursor: pointer;" onmouseover="this.style.fontWeight='bold'" onmouseout="this.style.fontWeight=''">
                     <td class="tdCenter">${one.one_no}</td>
                     <td class="tdCenter">${one.one_title}</td>
                     <td class="tdCenter">${one.one_writer}</td>
                     <td class="tdCenter"><fmt:formatDate value="${one.one_date}" pattern="yyyy-MM-dd HH:mm-ss" var="today" />${today}</td>
                  </tr>

               </c:if>

            </c:forEach>
         </tbody>
      </table>
      
            <button class="write" onclick="f_write('${mb_Id}')" style="cursor:pointer" ">글쓰기</button>
      <br>
      <br>
      <div id="btnBox_parent">
      <div id="btnBox">
         <!-- 반복처리할 태그 시작-->
         <c:if test="${paging.nowPageBtn > 1 }">
            <a href="getOneList?nowPageBtn=${paging.nowPageBtn -1 }">&lt;</a>
         </c:if>
         <c:forEach begin="${paging.startBtn}" end="${paging.endBtn }"
            step="1" var="i">
            <c:choose>
               <c:when test="${paging.nowPageBtn == i}">
                  <a class="aSel">${i}</a>
               </c:when>
               <c:otherwise>
                  <a href="getOneList?nowPageBtn=${i}"><Strong>${i}</Strong></a>
               </c:otherwise>
            </c:choose>
         </c:forEach>
         <c:if test="${paging.nowPageBtn < paging.totalBtnCnt }">
            <a href="getOneList?nowPageBtn=${paging.nowPageBtn +1 }">&gt;</a>
         </c:if>
         <!-- 반복처리할 태그 끝 -->
      </div>
      <br>
      <br>

           
   </div>
      <br>
      <br>

   
   </div>
</div>
</div>
</div>
</section>
</div>


</body>
</html>