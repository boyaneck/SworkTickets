<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
   crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+"
   crossorigin="anonymous"></script>

   <script src="https://developers.kakao.com/sdk/js/kakao.js"></script> 
<!--    <script src="https://kit.fontawesome.com/22152c116a.js" crossorigin="anonymous"></script> -->
    <link rel="stylesheet" href="//cdn.jsdelivr.net/gh/xpressengine/xeicon@2.3.1/xeicon.min.css">
<link rel="stylesheet" href="./css/style.css">
<link rel="stylesheet" href="./css/board.css">
<link rel="stylesheet" href="./css/ranking.css">
<link rel="shortcut icon" href="./images/favicon.ico">
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>
<title>뉴전시스</title>
</head>

<!-- 회원 -->
<nav class="navbar navbar-expand-sm navbar-light header-navbar"
   data-toggle="affix">
   <a class="navbar-brand logoimg" href="index.jsp"> <img
      style="width: 140px;" src="./images/logo.png">&nbsp&nbsp
   </a>
<!-- 햄버거 시작-->
     
    <div class="collapse" id="collapsibleNavbar">
    <ul class="navbar-nav hambuger">
    
      <div class="form-group col-xs-6 my-2">
        <div class="inner-addon right-addon" name="addonHambuger">
          <i class="glyphicon fas fa-search"></i>
         <input type="text" class="form-control main" placeholder="검색" name="eSearchKeyword" id="eSearchKeyword" onkeyup="searchkey()" value="${eSearchKeyword }"/>
          <button style="float:right; position:absolute; background:none; border:none;right:2%;top:2%;" class="searchbtn" onclick="searchkeya()"> <i class="xi-magnifier"></i></button>
  </div>
      </div>
    
      <li class="nav-item">
      <c:if test='${mb_Id ne NULL}'>
        <span class="nav-hello hambuger">${mb_Id}님 안녕하세요</span>
      </c:if>
      </li>
      <li class="nav-item dropdown hambuger">
      <c:if test='${mb_Id ne NULL}'>
        <a class="nav-link hambuger" data-toggle="dropdown" role="button" 
        style="font-size:20px; font-weight:600; color:#1f1f1f;"> 마이페이지 </a>
        <div class="dropdown-menu header-menu" aria-labelledby="member" style="margin-right:20px;">
           <a class="dropdown-item header-item" id="memberUpdate" href="mypageView">&nbsp회원수정</a>
           <a class="dropdown-item header-item" href="/getPayList">&nbsp나의구매내역</a>
             <a class="dropdown-item header-item" href="/MyCoupon">&nbsp내 쿠폰함</a>
             <a class="dropdown-item header-item" href="/getMyGoodList">&nbsp내 좋아요 목록</a>
        </div>
       </c:if>
      </li>
      <li class="nav-item">
         <a class="nav-link mypage hambuger" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> 마이페이지 </a>            
      </li>
      <li class="nav-item" style="margin-top:0px;">
        <a class="nav-link hambuger" href="/getUserExhibitionList" style="padding-top:0px;" > 전시 </a>
      </li>
      <li class="nav-item">
        <a class="nav-link hambuger" href="/ranking"> 랭킹 </a>
      </li>
      <li class="nav-item">
        <a class="nav-link hambuger" href=/local> 지역 </a>
      </li>
      <li class="nav-item">
        <a class="nav-link hambuger" href=/getCouponList> 쿠폰 </a>
      </li>
      <li class="nav-item">
        <a class="nav-link hambuger" data-toggle="dropdown" href="/getOneList" role="button" aria-haspopup="true" aria-expanded="false"> 고객센터 </a>
         <div class="dropdown-menu header-menu" aria-labelledby="cs">
               <a class="dropdown-item header-item" href="/getBoardList">공지사항</a>
               <a class="dropdown-item header-item" href="/getFaqList">자주묻는질문</a>
               <a class="dropdown-item header-item" href="/getOneList">1:1 문의</a>
        </div>
      </li>
         
    </ul>
    <c:if test='${mb_Id eq NULL}'>
    <a class="dropdown-item header-item-login hamburger" href="login.jsp" >&nbsp로그인</a>
    </c:if>
    
    <c:if test='${mb_Id ne NULL}'>
    <a class="nav-link header-logout hamburger" href="/logoutGO" style="margin:10px 268px 0 20px;">로그아웃</a>
    </c:if>
  </div>
