<%@page import="org.springframework.web.bind.annotation.SessionAttributes"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
	<title>관리자 상세보기-${exhibition.exh_title}</title>
</head>
<body>
<style>
</style>
<br><br><br>
<div class="jumbotron">
        <h1>${exhibition.exh_title}</h1>
        <h5>${exhibition.exh_st_date} ~ ${exhibition.exh_end_date}</h5>
        <h6>${exhibition.exh_hall}</h6>
        <br>
        <jsp:useBean id="now" class="java.util.Date" /> 
        <fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" /> 
		<h5>
		<c:choose>
				<c:when test="${exhibition.exh_approval eq 0 && exhibition.exh_st_date <= today}">
				<p>승인 불가</p>
				<p>전시 시작일자를 변경해주세요.</p>
				</c:when>
				<c:when test="${exhibition.exh_approval eq 0 && exhibition.exh_st_date > today}">
				<p>승인 대기</p>
				</c:when>
				<c:when test="${exhibition.exh_approval eq 1 && exhibition.exh_end_date < today}">
				<p>전시 종료</p>
				</c:when>
				<c:when test="${exhibition.exh_approval eq 1 && exhibition.exh_st_date > today}">
				<p>승인</p>
				<p>전시 예정</p>
				</c:when>
				<c:otherwise>
				<p>전시 진행중</p>
				</c:otherwise>
		</c:choose>
		</h5>
</div>
<p>작가 ${exhibition.exh_artist}</p>
<p>관람등급 ${exhibition.exh_rating}</p>
<p>관람시간 ${exhibition.exh_time}</p>
<p>발권정보 ${exhibition.exh_shipping_info}</p>
<p>예매수수료 <fmt:formatNumber value="${exhibition.exh_fee}" groupingUsed="true" />원</p>
<p>가격 <fmt:formatNumber value="${exhibition.exh_price}" groupingUsed="true" />원</p>
   <div id="footer">
<%-- 			<a href="WEB-INF/admin/ExhibitionInsert?exh_no=${exhibition.exh_no}.jsp"><button type="button" id="modify" class="btn btn-primary">수정</button></a> --%>
			<a href="modifymoveExhibition?exh_no=${exhibition.exh_no}&page=${page}"><button type="button" id="modify" class="btn btn-primary">수정</button></a>
			<button type="button" id="del" class="btn btn-primary" onclick="del('${page}')">삭제</button>
			<a href="approvalExhibition?exh_no=${exhibition.exh_no}"><button type="button" id="approval" class="btn btn-primary">승인</button></a>
		</div>
		<script>
		 var edate = new Date('${exhibition.exh_end_date}');
		 var sdate = new Date('${exhibition.exh_st_date}');
		 var ndate = new Date();
		 var mond = document.getElementById("modify"); 	
		 var dond = document.getElementById("del"); 	
		 var aond = document.getElementById("approval"); 	
		 
		(function delmo() {
		    let approval = "${exhibition.exh_approval}";
		    if (approval == 1 && edate <= ndate) {
// 		    	$(#modify).attr("disabled", true);
// 		    	$(#del).attr("disabled", true);
// 		    	$(#approval).attr("disabled", true);
		    	mond.style.display = 'none';
		    	dond.style.display = 'none';
		    	aond.style.display = 'none';
		    } else if (approval == 1) {
		    	dond.style.display = 'none';
		    	aond.style.display = 'none';
// 		    	$(#del).attr("disabled", true);
// 		    	$(#approval).attr("disabled", true);
		    } else if (approval == 0 && sdate <= ndate) {
		    	aond.style.display = 'none';
		    } else{
		    }
		})();

		
       function del(page){
          var delConfirm = confirm('정말 삭제하시겠습니까?');
          var page= page;
         if (delConfirm == true) {

            location.href = 'deleteExhibition?exh_no=${exhibition.exh_no}&page='+page;
            alert('삭제되었습니다.');
         }
         else {
            alert('삭제가 취소되었습니다.');
         }
       }
       
      </script>
</body>
</html>
