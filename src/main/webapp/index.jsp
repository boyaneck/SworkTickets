<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%@ include file="header.jsp"%>
<!-- @import url("https://fonts.googleapis.com/css2?family=Nunito&display=swap"); -->


<style type="text/css">
/* 카드 */

.cd {
    align-items: center;
    background-color: #F3F5F7;
    /* font-family: 'Poppins',
        sans-serif; */
    width: 100%;
    min-height: 100vh;
    color: #1B1C34;
    display: flex;
    justify-content: center;
    align-items: center;
}



.container-card {
    /* max-width: 70%; */
    max-width: 70%;
    margin: 0 auto;
    height: 100%;
}

.grid-card {
    display: grid;
    grid-template-columns: 300px;
    /* grid-template-columns: 2fr 2fr 2fr; */
    gap: 3%;
    margin: 5% 0;
/*     justify-content: center; */
}
.grid-card2 {
    display: grid;
    grid-template-columns: 300px;
    /* grid-template-columns: 2fr 2fr 2fr; */
    gap: 3%;
    margin: 5% 0;
    justify-content: flex-end;
}

.card {
    overflow: hidden;
    padding: 20px;
    background-color: rgba(255, 255, 255, 0.1);
/*     border-radius: 30px; */
    text-align: center;
/*     box-shadow: 10px 10px 10px rgb(206, 203, 203); */
border-radius: 0px;
}


.card_img img {
    width: 100%;
    height: 25rem;
    /* border-radius: 20px; */
}

.card_body-1 {
    padding: 29px 20px 30px 20px;
    text-align: -webkit-center;
}

.card_body-2 {
    padding: 34px 20px 35px 20px;
    text-align: -webkit-center;
}
/* .card_body-2 { */
/*     padding: 38px 20px 24px 20px; */
/*     text-align: -webkit-center; */
/* } */

.card_title {
/*     font-family: 'Merriweather', */
/*         serif; */
/*     font-weight: 900; */
    text-transform: capitalize;

    font-size: 16px;
    padding-bottom: 10px;
}

.card_body p {
    font-weight: 400;
    font-size: 18px;
    line-height: 1.7;

}

p.card_author {
    font-size: 15px;
    padding-top: 15px;

}

p.card_author a {
    color: #1B1C34;
    font-style: italic;
}

p.card_author a:hover {
    font-weight: bold;
}

a.read_more {
    color: #FFF;
    font-size: 13px;
    text-decoration: none;
    letter-spacing: 1.1px;
    background: #0F1616;
    margin-top: 50px;
    padding: 24px 0px;
    border-radius: 15px;
    display: inline-block;
    width: 70%;
    transition: all .3s ease-in-out;
}

a.read_more:hover {
    box-shadow: 0px 1px 50px rgba(0, 0, 0, 0.15);
    background: #404040;
}

.link {
    position: fixed;
    background-color: #D12322;
    padding: 23px 40px;
    right: -106px;
    border-radius: 5px;
    top: 50%;
    transform: translateY(-50%);
    transform: rotate(-90deg);
    font-size: 18px;
    font-weight: 500;
    color: #FFF;
    text-decoration: none;
    text-transform: capitalize;
    transition: all .1s ease-in-out;
}

.link i {
    padding-left: 7px;
}

.link:hover {
    text-decoration: underline;
    background-color: black;
}


@font-face {
	font-family: "longline";
	src: url("https://assets.codepen.io/756881/Longline+Quart+FREE.ttf")
		format("truetype");
	font-weight: normal;
	font-style: normal;
}

</style>
</head>
<body class="d-flex flex-column min-vh-100">
<!-- <img class="picture" src="./images/main_image.png" /> -->

<div id="carouselExampl	eCaptions" class="carousel slide" data-ride="carousel" data-interval="false">
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
 <!--  <button class="carousel-control-prev" type="button" data-target="#carouselExampleCaptions" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-target="#carouselExampleCaptions" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </button> -->
</div>

<!-- 전시버튼 -->
<div class="new_title">
<h2><span style="color:#7832f7">NEW</span> EXHIBITION</h2>
<h3 style="color:#fff">NEW EXHIBITION</h3>

<div class="stage">
  
  
<div class="container">
  <div class="ring">
    <div class="img"></div>
    <div class="img"></div>
    <div class="img"></div>
    <div class="img"></div>
    <div class="img"></div>
    <div class="img"></div>
    <div class="img"></div>
    <div class="img"></div>
    <div class="img"></div>
    <div class="img"></div>
  </div>
</div>

</div>
<!-- partial -->
  <script src='https://cdnjs.cloudflare.com/ajax/libs/gsap/3.6.1/gsap.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/zepto/1.2.0/zepto.min.js'></script><script  src="./script.js"></script>


</div>

<div class="new_ex">
<button type="button" class="newEx_btn" onclick = "location.href= '../getUserExhibitionList'" ><span style="color:#7832f7">+</span>more</button>
</div>

<!-- <div class="maintext">
aa
</div> -->

<!-- 센터 시작 -->

<div class="rank_center"><h1 class="rank-title">RANK</h1></div>

<section class="rank_box">
<div class="rank1">
        <i class="bi bi-suit-heart-fill"></i>
	좋아요<br><br>
	
<!-- 	  <div class="cd"> -->
        <div class="container container-card">
            <div class="grid-card">
                <div class="card">
                    <h2 class="card_title">1. 나의 조랑말 선생님</h2>
                    <div class="card_img">
                        <img src="/images/아라의소설.jpg" alt="">
                    </div>
                    <div class="card_body-1">
