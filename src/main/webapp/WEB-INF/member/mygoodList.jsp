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
		<h1>좋아요 전시 목록</h1>
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
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${getMyGoodList}" var="getMyGoodList">
					<tr onclick="selTr(${getMyGoodList.exh_no})" style="cursor: pointer;">
						<td class="tdCenter">${getMyGoodList.exh_no}</td>
						<td><a href="getUserExhibition?exh_no=${getMyGoodList.exh_no}&page=${paging.nowPageBtn}">
						${getMyGoodList.exh_title}
						</a></td>
						<td class="tdCenter"><fmt:formatNumber value="${getMyGoodList.exh_price}" groupingUsed="true" />원</td>
						<td class="tdCenter">${getMyGoodList.exh_st_date}~
							${getMyGoodList.exh_end_date}</td>
						<td class="tdCenter">${getMyGoodList.exh_hall}</td>
						<td class="tdCenter"> 
						<c:choose>
						<c:when test="">
						<button id="good_pick" type="button" onclick="location.href='/good_pick?exh_no=${getMyGoodList.exh_no}'">♥</button>
						 </c:when>
						 <c:otherwise>
						<button id="good_pick" type="button" onclick="location.href='/good_pick?exh_no=${getMyGoodList.exh_no}'">♡</button>
						</c:otherwise>
						</c:choose>
						
						</td>
						 
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<br> <br>
			<!-- 		반복처리할 태그 시작 -->
			<div class="container ">

				<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center">
						<!-- 		맨처음 -->
						<li class="page-item "><a class="page-link"
							href="getUserExhibitionList?nowPageBtn=1">&laquo;</a></li>

						<c:if test="${paging.nowPageBtn > 1 }">
							<li class="page-item "><a class="page-link"
								href="getUserExhibitionList?nowPageBtn=${paging.nowPageBtn-1}">&lt;</a></li>
						</c:if>

						<!-- 반복처리 태그				 -->
						<c:forEach begin="${paging.startBtn}" end="${paging.endBtn }"
							step="1" var="i">
							<c:choose>
								<c:when test="${paging.nowPageBtn==i}">
									<li class="page-item active"><a class="page-link"
										href="getUserExhibitionList?nowPageBtn=${i}">${i}</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item "><a class="page-link"
										href="getUserExhibitionList?nowPageBtn=${i}">${i}</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<!-- 		반복 끝 -->
						<c:if test="${paging.nowPageBtn < paging.totalBtnCnt }">
							<li class="page-item "><a class="page-link"
								href="getUserExhibitionList?nowPageBtn=${paging.nowPageBtn+1}">&gt;</a></li>
						</c:if>
						<!-- 		맨끝 -->
						<li class="page-item"><a class="page-link"
							href="getUserExhibitionList?nowPageBtn=${paging.totalBtnCnt}">&raquo;</a></li>

					</ul>
				</nav>

			</div>
			<!-- 		반복처리할 태그 끝 -->
			</div>
</body>
</html>