<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" --%>
<%-- 	pageEncoding="UTF-8"%> --%>
<%-- <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> --%>
<!-- <head> -->
<%-- <title>${exhibition.exh_title}</title> --%>
<!-- </head> -->
<!-- <body> -->
<link rel="stylesheet" href="./css/exhibitionDetail.css">
<div class="container" style="text-align: center; padding-top: 30px;">
		<h3 style="font-weight: bold;">${exhibition.exh_title}</h3>
		<br>
		<h6>${exhibition.exh_location}</h6>
		<h5>${exhibition.exh_hall}</h5>

<!-- 			<div id="map" style="width: 800px; height: 700px; margin: 0 auto; margin-bottom: 50px;"></div> -->
<!-- 	<img src="images/1.jpg" id="map" style="width: 800px; height: 700px; margin: 0 auto; margin-bottom: 50px;"> -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1ea44200cb8cf7bb0a768d9c219c84a0&libraries=services"></script>
	<script>
				var lx = ${exhibition.exh_place_x};
				var ly = ${exhibition.exh_place_y};
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(lx, ly), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		

		// 마커가 표시될 위치입니다 
		var markerPosition = new kakao.maps.LatLng(lx, ly);

		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
			position : markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		
		marker.setMap(map);
		map.setCenter(markerPosition);
		 map.relayout();
		// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
		// marker.setMap(null);
	</script>
	</div>
<!-- </body> -->
<!-- </html> -->