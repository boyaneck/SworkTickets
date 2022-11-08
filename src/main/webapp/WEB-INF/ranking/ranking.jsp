<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전시 목록</title>
<!-- header -->
<%@ include file="/header.jsp"%>
<!-- header end -->
<style>
</style>
<body>

	<div id="carouselExampleCaptions" class="carousel slide"
		data-ride="carousel" data-interval="false">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleCaptions" data-slide-to="0"
				class="active"></li>
			<li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
			<li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="./images/main_image.png" class="d-block w-100"
					alt="배경이미지1">
				<div class="carousel-caption d-none d-md-block">
					<h5>첫번째</h5>
				</div>
			</div>
			<div class="carousel-item">
				<img src="./images/main_image2.png" class="d-block w-100"
					alt="배경이미지2">
				<div class="carousel-caption d-none d-md-block">
					<h5>두번째</h5>
				</div>
			</div>
			<div class="carousel-item">
				<img src="./images/main_image3.png" class="d-block w-100"
					alt="배경이미지3">
				<div class="carousel-caption d-none d-md-block">
					<h5>세번째</h5>
				</div>
			</div>
		</div>
	</div>


	<div class="jumbotron">
		<h1 class="text-center">RANK</h1>
	</div>

	<div class="container-fluid">
		<div class="row text-center">
			<div class="col">
				좋아요
				<c:forEach items="${getGoodList}" var="getGoodList" varStatus="status">
					<div class="row "><div class="col">
						<a href="getUserExhibition?exh_no=${getGoodList.exh_no}">${status.count} ${getGoodList.exh_title}</a>
						 ${getGoodList.rank_cnt }<br>
					</div></div>
				</c:forEach>
			</div>
			<div class="col">
				예매율
				<c:forEach items="${payRankList}" var="payRankList" varStatus="status">
					<div class="row "><div class="col">
						<a href="getUserExhibition?exh_no=${payRankList.exh_no}">
						${status.count}
							${payRankList.exh_title} </a> 
						<fmt:formatNumber value="${(payRankList.rank_cnt / total)*100 }" />
						%
					</div></div>
				</c:forEach>
			</div>
		</div>
		
	</div>
	<br><br>
	<div class="jumbotron">
		<a href="getUserExhibitionList"><h1 class="text-center">+more</h1></a>
	</div>
<%@ include file="/footer.jsp"%>
</body>
</html>