<!--   햄버거 끝 -->
  
   <c:choose>
      <c:when test='${mb_Id eq "admin"}'>
      
         <ul class="nav navbar-nav mr-auto ml-3">
         <li class="nav-item dropdown header-title">
            <a class="nav-link header" href="/getExhibitionList"> 전시 </a>
         </li>
         <li class="nav-item dropdown header-title">
            <a class="nav-link header" href="/ranking"> 랭킹 </a>
         </li>
         <li class="nav-item dropdown header-title">
            <a class="nav-link header" href="/local"> 지역 </a>
         </li>
         <li class="nav-item dropdown header-title">
            <a class="nav-link header" data-toggle="dropdown" href="/getCouponList" role="button" aria-haspopup="true" aria-expanded="false"> 쿠폰 </a>
            <div class="dropdown-menu header-menu" aria-labelledby="coupon">
            <a class="dropdown-item header-item" href="/getCouponList">쿠폰목록</a>
            <a class="dropdown-item header-item" href="/insertCouponForm">쿠폰등록</a>
            </div>
         </li>
         <li class="nav-item dropdown header-title">
            <a class="nav-link header" data-toggle="dropdown" href="/getOneList" role="button" aria-haspopup="true" aria-expanded="false"> 고객센터 </a>
            <div class="dropdown-menu header-menu" aria-labelledby="cs">
               <a class="dropdown-item header-item" href="/getBoardList">공지사항</a>
               <a class="dropdown-item header-item" href="/adminFaqList">자주묻는질문</a>
               <a class="dropdown-item header-item" href="/getOneList">1:1 문의</a>
            </div>
         </li>
      </ul>
      
      <ul class="nav navbar-nav navbar-right">
        <!-- 검색 -->
      <div class="form-group col-xs-6 my-2">
        <div class="inner-addon right-addon main" name="addonMain">
          <input type="text" class="form-control main" placeholder="검색" name="eSearchKeyword" id="eSearchKeyword" onkeyup="searchkey()" value="${eSearchKeyword }"/>
          <button style="float:right; position:absolute; background:none; border:none;right:2%;top:2%;" class="searchbtn" onclick="searchkeya()"> <i class="xi-magnifier"></i></button>
        </div>
      </div>
      <!-- 검색 -->
               <li class="nav-item">
                     <span class="nav-hello-main">${mb_Id}님 안녕하세요</span>
               </li>
               <li class="nav-item dropdown header-title">
               <a class="nav-link dropdown-toggle header-toggle" data-toggle="dropdown" href="/admin" role="button" aria-haspopup="true" aria-expanded="false"> 관리자 </a>
               <div class="dropdown-menu header-menu" aria-labelledby="member">
               <!-- <a class="nav-link header-logout" href="/logoutGO">로그아웃</a> -->
               <!-- <a class="dropdown-item header-item" href="/getMemberList">&nbsp회원목록</a> -->
               <a class="dropdown-item header-item" href="/admin" >관리자페이지</a>
               </div>
               </li>
            </ul>
               <a class="nav-link header-logout main" href="/logoutGO">로그아웃</a>
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
            <a class="nav-link header" href="/local"> 지역 </a>
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
        <div class="inner-addon right-addon main" name="addonMain">
          <input type="text" class="form-control main" placeholder="검색" name="eSearchKeyword" id="eSearchKeyword" onkeyup="searchkey()" value="${eSearchKeyword }"/>
          <button style="float:right; position:absolute; background:none; border:none;right:2%;top:2%;" class="searchbtn" onclick="searchkeya()"> <i class="xi-magnifier"></i></button>
        </div>
      </div>
      <!-- 검색 -->
               <li class="nav-item">
                     <span class="nav-hello-main">${mb_Id}님 안녕하세요</span>
               </li>
               <li class="nav-item dropdown header-title">
               <a class="nav-link mypage" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false"> 마이페이지 </a>
               <div class="dropdown-menu header-menu" aria-labelledby="member">
               <a class="dropdown-item header-item" id="memberUpdate" href="mypageView">&nbsp회원수정</a>
               <a class="dropdown-item header-item" href="/getPayList">&nbsp나의구매내역</a>
               <a class="dropdown-item header-item" href="/MyCoupon">&nbsp내 쿠폰함</a>
                  <a class="dropdown-item header-item" href="/getMyGoodList">&nbsp내 좋아요 목록</a>
               </div>
               </li>
            </ul>
            
               <a class="nav-link header-logout main" href="/logoutGO">로그아웃</a>
      </c:when>
        <c:when test="${mb_Id ne NULL || mb_Id ne NULL}">
         <ul class="nav navbar-nav mr-auto ml-3">
         <li class="nav-item dropdown header-title">
            <a class="nav-link header" href="/getUserExhibitionList" > 전시 </a>
         </li>
         <li class="nav-item dropdown header-title">
            <a class="nav-link header" href="/ranking"> 랭킹 </a>
         </li>
         <li class="nav-item dropdown header-title">
            <a class="nav-link header" href="/local"> 지역 </a>
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
        <div class="inner-addon right-addon main" name="addonMain">
          <input type="text" class="form-control main" placeholder="검색" name="eSearchKeyword" id="eSearchKeyword" onkeyup="searchkey()" value="${eSearchKeyword }"/>
          <button style="float:right; position:absolute; background:none; border:none;right:2%;top:2%;" class="searchbtn" onclick="searchkeya()"> <i class="xi-magnifier"></i></button>
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
            
               <a class="nav-link header-logout main" href="/logoutGO">로그아웃</a>
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
            <a class="nav-link header" href="/local"> 지역 </a>
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
        <div class="inner-addon right-addon main" name="addonMain">
          <input type="text" class="form-control main" placeholder="검색" name="eSearchKeyword" id="eSearchKeyword" onkeyup="searchkey()" value="${eSearchKeyword }"/>
          <button style="float:right; position:absolute; background:none; border:none;right:2%;top:2%;" class="searchbtn" onclick="searchkeya()"> <i class="xi-magnifier"></i></button>
        </div>
      </div>
      <!-- 검색 -->
      
      <ul class="nav navbar-nav navbar-right">
            <li class="nav-item dropdown header-title">
            <!-- <a class="nav-link dropdown-toggle header-toggle-login" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false"> 로그인 </a>
               <div class="dropdown-menu header-menu" aria-labelledby="login"> -->
            <a class="dropdown-item header-item-login main" href="login.jsp">&nbsp로그인</a>
            <!-- <a class="dropdown-item header-item" href="/login/kakao">&nbsp카카오로그인</a> -->
            <!-- <a class="dropdown-item header-item" href="insertMember.jsp">&nbsp회원가입</a> -->
            <!-- </div> -->
            </li>
        </ul>
      </c:otherwise>   
   </c:choose>
<!--    햄버거 버튼 -->
     <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>
</nav>
<script>
function searchkey() {
    if (window.event.keyCode == 13) {

 // 엔터키가 눌렸을 때 실행하는 반응
    var exs = document.getElementById("eSearchKeyword").value;

    location.href="getUserExhibitionList?eSearchKeyword="+exs;
    }
}
function searchkeya() {

    var exsu = document.getElementById("eSearchKeyword").value;

    location.href="getUserExhibitionList?eSearchKeyword="+exsu;
}

/* $(document).ready(function(){
    $("#memberUpdate").click(function(){
        // 확인 대화상자    
        if(confirm("수정하시겠습니까?")){
            document.form1.action ="member/mypageConfirm";
            document.form1.submit();
        }
    });
}); */
</script>
</html>