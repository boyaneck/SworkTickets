<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뉴전시스</title>
<%@ include file="header.jsp"%>
<style>
.a_oth {
	text-decoration: none;
	color: #000;
	font-size: 13px;
}

.a_oth:hover {
	text-decoration: none;
	color: #000;
	font-size: 14px;
}

.logo {
	margin: 20px;
}

.btn-login {
	background-color: #7329f7;
	width: 100%;
	border: none;
	color: white;
	padding: 5px;
	height: 40px;
}
.popup {

    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-40%, -50%);
}
@media (max-width: 768px) {
 .col-4{
 padding: 0;
 }
}
</style>
</head>
<body class="d-flex flex-column min-vh-100">

	<div class="container d-flex justify-content-center" >
		<div class="row  d-flex justify-content-center" style="margin-top: 50px;" >
		
			  <div class="col-xl-10 col-lg-12 col-md-9" style="margin: 0 auto;">		  
				<div class="card o-hidden border-0 shadow-lg my-5">
						<div class="card-body p-0">
								  <div class="row" style="margin: 0 auto;">
					    <div class="col-lg-5 d-none d-lg-block bg text-center">
					      <img class="popup" src="./images/logo.png">
					    </div>
						<div class="col-lg-7 ">
							<div class="p-4 text-center ">
								<div >
									<h1 class="h4 text-gray-900 md-4">로그인</h1>
								</div>
								<%
								if (request.getParameter("error") != null) {
									out.println("<div class='alert alert-danger'>");
									out.println("아이디와 비밀번호를 확인해 주세요");
									out.println("</div>");
								}
								%>
								<form class="form-signin" action="logincheck" method="post">
									<div class="form-group">
										<label for="inputUserName" class="sr-only">User Name</label>
										<!-- 					name속성(파라미터) 있어야 데이터 전송됨  -->
										<input type="text" class="form-control" placeholder="아이디"
											name="mb_id" autofocus>
									</div>
									<div class="form-group">
										<label for="inputPassword" class="sr-only">Password</label> <input
											type="password" class="form-control" placeholder="비밀번호"
											name="mb_pw">
									</div>

									<div class="form-group">
										<button class="btn-login btn-block" type="submit">로그인</button>
									</div>


								</form>

								<div class="row text-center otherBox">
									<div class="col-4 ">
										<a class="a_oth" href="/step1">회원가입 </a>
									</div>
									<div class="col-4">
										<a class="a_oth" href="/findIdform">아이디찾기</a>
									</div>
									<div class="col-4">
										<a class="a_oth" href="/findPwform">비밀번호찾기</a>
									</div>
								</div>

								<div class="row text-center otherBox">
									<div class="col">
										<img class="logo" onclick="location.href='/getAuthUrl'" src="images/KakaoTalk_login.png" style="height: 30px; cursor: pointer;"> 
										<img class="logo" onclick="location.href='/getNaverAuthUrl'" src="images/Naver_login.png" style="height: 30px; cursor: pointer;">
									</div>


								</div>


							</div>
						</div>
					</div>
					</div>
					</div>
				</div>
			</div>

<!-- 		</div> -->

	</div>

	<%@ include file="footer.jsp"%>
</body>
</html>