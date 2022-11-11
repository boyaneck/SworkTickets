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
<body>
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
	
		<br> <br>
			<!-- 		반복처리할 태그 시작 -->
			<div class="container ">

				<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center">
						<!-- 		맨처음 -->
						<li class="page-item "><a class="page-link" href="getUserExhibitionList?nowPageBtn=1">&laquo;</a></li>

						<c:if test="${paging.nowPageBtn > 1 }">
							<li class="page-item "><a class="page-link" href="getUserExhibitionList?nowPageBtn=${paging.nowPageBtn-1}">&lt;</a></li>
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
			<%@ include file="../../footer.jsp" %>
</body>
</html>