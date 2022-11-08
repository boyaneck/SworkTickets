<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../header.jsp"%>
<%
String sts = "";
if (session.getAttribute("mb_Id") == null) {
	sts = "disabled";
}
%>

<!DOCTYPE html>
<html>
<head>

<script>
	function quitMember(mb_id) {
		if(confirm('정말 탈퇴하시겠습니까?')){
		if (mb_id != null) {
			console.log("if문 입니다.");
			location.href = "deleteMember?mb_id=" + mb_id;
		} else {
			console.log("else문입니다.");
		}
		} else{
			location.href= "mypage";
		}
	}
</script>

<meta charset="UTF-8">
<title>Insert title here</title>
<style>
input-group mb-3{width: 70% !important;}
.btn1{
	height: 38px;
	color: #7329f7; 
	background-color: white; 
	border-color: #7329f7; 
	border: solid 1px;
	padding: 3px 10px;
}
.btn2{
	height: 38px;
	color: red; 
	background-color: white; 
	border-color: red; 
	border: solid 1px;
	padding: 3px 10px;
}
</style>
</head>
<body>
	<div class="container"
	style="width: 40%; padding: 30px;">
		<h2 style="text-align: center; font-weight: bolder; padding: 30px 0;">마이페이지</h2>
		<hr>
	
		<form name="form" action="updateMember" method="post">
	<div class="input-group mb-3" style="justify-content: center;">
			<input type="hidden" name="mb_no" value="${member.mb_no}">
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">아이디</span>
				</div>
				<input type="text" class="form-control innm" name="mb_id" value="${member.mb_id}" readonly="readonly">
			</div>
			<div class="mb-3" style="width:100%;">
				<label for="pw">*비밀번호</label> 
				  <input type="password" class="form-control" name="mb_pw" id="pw"  minlength="4" maxlength="8">
			</div>

			<div class="mb-3" style="width:100%;">
				<label for="pw2">*비밀번호 확인</label>
				  <input type="password" class="form-control" name="mb_pw2" id="pw2"  minlength="4" maxlength="8"> 
					<span><font id="checkPw" size="2">비밀번호는 4~8글자입니다</font></span>
			</div>

			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">이름</span>
				</div>
				<input type="text" class="form-control innm" name="mb_name"
					value="${member.mb_name}" <%=sts %>>
			</div>

			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">핸드폰번호</span>
				</div>
				<input type="text" class="form-control innm" name="mb_phone"
					value="${member.mb_phone}" <%=sts %>>
			</div>

			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">이메일</span>
				</div>
				<input type="text" class="form-control innm" name="mb_email"
					value="${member.mb_email}" <%=sts %>>
			</div>
			<div id="footer">
			<div class="container text-center" >
				<button type="submit" class="btn1" <%=sts%>>회원정보수정</button>
				<button id="conDel" type="button" class="btn2"
					 onclick="quitMember(`${member.mb_id}`)">회원탈퇴</button>
			</div>
			</div>
	</div>
		</form>
</div>
</body>
</html>