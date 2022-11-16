<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
<link rel="stylesheet" href="//cdn.jsdelivr.net/gh/xpressengine/xeicon@2.3.1/xeicon.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
  <link rel="stylesheet" href="./css/exhibitionDetail.css">
<title>${exhibition.exh_title}</title>

<script>
$(function(){
	$("#menu1").css({"border":"1px solid #999", "border-bottom":"1px solid white"});
	$("#menu1").siblings("div.tabDiv").css({"background-color":"white", "border-bottom":"1px solid #999"});
	$("#con1").show();
	$("#con1").siblings("div.conBox").hide();
	
	$("div.tabDiv").on("click",function(){
		let id = $(this).attr("id");
		$('#'+id).css({"border":"1px solid #999", "border-bottom":"1px solid white","background-color":"#fff"});
		$('#'+id).siblings("div.tabDiv").css({"border":"1px solid white","background-color":"white", "border-bottom":"1px solid #999"});
		$('#con'+id.substring(4,5)).show();
		$('#con'+id.substring(4,5)).siblings("div.conBox").hide();
	});
});


var edate = new Date('${exhibition.exh_end_date}');
var sdate = new Date('${exhibition.exh_st_date}');
var ndate = new Date();
var mond = document.getElementById("modify"); 	
var dond = document.getElementById("del"); 	
var aond = document.getElementById("approval"); 	

(function delmo() {
   let approval = "${exhibition.exh_approval}";
   if (approval == 1 && edate <= ndate) {
//    	$(#modify).attr("disabled", true);
//    	$(#del).attr("disabled", true);
//    	$(#approval).attr("disabled", true);
   	mond.style.display = 'none';
   	dond.style.display = 'none';
   	aond.style.display = 'none';
   } else if (approval == 1) {
   	dond.style.display = 'none';
   	aond.style.display = 'none';
//    	$(#del).attr("disabled", true);
//    	$(#approval).attr("disabled", true);
   } else if (approval == 0 && sdate <= ndate) {
   	aond.style.display = 'none';
   } else{
   }
})();


function del(page){
 var delConfirm = confirm('정말 삭제하시겠습니까?');
 var page= page;
if (delConfirm == true) {

   location.href = 'deleteExhibition?exh_no=${exhibition.exh_no}&page='+page;
   alert('삭제되었습니다.');
}
else {
   alert('삭제가 취소되었습니다.');
}
}

function approval(){
 var approvalConfirm = confirm('정말 승인하시겠습니까?');
if (approvalConfirm == true) {

   location.href = 'approvalExhibition?exh_no=${exhibition.exh_no}';
   alert('승인 되었습니다.');
}
else {
   alert('승인이 취소되었습니다.');
}
}

var tt = new Date('${exhibition.exh_mdf_date}');
console.log(tt);
</script>
</head>
<body class="d-flex flex-column min-vh-100">
<div class="container" style="text-align:center; padding: 50px 0;">
	<div class="row">
	<div class="col-md-5"> 
	<img src="/images/${exhibition.exh_thumbnail }" id="thum1" alt="이미지" style="width:400px; height: 500px;">
<!-- 	<img src="/images/poroly.png" alt="이미지" style="width:400px; height: 500px;"> -->
	</div>
	<div class="col-md-7" style="text-align: left; font-size: 13pt;">
		<h3 style="font-weight: bold;">${exhibition.exh_title}</h3>
		<h6 style="color: gray;">${exhibition.exh_st_date}~ ${exhibition.exh_end_date}</h6>
		<h5>${exhibition.exh_hall}</h5>
		<hr style="border: 1px solid black;">
		<div class="row" style="line-height: 300%;">
	<div class="col-3">작가</div> <div class="col-9" id="col">${exhibition.exh_artist}</div>
	<div class="col-3">관람등급</div> <div class="col-9" id="col"> ${exhibition.exh_rating}</div>
	<div class="col-3">관람시간</div> <div class="col-9" id="col"> ${exhibition.exh_time}</div>
	<div class="col-3">발권정보</div> <div class="col-9" id="col"> ${exhibition.exh_shipping_info}</div>
	<div class="col-3">예매수수료</div> <div class="col-9" id="col"><fmt:formatNumber value="${exhibition.exh_fee}" groupingUsed="true" />원</div>
	<div class="col-3">가격</div> <div class="col-9" id="col1"><fmt:formatNumber value="${exhibition.exh_price}" groupingUsed="true" />원</div>
	
	<div class="col-3"></div> 
	<div class="col-9" style="text-align:center; font-size: 16pt;">
	
				
 
		
</div>
	</div>
	</div>
	</div>
<!-- 하단 -->
<div class="container">
<jsp:useBean id="now" class="java.util.Date" /> 
        <fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" /> 
		<h5>
		<c:choose>
				<c:when test="${exhibition.exh_approval eq 0 && exhibition.exh_st_date <= today}">
				<p>승인 불가</p>
				<p>전시 시작일자를 변경해주세요.</p>
				</c:when>
				<c:when test="${exhibition.exh_approval eq 0 && exhibition.exh_st_date > today}">
				<p>승인 대기</p>
				</c:when>
				<c:when test="${exhibition.exh_approval eq 1 && exhibition.exh_end_date < today}">
				<p>전시 종료</p>
				</c:when>
				<c:when test="${exhibition.exh_approval eq 1 && exhibition.exh_st_date > today}">
				<p>승인</p>
				<p>전시 예정</p>
				</c:when>
				<c:otherwise>
				<p>전시 진행중</p>
				</c:otherwise>
		</c:choose>
		</h5>
		
		 <div>
			<a href="modifymoveExhibition?"><button type="button" id="modify" class="btn btn-dark">수정</button></a>
			<button type="button" id="del" class="btn btn-dark" onclick="del('${page}')">삭제</button>
			<button type="button" id="approval" class="btn btn-dark" onclick="approval()">승인</button></a>
			<a href="getExhibitionList"><button type="button" id="exh_List" class="btn btn-dark">목록</button></a>
		</div>
		
  <div class="row a" style="padding-top: 50px; margin-left: 0; margin-right: 0;">
    <div class="col tabDiv pt-3 pb-2" id="menu1"><h5>상세정보</h5></div>
    <div class="col tabDiv pt-3 pb-2" id="menu2"><h5>관람후기</h5></div>
    <div class="col tabDiv pt-3 pb-2" id="menu3"><h5>장소정보</h5></div>
  </div>
  <div id="con1" class="conBox p-3" style="background-color: white; text-align:left !important;"><%@ include file="../exhibition/Information.jsp"%></div>
  <div id="con2" class="conBox p-3" style="background-color: white; text-align:left !important;"><%@ include file="../exhibition/reviewwrite.jsp"%></div>
  <div id="con3" class="conBox p-3" style="background-color: white;"><%@ include file="../exhibition/UserExhibitionLocation.jsp"%></div>
</div>
	<br>
	</div>
	<br>
<%-- <%@ include file="../../footer.jsp" %> --%>
</body>

</html>
