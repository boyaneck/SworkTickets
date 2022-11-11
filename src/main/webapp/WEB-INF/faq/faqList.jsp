<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../header.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
/* Custom style */
.accordion-button:not(.collapsed) {
	padding:60px;
	
    color: white;
    background-color: #cdb3fc !important;
    box-shadow: inset 0 -1px 0 rgb(0 0 0 / 13%);
}
    .accordion-button::after {
    
      background-image: url("data:image/svg+xml,%3csvg viewBox='0 0 16 16' fill='%23333' xmlns='http://www.w3.org/2000/svg'%3e%3cpath fill-rule='evenodd' d='M8 0a1 1 0 0 1 1 1v6h6a1 1 0 1 1 0 2H9v6a1 1 0 1 1-2 0V9H1a1 1 0 0 1 0-2h6V1a1 1 0 0 1 1-1z' clip-rule='evenodd'/%3e%3c/svg%3e");
      transform: scale(.7) !important;
    }
    .accordion-button:not(.collapsed)::after {
      background-image: url("data:image/svg+xml,%3csvg viewBox='0 0 16 16' fill='%23333' xmlns='http://www.w3.org/2000/svg'%3e%3cpath fill-rule='evenodd' d='M0 8a1 1 0 0 1 1-1h14a1 1 0 1 1 0 2H1a1 1 0 0 1-1-1z' clip-rule='evenodd'/%3e%3c/svg%3e");
    }
    
   .accordion-item{
   
   font-size:20px !important;
   border-left:none !important;
   border-right:none !important;
   width:65% !important;
   margin-left:280px !important;
   
   }
   .accordion-item:hover{
   background-color: #f9fafa !important;
   }
   .board > h1{
   
   font-size:50px;
   
   }
   .title{
   font-weight:bold;
   font-size:22px;
   }
   
</style>
<script>

function getfaq(val){
   location.href="getFaq?faq_no="+val;

}
function f_write(val){
    console.log(val);
    if(val == ''){
        alert("로그인이 되야 작성 가능합니다");
        location.href="/getFaqList";
    }else{
        location.href="/goWriteFaq";
    }
}
</script>
<body>
<<<<<<< HEAD
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
						<h2 style="text-align: center; font-weight: bold;">FAQ</h2>
					</div>
<!--    <div class="board"> -->
<!--       <h1>FAQ</h1> -->
<!--    </div> -->
   <%-- <%@ include file="../../menu.jsp" %> --%>
   <nav id="searchNav" class="sub_title">
      <form class="form-inline" action="getOneList.do" method="post">
         <select class="form-control" id="sel1" name="searchCondition"
            style="display: inline-block !important; margin-right: 10px;">
            <c:forEach items="${conditionMap}" var="option">
               <option value="${option.value}">${option.key}</option>
            </c:forEach>
            <%--       <option value="${conditionMap['제목']}">${conditionMap['제목']}</option> --%>
            <%--       <option value="${conditionMap['내용']}">${conditionMap['내용']}</option> --%>
         </select> <input class="form-control mr-sm-2" type="text" name="searchKeyword"
            placeholder="검색어를 입력하세요.">
         <button class="btn btn-success" type="submit">검색</button>
      </form>
   </nav>
   <div class="container-fluid">
      <table class="table table-hover">
         <thead class="btn-primary">
            <tr>
               
               <th>번호</th>
               <th>제목</th>
               <th>카테고리</th>
               <th>등록일</th>
               
            </tr>
         </thead>
         <tbody>

            <c:forEach items="${faqList}" var="faq">
<%--                <c:if test="${one.one_secret eq 'true'}"> --%>
<%--                   <c:choose> --%>
<%--                      <c:when --%>
<%--                         test="${one.one_writer eq mb_Id || mb_Id eq 'admin'}"> --%>
<!--                         <tr> -->
<%--                            <td onclick="getone(${one.one_no})" --%>
<%--                               style="cursor: pointer">${one.one_no}</td> --%>
<%--                            <td>${one.one_title }</td> --%>
<%--                      </c:when> --%>
<%--                      <c:otherwise> --%>
<!--                         <tr> -->
<!--                            <td>비밀게시글은 작성자와 관리자만 볼 수 있습니다.</td> -->
<!--                         </tr> -->
<%--                      </c:otherwise> --%>
<%--                   </c:choose> --%>

