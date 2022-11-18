<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <%@ include file="../../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>뉴전시스</title>
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
.btn-success:hover{
background-color:#7832f7!important;
color:white !important;
/* cursor:pointer; */
}   
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="insertOne">
<div class="container">
 <div class="input-group mb-3">
            <div class="input-group-prepend">
              
<input type="checkbox" name="one_secret" id="box" style="margin-top:50px;">
<label for="box" style="margin-top:50px;"><em></em>비밀글 설정</label>
            </div>
         </div>



<div class="input-group mb-3">
				<div class="input-group-prepend">
					<label for="exh_cs_phone" class="input-group-text">아이디</label>
				</div>
				<input type="text" class="form-control innm" id="one_writer"
					name="one_writer" value="<%= session.getAttribute("mb_Id") %>" readonly required style="background-color:white!important">
			</div>
         <div class="input-group mb-3">
				<div class="input-group-prepend">
					<label for="exh_cs_phone" class="input-group-text" style="padding-left: 20px; padding-right: 20px;">제목</label>
				</div>
				<input type="text" class="form-control innm" id="one_title"
					name="one_title" placeholder="제목을 작성해주세요" required>
			</div>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<label for="exh_content" class="input-group-text"style="padding-left: 18px; padding-right: 18px;" >내 용</label>
				</div>
				<textarea class="form-control" rows="10" id="comment"
					id="one_content" name="one_content" placeholder="내용을 입력해주세요." required></textarea>
			</div>


<div class="regBtn" style="margin-top:40px; text-align:center;">
<button class="btn btn-success"  style="cursor: pointer;">글 등록</button>
</div>
</div>
</form>
</body>
</html>