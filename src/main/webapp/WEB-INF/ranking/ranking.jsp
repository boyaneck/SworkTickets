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
<script>
function rank_btn(i){

if(i==1){
   document.getElementById('good_btn').style.color='#7329f7';
   document.getElementById('good_btn').style.fontWeight='bold';
   document.getElementById('pay_btn').style.color='gray';
   document.getElementById('pay_btn').style.fontWeight='normal';
   document.getElementById('pay_tab').style.display = "none";
   document.getElementById('good_tab').style.display = "";
   
}   else{
   document.getElementById('pay_btn').style.color='#7329f7';
   document.getElementById('pay_btn').style.fontWeight='bold';
   document.getElementById('good_btn').style.color='gray';
   document.getElementById('good_btn').style.fontWeight='normal';
   document.getElementById('good_tab').style.display = "none";
   document.getElementById('pay_tab').style.display = "";
}

}
</script>
</head>
<body class="d-flex flex-column min-vh-100">

   <!--    <div class="jumbotron"> -->
   <!--       <h1 class="text-center">RANK</h1> -->
   <!--    </div> -->

   <!--    <div class="container-fluid"> -->
   <!--       <div class="row text-center"> -->
   <!--          <div class="col"> -->
   <!--             좋아요 -->
   <%--             <c:forEach items="${getGoodList}" var="getGoodList" varStatus="status"> --%>
   <!--                <div class="row "><div class="col"> -->
   <%--                   <a href="getUserExhibition?exh_no=${getGoodList.exh_no}">${status.count} ${getGoodList.exh_title}</a> --%>
   <%--                    ${getGoodList.rank_cnt }<br> --%>
   <!--                </div></div> -->
   <%--             </c:forEach> --%>
   <!--          </div> -->
   <!--          <div class="col"> -->
   <!--             예매율 -->
   <%--             <c:forEach items="${payRankList}" var="payRankList" varStatus="status"> --%>
   <!--                <div class="row "><div class="col"> -->
   <%--                   <a href="getUserExhibition?exh_no=${payRankList.exh_no}"> --%>
   <%--                   ${status.count} --%>
   <%--                      ${payRankList.exh_title} </a>  --%>
   <%--                   <fmt:formatNumber value="${(payRankList.rank_cnt / total)*100 }" /> --%>
   <!--                   % -->
   <!--                </div></div> -->
   <%--             </c:forEach> --%>
   <!--          </div> -->
   <!--       </div> -->

   <!--    </div> -->

   <div class="board">
      <h1>랭킹</h1>
      <div class="text-center">
         <button class="btn-ranking"
            style="color: #7329f7; font-weight: bold;" id="good_btn"
            onclick="rank_btn(1)">좋아요</button>
         <button class="btn-ranking" style="color: gray" id="pay_btn"
            onclick="rank_btn(2)">예매율</button>
      </div>
   </div>
   <div class="container rank">
      <table class="table table-hover">
         <thead class="btn-primary">
            <tr>
               <th>랭킹</th>
               <th></th>
               <th>전시명</th>
               <th>가격</th>
               <th>전시일자</th>
               <th>장소</th>

            </tr>
         </thead>

         <tbody id="pay_tab" style="display: none;">

            <c:forEach items="${payRankList}" var="payRankList"
               varStatus="status">
                  <tr onclick="location.href='getUserExhibition?exh_no=${payRankList.exh_no}'" style="cursor: pointer;">
                  <td class="tdCenter rank" >${status.count}</td>
                  <td class="tdCenter" ><img src="/images/2-1.jpg"
                     <%--                   '${payRankList.exh_thumbnail}' --%>
                  alt="이미지"
                     style="width: 100px; height: 150px;"></td>
                  <td class="tdCenter" >
                        ${payRankList.exh_title}</td>
                  <td class="tdCenter price" ><fmt:formatNumber
                        value="${payRankList.exh_price}" groupingUsed="true" />원</td>
                  <td class="tdCenter date" >${payRankList.exh_st_date}~
                     ${payRankList.exh_end_date}</td>
                  <td class="tdCenter exh_hall" >${payRankList.exh_hall}</td>
               </tr>
            </c:forEach>
         </tbody>

         <tbody id="good_tab" style="border-top: 1.5px solid #1f1f1f">
            <c:forEach items="${getGoodList}" var="getGoodList"
               varStatus="status">
               <tr onclick="location.href='getUserExhibition?exh_no=${getGoodList.exh_no}'" style="cursor: pointer;">
                  <td class="tdCenter rank">${status.count}</td>
                  <div></div>
                     <td class="tdCenter"><img src="/images/2-1.jpg"
                     <%--                   '${payRankList.exh_thumbnail}' --%>
                  alt="이미지"
                     style="width: 100px; height: 150px;"></td>
                  <td class="tdCenter">
                        ${getGoodList.exh_title}</td>
                  <td class="tdCenter price"><fmt:formatNumber
                        value="${getGoodList.exh_price}" groupingUsed="true" />원</td>
                  <td class="tdCenter date">${getGoodList.exh_st_date}~
                     ${getGoodList.exh_end_date}</td>
                  <td class="tdCenter exh_hall">${getGoodList.exh_hall}</td>

               </tr>
            </c:forEach>

         </tbody>
      </table>
   </div>
   <br>
   <br>
   <div class="jumbotron">
      <a href="getUserExhibitionList"><h1 class="text-center">+more</h1></a>
   </div>
   <%@ include file="/footer.jsp"%>
</body>
</html>