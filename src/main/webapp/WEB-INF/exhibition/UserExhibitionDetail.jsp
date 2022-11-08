<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
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
						$('#my_checkbox'+eno).siblings("svg.nogood").hide();
						$('#my_checkbox'+eno).siblings("svg.good").show();
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
						$('#my_checkbox'+eno).siblings("svg.nogood").show();
						$('#my_checkbox'+eno).siblings("svg.good").hide();
					}
				},
				error :  function(){
					alert("오류가 발생했습니다.");
				}
		  });
	  }
	
	  
}
</script>
</head>
<body>
	<br>
	<br>
	<br>
	<div class="jumbotron">
		<h1>${exhibition.exh_title}</h1>
		
		
		
		
		<!--         좋아요 기능 버튼 -->
		<form name="goodVO" method="post">
		<span onclick='is_checked(${exhibition.exh_no})'>
			<label >
				<!-- is_checked(3) 함수 호출문  --> <svg
					xmlns="http://www.w3.org/2000/svg" width="16" height="16"
					fill="currentColor" class="bi bi-suit-heart nogood"
					viewBox="0 0 16 16">
		  <path
						d="m8 6.236-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z" />
		</svg> <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
					fill="currentColor" class="bi bi-suit-heart-fill good"
					viewBox="0 0 16 16">
		  <path
						d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1z" />
		</svg> 
				
						<c:choose>
								<c:when test="${good_check eq true}">
									<input type="checkbox" class="my_checkbox"
				id="my_checkbox${exhibition.exh_no}" value="${exhibition.exh_no}" checked="checked">
				좋아요
								</c:when>
						
								<c:otherwise>
										<input type="checkbox" class="my_checkbox"
				id="my_checkbox${exhibition.exh_no}" value="${exhibition.exh_no}">
				좋아요
								</c:otherwise>
							</c:choose>
				
				</span>
				
		
			</label> <input id="is_checked" type="hidden" name="" value="0" />
		</form>





		<h5>${exhibition.exh_st_date}~ ${exhibition.exh_end_date}</h5>
		<h6>${exhibition.exh_hall}</h6>
	</div>
	<p>작가 ${exhibition.exh_artist}</p>
	<p>관람등급 ${exhibition.exh_rating}</p>
	<p>관람시간 ${exhibition.exh_time}</p>
	<p>발권정보 ${exhibition.exh_shipping_info}</p>
	<p>
		예매수수료
		<fmt:formatNumber value="${exhibition.exh_fee}" groupingUsed="true" />
		원
	</p>
	<p>
		가격
		<fmt:formatNumber value="${exhibition.exh_price}" groupingUsed="true" />
		원
	</p>
	<div id="footer">
		<form action="/payUser" method="post">
			<input type="hidden" name="exh_no" value="${exhibition.exh_no}">
			<input type="hidden" name="exh_title" value="${exhibition.exh_title}">
			<input type="hidden" name="amount" value="${exhibition.exh_price}">
			<button type="submit" class="btn btn-primary">예매하기</button>
		</form>
	</div>
	<br>
	<%@ include file="UserExhibitionLocation.jsp"%>
	<br>
</body>
</html>
