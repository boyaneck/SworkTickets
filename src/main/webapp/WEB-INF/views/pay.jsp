<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../../header.jsp"%>



<script type="text/javascript"
	src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<link rel="stylesheet" href="./css/pay.css">
<script>
var chk = false;

$(document).ready(function(){
   var IMP = window.IMP; // 생략가능
   IMP.init('${impKey}');
   $("#check_module").click(function () {
	   $('#exh_title').val('${exh_title}')	
	   console.log($('#exh_title').val());
	   var formValues = $("form[name=fm]").serialize() ;
      IMP.request_pay({
         pg: 'html5_inicis.INIpayTest', // 자신이 설정한 pg사 설정
//          pay_method: 'card',
         merchant_uid: 'merchant_' + new Date().getTime(),
         name: $('#exh_title').val(),// 상품명
         mid : $("#mb_id").val(),//사용자
         amount: $("#amount").val(),//가격
         buyer_email: $("#buyer_email").val() ,//이메일
         buyer_name: $("#buyer").val() ,//주문자명
         buyer_tel: $("#buyer_tel").val() ,//폰번
         paid_at: $("#p_date").val() ,
//          buyer_addr: $("#uaddr").val() ,//주소
//          buyer_postcode: '123-456',//우편번호
         m_redirect_url: "http://localhost:8090/payUserM?formValues="+formValues//내 url 
         }, function (rsp) {
            console.log(rsp);
            if (rsp.success) {
               var msg = '결제가 완료되었습니다.';
               $('#p_id').val(rsp.imp_uid);//test
               $('#p_mer').val(rsp.merchant_uid);
//                $('#mb_id').val(userId);
               $('#p_date').val(rsp.paid_at);
               $('#exh_title').val(rsp.name);
               msg += '\n고유ID : ' + rsp.imp_uid;
               msg += '\n상점 거래ID : ' + rsp.merchant_uid;
               msg += '\n결제 금액 : ' + rsp.paid_amount;
               
               chk = true;               
            } else {
               var msg = '결제에 실패하였습니다.';
               msg += '\n에러내용 : ' + rsp.error_msg;
            }
            alert(msg);
            if(chk==true) orderList();
      });
   });
   
   function orderList(){
      alert('주문내역 처리할 곳. 컨트롤러 호출');
      let fm = document.fm;
      fm.action ="payUserDB";
      fm.method="post";
      fm.submit();
   }
   
   $("#cancel_module").click(function () {
      $.ajax({
         url : "paycan",
         data : {"mid": $("#merchant_uid").val()},
         method : "POST",
         success : function(val){
            console.log(val);
            if(val==1) alert("취소 완료");
            else alert("취소 실패\n이미 취소되었거나 잘못된 정보입니다.");
         },
         error :  function(request, status){
            alert("취소가 실패하였습니다.");
         }
      });
   });
   
   $("#list_module").click(function(){
      $.ajax({
         url : "payamount",
         data : {"mid": $("#merchant_uid").val()},
         method : "GET",
         contentType : 'application/json; charset=UTF-8',
         success : function(val){
            console.log(val);
            $("#paylist").empty();
            if(val.msg!=null){
               $("#paylist").append(val.msg);
            }else{
               $("#paylist").append("고유ID: "+val.imp_uid);
               $("#paylist").append("<br>상점 거래ID: "+val.merchant_uid);
               $("#paylist").append("<br>주문상품: "+val.name);
               $("#paylist").append("<br>주문자: "+val.buyer_name);
               $("#paylist").append("<br>결제금액: "+val.amount);
               $("#paylist").append("<br>결제수단: "+val.pay_method);
               $("#paylist").append("<br>구매처: "+val.pg_provider );
               $("#paylist").append("<br>결제시각: "+val.started_at );
               $("#paylist").append("<br>취소시각: "+val.cancelled_at );
            }
         },
         error :  function(request, status){
            alert("목록 가져오기를 할 수 없습니다.");
         }
      });
   });
   
   
   $("#all_module").click(function(){
      $.ajax({
         url : "paylist",
         method : "GET",
         contentType : 'application/json; charset=UTF-8',
         success : function(val){
            console.log(val);
            $("#paylist").empty();
            $.each(val, function(i, v){
               $("#paylist").append("고유ID: "+v.imp_uid);
               $("#paylist").append("<br>상점 거래ID: "+v.merchant_uid);
               if(v.status == 'cancelled' ) $("#paylist").append("<br><span style=\"color:red;font-weight:bold;\">주문취소</span>");
               else if(v.status == 'ready' ) $("#paylist").append("<br><span style=\"color:pink;font-weight:bold;\">결제오류</span>");
               else if(v.status == 'failed' ) $("#paylist").append("<br><span style=\"color:pink;font-weight:bold;\">결제오류</span>");
               else $("#paylist").append("<br><span style=\"color:blue;font-weight:bold;\">결제완료</span>");
               $("#paylist").append("<br>주문상품: "+v.name);
               $("#paylist").append("<br>주문자: "+v.buyer_name);
               $("#paylist").append("<br>결제금액: "+v.amount);
               $("#paylist").append("<br>결제수단: "+v.pay_method);
               $("#paylist").append("<br>구매처: "+v.pg_provider );
               $("#paylist").append("<br>결제시각: "+v.started_at );
               $("#paylist").append("<br>취소시각: "+v.cancelled_at+"<hr><br>" );
               
            });
         },
         error :  function(request, status){
            alert("목록 가져오기를 할 수 없습니다.");
         }
      });
   });
   
});

