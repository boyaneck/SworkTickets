<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠폰 수정</title>
<%@ include file="../../header.jsp"%>
</head>
<body>
<div class="container">
	<div class="row justify-content-md-center">
	<form action="/updateCoupon" method="post"> 
		<fieldset>
            <legend>쿠폰등록</legend>		
            		<div class="row">
            		<label for="c_name">쿠폰명</label>	
					<input class="form-control" type="text" name="c_name" id="c_name" required="required" autocomplete="off" value="${coupon.c_name}">							
					<div class="col">
					<label for="c_per">할인율</label>	
					<input class="form-control" type="number" name="c_per"  id="c_per" required="required" max="100" value="${coupon.c_per }">		
					</div>
					<div class="col">
					<label for="c_date">만료날짜</label>	
					<input class="form-control" type="date" name="c_date"  id="c_date" required="required" value="${coupon.c_date}">		
					</div>
					<div class="col-2">	
						<button class="btn btn-primary btn-lg" type="submit" >등록</button>
					</div>
					</div>
				
			</fieldset>
	</form>
	</div>
	
	</div>
</body>
</html>