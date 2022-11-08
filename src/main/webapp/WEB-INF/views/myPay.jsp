<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<%@ include file="../../header.jsp"%>
<style>
.row{margin-top: 20px;}
.btn1{
	height: 38px;
	color: #7329f7; 
	background-color: white; 
	border-color: #7329f7; 
	border: solid 1px;
}
</style>
</head>
<body class="d-flex flex-column min-vh-100">
	<!-- 타이틀 -->
	<div class="container"
		style="width: 50%; padding: 30px;">
		<h2 style="text-align: center; font-weight: bolder; padding: 30px 0;">결 제 내 역</h2>
	
	<nav id="searchNav" class="navbar navbar-expand-sm navbar-dark" style="-webkit-justify-content: flex-end; padding-bottom: 20px;">
			<form class="form-inline" action="getPayList" method="post">
				<select class="form-control" id="sel1" name="searchCondition"
					style="display: inline-block !important; margin-right: 10px;">
					<c:forEach items="${conditionMap}" var="option">
						<option value="${option.value}">${option.key}</option>
					</c:forEach>
				</select> <input class="form-control mr-sm-2" type="text"
					name="searchKeyword" placeholder="검색어를 입력하세요.">
				<button class="btn1" type="submit">검색</button><br>
			</form>
		</nav>
	
	
	
	<c:forEach items="${myPayList}" var="myPayList">
	<div class="row">
	<div class="col-3">
	<img src="/images/${myPayList.exh_thumbnail }" alt="이미지" style="width:200px; height: 300px;">
	</div>
	<div class="col-6" style="line-height: 200%;">
	<h4>${myPayList.exh_title}</h4>
	금액 : ${myPayList.amount}<br>
	구매자 : ${myPayList.buyer}<br>
	전화번호 : ${myPayList.buyer_tel}<br>
	결제일시 : ${myPayList.p_date}<br>
<%-- 	결제고유ID : ${myPayList.p_id} --%>
<%-- 	상점거래ID : ${myPayList.p_mer} --%>
	전시 종료일 : ${myPayList.exh_end_date}
	</div>
<%-- 	환불 여부 : ${myPayList.p_chk}<br> --%>
<div class="col-3 align-self-center">
				<c:set var="today" value="<%=new java.util.Date()%>"/>
		<c:set var="sysYear"> <fmt:formatDate value="${today}" pattern="yyyy-MM-dd" /></c:set>
		<form action="paycan" method="POST" style="text-align: right;">
			<input type="hidden" name="mid" id="merchant_uid"
				value="${myPayList.p_mer}">
				
				<c:if test="${myPayList.exh_end_date < sysYear}">
					<button class="btn btn-outline-aqua" onclick="" type="button">종료된 전시</button>
					
					</c:if>
				
				<c:if test="${myPayList.exh_end_date > sysYear}">
				<c:choose>
					<c:when test="${myPayList.p_chk eq 0}">
						<button id="cancel_module" type="submit" class="btn btn-outline-danger">취소하기</button>
					</c:when>
					<c:otherwise>
						<button type="button" class="btn btn-outline-success">환불완료</button>
					</c:otherwise>
				</c:choose>
				</c:if>
		</form>
</div>
		</div>
		<hr style="margin: 30px 0;">
	</c:forEach>
</div>
</body>
</html>