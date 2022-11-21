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
<link href="../css/style_admin.css" rel="stylesheet" />
<link href="../css/admin.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="../js/scripts.js"></script>
<script>
//유효성 검사
function validate() {
//  var mb_id = document.getElementById("mb_id");
 var mb_pw = document.getElementById("mb_pw");
 var mb_name = document.getElementById("mb_name");
 var mb_phone = document.getElementById("mb_phone");
 var mb_email = document.getElementById("mb_email");
 
//   if (document.insertMember.mb_id.value == "") {
//     alert("아이디를 입력하세요");
//  }
  if (document.insertMember.mb_pw.value == "") {
    alert("비밀번호를 입력하세요");
    return false;
 }
  if (document.insertMember.mb_name.value == "") {
    alert("이름을 입력하세요");
    return false;
 }
  if (document.insertMember.mb_phone.value == "") {
    alert("휴대번호를 입력하세요");
    return false;
  }else{
     if(!phone_chk(document.insertMember.mb_phone.value)){
       alert("번호를 형식에 맞게 입력하세요");
       return false;
     }
  }
  if(document.insertMember.mb_email.value == ""){
     alert("이메일을 입력하세요");
     return false;
  }else{
     if(!email_chk(document.insertMember.mb_email.value)) {
        alert("이메일을 형식에 맞게 입력하세요");
        return false;
     }
  }
}


function email_chk(obj){
  var regex=/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
  return (regex.test(obj));
}

function phone_chk(obj){
  var regex=/^01([0|1|6|7|8|9])?([0-9]{3,4})?([0-9]{4})$/i;
  return (regex.test(obj));
}


function numberMaxLength(e){
  if(e.value.length > e.maxLength){
      e.value = e.value.slice(0, e.maxLength);
  }
}
</script>
</head>
<body>
	<div>
		<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
			<!-- Navbar Brand-->
			<a class="navbar-brand logoimg" href="../index.jsp" style="text-align: center;"> <img style="width: 140px;" src="../images/logo.png">&nbsp&nbsp
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
						<nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion" style="height: 1050px;">
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
											<a class="nav-link" href="/insertmoveExhibition">전시등록</a>
											<a class="nav-link" href="/getExhibitionList">전시목록</a>
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
											<a class="nav-link" href="/admin/CouponList">쿠폰목록</a>
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
											<a class="nav-link" href="/getBoardList">공지사항</a>
											<a class="nav-link" href="/adminFaqList">FAQ</a>
											<a class="nav-link" href="/getOneList">1:1 문의</a>
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
			<h2 style="font-weight: bold;">회원등록</h2>
		</div>
<!-- 		<div class="res_tbl_wrap"> -->
<!-- 			<nav id="searchNav" class="navbar navbar-expand-sm navbar-dark"> -->
<!-- 				<form class="form-inline" action="getAllPayList" method="post"> -->
<!-- 					<select class="form-control" id="sel1" name="searchCondition" style="display: inline-block !important; margin-right: 10px; appearance:auto;"> -->
<%-- 						<c:forEach items="${conditionMap}" var="option"> --%>
<%-- 							<option value="${option.value}">${option.key}</option> --%>
<%-- 						</c:forEach> --%>
<!-- 					</select> <input class="form-control mr-sm-2" type="text" -->
<!-- 						name="searchKeyword" placeholder="검색어를 입력하세요."> -->
<!-- 					<button class="btn-purple" type="submit">검색</button> -->
<!-- 				</form> -->
<!-- 			</nav> -->
<!-- 		</div> -->
		<div class="container">
			<div class="form-body">
				<div class="row" style="text-align: -webkit-center;">
					<div class="form-holder">
						<div class="form-content">
							<div class="form-items">
							<!--                      <form class="requires-validation" action="insertMember" name="insertMember" method="post"> -->
							<form action="/admin/insertMember" name="insertMember" method="post" onSubmit="return validate()">
								<div class="col-md-3 mt-3">
									<input type="text" class="form-control form-control-sm" name="mb_id" id="mb_id" placeholder="아이디" maxlength="12" minlength="8" pattern="^[0-9|a-z|A-Z|]*$" required>
									<!-- <button type="button" id="idChk" name="idChk" onclick='chkBtn()'>중복확인</button> -->
<!-- 									<span class="id_notice">아이디는 영문과 숫자로만 입력해주세요.</span> -->
									<div class="valid-feedback">유효한아이디입니다.</div>
									<div class="invalid-feedback">공백없이 입력해주세요</div>

								</div>
								<div class="col-md-3 mt-3">
									<input type="password" class="form-control form-control-sm" name="mb_pw" placeholder="패스워드" maxlength="20" minlength="8" pattern="^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^&*()_-+=[]{}~?:;`|/]).{6,50}$"
										required>
									<div class="valid-feedback">사용할 수 있는 패스워드입니다.</div>
									<div class="invalid-feedback">패스워드가 적합히 입력해주세요</div>
								</div>
								<div class="col-md-3 mt-3">
									<input type="text" class="form-control form-control-sm" name="mb_name" placeholder="이름" maxlength="5" minlength="2" required>
									<!--                            <div class="valid-feedback">사용할 수 있는 패스워드입니다.</div>
                           <div class="invalid-feedback">패스워드가 적합히 입력해주세요</div>
 -->
								</div>
								<div class="col-md-3 mt-3">
									<tr class="mobileNo">
<!-- 										<th><label for="phone">휴대폰 번호</label></th> -->
										<td>
											<p>
												<input class="form-control form-control-sm" id="mb_phone" type="text" name="mb_phone" title="전화번호 입력" placeholder="전화번호 입력" maxlength="11" minlength="10"
													oninput="numberMaxLength(this);" required />
											</p>
										</td>
									</tr>
								</div>
								<div class="col-md-3 mt-3">
<!-- 									<div id="menu-text">E-mail 인증</div> -->
									<input class="form-control form-control-sm" id="mb_email" class="text_box" type="email"
										name="mb_email" placeholder="이메일 입력" maxlength="50"	autofocus>
									<!--                            <button type="button" id="sendMail" -->
									<!--                               class="btn btn-primary btn-sm">발송하기</button> -->
									<!--                            <div class="text_box" id="cert"> -->
									<!--                               <input id='emailCheck' class='text_box' type='text' required -->
									<!--                                  disabled> -->
									<!--                               <button type="button" id='check' -->
									<!--                                  class='btn btn-primary btn-sm' -->
									<!--                                  onclick='qweemailCheck(); return false;'>인증확인</button> -->
									<!--                            </div> -->
								</div>

								<div class="mx-auto mt-3" id="footer">
									<button id="conRegister" type="submit" class="btn-purple">회원등록</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
					
					
				</div>
			</div>
		</section>
	</div>
</body>
</html>
