<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/header.jsp"%>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
var chk = false;
$(document).ready(function(){
   var IMP = window.IMP; // 생략가능
   IMP.init('${impKey}');
   $("#check_module").click(function () {
      IMP.request_pay({
         pg: 'html5_inicis.INIpayTest', // 자신이 설정한 pg사 설정
//          pay_method: 'card',
         merchant_uid: 'merchant_' + new Date().getTime(),
         name: '너구리',// 상품명
         mid : $("#mb_id").val(),
         amount: $("#amount").val(),//가격
         buyer_email: $("#buyer_email").val() ,//이메일
         buyer_name: $("#buyer").val() ,//주문자명
         buyer_tel: $("#buyer_tel").val() ,//폰번
         paid_at: $("#p_date").val() ,
//          buyer_addr: $("#uaddr").val() ,//주소
//          buyer_postcode: '123-456',//우편번호
         m_redirect_url: 'http://localhost:8090/payments/complete'//내 url 
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

function useCoupon(a) {
   var amount= document.getElementById('result').value;
   var per=a;
   var result =amount- (amount *(per/100));   
   alert(result);
   $('#amount').val(result);
   }
   
$('#testBtn').click(function(e){
   e.preventDefault();
   $('#testModal').modal("show");
});

</script>

</head>
<body>
<form name="fm">
<div style="position:sticky;top:0;left:0;background-color:#fff;padding-bottom:20px;border-bottom:1px solid #000;">
   <h2>아임 서포트 결제 모듈 테스트 해보기</h2><br>
   <h2>결제하기</h2>
   이름: <input type="text" name="buyer" id="buyer" placeholder="이름 입력"><br>
   전화번호: <input type="text" name="buyer_tel" id="buyer_tel" placeholder="예시: 010-1111-2222"><br>
   이메일: <input type="text" name="buyer_email" id="buyer_email" placeholder="이메일 입력"><br>
<!--    주소: <input type="text" name="uaddr" id="uaddr" placeholder="주소 입력"><br> -->
    원금액:<input type="text" name="result" id="result" >
   결제금액:<input type="text" name="amount" id="amount" readonly="readonly">
   
   
   <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#staticBackdrop">
 쿠폰적용
</button><br>
   결제고유ID<input type="text" name="p_id" id="p_id" >
   상점거래ID<input type="text" name="p_mer" id="p_mer" >
<!--    회원아이디<input type="text" name="mb_id" id="mb_id" > -->
   결제일시<input type="text" name="p_date" id="p_date">
   상품명<input type="text" name="exh_title" id="exh_title" >
   <button id="check_module" type="button">결제하기</button>
   <br><hr>

         <h2>결제내역 관련</h2>
         <!--    imp_uid: <input type="text" name="imp_uid" id="imp_uid" placeholder="imp_uid 입력"><br> -->
         merchant_uid: <input type="text" name="merchant_uid" id="merchant_uid" placeholder="merchant_uid 입력"><br>
         <button id="cancel_module" type="button">취소하기</button>
         <button id="list_module" type="button">결제완료목록조회</button>
         <button id="all_module" type="button">모든목록조회</button>
      </div>
   
   <p id="paylist"></p>
</form>



<!-- 쿠폰 -->
<fmt:parseDate var="startDate_D"  value="${today }" pattern="yyyy-MM-dd"/>
<fmt:parseNumber var="startDate_N" value="${startDate_D.time / (1000*60*60*24)}" integerOnly="true" />
   <!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">쿠폰 목록</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
             <div class="container">
         <table class="table" style="width: 100%; border-collapse: collapse; table-layout: fixed;">
         <c:forEach items="${couponList}" var="coupon">
         <fmt:parseDate var="endDate_D" value="${coupon.c_date }"  pattern="yyyy-MM-dd"/>
         <fmt:parseNumber var="endDate_N" value="${endDate_D.time / (1000*60*60*24)}" integerOnly="true" /> 
         
            <tr>
              <td class="text-center">쿠폰명 : ${coupon.c_name}<br>
              할인율 : ${coupon.c_per}%<br>
              만료날짜 : ${coupon.c_date}
               </td>
                <td class="text-center text-danger"> ${endDate_N-startDate_N}일 남음 </td>
          <td class="text-center"><button id="${coupon.c_num}" class="close" data-dismiss="modal" aria-label="Close" onclick="useCoupon(${coupon.c_per});" >적용하기</button> </td>

            </tr>
</c:forEach>
</table>
</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

   
</body>
</html>