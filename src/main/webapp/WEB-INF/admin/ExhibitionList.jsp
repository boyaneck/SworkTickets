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
<!-- header end -->
<style>
</style>
<body>
	<div class="jumbotron">
		<h1>관리자 전시 목록</h1>
	</div>
	<nav id="searchNav" class="navbar navbar-expand-sm navbar-dark">
		<form class="form-inline" action="getExhibitionList" method="post">
			<select class="form-control" id="sel1" name="exSearchCondition"
				style="display: inline-block !important; margin-right: 10px;">
				<c:forEach items="${exSearchConditionMap}" var="option">
					<option value="${option.value}">${option.key}</option>
				</c:forEach>
			</select> <input class="form-control mr-sm-2" type="text" name="exSearchKeyword"
				placeholder="검색어를 입력하세요.">
			<button class="btn btn-outline-primary" type="submit">검색</button>
		</form>
	</nav>
<!-- 	<nav id="searchNav" class="navbar navbar-expand-sm navbar-dark"> -->
<!-- 		<form class="form-inline" action="getExhibitionList" method="post"> -->
<!-- 			<select class="form-control" id="sel1" name="exFilterCondition" -->
<!-- 				style="display: inline-block !important; margin-right: 10px;"> -->
<%-- 				<c:forEach items="${exFilterConditionMap}" var="filter"> --%>
<%-- 					<option value="${filter.value}">${filter.key}</option> --%>
<%-- 				</c:forEach> --%>
<!-- 			</select> -->
<!-- 			<button class="btn btn-outline-primary" type="submit">검색</button> -->
<!-- 		</form> -->
<!-- 	</nav> -->
	<div class="container-fluid">
		<table class="table table-hover">
			<thead class="btn-primary">
				<tr>
					<th>번호</th>
					<th>전시명</th>
					<th>가격</th>
					<th>전시일자</th>
					<th>장소</th>
					<th>전시종료여부</th>
					<th>삭제여부</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${exhibitionList}" var="exhibition">
					<tr>
						<%-- 					<tr onclick="selTr(${exhibition.exh_no})" style="cursor: pointer;"> --%>
						<td class="tdCenter">${exhibition.exh_no}</td>
						<td><a
							href="getExhibition?exh_no=${exhibition.exh_no}&page=${paging.nowPageBtn}">${exhibition.exh_title}</a></td>
						<td class="tdCenter"><fmt:formatNumber
								value="${exhibition.exh_price}" groupingUsed="true" />원</td>
						<td class="tdCenter">${exhibition.exh_st_date}~
							${exhibition.exh_end_date}</td>
						<td class="tdCenter">${exhibition.exh_hall}</td>
						<td class="tdCenter"><jsp:useBean id="now"
								class="java.util.Date" /> <fmt:formatDate value="${now}"
								pattern="yyyy-MM-dd" var="today" /> <c:if
								test="${exhibition.exh_end_date < today}">
								<c:out value="종료" />
							</c:if></td>
						<td class="tdCenter"><c:if
								test="${exhibition.exh_cancell eq 1}">
								<c:out value="삭제" />
							</c:if></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<br> <br>
		<div>
			<!-- 		반복처리할 태그 시작 -->
			<div class="container ">

				<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center">
						<!-- 		맨처음 -->
						<li class="page-item "><a class="page-link"
							href="getExhibitionList?nowPageBtn=1">&laquo;</a></li>

						<c:if test="${paging.nowPageBtn > 1 }">
							<li class="page-item "><a class="page-link"
								href="getExhibitionList?nowPageBtn=${paging.nowPageBtn-1}">&lt;</a></li>
						</c:if>

						<!-- 반복처리 태그				 -->
						<c:forEach begin="${paging.startBtn}" end="${paging.endBtn }"
							step="1" var="i">
							<c:choose>
								<c:when test="${paging.nowPageBtn==i}">
									<li class="page-item active"><a class="page-link"
										href="getExhibitionList?nowPageBtn=${i}">${i}</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item "><a class="page-link"
										href="getExhibitionList?nowPageBtn=${i}">${i}</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<!-- 		반복 끝 -->
						<c:if test="${paging.nowPageBtn < paging.totalBtnCnt }">
							<li class="page-item "><a class="page-link"
								href="getExhibitionList?nowPageBtn=${paging.nowPageBtn+1}">&gt;</a></li>
						</c:if>
						<!-- 		맨끝 -->
						<li class="page-item"><a class="page-link"
							href="getExhibitionList?nowPageBtn=${paging.totalBtnCnt}">&raquo;</a></li>

					</ul>
				</nav>

			</div>
			<!-- 		반복처리할 태그 끝 -->
			<div id="footer">
				<a href="insertmoveExhibition">
					<button type="button" id="conWrite" class="btn btn-primary">
						<!-- 			<a class="page-link" href="insertmoveExhibition"> -->
						전시등록
					</button>
				</a>
			</div>
		</div>
	</div>
</body>
</html>