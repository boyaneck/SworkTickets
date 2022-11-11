<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <%@ include file="../../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<style>
input[id="box"]{
 display:none;
}

input[id="box"] + label em {
display:inline-block;
width:25px;
height:25px;
margin-right:5px;
background:url(images/bg_chkbox.gif) 0 0 no-repeat;
vertical-align:middle;
}

input[id="box"]:checked + label em{
background-position:-38px 0;

}
input
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="insertOne">
<div>
 <div class="input-group mb-3">
            <div class="input-group-prepend">
              
<input type="checkbox" name="one_secret" id="box" style="padding-left:400px; margin-top:50px;">
<label for="box" style="padding-left:400px; margin-top:50px;"><em></em>비밀글 설정</label>
            </div>
         </div>


<!-- <select name="one_category"> -->
<!-- <option value="회원">회원</option> -->
<!-- <option value="결제">결제</option> -->
<!-- </select> -->
<div class="input-group mb-3">
            <div class="input-group-prepend" style="padding-left:400px;">
               <span class="input-group-text">아이디</span>
            </div>
<input type="text" name="one_writer" placeholder="작성자 아이디값 받아오기" value="<%= session.getAttribute("mb_Id") %>" readonly>
         </div>
 
 
 <div class="input-group mb-3" style="padding-left:400px;">
            <div class="input-group-prepend">
               <span class="input-group-text">제목</span>
            </div>
         <input type="text" placeholder="제목을 입력하세요" name="one_title" >
         </div>
         
         



 <div class="input-group mb-3" style="padding-left:400px;">
            <div class="input-group-prepend">
               <span class="input-group-text">내용</span>
            </div>
<textarea placeholder="내용을 입력하세요" name="one_content" rows="15" cols="100" ></textarea>
         </div>


<div class="regBtn" style="padding-left:900px; margin-top:40px;">
<button class="btn btn-success"  style="cursor: pointer">글 등록</button>
</div>
</div>
</form>
</body>
</html>