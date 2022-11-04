<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<script>
function findPwBtn(){
	var emailRegex = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	var email = $("#mb_email");
	
	$.ajax({
		url : "/findPw",
		type : "post", 
		data : {"mb_id" : $("#findPw").val()},
		success : function(mMeberInfo){ 
			if(mMeberInfo) { //순서가 왜 중요한지?
			alert(
					"비밀번호는"+mMeberInfo.mb_pw+"입니다.\n" 
				+ "이메일은" +mMeberInfo.mb_email+"입니다\n"
				+ "핸드폰번호는" +mMeberInfo.mb_phone+"입니다"
				);
			}
		}
	});
}
</script>
<body>
<form action="/findPw">
<input type="text" class="form-control" placeholder="아이디를 입력해주세요." id="findPw"  required autofocus>
			<button type="button" onclick='findPwBtn()'>비밀번호 찾기</button>			
</form>
</body>
</html>