<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
.row{align: left;}
#sendMail, #check, #change{
width: 90%;
	height: calc(1.5em + 0.75rem + 2px);
	color:#7329f7; 
	background-color:white; 
	border-color:#7329f7; 
	border: solid 1px;
	align: left !important;
	margin-left:0;
}
input[type="text"]{
    width: 400px;
	height: calc(1.5em + 0.75rem + 2px);
	align: left !important;
	margin-right:0;
}
input[type="password"]{
    width: 400px;
	height: calc(1.5em + 0.75rem + 2px);
	align: left !important;
	margin-right:0;
}
input[type="hidden"]{
    width: 400px;
	height: calc(1.5em + 0.75rem + 2px);
	align: left !important;
	margin-right:0;
}
h2{margin-top: 30px; 
    width: 100%;
    margin: 50px 0;
    padding-right: 380px;
}
.col-3{text-align: right;}
</style>
<script>
$(function() {
    var emailRegex = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
    var email = $("#email");
    $("#sendMail").on( "click", function() {
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
              data : {email : email.val()},
              success : function(data) {
            	  if(data=='ok'){
            		  alert("인증번호를 발송했습니다.");
            		  $("#emailCheck").removeAttr("disabled");
            	  }else{
            		  alert("인증번호가 발송되지 않았습니다.");
            	  }
              },
              error : function(request, status) {
                 alert("오류가 발생했습니다.");
              }
           });
        }
     });
 });
 
 function emailCheck() {
    var emailCheck = $("#emailCheck").val();
    if (emailCheck == "") {
       alert("인증번호를 입력하지 않았습니다.");
    } else {
       $.ajax({
          type : 'POST',
          url : 'email_Check',
          data : { emailCheck : emailCheck},
          success : function(data) {
             if (data == true) {
                alert("인증되었습니다.");
                $('#mb_email').val($("#email").val());
				$("#findPwform").attr("action", "findPwform?find=email");
				$('#findPwform').submit();
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
 
	//비밀번호 재확인
	$(function() {
		$('#mb_pw2').focusout(function() {
			console.log($('#mb_pw2').val());
			if ($('#mb_pw2').val() != $('#mb_pw').val()) {
				alert("비밀번호를 재확인 해주세요");
			} else {
				passwordCheck = true;
			}
		});

	});
	function changePW(){
		console.log("aa");
		if(passwordCheck){
			$('#pwchange').submit();
			alert("변경이 완료되었습니다.")
		}
	}
	

	
</script>
<%@ include file="../../header.jsp"%>
</head>
<body>
<div style="background-color:lightgray; height:100vh">
<form action="" method="post" id="findPwform">
		<input type="hidden" name="mb_email" id="mb_email">
	</form>
	
<h2 style="text-align:center; font-weight:bolder;padding:50px">비밀번호 찾기</h2>

	<div class="container-fluid" id="fluid-height"
		style="text-align: -webkit-center; background-color: white; width: 50%">
		<div class="row">
				<h3 style="margin:50px 0; margin-left: 10%;">
					&nbsp;&nbsp;&nbsp;&nbsp;E-mail 인증
				</h3>
			<br>
		</div>

		<div class="row">
			<div class="col-3">
				<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이메일</b>
			</div>
			
			<div class="col-6">
				<input id="email" name="email" class="text_box" type="text" placeholder="이메일 입력" required autofocus></div>
					<div class="col-3"><button id="sendMail" >발송하기</button> </div>
		</div><br>
		
		<div class="row">
			<div class="col-3">
				<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;인증번호</b>
			</div>
			<div class="col-6" style="margin-bottom:50px;">
				<input id='emailCheck' class='text_box' type='text' required disabled></div>
				<div class="col-3"><button id='check' onclick='emailCheck()'>인증확인</button>
			</div>
		</div>
		
<!-- 		인증번호확인 -->
		 <%if(request.getAttribute("mb_Id")!=null){ %>
		<div class="row">
			<div class="col-3">
				<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;비밀번호</b>
			</div>
			<div class="col-6" style="margin-bottom:50px;">
		<form action="change" id="pwchange" method="post">
		<input type="hidden" name="mb_id" id="mb_id" value="${mb_Id}">
		<input type="password" name="mb_pw" id="mb_pw" placeholder='비밀번호' required><br>
		<input type="password" name="mb_pw2" id="mb_pw2" placeholder='비밀번호재확인' required><br></div>
		<div class="col-3"><button type="button" id="change" onclick="changePW()">변경하기</button></div>
		</form>
		<%} %>
	</div>
	</div>
	</div>
</body>
</html>