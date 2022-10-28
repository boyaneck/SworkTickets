<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
	<title>관리자 상세보기-${exhibition.exh_title}</title>
</head>
<body>
<style>
</style>
<br><br><br>
<div class="jumbotron">
        <h1>${exhibition.exh_title}</h1>
        <h5>${exhibition.exh_st_date} ~ ${exhibition.exh_end_date}</h5>
        <h6>${exhibition.exh_hall}</h6>
</div>
<p>작가 ${exhibition.exh_artist}</p>
<p>관람등급 ${exhibition.exh_rating}</p>
<p>관람시간 ${exhibition.exh_time}</p>
<p>발권정보 ${exhibition.exh_shipping_info}</p>
<p>예매수수료 <fmt:formatNumber value="${exhibition.exh_fee}" groupingUsed="true" />원</p>
<p>가격 <fmt:formatNumber value="${exhibition.exh_price}" groupingUsed="true" />원</p>
   <div id="footer">
			<a href="WEB-INF/admin/ExhibitionInsert.jsp"><button type="button" class="btn btn-primary">수정하기</button></a>
			<button type="button" class="btn btn-primary">삭제하기</button>
		</div>
</body>
</html>
