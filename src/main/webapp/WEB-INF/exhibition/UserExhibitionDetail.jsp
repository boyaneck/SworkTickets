<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
<link rel="stylesheet" href="//cdn.jsdelivr.net/gh/xpressengine/xeicon@2.3.1/xeicon.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<title>${exhibition.exh_title}</title>

<style>
input.my_checkbox {
	display: none;
}
</style>

<script>
$(function(){
	/*
	즉시 실행 함수 종류
	- $(function(){}
	- $(document).ready(function(){},
	- window.onload = function() {}
			*/
	const checkbox = $('.my_checkbox');
	/*
	<input type="checkbox" class="my_checkbox" id="my_checkbox2" value="2">
	<input type="checkbox" class="my_checkbox" id="my_checkbox3" value="3">
	*/
	//$.each(배열객체, function(인덱스, 배열요소 하나씩 떼어오는 변수){소스코드});
	$.each(checkbox, function(i, v){
		const is_checked = checkbox[i].checked;
		if(is_checked){
			$(this).siblings(".nogood").hide();
			$(this).siblings(".good").show();
		}else{
			$(this).siblings(".good").hide();
			$(this).siblings(".nogood").show();
		}
	});
	
});

function is_checked(eno) {//eno=3
	//document => html객체
	 // 1. checkbox element를 찾습니다.
	 //Element = 요소 = 태그 
	 //document html에서 id가 my_checkbox3 이라는 요소(태그)를 가져와라 
		// <input type="checkbox" class="my_checkbox" id="my_checkbox3" value="3">
	  const checkbox = document.getElementById('my_checkbox'+eno);

	  // 2. checked 속성을 체크합니다.
	  /* checkbox.checked : 
		  -체크가 되어있으면 true를 반환 
		  -체크가 안되있으면 false를 반환
		  */
	  const is_checked = checkbox.checked;
// 	  alert('chk: '+is_checked);
	// 3. 결과를 출력합니다. 
	//{}중괄호로 묶고 값이 key : value의 쌍으로 되어있는 자바스크립트의 자료형은 object = json
	  if(is_checked) {
		  $.ajax({
			  // url: 은 컨트롤러의 @RequestMapping(value="/insertOne"을 호출한다.
				url : "insertGood",
			  //data: 는 파라미터를 전송한다.
			  //$('#my_checkbox'+eno).val() : ID가 my_checkbox3인 태그의 값을 가져오라는 의미.
			  // val() : 값을 가져오라는 의미. val(5) : 값을 5로 설정하라는 의미. 
				data : {exh_no : $('#my_checkbox'+eno).val()},
				//type : data전송방식 = method type => post, get
				type : "POST",
				//success : ajax가 성공적으로 처리되었을때 실행됨
				success : function(res){ //res : 처리한곳에서 보내는 데이터
					if(res > 0){
						$('#my_checkbox'+eno).siblings(".nogood").hide();
						$('#my_checkbox'+eno).siblings(".good").show();
					}
				},
				// ajax가 실패했을때 실행됨
				error :  function(){
					alert("로그인 하십시오.");
					
				}
		  });
	  }else{  
		  $.ajax({
				url : "deleteGood",
				data : {exh_no : $('#my_checkbox'+eno).val()},
				type : "POST",
				success : function(res){
					if(res > 0){
						$('#my_checkbox'+eno).siblings(".nogood").show();
						$('#my_checkbox'+eno).siblings(".good").hide();
					}
				},
				error :  function(){
					alert("오류가 발생했습니다.");
				}
		  });
	  }
	
	  
}

</script>
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
</script>
<style>
.btn11{
	width: 160px;
	height: 45px;
	color: white; 
	background-color: black; 
	border: solid 1px;
	font-weight: bold;
	font-size: 16pt;
	margin-bottom: 10px;
	padding-bottom: 50px;
}
#col{text-align: left;}
#col1{color: #7329f7; font-weight: bold; }

  div.row a{text-align:center;margin-right:0px;margin-left:0px; padding-top: 50px; background-color: white !important;}
  div.tabDiv:hover{cursor:pointer;}
  div.conBox{width:100%; height: 500px;}
  .col{background-color: white;}
  </style>
</head>
<body class="d-flex flex-column min-vh-100">
<div class="container" style="text-align:center; padding: 50px 0;">
	<div class="row">
	<div class="col-5">
	<img src="/images/${exhibition.exh_thumbnail }" alt="이미지" style="width:400px; height: 500px;">
<!-- 	<img src="/images/poroly.png" alt="이미지" style="width:400px; height: 500px;"> -->
	</div>
	<div class="col-7" style="text-align: left; font-size: 13pt;">
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
	<div class="col-9" style="text-align:right; font-size: 16pt;">
	<!--         좋아요 기능 버튼 -->
		<span onclick='is_checked(${exhibition.exh_no})'>
			<label style="margin-bottom: 0px;">
				<!-- is_checked(3) 함수 호출문  --> 
					<i class = "xi-heart good" style="color:red; margin-bottom: 0px; font-size: 33px; cursor:pointer;"></i>
				<i class = "xi-heart-o nogood" style="color: red; margin-bottom: 0px; font-size: 33px; cursor:pointer;"></i>
						<c:choose>
								<c:when test="${good_check eq true}">
									<input type="checkbox" class="my_checkbox"
				id="my_checkbox${exhibition.exh_no}" value="${exhibition.exh_no}" checked="checked">
				
								</c:when>
						
								<c:otherwise>
										<input type="checkbox" class="my_checkbox"
				id="my_checkbox${exhibition.exh_no}" value="${exhibition.exh_no}">
				
								</c:otherwise>
							</c:choose>
				
				</span>
				
			</label> <input id="is_checked" type="hidden" name="" value="0" />
	
	
		<form action="/payUser" method="post" style="display: inline-block;">
			<input type="hidden" name="exh_no" value="${exhibition.exh_no}">
			<input type="hidden" name="exh_title" value="${exhibition.exh_title}">
			<input type="hidden" name="amount" value="${exhibition.exh_price}">
			<input type="hidden" name="exh_thumbnail" value="${exhibition.exh_thumbnail}">
			<button type="submit" class="btn11">예매하기</button>
		</form>
</div>
	</div>
	</div>
	</div>
<!-- 하단 -->
<div class="container">
  <div class="row a" style="padding-top: 50px; margin-left: 0; margin-right: 0;">
    <div class="col tabDiv pt-3 pb-2" id="menu1"><h5>상세정보</h5></div>
    <div class="col tabDiv pt-3 pb-2" id="menu2"><h5>관람후기</h5></div>
    <div class="col tabDiv pt-3 pb-2" id="menu3"><h5>장소정보</h5></div>
  </div>
  <div id="con1" class="conBox p-3" style="background-color: white; text-align:left !important;"><%@ include file="Information.jsp"%></div>
  <div id="con2" class="conBox p-3" style="background-color: white; text-align:left !important;"><%@ include file="reviewwrite.jsp"%></div>
  <div id="con3" class="conBox p-3" style="background-color: white;"><%@ include file="UserExhibitionLocation.jsp"%></div>
</div>
	<br>
	</div>
	<br>
<%@ include file="../../footer.jsp" %>
</body>

</html>
