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
input[type="text" i] {
    padding: 0px;
}

input[type="text"] {
    box-sizing: border-box;
    height: 31px;
    vertical-align: bottom;
    margin-top: 10px;
}

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
				$("#findIdform").attr("action", "findIdform?find=email");
				$('#findIdform').submit();
				$('#fluid-height').css("display", "none");
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
 
</script>
</head>
<body>
	<form action="" method="post" id="findIdform">
		<input type="hidden" name="mb_email" id="mb_email">
	</form>
	
	
	<div class="container-fluid" id="fluid-height" style="padding:0 ">
      <div id="center" class="container container-box">
         <div class="g_box" >
            <div id="menu-text">E-mail 인증</div>
			<input id="email" name="email" class="text_box" type="text" placeholder="이메일 입력" required autofocus>
			<button id="sendMail" class="btn btn-primary btn-sm">발송하기</button>
			<div class="text_box" id="cert">
				<input id='emailCheck' class='text_box' type='text' required disabled>
				<button id='check' class='btn btn-primary btn-sm' onclick='emailCheck()'>인증확인</button>
          	</div>
         </div>
      </div>
   </div>
    <%if(request.getAttribute("mb_Id")!=null){ %>
    <input type="text" name="mb_id" id="mb_id" value="${mb_Id}">
	<%} %>
</body>
</html>