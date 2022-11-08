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
<form action="insertFaq">


 
 <div class="input-group mb-3">
            <div class="input-group-prepend">
               <span class="input-group-text">제목</span>
            </div>
         <input type="text" placeholder="제목을 입력하세요" name="faq_title" >
         </div>
         
         



 <div class="input-group mb-3">
            <div class="input-group-prepend">
               <span class="input-group-text">내용</span>
            </div>
<textarea placeholder="내용을 입력하세요" name="faq_content" rows="15" cols="100"></textarea>
         </div>


<button>새글 등록</button>
</body>
</html>