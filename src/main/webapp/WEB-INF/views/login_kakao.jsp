<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<title>Home</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
</head>
  <body>
  <c:choose>
  <c:when test="${kakaoInfo.msg eq NULL}">
	<ul>
	    <li onclick="kakaoLogin();">
	      <a href="javascript:void(0)">
	          <span>카카오 로그인</span>
	      </a>
	    </li>
	</ul>
  </c:when>
  <c:otherwise>
  	<ul>
	    <li onclick="kakaoLogout();">
	      <a href="javascript:void(0)">
	          <span>카카오 로그아웃</span>
	      </a>
	    </li>
	</ul>
  </c:otherwise>
  </c:choose>
  <script>
  //카카오 로그인
  function kakaoLogin() {
	  location.href = "/getAuthUrl";
//     $.ajax({
//         url: '/getAuthUrl',
//         type: 'get',
//         async: false,
//         dataType: 'text',
//         success: function (res) {
//             location.href = res;
//         }
//     });

  }
  //카카오 로그아웃
  function kakaoLogout() {
    $.ajax({
        url: '/logOutUrl',
        type: 'get',
        async: false,
        dataType: 'text',
        success: function (res) {
            location.href = res;
        }
    });

  }

  </script>
  <c:choose>
	  <c:when test="${kakaoInfo.msg eq NULL}">
	  	데이터가 없습니다.
	  </c:when>
	  <c:otherwise>
	  	accessToken :  ${kakaoInfo.accessToken}<br>
	  	id :  ${kakaoInfo.id}<br>
	  	nickname :  ${kakaoInfo.nickname}<br>
	  	email :  ${kakaoInfo.email}<br>
	  	gender :  ${kakaoInfo.gender}<br>
	  	connected_at :  ${kakaoInfo.connected_at}<br>
	  </c:otherwise>
  </c:choose>
  
  </body>
</html>