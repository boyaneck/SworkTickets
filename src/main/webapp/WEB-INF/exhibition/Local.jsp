<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지역</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <title>jQuery UI Tabs - Default functionality</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>
$( function() {
  $( "#tabs" ).tabs();
} );
</script>
</head>
<body>
	<c:forEach items="${UserExhibitionList}" var="exhibition">
		<div id="tabs">
			<ul>
				<li><a href="#tabs-1">{exhibition_local.name}</a></li>
			</ul>
			<div id="tabs-1">
				<div class="col" style="margin-bottom: 30px; cursor:pointer;" onclick="location.href='getUserExhibition?exh_no=${exhibition.exh_no}'" >
				<div class="card h-100 heart">
					<img src="/images/${exhibition.exh_thumbnail }"
						class="card-img-top" alt="이미지" style="height: 300px;">
					<div class="card-body" >
						<b class="card-title">${exhibition.exh_title}</b>
						<p class="card-text" style="font-size: 14px; color: gray;">${exhibition.exh_hall }<br>
						${exhibition.exh_st_date}~${exhibition.exh_end_date}
						<span style="text-align: right;"><i class = "xi-heart good" style="color:red;"></i> 
					<b style="color: black; text-align: center;">${exhibition.rank_cnt}</b></span></p>
					</div>
				</div>
			</div>
			</div>
		</div>
	</c:forEach>
</body>
</html>