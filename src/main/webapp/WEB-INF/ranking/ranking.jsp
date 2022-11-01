<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전시 목록</title>
<!-- header -->
<%@ include file="/header.jsp"%>
<!-- header end -->
<style>
</style>

<body>
	<div class="jumbotron">
		<h1>전시 랭킹</h1>
	</div>

	<div class="container-fluid">
		<table class="table table-hover">
			<thead class="btn-primary">
				<tr>
					<th>번호</th>
					<th>전시명</th>
					<th>가격</th>
					<th>전시일자</th>
					<th>장소</th>
					<th>좋아요 수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${getGoodList}" var="getGoodList">
					<tr onclick="selTr(${getGoodList.exh_no})" style="cursor: pointer;">
						<td class="tdCenter">${exhibition.exh_no}</td>
						<td><a href="getUserExhibition?exh_no=${getGoodList.exh_no}">
						${getGoodList.exh_title}
						</a></td>
						<td class="tdCenter"><fmt:formatNumber value="${getGoodList.exh_price}" groupingUsed="true" />원</td>
						<td class="tdCenter">${getGoodList.exh_st_date}~
							${getGoodList.exh_end_date}</td>
						<td class="tdCenter">${getGoodList.exh_hall}</td>
						<td class="tdCenter"> 
						<c:choose>
						<c:when test="">
						<button id="good_pick" type="button" onclick="location.href='/good_pick?exh_no=${getGoodList.exh_no}'">♥</button>
						 </c:when>
						 <c:otherwise>
						<button id="good_pick" type="button" onclick="location.href='/good_pick?exh_no=${getGoodList.exh_no}'">♡</button>
						</c:otherwise>
						</c:choose>
						
						</td>
						 <td>
						 ${getGoodList.good_cnt }
						 </td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<br> <br>
		
			</div>
</body>
</html>