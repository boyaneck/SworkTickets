<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멤버등록</title>
<%@ include file="../../header.jsp"%>

<style>
@import
	url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;700;900&display=swap')
	;

*, body {
	font-family: 'Poppins', sans-serif;
	font-weight: 400;
	-webkit-font-smoothing: antialiased;
	text-rendering: optimizeLegibility;
	-moz-osx-font-smoothing: grayscale;
}

html, body {
	height: 100%;
	background-color: #152733;
	overflow: hidden;
}

.form-holder {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	text-align: center;
	min-height: 100vh;
	margin: 0 auto;
}

.form-holder .form-content {
	position: relative;
	text-align: center;
	display: -webkit-box;
	display: -moz-box;
	display: -ms-flexbox;
	display: -webkit-flex;
	display: flex;
	-webkit-justify-content: center;
	justify-content: center;
	-webkit-align-items: center;
	align-items: center;
	padding: 60px;
}

.form-content .form-items {
	border: 3px solid #fff;
	padding: 40px;
	display: inline-block;
	width: 100%;
	min-width: 540px;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	text-align: left;
	-webkit-transition: all 0.4s ease;
	transition: all 0.4s ease;
}

.form-content h3 {
	color: #fff;
	text-align: left;
	font-size: 28px;
	font-weight: 600;
	margin-bottom: 5px;
}

.form-content h3.form-title {
	margin-bottom: 30px;
}

.form-content p {
	color: #fff;
	text-align: left;
	font-size: 17px;
	font-weight: 300;
	line-height: 20px;
	margin-bottom: 30px;
}

.form-content label, .was-validated .form-check-input:invalid ~.form-check-label,
	.was-validated .form-check-input:valid ~.form-check-label {
	color: #fff;
}

.form-content input[type=text], .form-content input[type=password],
	.form-content input[type=email], .form-content select {
	width: 100%;
	padding: 9px 20px;
	text-align: left;
	border: 0;
	outline: 0;
	border-radius: 6px;
	background-color: #fff;
	font-size: 15px;
	font-weight: 300;
	color: #8D8D8D;
	-webkit-transition: all 0.3s ease;
	transition: all 0.3s ease;
	margin-top: 16px;
}

.btn-primary {
	background-color: #6C757D;
	outline: none;
	border: 0px;
	box-shadow: none;
}

.btn-primary:hover, .btn-primary:focus, .btn-primary:active {
	background-color: #495056;
	outline: none !important;
	border: none !important;
	box-shadow: none;
}

.form-content textarea {
	position: static !important;
	width: 100%;
	padding: 8px 20px;
	border-radius: 6px;
	text-align: left;
	background-color: #fff;
	border: 0;
	font-size: 15px;
	font-weight: 300;
	color: #8D8D8D;
	outline: none;
	resize: none;
	height: 120px;
	-webkit-transition: none;
	transition: none;
	margin-bottom: 14px;
}

.form-content textarea:hover, .form-content textarea:focus {
	border: 0;
	background-color: #ebeff8;
	color: #8D8D8D;
}

.mv-up {
	margin-top: -9px !important;
	margin-bottom: 8px !important;
}

.invalid-feedback {
	color: #ff606e;
}

.valid-feedback {
	color: #2acc80;
}

