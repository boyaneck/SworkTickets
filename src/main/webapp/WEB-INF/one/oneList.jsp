<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../header.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet"
   href="//cdn.jsdelivr.net/gh/xpressengine/xeicon@2.3.1/xeicon.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
.table tr:hover{
 background-color:#e8dbfe!important;

}
.aa{
color:
}
.write{
border-radius:4px;
border: 1px solid #1f1f1f;
    background-color: white;
    width: 100px;
    height: 40px;
    color: #f4f4f4;
    font-size: 18px;
    color: black;
}


</style>
<script>

   function getone(val){
   location.href="getOne?one_no="+val;

 }
   function f_write(val){
    console.log(val);
    if(val == ''){
        alert("로그인이 되야 작성 가능합니다");
        location.href="/getOneList";
    }else{
        location.href="/goWrite";
    }
 }
</script>
<body>
   <div class="board">
      <h1>1:1문의 </h1>
   </div>
   <nav id="searchNav" class="sub_title">
      <form class="form-inline" action="getOneList" method="post">
          <input class="form-control mr-sm-2" type="text" name="searchKeyword"
            placeholder="검색어를 입력하세요.">
         <button class="btn btn-success" type="submit" style="border-radius:4px">검색</button>
      </form>
   </nav>
   <div class="container-fluid">
      <table class="table table-hover">
         <thead class="btn-primary">
            <tr>
               <th style="width:10%; text-align:center;">번호</th>
               <th style="width:50%; text-align:center;">제목</th>
               <th style="width:20%; text-align:center;">작성자</th>
               <th style="width:20%; text-align:center;">등록일</th>
               
            </tr>
         </thead>
         <tbody>

            <c:forEach items="${oneList}" var="one">
               <c:if test="${one.one_secret eq 'true'}">
               <c:choose>
               <c:when test="${one.one_writer eq mb_Id || mb_Id eq 'admin'}">
               
               <tr onclick="getone(${one.one_no})" style="cursor: pointer;" onmouseover="this.style.fontWeight='bold'" onmouseout="this.style.fontWeight=''">
                <td onclick="getone(${one.one_no})" style="cursor: pointer" class="tdCenter">${one.one_no}</td>
                <td class="tdCenter">${one.one_title }<i class = "xi-lock-o" style="padding-top:px; font-size: 17.5px; cursor:pointer;"></i></td>
                <td class="tdCenter">${one.one_writer }</td>
                <td class="tdCenter"><fmt:formatDate value="${one.one_date}" pattern="yyyy-MM-dd HH:mm-ss" var="today" />${today}</td>
                     
                     </c:when>
                     <c:otherwise>
                     
                        <tr><td class="tdCenter" >${one.one_no}</td>
                           <td class="tdCenter aa">비밀게시글은 작성자와 관리자만 볼 수 있습니다.<i class = "xi-lock-o" style="padding-top:px; font-size: 17.5px; cursor:pointer;"></i></td>
                           <td class="tdCenter">${one.one_writer }</td>
                           <td class="tdCenter"><fmt:formatDate value="${one.one_date}" pattern="yyyy-MM-dd HH:mm-ss" var="today" />${today}</td>
                        </tr>
                     </c:otherwise>
                  </c:choose>

               </c:if>

               <c:if test="${one.one_secret eq 'false'}">

                  <tr onclick="getone(${one.one_no})" style="cursor: pointer;" onmouseover="this.style.fontWeight='bold'" onmouseout="this.style.fontWeight=''">
                     <td class="tdCenter">${one.one_no}</td>
                     <td class="tdCenter">${one.one_title}</td>
                     <td class="tdCenter">${one.one_writer}</td>
                     <td class="tdCenter"><fmt:formatDate value="${one.one_date}" pattern="yyyy-MM-dd HH:mm-ss" var="today" />${today}</td>
                     

                  </tr>

               </c:if>

            </c:forEach>
         </tbody>
      </table>
      
            <button class="write" onclick="f_write('${mb_Id}')" style="cursor:pointer" ">글쓰기</button>
      <br>
      <br>
      <div id="btnBox_parent">
      <div id="btnBox">
         <!-- 반복처리할 태그 시작-->
         <c:if test="${paging.nowPageBtn > 1 }">
            <a href="getOneList?nowPageBtn=${paging.nowPageBtn -1 }">&lt;</a>
         </c:if>
         <c:forEach begin="${paging.startBtn}" end="${paging.endBtn }"
            step="1" var="i">
            <c:choose>
               <c:when test="${paging.nowPageBtn == i}">
                  <a class="aSel">${i}</a>
               </c:when>
               <c:otherwise>
                  <a href="getOneList?nowPageBtn=${i}"><Strong>${i}</Strong></a>
               </c:otherwise>
            </c:choose>
         </c:forEach>
         <c:if test="${paging.nowPageBtn < paging.totalBtnCnt }">
            <a href="getOneList?nowPageBtn=${paging.nowPageBtn +1 }">&gt;</a>
         </c:if>
         <!-- 반복처리할 태그 끝 -->
      </div>
      <br>
      <br>

           
   </div>
      <br>
      <br>

   
   </div>



</body>
</html>