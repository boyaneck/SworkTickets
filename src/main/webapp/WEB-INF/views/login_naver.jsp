<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<style>
#naver_id_login:hover {cursor:pointer;}
#logOutBtn { font-weight:bold;text-decoration: none; display: inline-block; padding:15px 30px; background-color:darkgreen;color: #fff; border-radius:5px;}
</style>

<script>
function nBtn(){
	location.href = "/getNaverAuthUrl?inout=1";
}
</script>
</head>
<body>


<%
HashMap<String, Object> memberInfo = (HashMap<String, Object>) request.getAttribute("naverLogin");
if(memberInfo!=null){%>
<a href="/naverLogout" id="logOutBtn">로그아웃</a>
<%}else{%>
<div id="naver_id_login" onclick="nBtn()"><img src="${pageContext.request.contextPath}/images/naver.png"></div>
<%} %>
</body>
</html>