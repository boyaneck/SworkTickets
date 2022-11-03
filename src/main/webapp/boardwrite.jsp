<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="insertBoard">
<div>



<input type="text" name="noti_writer" placeholder="작성자 아이디값 받아오기" value="<%= session.getAttribute("mb_Id") %>" readonly>
 
<input type="text" placeholder="제목을 입력하세요" name="noti_title" >

<input type="textarea" placeholder="내용을 입력하세요" name="noti_content">

<button>새글 등록</button>

</div>
</form>
</body>
</html>