function useCoupon(a,b) {
   var amount= document.getElementById('result').value;
   var per=a;
   var cb_id=b;
   var result =amount- (amount *(per/100));   
   alert(result);
   $('#amount').val(result);
   $('#cb_id').val(cb_id);
   }
   
$('#testBtn').click(function(e){
   e.preventDefault();
   $('#testModal').modal("show");
});

</script>




</head>
<body class="d-flex flex-column min-vh-100">
<form name="fm" style="text-align:-webkit-center;">
	<!-- 타이틀 -->
	<div class="container"
		style="background-color: lightgray; width: 50%; padding: 30px;">
		<h2 style="text-align: center; font-weight: bolder; padding: 30px 0;">결제하기</h2>

		<!-- 이미지, 제목, 가격 -->
		<div class="container"
			style="text-align: center; background-color: white;">

			<h3>
				<b>주문 상세 정보</b>
			</h3>
			<div class="row">
				<div class="col-md-6">
				<img src="/images/${exh_thumbnail }" alt="이미지" style="width: 200px; height: 250px;" id="thum1">
<!-- 					<img src="/images/2.png" alt="이미지" style="width: 200px; height: 250px;"> -->
				</div>
				<div class="col-md-6">
					<div class="row">
						<h4>
							<b id="ptitle">${exh_title}</b>
						</h4>
						<input type="hidden" name="exh_title" class = "exh_title" id="exh_title"
							value='${exh_title}' readonly="readonly">
					</div>
					<div class="row" id="pamount">
						${amount}원 
					</div>
				</div>
			</div>
			<hr style="margin: 30px; text-align: left;">
			<!-- 주문자 정보 -->
			<div class="container"  id="pay2"
				style="text-align: left; padding: 20px 0; background-color: white;">

				<div class="row">
					<div class="col-md-1"></div>
					<div class="col-md-5">
						<h3 style="padding: 0 0;">주문자 정보</h3>
					</div>
					<div class="col-md-6">
						<input type="hidden" style="width: 100%">
					</div>
				</div>
				<br>

				<div class="row">
					<div class="col-md-1"></div>
					<div class="col-md-2">
						<b>이름</b>
					</div>
					<div class="col-md-9">
						<input type="text" name="buyer" id="buyer" placeholder="이름 입력"
							value="${member.mb_name}" style="width: 100%">
					</div>
				</div>
				<br>

				<div class="row">
					<div class="col-md-1"></div>
					<div class="col-md-2">
						<b>전화번호</b>
					</div>
					<div class="col-md-9">
						<input type="text" name="buyer_tel" id="buyer_tel"
							placeholder="예시: 010-1111-2222" value='${member.mb_phone}'>
					</div>
				</div>
				<br>

				<div class="row">
					<div class="col-md-1"></div>
					<div class="col-md-2">
						<b>이메일</b>
					</div>
					<div class="col-md-9">
						<input type="text" name="buyer_email" id="buyer_email"
							placeholder="이메일 입력" value='${member.mb_email}'>
					</div>
				</div>
			</div>
		</div>
		<!-- <hr style="margin-bottom:30px; "> -->

		<!-- 결제창 -->
		<div class="container" id="pay3"
			style="text-align: center; padding: 20px 0; margin-top:50px; background-color: white;">
			<div class="container"
				style="text-align: center; background-color: white;">
				<div class="row">
					<div class="col-md-1"></div>
					<div class="col-5 line" style="border-bottom: 2px solid black; text-align:left; padding-right: 0px;">
						<b>결제금액</b>
					</div>
					<div class="col-4 line" style="border-bottom: 2px solid black;">
						<input type="text" name="amount" id="amount" value='${amount}'
							style="font-weight: bold; text-align: right !important; color: #7329f7; border: none;"
							readonly="readonly">
					</div>
					<div class="col-md-2">
						<button type="button"
							style="color: #7329f7; width: 100%; background-color: white; border-color: #7329f7; border: solid 1px;"
							data-toggle="modal" data-target="#staticBackdrop">쿠폰적용</button>
					</div>
				</div>
				<input type="hidden" name="result" id="result"
					value='${amount}' style="display: none;"> <input
					type="hidden" name="md_id" id="md_id" value='${md_id}'
					style="display: none;"><br>
				<!--    결제고유ID -->
				<input type=hidden name="p_id" id="p_id" style="display: none;">
				<!--    상점거래ID -->
				<input type="hidden" name="p_mer" id="p_mer" style="display: none;">
				<!--    회원아이디<input type="text" name="mb_id" id="mb_id" > -->
				<!--    결제일시 -->
				<input type="hidden" name="p_date" id="p_date"
					style="display: none;"> 
					<input type="hidden" name="cb_id" id="cb_id" value=0 style="display: none;"> 
					<input
					type="hidden" name="exh_no" id="exh_no" value="${exh_no }"
					style="display: none;">
