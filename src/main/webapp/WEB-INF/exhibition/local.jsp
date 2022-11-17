<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뉴전시스</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ include file="/header.jsp"%>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/gh/xpressengine/xeicon@2.3.1/xeicon.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>
	$(function() {
		$("#tabs").tabs();
	});

	function local_func(i, cnt) {
		var name = i;
		var st = cnt;
		$("#" + cnt).addClass("ch_tab").removeClass("loc_name");
		$("#" + cnt).siblings().addClass("loc_name").removeClass('ch_tab');
		$("#" + cnt).children('a').addClass("ch_tab").removeClass("loc_name");
		$("#" + cnt).siblings().children('a').addClass("loc_name").removeClass('ch_tab');
		$
				.ajax({
					type : "GET",
					url : "local_search?exh_local_name=" + name,
					success : function(data) {
						if (data == null) {

							alert("시스템에 문제가 발생했습니다")

						} else {
							var UserExhibitionList = data.UserExhibitionList;
							var error = data.error;

							const element = document.getElementById('tab-r');
							var comment_html = "";
							if (error != 1) {
								$
										.each(
												UserExhibitionList,
												function(i, v) {
													var exh_no = UserExhibitionList[i].exh_no;
													var exh_thumbnail = UserExhibitionList[i].exh_thumbnail;
													var exh_title = UserExhibitionList[i].exh_title;
													var exh_hall = UserExhibitionList[i].exh_hall;
													var exh_st_date = UserExhibitionList[i].exh_st_date;
													var exh_end_date = UserExhibitionList[i].exh_end_date;
													var st_Date = new Date(
															exh_st_date);
													var end_Date = new Date(
															exh_end_date);
													var st_re_date = st_Date
															.getFullYear()
															+ "-"
															+ (st_Date
																	.getMonth() + 1)
															+ "-"
															+ ("00" + st_Date
																	.getDate()
																	.toString())
																	.slice(-2);
													var en_re_date = end_Date
															.getFullYear()
															+ "-"
															+ (end_Date
																	.getMonth() + 1)
															+ "-"
															+ end_Date
																	.getDate();
													var rank_cnt = UserExhibitionList[i].rank_cnt;

													comment_html += "<div class='col' style='margin-bottom: 30px; cursor:pointer;' >";
													comment_html += "<a href=getUserExhibition?exh_no="
															+ exh_no
															+ " style='text-decoration: none;'>";

													comment_html += "<div class='card h-100 heart'>";
													comment_html += "<img src='/images/"+exh_thumbnail+"' class='card-img-top' alt='이미지' style='height: 300px;'>";
													comment_html += "<div class='card-body' >";
													comment_html += "<b class='card-title'>"
															+ exh_title
															+ "</b>";
													comment_html += "<p class='card-text' style='font-size: 14px; color: gray;'>"
															+ exh_hall + "<br>";
													comment_html += st_re_date
															+ "~" + en_re_date;
													comment_html += "  <span style='text-align: right;'><i class = 'xi-heart good' style='color:red;'></i> ";
													comment_html += "<b style='color: black; text-align: center;'>"
															+ rank_cnt
															+ "</b></span></p>";
													comment_html += "</div>   </div>  </a>  </div>";

													element.innerHTML = comment_html;
												});
							} else {
								element.innerHTML = "해당 지역의 전시가 없습니다.";
							}

						}
					}
				});

	}
	
	function showID(id)
	{
	obj=document.getElementById(id);

	if(obj.style.display == "none") 
	  obj.style.display="block";
	else
	  obj.style.display="none";
	}
</script>
<style>
#tabs {
	border: 1px solid white !important;
}

.ui-corner-all, .ui-corner-top, .ui-corner-right, .ui-corner-tr {
	border: 1px solid white !important;
}

.loc_name {
	color: #000 !important;
	background-color: white !important;
	border: 1px solid white !important;
}

.ch_tab {
	font-weight: bold !important;
	color: #7329f7 !important; background-color : white !important;
	border: 1px solid white !important;
	background-color: white !important;
}

.ui-tabs .ui-tabs-nav .ui-tabs-anchor:focus {
	font-weight: bold;
	color: #7832f7 !important;
}

a {
	text-decoration: none;
}

li {
	list-style: none;
}

#tab li a {
	color: #000;
}


@media ( max-width : 768px) {
#tab{
display: none;
}

}
@media ( min-width : 769px) {
.tabs-m{
display: none;

}

}
.normal{
font-weight: normal;
}


</style>
</head>

<body class="d-flex flex-column min-vh-100">

<div class=" tabs-m">
		  <div class="board" style="margin-top: 50px;">
		 <a href="#" onclick="showID('m-menu');" style="cursor: pointer; text-align: center;  text-decoration: none;"><h1>지역 선택 <i class="xi-caret-down-square"></i></h1></a> 
		 </div>
 			<div id="m-menu" style="display: none; margin: 5px;">
      			<c:forEach items="${loc}" var="loc_name" varStatus="status">
					<div class="loc_name  " id="${status.count }"
						onclick="local_func('${loc_name}','${status.count}')" style="text-align: center;">
						<a class="normal" href="#tabs-1" id="tabs${status.count }">
						${loc_name}
						</a>
						</div>
				</c:forEach>
			</div>
      </div>


	<div class="container justify-content-center" style="text-align: center; margin-top: 70px;">

		<div id="tabs">
		
			<ul id="tab"
				style="background-color: white; border-bottom: 1px solid white !important;">
				<c:forEach items="${loc}" var="loc_name" varStatus="status">
					<li class="loc_name" id="${status.count }"
						onclick="local_func('${loc_name}','${status.count}')"><a
						href="#tabs-1" id="tabs${status.count }">${loc_name}</a></li>
				</c:forEach>
			</ul>
			<div id="tabs-1" class="container justify-content-center" style="padding:20px 0px;">
				<div id="tab-r" class="row row-cols-1 row-cols-md-4 g-4"
					style="margin-bottom: 30px; margin-left:0; margin-right: 0;">
					<c:forEach items="${UserExhibitionList}" var="exhibition"
						varStatus="status">
						<div class="col" style="margin-bottom: 30px; cursor: pointer;"
							onclick="location.href='getUserExhibition?exh_no=${exhibition.exh_no}'">
							<div class="card h-100 heart" id="${status.count }">
								<img src="/images/${exhibition.exh_thumbnail }"
									class="card-img-top" alt="이미지" style="height: 300px;">
								<div class="card-body">
									<b class="card-title">${exhibition.exh_title}</b>
									<p class="card-text" style="font-size: 14px; color: gray;">${exhibition.exh_hall }<br>
										${exhibition.exh_st_date}~${exhibition.exh_end_date} <span
											style="text-align: right;"><i class="xi-heart good"
											style="color: red;"></i> <b
											style="color: black; text-align: center;">${exhibition.rank_cnt}</b></span>
									</p>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/footer.jsp"%>
</body>
</html>