<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뉴전시스</title>

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
/*    grid-template-columns: 300px; */
   grid-template-columns: 1fr 1fr
   gap: 3%;
   margin: 2% 0;
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
   height: 100% !important;
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
/*    width: 100%; */
   width: 20rem;
   height: 25rem;
   /* border-radius: 20px; */
}

.card_body-1 {
/*    padding: 29px 20px 30px 20px; */
   text-align: -webkit-center;
}

.card_body-2 {
/*    padding: 29px 20px 30px 20px; */
   text-align: -webkit-center;
}

.card_title {
   text-transform: capitalize;
   font-size: 16px;
   padding-bottom: 10px;
}

.card_body p {
   font-weight: 400;
   font-size: 18px;
   line-height: 1.7;
}

.card:hover {
box-shadow : 10px 10px 3px #ddd;
cursor : pointer;
}

@media (max-width: 576px) {
/* rank시작 */

.rank-semititle {
   padding-left: 25px;
}

.rank_box {
   margin-top: 5px;
   display: flex;
/*    display: grid !important; */
/*    grid-template-columns: 1fr 1fr !important; */
}

 .rank_box > div { 
/*    position:relative; */
/*    display: inline-block; */
/*    text-align: center; */
/*      height: 1900px;  */
     line-height: 20px; 
 } 

/* .rank_box > img { */
/*    position:relative; */
/*    display: inline-block; */
   
/* } */


.rank1 {
   width: 100%;
}

.rank2 {
   width: 100%;
}


.rank-title {
   text-align: center;
    position: sticky;
/*     margin-top: 50px;  */
}


.rank-title {
   font-size: 50px;
/*    top:40%; */
}

.rank_ex {
   text-align: center;
}

.rank_ex > button {
   height: 50px;
   width: 120px;
   font-size: 25px;
   background-color: #fff;
   border-width: 1px;
   border-color: #1f1f1f;
}

/* rank 끝 */


/* 카드 시작*/
.card_img img {
      width: 100%;
}
.container-card {
   max-width: 100%;
   width: 100%;
   height: 90%;
   box-sizing: initial;
}
.grid-card {
   display: grid;
   grid-template-columns: 350px;
   gap: 2%;
/*    margin: 2% 0; */
   justify-content: center; 
}
.card_title {
/*    text-transform: capitalize; */
   font-size: 16px;
/*    padding-bottom: 10px; */
}

.card_body p {
   font-weight: 400;
   font-size: 18px;
/*    line-height: 1.7; */
}

.card_body-1 {
   padding: 20px 20px 20px 20px;
   text-align: -webkit-center;
}

.card_body-2 {
   padding: 20px 20px 20px 20px;
   text-align: -webkit-center;
}
/* 카드 끝*/

body, html {
   width: 100%;
   overflow-x: hidden;
}
}

</style>
<link rel="stylesheet" href="./css/owl.carousel.css">
<link rel="stylesheet" href="./css/owl.theme.default.css">
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
         </div>
      </div>
      
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

      <section class="rank_box row row-cols-1 row-cols-md-2 g-3">
         <div class="rank1">
         <span class="rank-semititle">좋아요</span><br>
            <br>

         <div class="container container-card  container-card1">
            
         </div>

      </div>
      
      <div class="rank2">
         <span class="rank-semititle">예매율</span><br>
         <br>

         <div class="container container-card container-card2">

         
         </div>

         </div>
   </section><br><br>
      <div class="rank_ex">
         <button type="button" onclick="location.href= '../ranking'">
            <span style="color: #7832f7">+</span>더보기
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
         location.href='getUserExhibition?exh_no='+a;
         
      }
      
        $(document).ready(function() {
       $.ajax({
            type:'get',
            url:"/index",
         
            success:function(data) {
          
          var rlist = data.rlist;
          var elist = data.elist;
          var glist = data.glist;
          var timeOff = new Date().getTimezoneOffset()*60000;
       
          
          
          $.each(elist, function(i, v){
             if(i < 3){
             
             var e_exno = elist[i].exh_no;
             var e_title = elist[i].exh_title;
             var e_banne = elist[i].exh_banne;
             
             var elist_html = "<div class='carousel-item'>";
                                                            
             elist_html += "<img src='./images/"+e_banne+"'class='d-block w-100' alt='"+e_banne+"'>";
             elist_html += "<div class='carousel-caption d-none d-md-block'>";
             elist_html += "</div>";
             elist_html += "</div>";
             
             
                
             $(".carousel-inner").append(elist_html);
             
             
             $(".carousel-item").eq(0).addClass("carousel-item active");
             
             
         }
          
         });
          
          
          $.each(glist, function(i, v){
             if(i < 3){
             var rank_cnt  =  glist[i].rank_cnt;
             
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
             glist_html += "<a style='font-size:16px;'>"+g_stdate+" ~ "+g_enddate+"</a><br>";
//              glist_html += `<div>`;
             glist_html += "<a style='font-size:16px;'>"+g_local_name+"</a>";
//              glist_html += `</div>`;
             glist_html += `</div>`;
             glist_html += `</div>`;
             glist_html += `</div>`;
             glist_html += `<br>`;
             
             
             $(".container-card1").append(glist_html);
         }
          
         });
    
             
          $.each(rlist, function(i, v){
             if(i < 3){
             var rank_cnt  =  rlist[i].rank_cnt;
         
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
         rlist_html += "<a style='font-size:16px;'>"+r_stdate+" ~ "+r_enddate+"</a><br>";
//          rlist_html += `<div>`;
         rlist_html += "<a style='font-size:16px;'>"+r_local_name+"</a>";
//          rlist_html += `</div>`;
         rlist_html += `</div>`;
         rlist_html += `</div>`;
         rlist_html += `</div>`;
         rlist_html += `<br>`;

         
            $(".container-card2").append(rlist_html);
         
         }
          });
         }
         });
        });
         
         
      </script>
            <!-- footer start -->
      <%@ include file="footer.jsp"%>
      <!-- footer end -->
</body>
</html>