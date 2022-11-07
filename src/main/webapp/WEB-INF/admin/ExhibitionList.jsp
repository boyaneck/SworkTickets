<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전시 목록</title>
<!-- header -->
<%@ include file="/header.jsp"%>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="http://cdn.datatables.net/1.10.2/css/jquery.dataTables.min.css">
<!-- header end -->
<style>
</style>
<body>
	<div class="jumbotron">
		<h1>관리자 전시 목록</h1>
	</div>
	<div class="table-responsive">
		<table id="myTable" class="display table" width="100%">
			<thead>
				<tr>
					<th>번호</th>
					<th>전시명</th>
					<th>가격</th>
					<th>전시시작일자</th>
					<th>전시종료일자</th>
					<th>장소</th>
					<th>승인여부</th>
					<th>전시종료여부</th>
				</tr>
			</thead>
			<%-- 						<td><a href="getExhibition?exh_no=${exhibition.exh_no}&page=${paging.nowPageBtn}">${exhibition.exh_title}</a></td> --%>
			<tbody>
				<c:forEach items="${exhibitionList}" var="exhibition">
					<tr onclick="selTr(${exhibition.exh_no},${paging.nowPageBtn})"
						style="cursor: pointer;">
						<td class="tdCenter">${exhibition.exh_no}</td>
						<td class="tdCenter">${exhibition.exh_title}</td>
						<td class="tdCenter"><fmt:formatNumber
								value="${exhibition.exh_price}" groupingUsed="true" />원</td>
						<td class="tdCenter">${exhibition.exh_st_date}</td>
						<td class="tdCenter">${exhibition.exh_end_date}</td>
						<td class="tdCenter">${exhibition.exh_hall}</td>
						<jsp:useBean id="now" class="java.util.Date" /> <fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" /> 
						<td class="tdCenter">
						<c:choose>
								<c:when test="${exhibition.exh_approval eq 1}">
									<span>승인</span>
								</c:when>
								<c:when test="${exhibition.exh_st_date <= today}">
									<span>승인불가</span>
								</c:when>
								<c:otherwise>
									<span>대기</span>
								</c:otherwise>
							</c:choose>
							</td>
						<td class="tdCenter">
						<c:if test="${exhibition.exh_end_date < today && exhibition.exh_approval eq 1}">
								<c:out value="종료" />
							</c:if></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<br> <br>
	</div>
	<div id="footer">
		<a href="insertmoveExhibition">
			<button type="button" id="conWrite" class="btn btn-primary">
				<!-- 			<a class="page-link" href="insertmoveExhibition"> -->
				전시등록
			</button>
		</a>
	</div>
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script type="text/javascript" src="../js/jquery.dataTables.min.js"></script>
	<script type="text/javascript"
		src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js">
		
	</script>
	<script>
		$(document).ready(function() {
			$('#myTable').dataTable();
		});
		
		function selTr(val, val2){
			location.href = "getExhibition?exh_no="+val+"&page="+val2;
		}
	</script>

</body>
</html>