<%--                </c:if> --%>

<%--                <c:if test="${one.one_secret eq 'false'}"> --%>

<%--                   <tr onclick="getfaq(${faq.faq_title})" style="cursor: pointer;"> //faq_no 칼럼 추가 예정 --%>
<%--                      <td class="tdCenter">${one.one_no}</td> --%>
                     <tr onclick="getfaq(${faq.faq_no})" style="cursor: pointer;">
                     <td class="tdCenter" style="width:10%;" >${faq.faq_no}</td>
                     <td class="tdCenter" style="width:60%;"  onclick="getfaq(${faq.faq_no}")">${faq.faq_title}</td>
                     <td class="tdCenter" style="width:15%;" >${faq.cate_name}</td>
                     
<%--                      <td class="tdCenter">${faq.faq_reg}</td> --%>
                     <td class="tdCenter" style="width:15%;" ><fmt:formatDate value="${faq.faq_reg}" pattern="yyyy-MM-dd HH:mm-ss" var="today" />${today}</td>
<%--                      <td class="tdCenter">${faq.faq_content}</td> --%>
   
                  </tr>

<%--                </c:if> --%>

            </c:forEach>
         </tbody>
      </table>
      <div>
      <button class="write" onclick="f_write('${mb_Id}')" style="cursor:pointer">글쓰기</button>
      </div>
      </div>
      <div id="btnBox_parent">
      <div id="btnBox">
         <!-- 반복처리할 태그 시작-->
         <c:if test="${paging.nowPageBtn > 1 }">
            <a href="getFaqList?nowPageBtn=${paging.nowPageBtn -1 }">&lt;</a>
         </c:if>
         <c:forEach begin="${paging.startBtn}" end="${paging.endBtn }"
            step="1" var="i">
            <c:choose>
               <c:when test="${paging.nowPageBtn == i}">
                  <a class="aSel">${i}</a>
               </c:when>
               <c:otherwise>
                  <a href="getFaqList?nowPageBtn=${i}">${i}</a>
               </c:otherwise>
            </c:choose>
         </c:forEach>
         <c:if test="${paging.nowPageBtn < paging.totalBtnCnt }">
            <a href="getFaqList?nowPageBtn=${paging.nowPageBtn +1 }">&gt;</a>
         </c:if>
         <!-- 반복처리할 태그 끝 -->
      </div>
      <br>
      <br>

      <%--   <c:if test="${session.getAttribute(mb_id) !==  --%>
      <%--   <div id="footer"> --%>
           
=======
   <div class="board">
      <h1>FAQ</h1>
>>>>>>> origin/jin
   </div>
 
 
<div class="m-4">
<c:forEach items="${faqList}" var="faq">

    <div class="accordion" id="myAccordion">
        <div class="accordion-item" >
        
            <h1 class="accordion-header" id="headingOne">
            
                <button type="button"  style="padding:40px; "  class="accordion-button collapsed title" data-bs-toggle="collapse" data-bs-target="#collapseOne${faq.faq_no }">Q. ${faq.faq_title}</button>									
            </h1>
            <div id="collapseOne${faq.faq_no }" class="accordion-collapse collapse panel-violet" data-bs-parent="#myAccordion">
                <div class="card-body">
                <div>
                    <p><strong>${faq.faq_content} </strong></p>
                    <fmt:formatDate value="${faq.faq_reg}" pattern="yyyy-MM-dd HH:mm-ss" var="today" />${today}

                </div>
                     
                </div> 
               
            </div>
        </div>
    </div>
    </c:forEach>
</div>





</body>
</html>