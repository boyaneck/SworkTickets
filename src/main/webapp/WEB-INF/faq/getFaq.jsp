<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

#span{
	width: 72px;
    text-align: center !important;
    }
    .btn-success:hover{
    background-color:#7832f7 !important;
    }
</style>

</head>
<body>
<%
String sts = "";
if (session.getAttribute("mb_Id") == null) {
   sts = "disabled";
}
%>
<script>
function deletefaq(val){
    var delConfirm = confirm('정말 삭제하시겠습니까?');
    if (delConfirm == true) {
        alert('삭제되었습니다.');
        location.href ="deleteFaq?faq_no="+ val;
    }
    else {
        alert('삭제가 취소되었습니다.');
    }
    }
</script>

<body>
<%    
response.setHeader("Cache-Control","no-store");    
response.setHeader("Pragma","no-cache");    
response.setDateHeader("Expires",0);    
if (request.getProtocol().equals("HTTP/1.1"))  
        response.setHeader("Cache-Control", "no-cache");  
%>
   <div class="board">
      <h1>상세 보기</h1>
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
      <form name="update" action="updateFaq" method="post">
         <input type="hidden" name="one_no" value="${faq.faq_no}">
         <div class="input-group mb-3">
            <div class="input-group-prepend">
               <span class="input-group-text">제목</span>
            </div>
            <input type="text" class="form-control innm" name="faq_title"
               value="${faq.faq_title}" <%=sts %>>
         </div>
         
         <div class="input-group mb-3">
            <div class="input-group-prepend">
               <span class="input-group-text">내용</span>
            </div>
            <textarea class="form-control innm" rows="10" id="faq_content"
               name="faq_content" <%=sts%>>${faq.faq_content}</textarea>
         </div> 
         </div> 
         <div>  
         <div id="btnBox_parent">
            <button class="btn btn-success" href="getFaqList">글목록</button>
            <button class="btn btn-success" type="submit">글수정</button>
            <button class="btn btn-success" onclick="deletefaq(${faq.faq_no})" style="cursor: pointer">글삭제</button>
             </form> 
         </div>
         </div>
      <form action="deleteOne">
         <input type="hidden" name="one_no" value="${one.one_no}">
      </form>
      <div id="btnBox_parent">
      
      </div>
   </div>
   
</body>
</html>