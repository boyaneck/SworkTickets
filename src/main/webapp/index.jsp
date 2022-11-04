<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- header -->
<%@ include file="header.jsp"%>
<!-- header end -->
</head>
<body class="d-flex flex-column min-vh-100">
<!-- <img class="picture" src="./images/main_image.png" /> -->

<div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel" data-interval="false">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
    <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="./images/main_image.png" class="d-block w-100" alt="배경이미지1">
      <div class="carousel-caption d-none d-md-block">
        <h5>첫번째</h5>
      </div>
    </div>
    <div class="carousel-item">
      <img src="./images/main_image2.png" class="d-block w-100" alt="배경이미지2">
      <div class="carousel-caption d-none d-md-block">
        <h5>두번째</h5>
      </div>
    </div>
    <div class="carousel-item">
      <img src="./images/main_image3.png" class="d-block w-100" alt="배경이미지3">
      <div class="carousel-caption d-none d-md-block">
        <h5>세번째</h5>
      </div>
    </div>
  </div>
</div>

<!-- 전시버튼 -->
<div class="new_title">
<h2><span style="color:#7832f7">NEW</span> EXHIBITION</h2>
<h3 style="color:#fff">NEW EXHIBITION</h3>
</div>

<div class="new_ex">
<button type="button" onclick = "location.href= '../getUserExhibitionList'" ><span style="color:#7832f7">+</span>more</button>
</div>

<br><br>
회원 메뉴 
<br><br>

<a href="/getUserExhibitionList">- 회원전시</a><br>
<br><br>
관리자 메뉴 
<br><br>
<a href="/getMemberList">- 회원목록</a><br>
<a href="insertCoupon.jsp">- 쿠폰등록</a><br>
<a href="/getCouponList">- 쿠폰목록</a><br>
<a href="/pay">- 관리자 결제목록</a><br>
<div class="container-fluid">
	<div class="h-100 d-inline-block bg-dark text-white">디브</div>
</div>

<!-- footer start -->
<%@ include file="footer.jsp" %>
<!-- footer end -->
</body>
</html>