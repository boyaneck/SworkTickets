<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뉴전시스</title>
<%@ include file="../../header.jsp"%>
</head>
<body>

	
	        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
	<div class="row justify-content-md-center">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-7">
					<div class="card shadow-lg border-0 rounded-lg mt-5">
						 <div class="card-header">
						 <h1 style="text-align: center; ">쿠폰수정</h1></div>
						<div class="card-body">
						<form action="/updateCoupon" method="post"> 
							
										<div class="form-floating mb-3 mb-md-0"><label for="c_name" style="font-weight: bold;">쿠폰명</label>
											<input class="form-control" type="text" name="c_name"
												id="c_name" required="required" autocomplete="off" value="${coupon.c_name}">
											
										</div>
							
									
										<div class="form-floating mb-3"> <label for="c_per" style="font-weight: bold;">할인율</label>
											<input class="form-control" type="number" name="c_per" value="${coupon.c_per}"
												id="c_per" required="required" max="100" placeholder="ex) 99">
										</div>
						
     						
								
										<div class="form-floating mb-3 mb-md-0"><label for="c_date" style="font-weight: bold;">만료날짜</label>
											<input class="form-control" type="date" name="c_date" value="${coupon.c_date}"
												id="c_date" required="required"> 
										</div>
								
								<div class="mt-4 mb-0">
									<div class="d-grid text-center">
										<button class="btn-purple" type="submit">등록</button>
									</div>
								</div>
							</form>
						</div>
						<div class="card-footer text-center py-3">
							<div class="small">
								<a href="/getCouponList" style="color:#7329f7;">쿠폰 목록으로</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


	</div>
</div></div>
</body>
</html>