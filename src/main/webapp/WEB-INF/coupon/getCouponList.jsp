<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠폰 목록</title>
 <script>
  
     function notlogin() {
        alert("로그인 후 진행 해 주시기 바랍니다.");
        location.href ="/login.jsp"
     };
    </script>

<%@ include file="/header.jsp"%>
</head>
<body>
<fmt:parseDate var="startDate_D"  value="${today }" pattern="yyyy-MM-dd"/>
<fmt:parseNumber var="startDate_N" value="${startDate_D.time / (1000*60*60*24)}" integerOnly="true" />

 


<div class="container">
<h1 style="text-align: center;">쿠폰 목록</h1>
<table class="table" style="width: 100%; border-collapse: collapse; table-layout: fixed;">
<c:forEach items="${couponList}" var="coupon">
<fmt:parseDate var="endDate_D" value="${coupon.c_date }"  pattern="yyyy-MM-dd"/>
<fmt:parseNumber var="endDate_N" value="${endDate_D.time / (1000*60*60*24)}" integerOnly="true" /> 

	<tr>
	  <td class="text-center">쿠폰명 : ${coupon.c_name}</td>
	  <td class="text-center">할인율 : ${coupon.c_per}%</td>	
	  <td class="text-center">만료날짜 : ${coupon.c_date}</td>
	    <td class="text-center text-danger"> ${endDate_N-startDate_N}일 남음 </td>



					<c:choose>
						<c:when test="${mb_Id eq 'admin'}">
							<td class="text-center"><button class="btn btn-primary"
									onclick="location.href='/getCoupon?c_num=${coupon.c_num}'">수정</button></td>
							<td class="text-center"><button class="btn btn-danger"
									onclick="location.href='/deleteCoupon?c_num=${coupon.c_num}'">삭제 </button></td>
						</c:when>
						<c:when test="${mb_Id ne null}">
							<c:choose>
								<c:when test="${error!=1}">
									<td class="text-center"><button class="btn btn-primary" onclick="location.href='/insertCouponBox?c_num=${coupon.c_num}'">쿠폰받기</button></td>
								</c:when>
							</c:choose>
						
						</c:when>
						<c:otherwise>
							<td class="text-center"><button class="btn btn-primary"
									onclick="notlogin()">쿠폰받기</button></td>
						</c:otherwise>
					</c:choose>


				</tr>
</c:forEach>
</table>
</div>
  <div class="container ">
			
				<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center">
<!-- 		맨처음 -->
					<c:if test="${paging.nowPageBtn > 1 }">
						<li class="page-item "><a class="page-link"
							href="getCouponList?nowPageBtn=1">&laquo;</a></li>
							</c:if>
							<c:if test="${paging.nowPageBtn > 1 }">
							<li class="page-item "><a class="page-link"
							href="getCouponList?nowPageBtn=${paging.nowPageBtn-1}">&lt;</a></li>
							</c:if>

<!-- 반복처리 태그 -->				
							<c:forEach begin="${paging.startBtn}" end="${paging.endBtn }" step="1" var="i" >
								<c:choose>
									<c:when test="${paging.nowPageBtn==i}">
									<li class="page-item active"><a class="page-link"
									href="getCouponList?nowPageBtn=${i}">${i}</a></li>
									</c:when>
									<c:otherwise>
									<li class="page-item "><a class="page-link"
									href="getCouponList?nowPageBtn=${i}">${i}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
<!-- 		반복 끝 -->
								<c:if test="${paging.nowPageBtn < paging.totalBtnCnt }">
							<li class="page-item "><a class="page-link"
							href="getCouponList?nowPageBtn=${paging.nowPageBtn+1}">&gt;</a></li>
							</c:if>
<!-- 		맨끝 -->			<c:if test="${paging.nowPageBtn < paging.totalBtnCnt }">
								<li class="page-item"><a class="page-link"
							href="getCouponList?nowPageBtn=${paging.totalBtnCnt}">&raquo;</a></li>
							</c:if>	
					</ul>
				</nav>
			
				</div>
  
  
  
  
  
  
  
</body>
</html>