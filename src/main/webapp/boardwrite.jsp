<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ include file="../../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <div class="board">
      <h1>글쓰기</h1>
   </div>
   <%-- <%@ include file="../../menu.jsp" %>   --%>
   <div class="container-fluid">
      <%
      if (request.getParameter("error") != null) {
         out.println("<div class='alert alert-danger'>");
         out.println("해당 글은 작성자만이 수정할 수 있습니다.");
         out.println("</div>");
      }
      %>
      <form name="insert" action="insertBoard" method="post">
         <input type="hidden" name="noti_no" value="${board.noti_no}">
         <div class="input-group mb-3">
            <div class="input-group-prepend">
               <span class="input-group-text">제목</span>
            </div>
            <input type="text" class="form-control innm" name="noti_title" maxlength="40">
         </div>
         <div class="input-group mb-3">
            <div class="input-group-prepend">
               <span class="input-group-text">작성자</span>
            </div>
            <input type="text" class="form-control innm" name="noti_writer"
               value="${board.noti_writer}" readonly>
         </div>
         <div class="input-group mb-3">
            <div class="input-group-prepend">
               <span class="input-group-text">내용</span>
            </div>
            <textarea class="form-control innm" rows="10" id="board_comment"
               name="noti_content" ></textarea>
         </div>
         <div class="input-group mb-3">
            <div class="input-group-prepend">
               <span class="input-group-text">파일</span>
            </div>
            <c:if test="${one.filename ne NULL}">
               <span style="cursor: pointer; padding: 0 20px;" onclick="seeImg()">[파일보기]</span>
               <script>
              function seeImg(){
                 $("#imgBox").show();
              }
<!--            </script> 
<%--             <span style="cursor:pointer;" onclick="downloadFile('${one.filename}')">[파일다운]</span> --%>
                           <script>
               function downloadFile(filename){
                   window.location ='download?filename='+filename;
               }
         </script>
            </c:if>
         </div>
         <div class="input-group mb-3">
            <div class="input-group-prepend">
               <span class="input-group-text">등록일</span>
            </div>
            <%--       <input type="text" class="form-control innm" name="regDate" value="${one.regdate}" readonly <%=sts %>>       --%>
         </div>
         <div class="input-group mb-3">
            <div class="input-group-prepend">
               <span class="input-group-text">조회수</span>
            </div>
            <%--       <input type="text" class="form-control innm" name="cnt" value="${one.cnt}" readonly <%=sts %>>       --%>
         </div>
         <div class="btnBox_parent" id="btnBox_parent">
            <button class="btn btn-success" href="boardwrite.jsp">글등록</button> 
            <button class="btn btn-success" href="getBoardList">글목록</button>
         </div>
      </form>

   </div>
   <!-- 클릭시 보이는 이미지 start -->
   <div id="imgBox" class="container-fluid">
      <div id="imgContentBox">
         <div id="imgBoxTitleBar">
            <span id="closeX" onclick="closeX()">X</span>
            <script>
           function closeX(){
              $("#imgBox").hide();
           }
        </script>
         </div>
         <img id="imgBoxImg" src="img/${board.filename}">
      </div>
   </div>
</body>
</html>