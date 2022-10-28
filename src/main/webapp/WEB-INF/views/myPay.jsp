<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<%@ include file="/header.jsp"%>
</head>
<body>
	<h2>나의 결제 내역</h2>
	<br>
	<c:forEach items="${myPayList}" var="myPayList">
	상품명: ${myPayList.exh_title} <br>
	금액: ${myPayList.amount}<br>
	구매자 : ${myPayList.buyer}<br>
	전화번호 : ${myPayList.buyer_tel}<br>
	결제일시 : ${myPayList.p_date}<br>
	결제고유ID : ${myPayList.p_id}<br>
	상점거래ID : ${myPayList.p_mer}<br>

		<form action="paycan" method="POST">
			<input type="hidden" name="mid" id="merchant_uid" value="${myPayList.p_mer}">
			<button id="cancel_module" type="submit">취소하기</button>
		</form>
		<hr>
		<!-- 	이메일: <input type="hidden" name="buyer_email" id="buyer_email" placeholder="이메일 입력"><br> -->
		<!-- 	주소: <input type="text" name="uaddr" id="uaddr" placeholder="주소 입력"><br> -->
		<!-- 	회원아이디<input type="text" name="mb_id" id="mb_id" readonly="readonly" disabled="disabled"> -->
	</c:forEach>


</body>
</html>