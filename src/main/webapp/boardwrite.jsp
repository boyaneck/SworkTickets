<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ include file="../../header.jsp" %>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
               value="<%=session.getAttribute("mb_Id") %>" readonly>
         </div>
         <div class="input-group mb-3">
            <div class="input-group-prepend">
               <span class="input-group-text">내용</span>
            </div>
            <textarea class="form-control innm" rows="10" id="noti_content"
               name="noti_content" ></textarea>
         </div>
  
         <div class="btnBox_parent" id="btnBox_parent">
            <button class="btn btn-success" href="boardwrite.jsp">글등록</button> 
            <button class="btn btn-success" href="getBoardList">글목록</button>
         </div>
      </form>

   </div>
</body>
</html>