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
<style>
#imgBox { 
display: none; 
position: absolute; 
top: 0; 
left: 0; 
height: 100vh !important; 
background-color: rgba(0, 0, 0, 0.5); 
z-index: 9999999; 
}

#imgContentBox { 
width: 600px; 
max-height: 550px; 
overflow: auto; 
position: absolute; 
top: 30%; 
left: 30%; 
border-radius: 5px; 
z-index: 9999999; 
} 

#imgBoxTitleBar { 
border-bottom: 1px solid #777; 
border-radius: 5px 5px 0 0; 
background-color: #ddd; 
width: 100%; 
padding: 10px; 
text-align: right; 
font-size: 20px; 
font-weight: bolder; 
} 

#imgBoxImg { 
width: 100%; 
border-radius: 0 0 5px 5px; 
} 

#closeX { 
padding: 5px 20px; 
border-radius: 5px; 
border: 1px solid #777; 
background-color: red; 
color: #fff; 
} 

#closeX:hover { 
background-color: #777; 
cursor: pointer; 
} 
</style>

<body>
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
<!--          <div class="input-group mb-3"> -->
<!--             <div class="input-group-prepend"> -->
<!--                <span class="input-group-text">작성자</span> -->
<!--             </div> -->
<!--             <input type="text" class="form-control innm" name="faq_writer" -->
<%--                value="관리자" readonly <%=sts %>> --%>
<!--          </div> -->
         <div class="input-group mb-3">
            <div class="input-group-prepend">
               <span class="input-group-text">내용</span>
            </div>
            <textarea class="form-control innm" rows="10" id="faq_content"
               name="faq_content" <%=sts%>>${faq.faq_content}</textarea>
         </div>
            <%--       <input type="text" class="form-control innm" name="cnt" value="${one.cnt}" readonly <%=sts %>>       --%>
         </div>
         <div>
         <div id="btnBox_parent">
            <button class="btn btn-success" type="submit">글수정</button>
            <button class="btn btn-success" href="faqwrite.jsp" >글쓰기</button> 
            <button class="btn btn-success" href="getFaqList">글목록</button>
         </div>
         </div>
      </form>
      
      <form action="deleteOne">
         <input type="hidden" name="one_no" value="${one.one_no}">
      </form>
      <div id="btnBox_parent">
      <button class="btn btn-delete" onclick="deletefaq(${faq.faq_no})" style="cursor: pointer">글삭제</button>
      </div>
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
         <img id="imgBoxImg" src="img/${one.filename}">
      </div>
   </div>
   <!-- 클릭시 보이는 이미지 end -->
</body>
</html>