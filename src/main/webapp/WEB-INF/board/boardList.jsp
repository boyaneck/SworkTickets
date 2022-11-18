<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet"
   href="//cdn.jsdelivr.net/gh/xpressengine/xeicon@2.3.1/xeicon.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
.table tr:hover {
   background-color: #e8dbfe !important;
}
.tdCenter{
word-break:keep-all;
}
.write {
   border-radius: 4px;
   border: 1px solid #1f1f1f;
   background-color: white;
   width: 100px;
   height: 40px;
   color: #f4f4f4;
   font-size: 18px;
   color: black;
}
.search:hover {
background-color:#7832f7 !important;
color:white;
}

@media (max-width: 768px) {
  .tb {
  display:none;
}
.searchNav{
text-align:center;
width:100%;


}
.sub_title{
float:none;
margin-bottom: 20px;
}
.btn-success{
width:100%;
margin-top: 10px;
}
.container-fluid{
padding:0;}
}



/* .tt{ */
/*  font-size:25px; */
/* } */


</style>
<script>
   function getboard(val) {
      location.href = "getBoard?noti_no=" + val;

   }
   function f_write(val) {
      if (val == '') {
         alert("로그인이 되야 작성 가능합니다");
         location.href = "/getBoardList";
      } else {
         location.href = "/goWriteBoard";
      }
   }
</script>
<body class="d-flex flex-column min-vh-100">
<%    
response.setHeader("Cache-Control","no-store");    
response.setHeader("Pragma","no-cache");    
response.setDateHeader("Expires",0);    
if (request.getProtocol().equals("HTTP/1.1"))  
        response.setHeader("Cache-Control", "no-cache");  
%>
   <div class="board">
      <h1>공 지 사 항</h1>
   </div>


   <nav id="searchNav" class="sub_title">
      <form class="form-inline justify-content-end" action="getBoardList" method="post">
         <input class="form-control mr-sm-2" type="text" name="searchKeyword"
            placeholder="제목 또는 작성자 검색" value="${searchKeyword }">
         <button class="btn btn-success search" type="submit"
            style="border-radius: 4px">검색</button>
      </form>
   </nav>
   <div class="container-fluid">
      <table class="table table-hover">
         <thead >
            <tr>
               <th class="tb" style="text-align: center;">번호</th>
               <th style="text-align: center;">제목</th>
               <th class="tb" style="text-align: center;">작성자</th>
               <th class="tb" style="text-align: center;">등록일</th>

            </tr>
         </thead>
         <tbody>

            <c:forEach items="${boardList}" var="board">
               <tr onclick="location.href='getBoard?noti_no=${board.noti_no }'"; style="cursor: pointer;" class="aa"
                  onmouseover="this.style.fontWeight='bold'"
                  onmouseout="this.style.fontWeight=''">
                  <td class="tdCenter tb" style="width: 10%;">${board.noti_no}</td>
                  <td class="tdCenter" style="width: 50%; padding: 20px 15px; word-break:keep-all;">${board.noti_title}</td>
                  <td class="tdCenter tb" style="width: 20%;">${board.noti_writer}</td>
                  <td class="tdCenter tb" style="width: 20%;"><fmt:formatDate
                        value="${board.noti_date}" pattern="yyyy-MM-dd HH:mm-ss"
                        var="today" />${today}</td>
               </tr>


            </c:forEach>
         </tbody>
      </table>
      <div>
         <c:choose>
            <c:when test="${mb_Id eq 'admin' }">
               <button class="write" onclick="f_write('${mb_Id}')"
                  style="cursor: pointer">글쓰기</button>
            </c:when>
            <c:otherwise></c:otherwise>
         </c:choose>
      </div>
   </div>

   <br>
   <br>
   <div id="btnBox_parent">
      <div id="btnBox">
         <!-- 반복처리할 태그 시작-->
         <c:if test="${paging.nowPageBtn > 1 }">
            <a href="getBoardList?nowPageBtn=1&searchKeyword=${searchKeyword }"  ><strong>&laquo;</strong></a>
         </c:if>
         <c:if test="${paging.nowPageBtn > 1 }">
            <a href="getBoardList?nowPageBtn=${paging.nowPageBtn -1 }&searchKeyword=${searchKeyword }"  class="tt" ><strong>&lt;</strong></a>
         </c:if>
         <c:forEach begin="${paging.startBtn}" end="${paging.endBtn }"
            step="1" var="i">
            <c:choose>
               <c:when test="${paging.nowPageBtn == i}">
                  <a style=" color: #7832f7; font-size:21px;" class="aSel"
                     href="getBoardList?nowPageBtn=${i}&searchKeyword=${searchKeyword }" ><strong>${i}</strong></a>
               </c:when>
               <c:otherwise>
                  <a href="getBoardList?nowPageBtn=${i}&searchKeyword=${searchKeyword }">${i}</a>
               </c:otherwise>
            </c:choose>
         </c:forEach>
         <c:if test="${paging.nowPageBtn < paging.totalBtnCnt }">
            <a href="getBoardList?nowPageBtn=${paging.nowPageBtn +1 }&searchKeyword=${searchKeyword }"><strong>&gt;</strong></a>
         </c:if>
         <c:if test="${paging.nowPageBtn < paging.totalBtnCnt }">
            <a href="getBoardList?nowPageBtn=${paging.totalBtnCnt}&searchKeyword=${searchKeyword }"><strong>&raquo;</strong></a>
         </c:if>
         <!-- 반복처리할 태그 끝 -->
      </div>
   </div>

<%@ include file="/footer.jsp"%>

</body>
</html>