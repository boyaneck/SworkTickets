<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<style>
.div{font-size: 20pt;}
.row1{line-height: 40px;}
.t{border: thin solid lightgray !important;}
.ta{
   padding-left: 0px !important;
    margin-left: 15px !important;
    padding-right: 0px !important;
    padding-top: 50px;
    }
    
    @media (max-width: 768px) {

}
</style>
<body>

   <div class="container"  style="padding-bottom: 300px; padding-top: 50px;" >
<%--       <div style="text-align: center;"><img src="/images/${exhibition.exh_thumbnail }" alt="이미지" style="width:100%;"></div> --%>
      <%-- <div style="text-align: center;"><img src="/images/${exhibition.exh_banne }" alt="이미지" style="width:100%;"></div> --%>
<%--       <div style="text-align: center;"><img src="/images/${exhibition.exh_img }" alt="이미지" style="width:100%;"></div> --%>
          <c:forEach items="${fn:split(exhibition.exh_img, '/') }" var="item">
           <div style="text-align: center;">  <img src="/images/${item}" alt="이미지" style="width:100%;"></div>
      </c:forEach>
<!--    테이블 -->   
   <div class="container-fluid ta">
      <div class="row row1 row-cols-sm-2">
         <div class="col-md-2  col-sm-4 col-4 t">주최</div>
         <div class="col-md-5  col-sm-8 col-8 t">${exhibition.exh_planner }</div>
         <div class="col-md-2  col-sm-4 col-4 t">고객문의처</div>
         <div class="col-md-3  col-sm-8 col-8 t">   ${exhibition.exh_cs_phone }</div>
      </div>
      <div class="row row1 row-cols-sm-2">   
         <div class="col-md-2  col-sm-4 col-4 t">작가</div>
         <div class="col-md-5  col-sm-8 col-8 t">${exhibition.exh_artist }</div>
         <div class="col-md-2  col-sm-4 col-4 t">관람등급</div>
         <div class="col-md-3  col-sm-8 col-8 t">   ${exhibition.exh_rating }</div>
      </div>
      <div class="row row1 row-cols-sm-2">   
         <div class="col-md-2  col-sm-4 col-4 t">관람시간</div>
         <div class="col-md-5  col-sm-8 col-8 t">${exhibition.exh_time }</div>
         <div class="col-md-2  col-sm-4 col-4 t">전시장소</div>
         <div class="col-md-3  col-sm-8 col-8 t">   ${exhibition.exh_hall }</div>
      </div>
      <div class="row row1 row-cols-sm-2">   
         <div class="col-md-2  col-sm-4 col-4 t">예매수수료</div>
         <div class="col-md-5  col-sm-8 col-8 t">${exhibition.exh_fee }</div>
         <div class="col-md-2  col-sm-4 col-4 t">발권정보</div>
         <div class="col-md-3  col-sm-8 col-8 t">   ${exhibition.exh_shipping_info }</div>
      </div>
      <div class="row row1 row-cols-sm-2">   
         <div class="col-md-2 col-sm-4 col-4 t">유효기간/이용조건</div>
         <div class="col-md-10 col-sm-8 col-8 t">${exhibition.exh_period_use }</div>
      </div>
      <div class="row row1 row-cols-sm-2">   
         <div class="col-md-2 col-sm-4  col-4 t">취소/환불안내</div>
         <div class="col-md-10 col-sm-8 col-8 t">${exhibition.exh_refund_info }</div>
      </div>
   </div>
   </div>
</body>
</html>