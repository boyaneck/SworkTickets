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
				error :  function(request,status,message){
					alert("로그인 후 이용 가능합니다.");
					
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


$(document).ready(function(){
	const review_bno1=${exhno2};
	var objparams={review_bno:review_bno1};
	
       	$.ajax({
		  	 	type:'get',
		   		url:"/reviewList",
		   		data:objparams,
				success:function(data) {
				 if(data.total > 0){
				var list = data.list;
				var reg=data.list.review_reg_date;
				
				
				var comment_html = "<div>";
				
				$('#count').html(data.total); //댓글 수 
				$.each(list, function(i, v){
					var content  =  list[i].review_content;
					var writer   =  list[i].review_writer;
					var review_no=  list[i].review_no;
					var review_bno =list[i].review_bno;
					var date= list[i].review_reg_date;
					
					
					
					comment_html +="<div id='a"+[i]+"' class='aa1'>";
					comment_html +="<div style='font-size:14px; color:#000; font-weight:bold; margin-top: 20px;'><span class='review_writer'>"+ content + "</div><br/>";
					comment_html +="<div style='font-size:13px; color:gray;'>"+writer+'&nbsp;'+ date+ "</div>";
					comment_html +="</div>";
					
			
					comment_html +="<div>"
					comment_html +="<div id='b"+[i]+"' style='display:none'>";
					comment_html +="<form action ='/updateReview'>"	;
					comment_html +="<div><input type='hidden' name='review_bno' value='"+review_bno+"'></div>";
					comment_html +="<div><input type='hidden' name='review_no' value='"+review_no+"'></div>";
					comment_html +="<div><textarea name='review_content' class='reveiw_content' >"+content+"</textarea></div>";
					comment_html +="<button  class='btn_comment_update' style='background-color:white; border:1px solid black; border-radius:3px; '><i class = 'xi-check'></i></button>";
					comment_html += "</form>";
					comment_html +="</div>";
					
				
			if(writer === $(".review_writer").val()){
							
				var writer_d = $(".review_writer").val()
				var list_no=review_no;
														
					comment_html += "<div style='text-align:right;'><button class='update1' style='cursor:pointer; background-color: white; border: none; font-size: 25px; margin-right: 20px;' onclick='updateReview("+[i]+")' ><i class = 'xi-pen-o'></i></button>";																
					comment_html += "<button id='delete' style='cursor:pointer; background-color: white; border: none; font-size: 25px;' onclick='del("+list_no+")'><i class = 'xi-trash-o'></i></button>";
				    comment_html += "</div><hr>";
					}
					else  comment_html += "</div><hr>";
					
					
					});
				
				$(".comment_Box").html(comment_html);
				
				
				  }
					else{
				   var comment_html = "<div>등록된 댓글이 없습니다.</div>";
				   $(".comment_Box").html(comment_html);
				   
			}
		}
   });	
		

	$('#Comment_regist').click(function() {
			
					const review_bno = 2;
					const review_writer = $('.review_writer').val();
					const review_content = $('.review_content').val();
					

			if(review_writer == ''){
					alert('로그인 후 이용해주세요');
					return;
			
			}else if(review_content == '') {
					alert('내용을 입력하세요');
			}
	
			$.ajax({
				type:'post',
				url:'/insertReview',
				data: JSON.stringify(
			{
				/*송원선*/
				"review_bno":review_bno1,
				/*송원선*/
				"review_writer":review_writer,
				"review_content":review_content
				
			}		
			),
				contentType: 'application/json',
				success:function(data){

			if(data === 'InsertSuccess') {
				alert('댓글 등록이 완료되었습니다.');
				$('.review_writer').val(review_writer);
					$('.review_content').val(review_content);
						window.location.reload();
			} else {
				alert('로그인 이후 이용해주시기 바랍니다.');
			}
			},
				error:function(){
				alert('통신실패');
			}
			});	
      });
    });

		function del(val){
			/*송원선*/
			const review_bno2=${exhno2};
			/*송원선*/
				var delConfirm = confirm('정말 삭제하시겠습니까?');
    	
		if (delConfirm == true) {
        		alert('삭제되었습니다.');
       			location.href ="deleteReview?review_no="+val+"&review_bno="+review_bno2;
   		 }
   		 else {
       			 alert('삭제가 취소되었습니다.');
                }
         }

		function updateReview(val){
				$('#a'+val).hide();
				$('#b'+val).show();
				$(".update1").hide();
		document.querySelectorAll('.btn_comment_update').forEach(function (item) {
        		item.addEventListener('click', function () { 
        	
             	const form = this.closest('form'); 
            	commentUpdate(form); 
         });
        });

    	 function commentUpdate(form) {
        		const data = { comment: form.querySelector('.review_content').value() };
       		if (!data.comment || data.comment.trim() === "") {
           		 alert("공백 또는 입력하지 않은 부분이 있습니다.");
            		return false;
             }
                const con_check = confirm("수정하시겠습니까?");
        
         if (con_check === true) {
             $.ajax({
                type: 'POST',
                url: "updateReview",
                dataType: 'JSON',
                contentType: 'application/json; charset=utf-8',
                data: JSON.stringify(data)
                
            }).done(function () {
            	debugger;
                window.location.reload();
            }).fail(function (error) {
            	
                alert(JSON.stringify(error));
            });
        }
	
	 }
			
}
		function login1(){
			var login1Confirm = confirm('로그인 페이지로 이동하시겠습니까?');
		if (login1Confirm == true) {
        		location.href ="login.jsp";
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
#Comment_regist{
	width: 200px;
	height: 45px;
	color: #7329f7; 
	background-color: white; 
	border: solid 1px;
	font-size: 16pt;
	}
#Comment_regist:hover{
width: 200px;
	height: 45px;
	color: white; 
	background-color: #7329f7; 
	border: solid 1px;
	font-size: 16pt;
}

textarea:focus, input:focus{ outline: none; }
textarea {
			margin-top:30px;
			width: 100%;
			height: 200px;
			padding: 10px;
			box-sizing: border-box;
			border: solid 2px #1E90FF;
			border-radius: 5px;
			font-size: 16px;
			resize: both;
		}
		
		.btn_comment_update:hover{
		
		color:red;
		}
</style>
</head>
<body class="d-flex flex-column min-vh-100" >
<div class="container" id="exh_detail" style="text-align:center; padding: 50px 0;">
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
	<div class="col-3">관람시간</div> <div class="col-9" id="col" style="word-break: keep-all;"> ${exhibition.exh_time}</div>
	<div class="col-3">발권정보</div> <div class="col-9" id="col"> ${exhibition.exh_shipping_info}</div>
	<div class="col-3">수수료</div> <div class="col-9" id="col"><fmt:formatNumber value="${exhibition.exh_fee}" groupingUsed="true" />원</div>
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
			<c:choose>
				<c:when test="${mb_Id ne null}">
			<button type="submit" class="btn11">예매하기</button>
				</c:when>
				<c:otherwise>
			<button type="button" class="btn11" onclick='login1()'>예매하기</button>
				</c:otherwise>
			</c:choose>
		</form>
		
</div>
	</div>
	</div>
	</div>
<!-- 하단 -->
<div class="container" id="userdetail">
  <div class="row a" style="padding-top: 50px; margin-left: 0; margin-right: 0;">
    <div class="col tabDiv pt-3 pb-2" id="menu1"><h5>상세정보</h5></div>
    <div class="col tabDiv pt-3 pb-2" id="menu2"><h5>관람후기</h5></div>
    <div class="col tabDiv pt-3 pb-2" id="menu3"><h5>장소정보</h5></div>
  </div>
</div>
	<br>
	</div>
	  <div id="con1" class="conBox" style="background-color: white; text-align:left !important;">
  	<%@ include file="Information.jsp"%>
   </div>
  <div id="con2" class="conBox" style="background-color: white; text-align:left !important;">
    <%@ include file="reviewwrite.jsp"%>
    </div>
  <div id="con3" class="conBox" style="background-color: white;">
    <%@ include file="UserExhibitionLocation.jsp"%>
    </div>
	<br>
</body>
</html>
