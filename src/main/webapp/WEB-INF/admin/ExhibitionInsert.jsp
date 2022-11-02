<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
// if(session.getAttribute("userId") == null){
// 	response.sendRedirect("login.jsp");	
// }else{
%>
<%@ include file="../../header.jsp"%>
<body>
	<div class="jumbotron">
		<h1>전시 등록</h1>
	</div>
	<div class="container-fluid">
		<form action="insertExhibition" method="post"
			enctype="multipart/form-data">
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<label for="exh_title" class="input-group-text">전시명</label>
				</div>
				<input type="text" class="form-control" id="exh_title"
					name="exh_title" placeholder="전시명을 입력하세요." required>
			</div>

			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<label for="exh_price" class="input-group-text">가격</label>
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
					<label for="exh_location" class="input-group-text">위치</label>
				</div>
				<input type="text" class="form-control innm" id="exh_location"
					name="exh_location" placeholder="주소를 검색해주세요."> 
					<input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
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
				<%--          <input type="text" class="form-control innm" name="writer" value="<%=session.getAttribute("userName").toString() %>" readonly> --%>
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
					name="exh_thumbnail">
			</div>

			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<label for="exh_banne" class="input-group-text">배너</label>
				</div>
				<input type="file" class="form-control innm" id="exh_banne"
					name="exh_banne">
			</div>

			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<label for="exh_img" class="input-group-text">이미지</label>
				</div>
				<input type="file" class="form-control innm" id="exh_img"
					name="exh_img">
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
					name="exh_time">
			</div>

			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<label for="exh_rating" class="input-group-text">관람등급</label>
				</div>
				<select id="exh_rating" name="exh_rating">
					<option value="">전체관람가</option>
					<option value="1">만 8세 이상</option>
					<option value="2">만 15세 이상</option>
					<option value="3">만 18세 이상</option>
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
					<option value="">지역을 선택해주세요</option>
					<option value="1">서울</option>
					<option value="2">경기/인천</option>
					<option value="3">충청/강원</option>
					<option value="4">대구/경북</option>
					<option value="5">부산/경남</option>
					<option value="6">광주/전라</option>
					<option value="7">제주</option>
				</select> 
			</div>

			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<label for="exh_common_no" class="input-group-text">공통 내용
						선택</label>
				</div>
				<input type="text" class="form-control innm" id="exh_common_no"
					name="exh_common_no">
			</div>

			<div id="footer">
				<button id="conComplete" type="submit" class="btn btn-primary">등록하기</button>
				<button id="conList" type="button" class="btn btn-primary">글목록</button>
			</div>
		</form>
	</div>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=75fb178f353ce628ee79e97732a582fc&libraries=services"></script>
<script>
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