.jumbotron.member-jumbo {
	margin-bottom: -2rem !important;
	padding: 2rem 3rem !important;
}
</style>
<script>
	$(function() {
		//핸드폰 번호 인증 
		var code2 = "";
		var emailRegex = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		var email = $("#mb_email");

		/* 핸드폰 인증번호 발송 start */
		$("#phoneChk").click(
				function() {
					alert("인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오.");
					var phone = $("#mb_phone").val();

					$.ajax({
						type : "GET",
						url : "phoneCheck?mb_phone=" + phone,
						cache : false,
						success : function(data) {
							if (data == "error") {
								alert("휴대폰 번호가 올바르지 않습니다.")
								$(".successPhoneChk").text("유효한 번호를 입력해주세요.");
								$(".successPhoneChk").css("color", "red");
								$("#mb_phone").attr("autofocus", true);
							} else {
								$("#phone2").attr("disabled", false);
								$("#phoneChk2").css("display", "inline-block");
								$(".successPhoneChk").text(
										"인증번호를 입력한 뒤 본인인증을 눌러주십시오.");
								$(".successPhoneChk").css("color", "green");
								$("#mb_phone").attr("readonly", true);
								code2 = data;
							}
						}
					});
				});
		/* 핸드폰 인증번호 발송 end */

		/* 핸드폰 인증번호 일치 여부 start */
		$("#phoneChk2").click(function() {
			if ($("#phone2").val() == code2) {
				$(".successPhoneChk").text("인증번호가 일치합니다.");
				$(".successPhoneChk").css("color", "green");
				$("#phoneDoubleChk").val("true");
				$("#phone2").attr("disabled", true);
			} else {
				$(".successPhoneChk").text("인증번호가 일치하지 않습니다. 확인해주시기 바랍니다.");
				$(".successPhoneChk").css("color", "red");
				$("#phoneDoubleChk").val("false");
				$(this).attr("autofocus", true);
			}
		});
		/* 핸드폰 인증번호 일치 여부 end */

		/* 이메일 인증 발송 start */
		$("#sendMail").on("click", function() {
			if (email == "") {
				alert("이메일을 입력하지 않았습니다.");
			} else {
				if (!(emailRegex.test(email.val()))) {
					alert("이메일 입력이 제대로 되지 않았습니다.");
					return false;
				}
				$.ajax({
					type : 'POST',
					url : 'email_Send',
					data : {
						email : email.val()
					},
					success : function(data) {
						console.log(data);
						if (data == 'ok') {
							alert("인증번호를 발송했습니다.");
							$("#emailCheck").removeAttr("disabled");
						} else {
							alert("인증번호가 발송되지 않았습니다.");
						}
					},
					error : function(request, status, error) {
						console.log(data);
						console.log(request, status, error);
						alert("오류가 발생했습니다.");

					}
				});
			}
		});
		/* 이메일 인증 발송 end */

	});
	/* 이메일 인증번호 일치 여부 start */
	function qweemailCheck() {
		var emailCheck = $("#emailCheck").val();
		if (emailCheck == "") {
			alert("인증번호를 입력하지 않았습니다.");
		} else {
			$.ajax({
				type : 'POST',
				url : 'email_Check',
				data : {
					emailCheck : emailCheck
				},
				success : function(data) {
					if (data == true) {
						alert("인증되었습니다.");
					} else {
						alert("인증번호가 일치하지 않습니다.");
					}
				},
				error : function(request, status) {
					alert("오류가 발생했습니다.");
				}
			});
		}
	}
	/* 이메일 인증번호 일치 여부 start */
</script>
</head>
<body>
	<!-- 	<div class="jumbotron member-jumbo">
		<h1>멤버등록</h1>
	</div> -->
	<div class="container">
		<div class="form-body">
			<div class="row">
				<div class="form-holder">
					<div class="form-content">
						<div class="form-items">
							<h3>회원가입</h3>
							<p>정보입력</p>
							<form class="requires-validation" action="insertMember"
								method="post">
								<div class="col-md-12">
									<input type="text" class="form-control" name="mb_id"
										placeholder="아이디" required>
									<div class="valid-feedback">유효한아이디입니다.</div>
									<div class="invalid-feedback">공백없이 입력해주세요</div>

								</div>
								<div class="col-md-12">
									<input type="password" class="form-control" name="mb_pw"
										placeholder="패스워드" required>
									<div class="valid-feedback">사용할 수 있는 패스워드입니다.</div>
									<div class="invalid-feedback">패스워드가 적합히 입력해주세요</div>

								</div>
								
									<div class="col-md-12">
									<input type="text" class="form-control" name="mb_name"
										placeholder="이름" required>
<!-- 									<div class="valid-feedback">사용할 수 있는 패스워드입니다.</div>
									<div class="invalid-feedback">패스워드가 적합히 입력해주세요</div>
 -->
								</div>
								<div class="col-md-12">
									<tr class="mobileNo">
										<th><label for="phone">휴대폰 번호</label></th>
										<td>
											<p>
												<input id="mb_phone" type="text" name="mb_phone"
													title="전화번호 입력" required />
												<button type="button" id="phoneChk"
													class="btn btn-dark doubleChk">인증번호 보내기</button>
												<br /> <input id="phone2" type="text" name="phone2"
													title="인증번호 입력" disabled required />
												<button type="button" id="phoneChk2"
													class="btn btn-dark doubleChk">인증확인</button>
												<span class="point successPhoneChk">휴대폰 번호 입력후 인증번호
													보내기를 해주십시오.</span> <input type="hidden" id="phoneDoubleChk" />
											</p>
										</td>
									</tr>
								</div>
								<div class="col-md-12">
									<div id="menu-text">E-mail 인증</div>
									<input id="mb_email" class="text_box" type="text"
										name="mb_email" placeholder="이메일 입력" required autofocus>
									<button type="button" id="sendMail"
										class="btn btn-primary btn-sm">발송하기</button>
									<div class="text_box" id="cert">
										<input id='emailCheck' class='text_box' type='text' required
											disabled>
										<button type="button" id='check' class='btn btn-primary btn-sm'
											onclick='qweemailCheck(); return false;' >인증확인</button>
									</div>
								</div>

								<div class="mx-auto" id="footer">
									<button id="conRegister" type="submit" class="btn btn-dark">회원가입</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
</body>
</html>