<!-- 				썸네일 -->
				<input type=hidden name="exh_thumbnail" id="exh_thumbnail" value="${exh_thumbnail }" style="display: none;">
				<input type=hidden name="exh_title" id="exh_title" value="${exh_title }" style="display: none;">
				<!--   결제버튼 -->
				<div class="container" id="pay"
					style="text-align: center; background-color: white;">
					<div style="text-align: center;">
						<button id="check_module"
							style="color: white; background-color: black; margin-top: 0px; margin-bottom: 20px;"
							type="button">결제하기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	</form>
	
	
	<!-- 쿠폰 -->
	<fmt:parseDate var="startDate_D" value="${today }" pattern="yyyy-MM-dd" />
	<fmt:parseNumber var="startDate_N"
		value="${startDate_D.time / (1000*60*60*24)}" integerOnly="true" />
	<!-- Button trigger modal -->


	<!-- Modal -->
	<div class="modal fade" id="staticBackdrop" data-backdrop="static"
		data-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-md">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">
						<b>쿠폰 목록</b>
					</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<c:forEach items="${couponList}" var="coupon">
						<fmt:parseDate var="endDate_D" value="${coupon.c_date }"
							pattern="yyyy-MM-dd" />
						<fmt:parseNumber var="endDate_N"
							value="${endDate_D.time / (1000*60*60*24)}" integerOnly="true" />

						<div class="container">

							<div class="row">
								<div class="col-3">
									<h1 class="text-center"
										style="transform: translate(0, 65%); color: #7329f7; font-weight: bolder;">${coupon.c_per}%</h1>
								</div>
								<div class="col"
									style="transform: translate(0, 0); text-align: left;">
									<b id="c_name" style="font-size: 30px">${coupon.c_name}</b><br>
									${coupon.c_date}까지<br> <span class="text-danger"><small>
											${endDate_N-startDate_N}일 남음</small></span>
								</div>
								<div class="col-4">
									<button id="${coupon.c_num}"
										style="transform: translate(0, 95%); border: 1px solid #7329f7; width: 130px; height: 45px; background-color: #fff; color: #7329f7; font-size: 18px; font-weight: bold;"
										class="align-middle" data-dismiss="modal" aria-label="Close"
										onclick="useCoupon(${coupon.c_per},${coupon.cb_id});">적용하기</button>
								</div>
							</div>
							<hr>
						</div>
					</c:forEach>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

<%@ include file="../../footer.jsp"%>
</body>
</html>