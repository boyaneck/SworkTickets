<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
   src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
   integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
   crossorigin="anonymous"></script>
<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js"
   integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+"
   crossorigin="anonymous"></script>
   <script src="https://developers.kakao.com/sdk/js/kakao.js"></script> 
    <script src="https://kit.fontawesome.com/22152c116a.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="./css/style.css">
<title>헤더입니다.</title>
</head>

<!-- 회원 -->
<nav class="navbar navbar-expand-sm navbar-light header-navbar"
   data-toggle="affix">
   <a class="navbar-brand logoimg" href="index.jsp"> <img
      style="width: 140px;" src="./images/logo.png">&nbsp&nbsp
   </a>

   <button class="navbar-toggler header-toggler" type="button" data-toggle="collapse"
      data-target="#collapsingNavbar">☰</button>
   
   <c:choose>
      <c:when test='${mb_Id eq "admin"}'>
         <ul class="nav navbar-nav mr-auto ml-3">
         <li class="nav-item dropdown header-title">
            <a class="nav-link header" href="/getExhibitionList" > 전시 </a>
         </li>
         <li class="nav-item dropdown header-title">
            <a class="nav-link header" href="/ranking"> 랭킹 </a>
         </li>
         <li class="nav-item dropdown header-title">
            <a class="nav-link header" href="#"> 지역 </a>
         </li>
         <li class="nav-item dropdown header-title">
            <a class="nav-link header" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false"> 쿠폰 </a>
            <div class="dropdown-menu header-menu" aria-labelledby="coupon">
            <a class="dropdown-item header-item" href="/getCouponList">쿠폰목록</a>
            <a class="dropdown-item header-item" href="/insertCouponForm">쿠폰등록</a>
            </div>
         </li>
         <li class="nav-item dropdown header-title">
            <a class="nav-link header" data-toggle="dropdown" href="/getOneList" role="button" aria-haspopup="true" aria-expanded="false"> 고객센터 </a>
            <div class="dropdown-menu header-menu" aria-labelledby="cs">
               <a class="dropdown-item header-item" href="/getBoardList">공지사항</a>
               <a class="dropdown-item header-item" href="/getFaqList">자주묻는질문</a>
               <a class="dropdown-item header-item" href="/getOneList">1:1 문의</a>
            </div>
         </li>
      </ul>
      
      <ul class="nav navbar-nav navbar-right">
            <!-- 검색 -->
      <div class="form-group col-xs-6 my-2">
        <div class="inner-addon right-addon">
          <i class="glyphicon fas fa-search"></i>
          <input type="text" class="form-control" placeholder="검색" />
        </div>
      </div>
      <!-- 검색 -->
               <li class="nav-item">
                     <span class="nav-hello">${mb_Id}님 안녕하세요</span>
               </li>
               <li class="nav-item dropdown header-title">
               <a class="nav-link dropdown-toggle header-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false"> 회원관리 </a>
               <div class="dropdown-menu header-menu" aria-labelledby="member">
               <a class="nav-link header-logout" href="/logoutGO">로그아웃</a>
               <a class="dropdown-item header-item" href="/getMemberList">&nbsp회원목록</a>
               <a class="dropdown-item header-item" href="/getAllPayList">&nbsp회원결제내역</a>
               </div>
               </li>
            </ul>
               <a class="nav-link header-logout" href="/logoutGO">로그아웃</a>
      </c:when>
      
       <c:when test="${mb_Id ne NULL}">
         <ul class="nav navbar-nav mr-auto ml-3">
         <li class="nav-item dropdown header-title">
            <a class="nav-link header" href="/getUserExhibitionList" > 전시 </a>
         </li>
         <li class="nav-item dropdown header-title">
            <a class="nav-link header" href="/ranking"> 랭킹 </a>
         </li>
         <li class="nav-item dropdown header-title">
            <a class="nav-link header" href="#"> 지역 </a>
         </li>
         <li class="nav-item dropdown header-title">
            <a class="nav-link header" href="/getCouponList"> 쿠폰 </a>
         </li>
         <li class="nav-item dropdown header-title">
            <a class="nav-link header" data-toggle="dropdown" href="/getOneList" role="button" aria-haspopup="true" aria-expanded="false"> 고객센터 </a>
            <div class="dropdown-menu header-menu" aria-labelledby="cs">
               <a class="dropdown-item header-item" href="/getBoardList">공지사항</a>
               <a class="dropdown-item header-item" href="/getFaqList">자주묻는질문</a>
               <a class="dropdown-item header-item" href="/getOneList">1:1 문의</a>
            </div>
         </li>
      </ul>
      
      <ul class="nav navbar-nav navbar-right">
            <!-- 검색 -->
      <div class="form-group col-xs-6 my-2">
        <div class="inner-addon right-addon">
          <i class="glyphicon fas fa-search"></i>
          <input type="text" class="form-control" placeholder="검색" />
        </div>
      </div>
      <!-- 검색 -->
               <li class="nav-item">
                     <span class="nav-hello">${mb_Id}님 안녕하세요</span>
               </li>
               <li class="nav-item dropdown header-title">
               <a class="nav-link mypage" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false"> 마이페이지 </a>
               <div class="dropdown-menu header-menu" aria-labelledby="member">
               <a class="dropdown-item header-item" href="mypage?mb_id=${mb_Id}">&nbsp마이페이지</a>
               <a class="dropdown-item header-item" href="/getPayList">&nbsp나의구매내역</a>
               <a class="dropdown-item header-item" href="/MyCoupon">&nbsp내 쿠폰함</a>
                  <a class="dropdown-item header-item" href="/getMyGoodList">&nbsp내 좋아요 목록</a>
               </div>
               </li>
            </ul>
            
               <a class="nav-link header-logout" href="/logoutGO">로그아웃</a>
      </c:when>
        <c:when test="${kakaoId ne NULL || naverLogin ne NULL}">
         <ul class="nav navbar-nav mr-auto ml-3">
         <li class="nav-item dropdown header-title">
            <a class="nav-link header" href="/getUserExhibitionList" > 전시 </a>
         </li>
         <li class="nav-item dropdown header-title">
            <a class="nav-link header" href="/ranking"> 랭킹 </a>
         </li>
         <li class="nav-item dropdown header-title">
            <a class="nav-link header" href="#"> 지역 </a>
         </li>
         <li class="nav-item dropdown header-title">
            <a class="nav-link header" href="/getCouponList"> 쿠폰 </a>
         </li>
         <li class="nav-item dropdown header-title">
            <a class="nav-link header" data-toggle="dropdown" href="/getOneList" role="button" aria-haspopup="true" aria-expanded="false"> 고객센터 </a>
            <div class="dropdown-menu header-menu" aria-labelledby="cs">
               <a class="dropdown-item header-item" href="#">공지사항</a>
               <a class="dropdown-item header-item" href="#">자주묻는질문</a>
               <a class="dropdown-item header-item" href="/getOneList">1:1 문의</a>
            </div>
         </li>
      </ul>
      
      <ul class="nav navbar-nav navbar-right">
            <!-- 검색 -->
      <div class="form-group col-xs-6 my-2">
        <div class="inner-addon right-addon">
          <i class="glyphicon fas fa-search"></i>
          <input type="text" class="form-control" placeholder="검색" />
        </div>
      </div>
      <!-- 검색 -->
               <li class="nav-item">
                     <%-- <span class="nav-hello">${kakaoId} 님 안녕하세요 </span> --%>
               </li>
               <li class="nav-item dropdown header-title">
               <a class="nav-link mypage" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false"> 마이페이지 </a>
               <div class="dropdown-menu header-menu" aria-labelledby="member">
               <%-- <a class="dropdown-item header-item" href="mypage?mb_id=${mb_Id}">&nbsp마이페이지</a> --%>
               <a class="dropdown-item header-item" href="/getPayList">&nbsp나의구매내역</a>
               <a class="dropdown-item header-item" href="/MyCoupon">&nbsp내 쿠폰함</a>
               </div>
               </li>
            </ul>
            
               <a class="nav-link header-logout" href="/logoutGO">로그아웃</a>
      </c:when>
      
      <c:otherwise> 
         <ul class="nav navbar-nav mr-auto mx-2">
         <li class="nav-item dropdown header-title">
            <a class="nav-link header" href="/getUserExhibitionList" > 전시 </a>
         </li>
         <li class="nav-item dropdown header-title">
            <a class="nav-link header" href="/ranking"> 랭킹 </a>
         </li>
         <li class="nav-item dropdown header-title">
            <a class="nav-link header" href="#"> 지역 </a>
         </li>
         <li class="nav-item dropdown header-title">
            <a class="nav-link header" href="/getCouponList"> 쿠폰 </a>
         </li>
         <li class="nav-item dropdown header-title">
            <a class="nav-link header" data-toggle="dropdown" href="/getOneList" role="button" aria-haspopup="true" aria-expanded="false"> 고객센터 </a>
            <div class="dropdown-menu header-menu" aria-labelledby="cs">
               <a class="dropdown-item header-item" href="/getBoardList">공지사항</a>
               <a class="dropdown-item header-item" href="/getFaqList">자주묻는질문</a>
               <a class="dropdown-item header-item" href="/getOneList">1:1 문의</a>
            </div>
         </li>
      </ul>
      <!-- 검색 -->
      <div class="form-group col-xs-6 my-2">
        <div class="inner-addon right-addon">
          <i class="glyphicon fas fa-search"></i>
          <input type="text" class="form-control" placeholder="검색" />
        </div>
      </div>
      <!-- 검색 -->
      
      <ul class="nav navbar-nav navbar-right">
            <li class="nav-item dropdown header-title">
            <!-- <a class="nav-link dropdown-toggle header-toggle-login" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false"> 로그인 </a>
               <div class="dropdown-menu header-menu" aria-labelledby="login"> -->
            <a class="dropdown-item header-item-login" href="login.jsp">&nbsp로그인</a>
            <!-- <a class="dropdown-item header-item" href="/login/kakao">&nbsp카카오로그인</a> -->
            <!-- <a class="dropdown-item header-item" href="insertMember.jsp">&nbsp회원가입</a> -->
            <!-- </div> -->
            </li>
        </ul>
      </c:otherwise>   
   </c:choose>
   
</nav>

</html>