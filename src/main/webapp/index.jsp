<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%@ include file="header.jsp"%>

</head>
<body class="d-flex flex-column min-vh-100">
	<!-- <img class="picture" src="./images/main_image.png" /> -->

	<div id="carouselExampl   eCaptions" class="carousel slide"
		data-ride="carousel" data-interval="false">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleCaptions" data-slide-to="0"
				class="active"></li>
			<li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
			<li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="./images/main_image.png" class="d-block w-100"
					alt="배경이미지1">
				<div class="carousel-caption d-none d-md-block">
					<h5>첫번째</h5>
				</div>
			</div>
			<div class="carousel-item">
				<img src="./images/main_image2.png" class="d-block w-100"
					alt="배경이미지2">
				<div class="carousel-caption d-none d-md-block">
					<h5>두번째</h5>
				</div>
			</div>
			<div class="carousel-item">
				<img src="./images/main_image3.png" class="d-block w-100"
					alt="배경이미지3">
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
		<h2>
			<span style="color: #7832f7">NEW</span> EXHIBITION
		</h2>
		<h3 style="color: #fff">NEW EXHIBITION</h3>
	</div>

	<div class="new_ex">
		<button type="button" class="newEx_btn"
			onclick="location.href= '../getUserExhibitionList'">
			<span style="color: #7832f7">+</span>more
		</button>
	</div>

	<!-- <div class="maintext">
aa
</div> -->

	<!-- 센터 시작 -->


	<div class="rank_center">
		<h1 class="rank-title">RANK</h1>
	</div>

	<section class="rank_box">
		<div class="rank1">
			<i class="bi bi-suit-heart-fill"></i> 좋아요<br>
			<br>

			<!--      <div class="cd"> -->
			<div class="container">
				<div class="grid">
					<div class="card">
						<h2 class="card_title">1. 나의 조랑말 선생님</h2>
						<div class="card_img">
							<img src="/images/아라의소설.jpg" alt="">
						</div>
						<div class="card_body">
							<!--                         <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Dolorum porro, illum totam nostrum sit delectus nisi sint magni perspiciatis adipisci?</p> -->
							<div>
								<i class="bi bi-suit-heart-fill"></i> <span class="num"
									data-val="300">000</span>
							</div>
						</div>
					</div>
				</div>
				<br>
				<div class="grid">
					<div class="card">
						<h2 class="card_title">2. 나의 팀버튼 선생님</h2>
						<div class="card_img">
							<img src="/images/이기적유전자.jpg" alt="">
						</div>
						<div class="card_body">
							<!--                         <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Dolorum porro, illum totam nostrum sit delectus nisi sint magni perspiciatis adipisci?</p> -->
							<div>
								<i class="bi bi-suit-heart-fill"></i> <span class="num"
									data-val="230">000</span>
							</div>
						</div>
					</div>
				</div>
				<br>
				<div class="grid">
					<div class="card">
						<h2 class="card_title">3. 평민의 역사</h2>
						<div class="card_img">
							<img src="/images/평면의역사.jpg" alt="">
						</div>
						<div class="card_body">
							<!--                         <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Dolorum porro, illum totam nostrum sit delectus nisi sint magni perspiciatis adipisci?</p> -->
							<div>
								<i class="bi bi-suit-heart-fill"></i> <span class="num"
									data-val="150">000</span>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--     </div> -->

			<c:forEach items="${getGoodList}" var="getGoodList"
				varStatus="status">
				<div class="row ">
					<div class="col">
						<a href="getUserExhibition?exh_no=${getGoodList.exh_no}">
							${status.count} ${getGoodList.exh_title}</a> ${getGoodList.rank_cnt }<br>
					</div>
				</div>
			</c:forEach>
		</div>
		<div class="rank2">
			<span style="color: #7832f7">%</span>예매율<br>
			<br>

			<!--      <div class="cd"> -->
			<div class="container">
				<div class="grid">
					<div class="card">
						<h2 class="card_title">1. 나의 조랑말 선생님</h2>
						<div class="card_img">
							<img src="/images/아라의소설.jpg" alt="">
						</div>
						<div class="card_body">
							<!--                         <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Dolorum porro, illum totam nostrum sit delectus nisi sint magni perspiciatis adipisci?</p> -->
							<div class="container cir">
								<div class="circular-progress1">
									<div class="value-container1">0%</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<br>
				<div class="grid">
					<div class="card">
						<h2 class="card_title">2. 나의 팀버튼 선생님</h2>
						<div class="card_img">
							<img src="/images/이기적유전자.jpg" alt="">
						</div>
						<div class="card_body">
							<!--                         <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Dolorum porro, illum totam nostrum sit delectus nisi sint magni perspiciatis adipisci?</p> -->
							<div class="container cir">
								<div class="circular-progress2">
									<div class="value-container2">0%</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<br>
				<div class="grid">
					<div class="card">
						<h2 class="card_title">3. 평민의 역사</h2>
						<div class="card_img">
							<img src="/images/평면의역사.jpg" alt="">
						</div>
						<div class="card_body">
							<!--                         <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Dolorum porro, illum totam nostrum sit delectus nisi sint magni perspiciatis adipisci?</p> -->
							<div class="container cir">
								<div class="circular-progress3">
									<div class="value-container3">0%</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--     </div> -->


		</div>
	</section>
	<div class="rank_ex">
		<button type="button" onclick="location.href= '../ranking'">
			<span style="color: #7832f7">+</span>more
		</button>
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
	<%@ include file="footer.jsp"%>
	<!-- footer end -->
	<!-- Script -->
	<script src="js/circular-progress.js"></script>
</body>
</html>