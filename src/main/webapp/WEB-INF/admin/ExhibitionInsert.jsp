<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
// if(session.getAttribute("userId") == null){
// 	response.sendRedirect("login.jsp");	
// }else{
%>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>관리자 모드</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link href="css/style_admin.css" rel="stylesheet" />
<link href="css/admin.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	crossorigin="anonymous"></script>
<script src="js/scripts.js"></script>
</head>
<%-- <%@ include file="../../header.jsp"%> --%>
<body>
	<div>
		<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
			<!-- Navbar Brand-->
			<a class="navbar-brand logoimg" href="index.jsp" style="text-align: center;"> <img style="width: 140px;"
				src="./images/logo.png">&nbsp&nbsp
			</a>
			<!-- Sidebar Toggle-->
			<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!">
				<i class="fas fa-bars"></i>
			</button>
			<div class="collapse navbar-collapse justify-content-end" id="collapsibleNavbar">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link header-logout" href="/logoutGO">로그아웃</a></li>
				</ul>
			</div>
		</nav>
		<section id="container">
			<aside>
				<div id="layoutSidenav" style="text-align: center;">
					<div id="layoutSidenav_nav">
						<nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion" style="height: 2300px;">
							<div class="sb-sidenav-menu">
								<div class="nav">
									<div class="sb-sidenav-menu-heading"></div>
									<a class="nav-link collapsed" href="#"
										data-bs-toggle="collapse" data-bs-target="#collapseLayouts"
										aria-expanded="false" aria-controls="collapseLayouts">
										<div class="sb-nav-link-icon">
											<i class="fas fa-columns"></i>
										</div> 회원관리
										<div class="sb-sidenav-collapse-arrow">
											<i class="fas fa-angle-down"></i>
										</div>
									</a>
									<div class="collapse" id="collapseLayouts"
										aria-labelledby="headingOne"
										data-bs-parent="#sidenavAccordion">
										<nav class="sb-sidenav-menu-nested nav">
