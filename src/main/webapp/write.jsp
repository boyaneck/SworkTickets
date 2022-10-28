<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
ㅇㅇ
<form action="insertBoard">
<div>
<input type="checkbox" name="noti_secret" >
<label>비밀글 설정</label>


<select name="noti_category">
<option value="회원">회원</option>
<option value="결제">결제</option>
</select>
<input type="text" name="noti_writer" placeholder="작성자 아이디값 받아오기" value="<%= session.getAttribute("mb_Id") %>" readonly>
 
<input type="text" placeholder="제목을 입력하세요" name="noti_title" >

<input type="textarea" placeholder="내용을 입력하세요" name="noti_content">

<button>새글 등록</button>

</div>
</form>
</body>
</html>