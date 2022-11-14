<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="//cdn.jsdelivr.net/gh/xpressengine/xeicon@2.3.1/xeicon.min.css">
<title>전시 목록</title>
<!-- header -->
<%@ include file="/header.jsp"%>
<!-- header end -->

<style>
/* .heart{ */
/*   position: relative; */
/* } */
/* .top-right { */
/*   position: absolute; */
/*   top: 5px; */
/*   right: 12px; */
/* } */
/* .heart:before{ */
/* content:''; */
/* /* background: linear-gradient(to top,black 30%,transparent 30%); */ */
/* background: linear-gradient(0deg, rgba(46,47,50,1) 0%, rgba(72,75,77,0) 100%, rgba(72,75,77,0) 100%); */
/* position:absolute; */
/* left:0; */
/* height:73%; */
/* width:100%; */
/* } */
</style>
</head>
<body class="d-flex flex-column min-vh-100">
	   <div class="board"><h1>전시</h1></div>
	<div class="container">
		<div class="row row-cols-1 row-cols-md-4 g-4" style="margin-bottom: 30px;">
	<c:forEach items="${UserExhibitionList}" var="exhibition">
			<div class="col" style="margin-bottom: 30px; cursor:pointer;" onclick="location.href='getUserExhibition?exh_no=${exhibition.exh_no}'" >
				<div class="card h-100 heart">
					<img src="/images/${exhibition.exh_thumbnail }"
						class="card-img-top" alt="이미지" style="height: 300px;">
					<div class="card-body" >
						<b class="card-title">${exhibition.exh_title}</b>
						<p class="card-text" style="font-size: 14px; color: gray;">${exhibition.exh_hall }<br>
						${exhibition.exh_st_date}~${exhibition.exh_end_date}
						<span style="text-align: right;"><i class = "xi-heart good" style="color:red;"></i> 
					<b style="color: black; text-align: center;">${exhibition.rank_cnt}</b></span></p>
					</div>
				</div>
			</div>
	</c:forEach>
		</div>
</div>
	<!-- 		반복처리할 태그 시작 -->
			<div id="btnBox_parent">
				<div id="btnBox">
								<!-- 		맨처음 -->
								<c:if test="${paging.nowPageBtn > 1 }">
									<a href="getUserExhibitionList?nowPageBtn=1">&laquo;</a>
								</c:if>
								<c:if test="${paging.nowPageBtn > 1 }">
									<a  href="getUserExhibitionList?nowPageBtn=${paging.nowPageBtn-1}">&lt;</a>
								</c:if>

								<!-- 반복처리 태그 -->
								<c:forEach begin="${paging.startBtn}" end="${paging.endBtn }" step="1" var="i">
									<c:choose>
										<c:when test="${paging.nowPageBtn==i}">
											<a style="font-weight:400; color:#7832f7;" href="getUserExhibitionList?nowPageBtn=${i}">${i}</a>
										</c:when>
										<c:otherwise>
											<a  href="getUserExhibitionList?nowPageBtn=${i}">${i}</a>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<!-- 		반복 끝 -->
								<c:if test="${paging.nowPageBtn < paging.totalBtnCnt }">
									<a href="getUserExhibitionList?nowPageBtn=${paging.nowPageBtn+1}">&gt;</a>
								</c:if>
								<!-- 		맨끝 -->
								<c:if test="${paging.nowPageBtn < paging.totalBtnCnt }">
									<a href="getUserExhibitionList?nowPageBtn=${paging.totalBtnCnt}">&raquo;</a>
								</c:if>
					</div>
					</div>
					
			<!-- 		반복처리할 태그 끝 -->
		<br> <br>
		
			<%@ include file="../../footer.jsp" %>
</body>
</html>