<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지역</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ include file="/header.jsp"%>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>
$( function() {
  $( "#tabs" ).tabs();
} );

	function local_func(i){
	
		var name=i;
		   $.ajax({
		        type : "GET",
		        url : "local_search?exh_local_name=" + name,
		        success : function(data) {
// 		        	debugger;
		           console.log(data);
		           if (data == "error") {
		        	   
		              alert("시스템에 문제가 발생했습니다")

		           } else {
		        	   var UserExhibitionList = data.UserExhibitionList;
		        	   console.log(UserExhibitionList);
		        	   const element = document.getElementById('tabs-1');
// 		        	   element.innerHTML = "<div style='color:red'>a</div>";
		        		var comment_html = "";
		        	   
		        		$.each(UserExhibitionList, function(i, v){
							var exh_thumbnail  =  UserExhibitionList[i].exh_thumbnail;
							var exh_title   =  UserExhibitionList[i].exh_title;
							var exh_hall = UserExhibitionList[i].exh_hall;
							var exh_st_date=  UserExhibitionList[i].exh_st_date;
							var exh_end_date=  UserExhibitionList[i].exh_end_date;
							var rank_cnt= UserExhibitionList[i].rank_cnt;		
							
							comment_html +="<div class='col' style='margin-bottom: 30px; cursor:pointer;' onclick='location.href='getUserExhibition?exh_no=${exhibition.exh_no}' >";
							
							comment_html  +=    "<div class='card h-100 heart'>";
							comment_html  +=   "<img src='/images/"+exh_thumbnail+"' class='card-img-top' alt='이미지' style='height: 300px;'>";
							comment_html  +=   "<div class='card-body' >";
 							comment_html  +=     "<b class='card-title'>"+ exh_title+"</b>";
				            comment_html  +=      "<p class='card-text' style='font-size: 14px; color: gray;'>"+exh_hall+"<br>";
				            comment_html  +=    exh_st_date+"~"+exh_end_date;
				            comment_html  +=    "  <span style='text-align: right;'><i class = 'xi-heart good' style='color:red;'></i> ";
				            comment_html  +=    "<b style='color: black; text-align: center;'>"+rank_cnt+"</b></span></p>";
				            comment_html  +=     "</div>   </div>   </div>";
							      
				         
				         
							
							element.innerHTML=comment_html;
							});
		        	   
		        	   
		           }
		        }
		     });
		
	}

</script>
</head>
<body>
      <div id="tabs">
         <ul>
   <c:forEach items="${loc}" var="loc_name" varStatus="status">
            <li class="loc_name" id="${status.count}" onclick="local_func('${loc_name}')"><a href="#tabs-1">${loc_name}</a></li> 
	</c:forEach>
         </ul>
         <div id="tabs-1">
          <c:forEach items="${UserExhibitionList}" var="exhibition" varStatus="status">
            <div class="col" style="margin-bottom: 30px; cursor:pointer;" onclick="location.href='getUserExhibition?exh_no=${exhibition.exh_no}'" >
            <div class="card h-100 heart" id="${status.count }">
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
         </c:forEach>
         </div>
      </div>
<%@ include file="/footer.jsp"%>
</body>
</html>