<!--                         <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Dolorum porro, illum totam nostrum sit delectus nisi sint magni perspiciatis adipisci?</p> -->
    <div>
        <i class="bi bi-suit-heart-fill"></i>
        <span class="num" data-val="300">000</span>
		</div>
                    </div>
                </div>
            </div>
            <br>
             <div class="grid-card2">
                <div class="card">
                    <h2 class="card_title">2. 나의 팀버튼 선생님</h2>
                    <div class="card_img">
                        <img src="/images/이기적유전자.jpg" alt="">
                    </div>
                    <div class="card_body-1">
<!--                         <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Dolorum porro, illum totam nostrum sit delectus nisi sint magni perspiciatis adipisci?</p> -->
    <div>
        <i class="bi bi-suit-heart-fill"></i>
        <span class="num" data-val="230">000</span>
		</div>
                    </div>
                </div>
            </div>
            <br>
           <div class="grid-card">
                <div class="card">
                    <h2 class="card_title">3. 평민의 역사</h2>
                    <div class="card_img">
                        <img src="/images/평면의역사.jpg" alt="">
                    </div>
                    <div class="card_body-1">
<!--                         <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Dolorum porro, illum totam nostrum sit delectus nisi sint magni perspiciatis adipisci?</p> -->
    <div>
        <i class="bi bi-suit-heart-fill"></i>
        <span class="num" data-val="150">000</span>
		</div>
                    </div>
                </div>
            </div>
        </div>
    </div>

<%-- <c:forEach items="${getGoodList}" var="getGoodList" varStatus="status"> --%>
<!--                <div class="row "><div class="col"> -->
<%--                   <a href="getUserExhibition?exh_no=${getGoodList.exh_no}"> --%>
<%--                   ${status.count}  --%>
<%--                      ${getGoodList.exh_title}</a> ${getGoodList.rank_cnt }<br> --%>
<!--                </div></div> -->
<%-- </c:forEach> --%>
<!-- </div> -->
<div class="rank2"><span style="color:#7832f7">%</span>예매율<br><br>

<!-- 	  <div class="cd"> -->
        <div class="container-card">
        
            <div class="grid-card">
                <div class="card">
                    <h2 class="card_title">1. 나의 조랑말 선생님</h2>
                    <div class="card_img">
                        <img src="/images/아라의소설.jpg" alt="">
                    </div>
                    <div class="card_body-2">
<!--                         <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Dolorum porro, illum totam nostrum sit delectus nisi sint magni perspiciatis adipisci?</p> -->
    <div class="container container-cir">
    <div class="circular-progress1">
        <div class="value-container1">0%</div>
    </div>
      </div>
                    </div>
                </div>
            </div>
            <br>
             <div class="grid-card2">
                <div class="card">
                    <h2 class="card_title">2. 나의 팀버튼 선생님</h2>
                    <div class="card_img">
                        <img src="/images/이기적유전자.jpg" alt="">
                    </div>
                    <div class="card_body-2">
<!--                         <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Dolorum porro, illum totam nostrum sit delectus nisi sint magni perspiciatis adipisci?</p> -->
  	<div class="container container-cir">
    <div class="circular-progress2">
        <div class="value-container2">0%</div>
    </div>
      </div>
                    </div>
                </div>
            </div>
            <br>
           <div class="grid-card">
                <div class="card">
                    <h2 class="card_title">3. 평민의 역사</h2>
                    <div class="card_img">
                        <img src="/images/평면의역사.jpg" alt="">
                    </div>
                    <div class="card_body-2">
<!--                         <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Dolorum porro, illum totam nostrum sit delectus nisi sint magni perspiciatis adipisci?</p> -->
    <div class="container container-cir">
    <div class="circular-progress3">
        <div class="value-container3">0%</div>
    </div>
      </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


<!-- </div> -->
</section>
<div class="rank_ex">
<button type="button" onclick = "location.href= '../ranking'" ><span style="color:#7832f7">+</span>more</button>
</div>

<!-- 센터 끝 -->


<!-- <br><br> -->
<!-- 회원 메뉴  -->
<!-- <br><br> -->

<!-- <a href="/getUserExhibitionList">- 회원전시</a><br> -->
<!-- <a href="/login_kakao">- 카카오로그인</a><br> -->
<!-- <a href="/getPayList">- 나의 구매내역</a><br> -->
<!-- <a href="insertMember.jsp">- 회원가입</a><br> -->
<!-- <a href="/MyCoupon">- 내 쿠폰함</a><br> -->
<!-- <a href="/getOneList">- 1대1문의</a><br> -->
<!-- <a href="login.jsp">- 로그인</a><br> -->
<!-- <a href="reviewwrite.jsp">후기</a> -->
<!-- <br><br> -->
<!-- 관리자 메뉴  -->
<!-- <br><br> -->
<!-- <a href="/getMemberList">- 회원목록</a><br> -->
<!-- <a href="insertCoupon.jsp">- 쿠폰등록</a><br> -->
<!-- <a href="/getCouponList">- 쿠폰목록</a><br> -->
<!-- <a href="/pay">- 관리자 결제목록</a><br> -->
<!-- <div class="container-fluid"> -->
<!--    <div class="h-100 d-inline-block bg-dark text-white">디브</div> -->
<!-- </div> -->


<!-- footer start -->
<%@ include file="footer.jsp" %>
<!-- footer end -->
   <!-- Script -->
    <script src="js/circular-progress.js"></script>
     <script src='https://unpkg.co/gsap@3/dist/gsap.min.js'></script>
<script src='https://unpkg.com/gsap@3/dist/ScrollTrigger.min.js'></script>
<script src='https://unpkg.com/gsap@3/dist/MotionPathPlugin.min.js'></script>
<script src='https://assets.codepen.io/16327/Flip.min.js'></script><script  src="js/semicircle-script.js"></script>
</body>
</html>