<!-- 											<a class="nav-link" -->
<!-- 												href="/registerTerm?agree1=true&agree2=true&agreeAll=true';">회원등록</a> -->
											<a class="nav-link" href="/admin/member">회원등록</a>
											<a class="nav-link" href="/getMemberList">회원목록</a> <a
												class="nav-link" href="/getAllPayList">회원결제</a>
										</nav>
									</div>

									<a class="nav-link collapsed" href="#"
										data-bs-toggle="collapse"
										data-bs-target="#collapseLayouts_exh" aria-expanded="false"
										aria-controls="collapseLayouts_exh">
										<div class="sb-nav-link-icon">
											<i class="fas fa-columns"></i>
										</div> 전시관리
										<div class="sb-sidenav-collapse-arrow">
											<i class="fas fa-angle-down"></i>
										</div>
									</a>
									<div class="collapse" id="collapseLayouts_exh"
										aria-labelledby="headingOne"
										data-bs-parent="#sidenavAccordion">
										<nav class="sb-sidenav-menu-nested nav">
											<a class="nav-link" href="/insertmoveExhibition">전시등록</a> <a class="nav-link "
												href="/getExhibitionList">전시목록</a>
										</nav>
									</div>

									<a class="nav-link collapsed" href="#"
										data-bs-toggle="collapse"
										data-bs-target="#collapseLayouts_coupon" aria-expanded="false"
										aria-controls="collapseLayouts_coupon">
										<div class="sb-nav-link-icon">
											<i class="fas fa-columns"></i>
										</div> 쿠폰관리
										<div class="sb-sidenav-collapse-arrow">
											<i class="fas fa-angle-down"></i>
										</div>
									</a>
									<div class="collapse" id="collapseLayouts_coupon"
										aria-labelledby="headingOne"
										data-bs-parent="#sidenavAccordion">
										<nav class="sb-sidenav-menu-nested nav">
											<a class="nav-link" href="/insertCouponForm">쿠폰등록 </a>
											<a class="nav-link" href="admin/CouponList">쿠폰목록</a>
										</nav>
									</div>


									<a class="nav-link collapsed" href="#"
										data-bs-toggle="collapse"
										data-bs-target="#collapseLayouts_service"
										aria-expanded="false" aria-controls="collapseLayouts_service">
										<div class="sb-nav-link-icon">
											<i class="fas fa-columns"></i>
										</div> 고객센터
										<div class="sb-sidenav-collapse-arrow">
											<i class="fas fa-angle-down"></i>
										</div>
									</a>
									<div class="collapse" id="collapseLayouts_service"
										aria-labelledby="headingOne"
										data-bs-parent="#sidenavAccordion">
										<nav class="sb-sidenav-menu-nested nav">
											<a class="nav-link" href="/getBoardList">공지사항</a> <a
												class="nav-link" href="/getFaqList">FAQ</a> <a
												class="nav-link" href="/getOneList">1:1 문의</a>
										</nav>
									</div>
								</div>

							</div>

						</nav>
					</div>
				</div>
			</aside>
			<div id="container_box">
				<div class="wrap" style="padding: 40px;">
					<div class="container">
						<h2 style="text-align: center; font-weight: bold;">전시등록</h2>
					</div>
	<div class="container-fluid">
		<form action="insertExhibition" method="post" enctype="multipart/form-data">
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<label for="exh_title" class="input-group-text">전시명</label>
				</div>
				<input type="text" class="form-control" id="exh_title"
					name="exh_title" placeholder="전시명을 입력하세요." required>
			</div>

			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<label for="exh_price" class="input-group-text"><i class="fas fa-won-sign"></i></label>
				</div>
				<input type="number" min="0" max="1000000" step="1000" value="10000"
					class="form-control innm" id="exh_price" name="exh_price">
			</div>

			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<label for="exh_st_date" class="input-group-text">시작일</label>
				</div>
				<input type="date" class="form-control innm" id="exh_st_date"
					name="exh_st_date">
			</div>

			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<label for="exh_end_date" class="input-group-text">종료일</label>
				</div>
				<input type="date" class="form-control innm" id="exh_end_date"
					name="exh_end_date">
			</div>

			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<label for="exh_location" class="input-group-text"><i class="fas fa-location"></i></label>
				</div>
				<input type="text" class="form-control innm mr-3" id="exh_location" name="exh_location" placeholder="주소검색 버튼으로 검색하세요."> 
					<input class="btn-purple" type="button" onclick="sample5_execDaumPostcode()" value="주소검색"><br>
			</div>
			
			<div class="input-group mb-3">
				<div class="input-group-prepend">
			<div id="map" style="width:300px;height:300px;margin-top:10px;"></div>
				</div>
			</div>
			

			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<label for="exh_hall" class="input-group-text">전시 장소</label>
				</div>
				<input type="text" class="form-control innm" id="exh_hall"
					name="exh_hall" placeholder="상세주소를 입력해주세요.">
			</div>

<!-- 			<input type="hidden" id="exh_place_x" name="exh_place_x"> -->
<!-- 			<input type="hidden" id="exh_place_y" name="exh_place_y"> -->
			<input type="text" id="exh_place_x" name="exh_place_x" placeholder="x좌표">
			<input type="text" id="exh_place_y" name="exh_place_y" placeholder="y좌표">
			<span> - 해당 내용은 히든처리할 예정입니다.</span>

			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<label for="exh_content" class="input-group-text">내용</label>
				</div>
				<textarea class="form-control" rows="10" id="comment"
					id="exh_content" name="exh_content" placeholder="60자 이내로 입력해주세요."></textarea>
			</div>

			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<label for="exh_thumbnail" class="input-group-text">썸네일</label>
				</div>
				<input type="file" class="form-control innm" id="exh_thumbnail"
					name="uploadFile_thumb">
			</div>

			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<label for="exh_banne" class="input-group-text">배너</label>
				</div>
				<input type="file" class="form-control innm" id="exh_banne"
					name="uploadFile_banne">
			</div>

			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<label for="exh_img" class="input-group-text">이미지</label>
				</div>
				<input type="file" multiple="multiple" class="form-control innm" id="exh_img" name="uploadFile">
			</div>

			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<label for="exh_planner" class="input-group-text">주최/기획</label>
				</div>
				<input type="text" class="form-control innm" id="exh_planner"
					name="exh_planner">
			</div>

			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<label for="exh_time" class="input-group-text">관람시간</label>
				</div>
				<input type="text" class="form-control innm" id="exh_time"
					name="exh_time" value="오전 10시 ~ 오후 8시 (입장마감: 오후 7시)">
			</div>

			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<label for="exh_rating" class="input-group-text">관람등급</label>
				</div>
				<select id="exh_rating" name="exh_rating">
					<option>전체관람가</option>
					<option>만 8세 이상</option>
					<option>만 15세 이상</option>
					<option>만 18세 이상</option>
				</select> 
			</div>

			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<label for="exh_artist" class="input-group-text">작가</label>
				</div>
				<input type="text" class="form-control innm" id="exh_artist"
					name="exh_artist">
			</div>

			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<label for="exh_local_name" class="input-group-text">지역명</label>
				</div>
				<select id="exh_local_name" name="exh_local_name">
