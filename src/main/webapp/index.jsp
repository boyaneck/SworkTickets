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
<script>
$(document).ready(function(){
	$('.slider-wrap').slick({
		  dots: false,
		  /* autoplay:true; //자동넘김 */
		  infinite: false,
		  speed: 300,
		  slidesToShow: 4,
		  slidesToScroll: 4,
		  responsive: [
		    {
		    	//반응형 ~ 1024
		      breakpoint: 1024,
		      settings: {
		        slidesToShow: 3,
		        slidesToScroll: 3,
		        infinite: true,
		        dots: true
		      }
		    },
		    { //반응형 ~ 600
		      breakpoint: 600,
		      settings: {
		        slidesToShow: 2,
		        slidesToScroll: 2
		      }
		    },
		    { //반응형 ~ 480
		      breakpoint: 480,
		      settings: {
		        slidesToShow: 1,
		        slidesToScroll: 1
		      }
		    }
		  ]
		});
});
</script>
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
<div class="slider-wrap">
<img src="./images/1.png" width="150" height="200">
<img src="./images/2.png" width="150" height="200">
<img src="./images/1.png" width="150" height="200">
<img src="./images/poroly_jsy.png" width="150" height="200">
<img src="./images/poroly.png" width="150" height="200">
<img src="./images/달러구트꿈백화점.jpg" width="150" height="200">
<img src="./images/아라의소설.jpg" width="150" height="200">
<img src="./images/이기적유전자.jpg" width="150" height="200">
<img src="./images/파친코2.jpg" width="150" height="200">
<img src="./images/거북이자리.jpg" width="150" height="200">
<img src="./images/평면의역사.jpg" width="150" height="200">
<img src="./images/필요가피로가되지않게.jpg" width="150" height="200">
<img src="./images/하얼빈.jpg" width="150" height="200">
<img src="./images/2.png" width="150" height="200">
</div>

<div class="new_ex">
<button type="button" onclick = "location.href= '../getUserExhibitionList'" ><span style="color:#7832f7">+</span>more</button>
</div>

<!-- <br><br>
회원 메뉴 
<br><br> -->

<!-- <a href="/getUserExhibitionList">- 회원전시</a><br> -->
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