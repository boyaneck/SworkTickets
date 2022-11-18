<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뉴전시스</title>
<link rel="stylesheet" href="//cdn.jsdelivr.net/gh/xpressengine/xeicon@2.3.1/xeicon.min.css">

<!-- header -->
<%@ include file="/header.jsp"%>
<!-- header end -->
<style>
h1{font-size: 30px;
    margin-top: 70px;
    margin-bottom: 40px;
    text-align: center;
    color: #1f1f1f;}
</style>

<body class="d-flex flex-column min-vh-100">
<div class="container">
	<div class="container" style="text-align:center;">
		<h1 style="text-align: center;">내 좋아요 목록</h1>
	</div>

		 <div class="container">
      <table class="table table-hover">
         <thead class="btn-primary">
            <tr class="rank_title">
<!--                <th>번호</th> -->
               <th><i class = "xi-heart good" style="color:red; margin-bottom: 0px; font-size: 25px;"></i></th>
               <th>전시명</th>
               <th>가격</th>
               <th>전시일자</th>
               <th>장소</th>

            </tr>
         </thead>

         <tbody>

            <c:forEach items="${getMyGoodList}" var="getMyGoodList">
                  <tr onclick="location.href='getUserExhibition?exh_no=${getMyGoodList.exh_no}'" style="cursor: pointer;">
<%--                   <td class="tdCenter" >${getMyGoodList.exh_no}</td> --%>
                  <td class="tdCenter" ><img src="/images/${getMyGoodList.exh_thumbnail}" alt="이미지"
                     style="width: 100px; height: 150px;"></td>
                  <td class="tdCenter" >${getMyGoodList.exh_title}</td>
                  <td class="tdCenter price" ><fmt:formatNumber
                        value="${getMyGoodList.exh_price}" groupingUsed="true" />원</td>
                  <td class="tdCenter date" >${getMyGoodList.exh_st_date}~
                     ${getMyGoodList.exh_end_date}</td>
                  <td class="tdCenter exh_hall" >${getMyGoodList.exh_hall}</td>
               </tr>
            </c:forEach>
         </tbody>

         
      </table>
		
		
			<!-- 		반복처리할 태그 시작 -->
			<div id="btnBox_parent">
				<div id="btnBox">
								<!-- 		맨처음 -->
								<c:if test="${paging.nowPageBtn > 1 }">
									<a href="getMyGoodList?nowPageBtn=1">&laquo;</a>
								</c:if>
								<c:if test="${paging.nowPageBtn > 1 }">
									<a  href="getMyGoodList?nowPageBtn=${paging.nowPageBtn-1}">&lt;</a>
								</c:if>

								<!-- 반복처리 태그 -->
								<c:forEach begin="${paging.startBtn}" end="${paging.endBtn }" step="1" var="i">
									<c:choose>
										<c:when test="${paging.nowPageBtn==i}">
											<a style="font-weight:400; color:#7832f7;" href="getMyGoodList?nowPageBtn=${i}">${i}</a>
										</c:when>
										<c:otherwise>
											<a  href="getMyGoodList?nowPageBtn=${i}">${i}</a>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<!-- 		반복 끝 -->
								<c:if test="${paging.nowPageBtn < paging.totalBtnCnt }">
									<a href="getMyGoodList?nowPageBtn=${paging.nowPageBtn+1}">&gt;</a>
								</c:if>
								<!-- 		맨끝 -->
								<c:if test="${paging.nowPageBtn < paging.totalBtnCnt }">
									<a href="getMyGoodList?nowPageBtn=${paging.totalBtnCnt}">&raquo;</a>
								</c:if>
					</div>
					</div>
					
			<!-- 		반복처리할 태그 끝 -->
			</div>
			</div>
			<%@ include file="../../footer.jsp" %>
</body>
</html>