<!-- 					<option value="1">서울</option> -->
<!-- 					<option value="2">경기/인천</option> -->
<!-- 					<option value="3">충청/강원</option> -->
<!-- 					<option value="4">대구/경북</option> -->
<!-- 					<option value="5">부산/경남</option> -->
<!-- 					<option value="6">광주/전라</option> -->
<!-- 					<option value="7">제주</option> -->
					<option>서울</option>
					<option>경기/인천</option>
					<option>충청/강원</option>
					<option>대구/경북</option>
					<option>부산/경남</option>
					<option>광주/전라</option>
					<option>제주</option>
				</select> 
			</div>

			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<label for="exh_cs_phone" class="input-group-text">고객문의처</label>
				</div>
				<input type="text" class="form-control innm" id="exh_cs_phone"
					name="exh_cs_phone" value="0505-16887-05361">
			</div>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<label for="exh_fee" class="input-group-text">예매수수료</label>
				</div>
				<input type="text" class="form-control innm" id="exh_fee"
					name="exh_fee" value="0">
			</div>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<label for="exh_shipping_info" class="input-group-text">발권정보</label>
				</div>
				<input type="text" class="form-control innm" id="exh_shipping_info" name="exh_shipping_info" value="현장수령">
			</div>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<label for="exh_period_use" class="input-group-text">유효기간/이용조건</label>
				</div>
				<input type="text" class="form-control innm" id="exh_period_use"
					name="exh_period_use" value="전시 기간내에 1일동안만 이용가능합니다.">
			</div>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<label for="exh_refund_info" class="input-group-text">취소/환불안내</label>
				</div>
				<textarea class="form-control" rows="10" id="exh_refund_info"
					id="exh_refund_info" name="exh_refund_info">
취소수수료 없음
마이페이지 -> 나의 결제내역에서 취소 가능합니다.
문의사항은 고객문의처로 문의바랍니다.
				</textarea>
			</div>

			<div id="footer">
				<button id="conComplete" type="submit" class="btn-purple">등록하기</button>
<!-- 				<button id="conList" type="button" class="btn btn-primary">글목록</button> -->
			</div>
		</form>
	</div>
		</div>
		</div>
	</section>
</div>
	
	
	
	
	
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=75fb178f353ce628ee79e97732a582fc&libraries=services"></script>
<script>
console.log("${exhibition.exh_title}");
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };

    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });


    function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // 최종 주소 변수
	
                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("exh_location").value = addr;
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //첫번째 결과의 값을 활용
                        console.log(result);

                        var ady = result.y;
                        document.getElementById("exh_place_x").value = ady;
                        console.log("adx : "+ady);
                        
                        var adx = result.x;
                        document.getElementById("exh_place_y").value = adx;
                        console.log("ady : "+adx);
                        
                        
                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        console.log(coords);
                        console.log("result.x :"+result.x);
                        
                        // 지도를 보여준다.
//                         mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                    }
                });
            }
        }).open();
    }
</script>
</body>
</html>
