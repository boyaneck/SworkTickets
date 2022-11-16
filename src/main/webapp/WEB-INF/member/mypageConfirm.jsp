<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../../header.jsp"%>
</head>
<script>
	function pwChk() {
		$.ajax({
			url : "/pwChk",
			type : "post",
			dataType : "json",
			data : {
				"mb_pw" : $("#mb_pw").val()
			},
			success : function(data) {
				if (data == 0) {
					alert("비밀번호가 일치하지 않습니다.");
				}
			}
		})
	}
</script>
<body class="d-flex flex-column min-vh-100">
	
	<div class="container">
		<form action="mypage">
			<div class="form-group row justify-content-center">
				<div class="col-md-6">
				<div class="input-group justify-content-center mt-5" style="margin-bottom:20px;">
					<input type="hidden" name="mb_id" id="mb_id" value="${mb_Id}">
					<%-- <input type="hidden" name="mb_pw" value="${member.mb_pw}" /> --%>
					<input class="form-control" type="password" placeholder="비밀번호 확인"
						id="mb_pw" name="mb_pw">
				</div>
				</div>
				<div class="form-group row justify-content-center">
				<div class="col-md-6">
				<div id="footer">
					<div class="container text-center">
						<button class="btn-purple-pw" id="checkPwd">비밀번호 확인</button>
					</div>
				</div>
				</div>
				</div>
			</div>
		</form>
	</div>
	<%@ include file="../../footer.jsp"%>
</body>
</html>