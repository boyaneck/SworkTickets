<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
	<c:choose>
		<c:when test="${naverInfo.msg eq NULL}">
			<ul>
				<li onclick="naverLogin();"><a href="javascript:void(0)"> <span>네이버로그인</span>
				</a></li>
			</ul>
		</c:when>
		<%--  <c:otherwise>
  	<ul>
	    <li onclick="naverLogout();">
	      <a href="javascript:void(0)">
	          <span>카카오 로그아웃</span>
	      </a>
	    </li>
	</ul>
  </c:otherwise> --%>
	</c:choose>
	<script>
  //카카오 로그인
  function naverLogin() {
	  location.href = "/getAuthUrl";
//     $.ajax({
//         url: '/getAuthUrl',
//         type: 'get',
//         async: false,
//         dataType: 'text',
//         success: function (res) {
//         	console.log(res);
//             location.href = res;
//         }
//     });

  }
</script>
	<c:choose>
		<c:when test="">
			<!-- 로그인 완료 후 -->
			<c:when test="${naverInfo.msg eq NULL}">
	  	데이터가 없습니다.
	  </c:when>

		</c:when>
		<c:otherwise>
			<form action="login_naver" method="post" name="frm"
				style="width: 470px;">
				<h2>로그인</h2>
				<input type="text" name="mb_id" id="mb_id"
					class="w3-input w3-border" placeholder="아이디" value="${id}">
				<br> <input type="password" id="mb_pw" name="mb_pw"
					class="w3-input w3-border" placeholder="비밀번호"> <br> <input
					type="submit" value="로그인" onclick="#"><br>
			</form>
			<br>
			<!-- 네이버 로그인 창 -->
			<div id="naver_id_login" style="text-align: center">
				<a href="${url}"> <img width="223"
					src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png" /></a>
			</div>
			<br>

		</c:otherwise>
	</c:choose>
</body>
</html>