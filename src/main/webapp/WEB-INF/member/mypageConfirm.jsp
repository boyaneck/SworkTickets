<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../../header.jsp"%>
</head>
<body>
	<form action="mypage">
		<div class="card-body">
			<div class="text-start">

				<input type="hidden" name="mb_id" id="mb_id" value="${mb_Id}">
				<%-- <input type="hidden" name="mb_pw" value="${member.mb_pw}" /> --%>
				<div class="input-group input-group-outline my-3">
					<label class="form-label">비밀번호 확인</label> <input type="password"
						id="mb_pw" name="mb_pw" class="form-control">
				</div>

			</div>
			<button class="btn bg-gradient-primary w-100 my-4 mb-2" id="checkPwd">
				비밀번호 확인</button>

			<!-- <script>
				$('#checkPwd').click(function() {
					const checkPassword = $('#mb_pw').val();
					console.log(checkPassword);
					if (!checkPassword || checkPassword.trim() === "") {
						alert("비밀번호를 입력하세요.");
					} else {
						$.ajax({
							type : 'GET',
							url : '/mypageView',
							data : {
								'mb_pw' : checkPassword
							},
							datatype : "text"
						}).done(function(result) {
							
							console.log(result);
							
							if (result) {
								console.log("비밀번호 같음");
								window.location.href = "/mypage?mb_id=${mb_Id}"; 
							} else if (!result) {
								console.log("비밀번호 다름");
								// 비밀번호가 일치하지 않으면
								alert("비밀번호가 맞지 않습니다.");
								window.location.reload();
							}
							
						}).fail(function(error) {
							alert(JSON.stringify(error));
						})
					}
				});
			</script> -->
		</div>
	</form>

</body>
</html>