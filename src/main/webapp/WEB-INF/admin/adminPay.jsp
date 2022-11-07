<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script><!-- jQuery CDN --->
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
var chk = false;
$(document).ready(function(){
	var IMP = window.IMP; // 생략가능
	IMP.init('${impKey}');
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

function orderList(){
	alert('주문내역 처리할 곳. 컨트롤러 호출');
	let fm = document.fm;
	fm.action ="pay";
	fm.method="post";
	fm.submit();
}

</script>
<%@ include file="../../header.jsp"%>
</head>
<body>
<!-- <form name="fm"> -->
<!-- <div style="position:sticky;top:0;left:0;background-color:#fff;padding-bottom:20px;border-bottom:1px solid #000;"> -->
<!-- 	<h2>결제내역 관리</h2> -->
<!-- 	imp_uid: <input type="text" name="imp_uid" id="imp_uid" placeholder="imp_uid 입력"><br> -->
<!-- 	merchant_uid: <input type="text" name="merchant_uid" id="merchant_uid" placeholder="merchant_uid 입력"><br> -->
<!-- 	<button id="cancel_module" type="button">취소하기</button> -->
<!-- 	<button id="list_module" type="button">결제완료목록조회</button> -->
<!-- 	<button id="all_module" type="button">모든목록조회</button> -->
<!-- </div> -->
<!-- 	</form> -->

	<nav id="searchNav" class="navbar navbar-expand-sm navbar-dark">
			<form class="form-inline" action="getAllPayList" method="post">
				<select class="form-control" id="sel1" name="searchCondition"
					style="display: inline-block !important; margin-right: 10px;">
					<c:forEach items="${conditionMap}" var="option">
						<option value="${option.value}">${option.key}</option>
					</c:forEach>
				</select> <input class="form-control mr-sm-2" type="text"
					name="searchKeyword" placeholder="검색어를 입력하세요.">
				<button class="btn btn-outline-primary" type="submit">검색</button><br>
			</form>
		</nav>
	
	<c:forEach items="${allPayList}" var="allPayList">
	<img src="/images/${allPayList.exh_img}" alt="이미지" style="width:100px; height:130px;"><br>
	상품명: ${allPayList.exh_title} <br>
	금액: ${allPayList.amount}<br>
	구매자 : ${allPayList.buyer}<br>
	전화번호 : ${allPayList.buyer_tel}<br>
	결제일시 : ${allPayList.p_date}<br>
	결제고유ID : ${allPayList.p_id}<br>
	상점거래ID : ${allPayList.p_mer}<br>
	전시 종료일 : ${allPayList.exh_end_date}<br>
<%-- 	환불 여부 : ${myPayList.p_chk}<br> --%>
				<c:set var="today" value="<%=new java.util.Date()%>"/>
		<c:set var="sysYear"> 
		<fmt:formatDate value="${today}" pattern="yyyy-MM-dd" /></c:set>
		<form action="paycan" method="POST">
			<input type="hidden" name="mid" id="merchant_uid"
				value="${allPayList.p_mer}">
				<c:if test="${allPayList.exh_end_date < sysYear}">
					<button class="btn btn-outline-danger" onclick="" type="button">종료된 전시</button>
					</c:if>
				
				<c:if test="${allPayList.exh_end_date > sysYear}">
				<c:choose>
					<c:when test="${allPayList.p_chk eq 0}">
						<button id="cancel_module" type="submit" class="btn btn-outline-primary">취소하기</button>
					</c:when>
					<c:otherwise>
						<button type="button" class="btn btn-outline-success">환불완료</button>
					</c:otherwise>
				</c:choose>
				</c:if>
		</form>
		<hr>
		</c:forEach>
		<div class="container ">
			
				<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center">
<!-- 		맨처음 -->
						<c:if test="${paging.nowPageBtn > 1 }">
						<li class="page-item "><a class="page-link"
							href="getAllPayList?nowPageBtn=1">&laquo;</a></li>
							</c:if>
							<c:if test="${paging.nowPageBtn > 1 }">
							<li class="page-item "><a class="page-link"
							href="getAllPayList?nowPageBtn=${paging.nowPageBtn-1}">&lt;</a></li>
							</c:if>

<!-- 반복처리 태그 -->				
							<c:forEach begin="${paging.startBtn}" end="${paging.endBtn }" step="1" var="i" >
								<c:choose>
									<c:when test="${paging.nowPageBtn==i}">
									<li class="page-item active"><a class="page-link"
									href="getAllPayList?nowPageBtn=${i}">${i}</a></li>
									</c:when>
									<c:otherwise>
									<li class="page-item "><a class="page-link"
									href="getAllPayList?nowPageBtn=${i}">${i}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
<!-- 		반복 끝 -->
								<c:if test="${paging.nowPageBtn < paging.totalBtnCnt }">
							<li class="page-item "><a class="page-link"
							href="getAllPayList?nowPageBtn=${paging.nowPageBtn+1}">&gt;</a></li>
							</c:if>
<!-- 		맨끝 -->
							<c:if test="${paging.nowPageBtn < paging.totalBtnCnt }">
								<li class="page-item"><a class="page-link"
							href="getAllPayList?nowPageBtn=${paging.totalBtnCnt}">&raquo;</a></li>
								</c:if>
					</ul>
				</nav>
			
				</div>


</body>
</html>