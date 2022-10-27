<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../../header.jsp"%>
<style>
.login-kakao{
border:0;
background-color:transparent;
}

</style>
	<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<div class="jumbotron">
   <h1>로그인</h1>      
</div>
	<div class="container" align="center">
		<div class="col-md-4 col-md-offset-4">
			<h3 class="form-signin-heading">로그인</h3>
			<%
				if (request.getParameter("error")!=null) {
					out.println("<div class='alert alert-danger'>");
					out.println("아이디와 비밀번호를 확인해 주세요");
					out.println("</div>");
				}
			%>
			<form class="form-signin" action="login" method="post">
				<div class="form-group">
					<label for="inputUserName" class="sr-only">User Name</label>
<!-- 					name속성(파라미터) 있어야 데이터 전송됨  -->
					<input type="text" class="form-control" placeholder="ID" name="mb_id" required autofocus>
				</div>
				<div class="form-group">
					<label for="inputPassword" class="sr-only">Password</label> 
					<input type="password" class="form-control" placeholder="Password" name="mb_pw" required>
				</div>
				<button class="btn btn btn-lg btn-success btn-block" type="submit">로그인</button>
			</form>
		</div>
	</div>
<!-- 	<button class="login-kakao"onclick="kakaoLogin()">
	<img src="images/kakao_login_medium_narrow.png" style="height:60px"/>
	</button> -->
	
 <c:choose>
 	<c:when test='${userId ne NULL}' >
 		<ul class="navbar-nav nav-right">    
		    <li class="nav-item"><a class="nav-link">${userId}님</a></li>
		    <li class="nav-item">
		      <a class="nav-link" href="logout">로그아웃</a>
		    </li>
		  </ul>
 	</c:when>
 	<c:otherwise>
 		<a href="login_kakao"><img src="images/kakao_login_medium_narrow.png" style="height:60px"/></a>
 	</c:otherwise>
 </c:choose>
 
	  <a href="/oauth/authorization/naver">네이버 로그인</a>
</body>
</html>