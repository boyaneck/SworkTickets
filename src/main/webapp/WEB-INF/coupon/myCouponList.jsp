<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 쿠폰함</title>

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

 


<div class="container" style="text-align: -webkit-center;">
<h1 style="text-align: center;">내 쿠폰함</h1>

<c:forEach items="${couponList}" var="coupon">
<fmt:parseDate var="endDate_D" value="${coupon.c_date }"  pattern="yyyy-MM-dd"/>
<fmt:parseNumber var="endDate_N" value="${endDate_D.time / (1000*60*60*24)}" integerOnly="true" /> 

   
<!--    <div class="rectangle" style="-webkit-mask-image: radial-gradient(circle at 148px 16px, transparent 16px, red 16.5px); -webkit-mask-position: 0 -16px;">  -->
<!-- <div class="rectangle" style="-webkit-mask-image: radial-gradient(circle at 120px 15px, transparent 15px, red 15.5px); -webkit-mask-position: 0 -15px;"> -->
         <div class="container">

            <div class="rectangle">
               <div class="row">
                  <div class="col-4">
                     <h1 class="text-center"
                        style="transform: translate(0, 80%); color: #7329f7; font-weight: bolder;">${coupon.c_per}%</h1>
                  </div>
                  <div class="col" style="transform: translate(0, 0); text-align:left;">
                     <b id="c_name" style="font-size: 40px">${coupon.c_name}</b><br>
                     ${coupon.c_date}까지<br> <span class="text-danger"><small>
                           ${endDate_N-startDate_N}일 남음</small></span>

      
                  </div>

               </div>
            </div>
         </div>


      </c:forEach>

</div>
  <div class="container ">
         
            <nav aria-label="Page navigation example">
               <ul class="pagination justify-content-center">
<!--       맨처음 -->
                  <c:if test="${paging.nowPageBtn > 1 }">
                  <li class="page-item "><a class="page-link"
                     href="MYCoupon?nowPageBtn=1">&laquo;</a></li>
                     </c:if>
                     <c:if test="${paging.nowPageBtn > 1 }">
                     <li class="page-item "><a class="page-link"
                     href="MYCoupon?nowPageBtn=${paging.nowPageBtn-1}">&lt;</a></li>
                     </c:if>

<!-- 반복처리 태그 -->            
                     <c:forEach begin="${paging.startBtn}" end="${paging.endBtn }" step="1" var="i" >
                        <c:choose>
                           <c:when test="${paging.nowPageBtn==i}">
                           <li class="page-item active"><a class="page-link"
                           href="MYCoupon?nowPageBtn=${i}">${i}</a></li>
                           </c:when>
                           <c:otherwise>
                           <li class="page-item "><a class="page-link"
                           href="MYCoupon?nowPageBtn=${i}">${i}</a></li>
                           </c:otherwise>
                        </c:choose>
                     </c:forEach>
<!--       반복 끝 -->
                        <c:if test="${paging.nowPageBtn < paging.totalBtnCnt }">
                     <li class="page-item "><a class="page-link"
                     href="MYCoupon?nowPageBtn=${paging.nowPageBtn+1}">&gt;</a></li>
                     </c:if>
<!--       맨끝 -->
                     <c:if test="${paging.nowPageBtn < paging.totalBtnCnt }">
                        <li class="page-item"><a class="page-link"
                     href="MYCoupon?nowPageBtn=${paging.totalBtnCnt}">&raquo;</a></li>
                        </c:if>
               </ul>
            </nav>
         
            </div>
  
  
  
  
  
  
  
</body>
</html>