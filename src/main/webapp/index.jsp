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
	justify-content: center; 
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

.card1 {
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
	padding: 29px 20px 30px 20px;
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

.card:hover {
box-shadow : 10px 10px 3px #ddd;
cursor : pointer;
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

.body {
	padding: 0;
	margin: 0;
	height: 600vh;
	width: 100vw;
	font-family: "Nunito", sans-serif;
	background-color: #e34f37;
	color: white;
}

h1 {
	font-family: "longline";
}

.slider-section {
	height: 22hv;
	bottom: 0;
	position: fixed;
	width: 100%;
}

h1 {
	font-size: 10vw;
}

.wheel {
	position: absolute;
	top: 0;
	display: flex;
	align-items: center;
	justify-content: center;
	width: 300vw;
	height: 300vw;
	max-width: 2000px;
	max-height: 2000px;
	left: 50%;
	transform: translateX(-50%);
}

.wheel__card {
	position: absolute;
	top: 0;
	left: 0;
	width: 6%;
	max-width: 200px;
	aspect-ratio: 1/1;
	cursor: pointer;
}

img {
	width: 300%;
	height: 400%;
	pointer-events: none;
	z-index: 999;
	cursor: pointer;
}

.hi {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 60vh;
	display: flex;
	align-items: center;
	justify-content: center;
	cursor: pointer;
}

.hi img {
	width: 100vw;
	height: 100vw;
	max-height: 500px;
	max-width: 500px;
}

</style>
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
				</div>
			</div>
			<div class="carousel-item">
				<img src="./images/main_image2.png" class="d-block w-100" alt="배경이미지2">
				<div class="carousel-caption d-none d-md-block">
				</div>
			</div>
			<div class="carousel-item">
				<img src="./images/main_image3.png" class="d-block w-100" alt="배경이미지3">
				<div class="carousel-caption d-none d-md-block">
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
			<button type="button" class="newEx_btn" onclick="location.href= '../getUserExhibitionList'">
				<span style="color: #7832f7">+</span>more
			</button>
		</div>
		<!-- 센터 시작 -->

		<div class="rank_center">
			<h1 class="rank-title">RANK</h1>
		</div>

		<section class="rank_box">
			<div class="rank1">
				<i class="bi bi-suit-heart-fill"></i> 좋아요<br>
				<br>

					  <!-- 	  <div class="cd"> -->
			<div class="container container-card">
				
			</div>
<!-- 		</div> -->

		</div>
		
		<div class="rank2">
			<span style="color: #7832f7">%</span>예매율<br>
			<br>

			<!-- 	  <div class="cd"> -->
			<div class="container-card2">

			
			</div>
<!-- 		</div> -->

			</div>
			
		</section>
		<div class="rank_ex">
			<button type="button" onclick="location.href= '../ranking'">
				<span style="color: #7832f7">+</span>more
			</button>
		</div>

		<!-- 센터 끝 -->


		<!-- Script -->
		<script src='https://unpkg.co/gsap@3/dist/gsap.min.js'></script>
		<script src='https://unpkg.com/gsap@3/dist/ScrollTrigger.min.js'></script>
		<script src='https://unpkg.com/gsap@3/dist/MotionPathPlugin.min.js'></script>
		<script src='https://assets.codepen.io/16327/Flip.min.js'></script>
		<script type="text/javascript">
		
			
		function rink(a){
			console.log("!!!!!!!!!: "+a);
			location.href='getUserExhibition?exh_no='+a;
			
		}
		
 		$.ajax({
  	 		type:'get',
   			url:"/index",
			
   			success:function(data) {
			console.log("성공");
			console.log(data.ptotal);
			console.log("data:");
			console.log(data);
 			
 			var rlist = data.rlist;
 			console.log("rlist:");
 			console.log(rlist);
 			var elist = data.elist;
 			console.log("elist:");
 			console.log(elist);
 			var glist = data.glist;
 			console.log("glist:");
 			console.log(glist);
 			var timeOff = new Date().getTimezoneOffset()*60000;
 		
 			
 			$.each(glist, function(i, v){
 				if(i < 3){
 				console.log("좋아요");
 				var rank_cnt  =  glist[i].rank_cnt;
 				console.log(glist[i].exh_no);
 				
 				var g_exno = glist[i].exh_no;
 				var g_title = glist[i].exh_title;
 				var g_thumb = glist[i].exh_thumbnail;
 				var g_cnt = glist[i].rank_cnt;
 				var g_st_date = glist[i].exh_st_date;
 				var g_end_date = glist[i].exh_end_date;
 				var g_local_name = glist[i].exh_local_name;
 				
 				var g_stdate = new Date(g_st_date-timeOff).toISOString().split("T")[0];
 				var g_enddate = new Date(g_end_date-timeOff).toISOString().split("T")[0];
 				
 				var glist_html = `<div class="grid-card">`;

 				glist_html += "<div class='card' onclick='rink("+g_exno+")'>";
 				glist_html += `<h2 class="card_title">`;
 				glist_html += (i+1)+". "+g_title+" </h2>";
 				glist_html += `<div class="card_img">`;
 				glist_html += "<img src='/images/"+g_thumb+"' alt='"+g_thumb+"'>";
 				glist_html += `</div>`;
 				glist_html += `<div class="card_body-1">`;
 				glist_html += "<p style='font-size:16px;'>"+g_stdate+" ~ "+g_enddate+"</p>";
 				glist_html += `<div>`;
 				glist_html += "<span style='font-size:16px;'>"+g_local_name+"</span>";
 				glist_html += `</div>`;
 				glist_html += `</div>`;
 				glist_html += `</div>`;
 				glist_html += `</div>`;
 				glist_html += `<br>`;
 				
 				$(".container-card").append(glist_html);
			}
 			
			});
 	
 				
 			$.each(rlist, function(i, v){
 				if(i < 3){
 				console.log("랭킹");
 				var rank_cnt  =  rlist[i].rank_cnt;
 				console.log(rlist[i].exh_no);
			
			var r_exno = rlist[i].exh_no;
			var r_title = rlist[i].exh_title;
			var r_thumb = rlist[i].exh_thumbnail;
			var r_st_date = rlist[i].exh_st_date;
			var r_end_date = rlist[i].exh_end_date;
			var r_local_name = rlist[i].exh_local_name;
				
			var r_stdate = new Date(r_st_date-timeOff).toISOString().split("T")[0];
			var r_enddate = new Date(r_end_date-timeOff).toISOString().split("T")[0];

			var rlist_html = `<div class="grid-card">`;

			rlist_html += "<div class='card' onclick='rink("+r_exno+")'>";
			rlist_html += `<h2 class="card_title">`;
			rlist_html += (i+1)+". "+r_title+" </h2>";
			rlist_html += `<div class="card_img">`;
			rlist_html += "<img src='/images/"+r_thumb+"' alt='"+r_thumb+"'>";
			rlist_html += `</div>`;
			rlist_html += `<div class="card_body-2">`;
			rlist_html += "<p style='font-size:16px;'>"+r_stdate+" ~ "+r_enddate+"</p>";
			rlist_html += `<div>`;
			rlist_html += "<span style='font-size:16px;'>"+r_local_name+"</span>";
			rlist_html += `</div>`;
			rlist_html += `</div>`;
			rlist_html += `</div>`;
			rlist_html += `</div>`;
			rlist_html += `<br>`;
			
				$(".container-card2").append(rlist_html);
			
			}
 			});
			}
			})
			
		</script>
<!-- 		<script src="js/circular-progress.js"></script> -->
				<!-- footer start -->
		<%@ include file="footer.jsp"%>
		<!-- footer end -->
</body>
</html>