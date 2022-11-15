<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<%@ include file="../../header.jsp"%>

<style>
.row {
   align: left;
}



input[type="text"] {
   width: 100%;
   height: calc(1.5em + 0.75rem + 2px);
   align: left !important;
   margin-right: 0;
}

h2 {
/*    margin-top: 30px; */
   width: 100%;
/*    margin: 50px 0; */
   padding-right: 380px;
}

.col-3 {
   text-align: right;
}

#send {
   text-align: left!important;
}

@media (max-width: 768px){
   #sendMail, #check{
   width: 100px !important;
   align: left !important;
   }
}
@media (max-width: 768px){
#fluid-height{
   text-align: center !important;
   width: 100% !important;
   margin: 0 0 !important;
   }
}

@media (max-width: 768px){
.row{
   padding: 0 30px !important;
   }
}
</style>
<script>
   $(function() {
      var emailRegex = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
      $("#sendMail").on("click", function() {
      var email = $("#email").val();
         if (email == 0) {
            alert("이메일을 입력하세요.");
         } else {
            if (!(emailRegex.test(email))) {
               alert("이메일 형식이 맞지 않습니다.");
               return false;
            }
            $.ajax({
               type : 'POST',
               url : 'email_Send',
               data : {
                  email : $("#email").val()
               },
               success : function(data) {
                  if (data == 'ok') {
                     alert("인증번호를 발송했습니다.");
                     $("#emailCheck").removeAttr("disabled");
                  } else {
                     alert("존재하지 않는 이메일입니다");
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
            data : {
               emailCheck : emailCheck
            },
            success : function(data) {
               if (data == true) {
                  alert("인증되었습니다.");
                  $('#mb_email').val($("#email").val());
                  $("#findIdform")
                        .attr("action", "findIdform?find=email");
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
   
   <div style="background-color: #f6f5f5; height: 100vh; padding-top: 50px;">
      <form action="" method="post" id="findIdform" style="display: none;">
         <input type="hidden" name="mb_email" id="mb_email">
      </form>
      <h2 style = "background-color: #f6f5f5;  font-size: 30px; padding:0; margin-bottom: 40px; text-align: center;">아이디찾기</h2>

      <div class="container-fluid" id="fluid-height" style="text-align: -webkit-center; background-color: white; padding: 0; width: 700px;">
         <div class="row">
            <h3 style="margin: 50px 0; margin-left: 5%; font-size:20px;">
               &nbsp;&nbsp;&nbsp;&nbsp;E-mail 인증</h3>
            <br>
         </div>

         <div class="row">
            <div class="col-3" style="width:30px;">
               <b style="margin:0px; font-size:16px; font-weight:400;">이메일</b>
            </div>

            <div class="col-6">
               <input style="font-size:16px;" id="email" name="mb_email" class="text_box" type="text" placeholder="이메일 입력" required autofocus>
            </div>
            <div class="col-3" id="send">
               <button class="btn-purple" id="sendMail">발송하기</button>
            </div>
         </div>
         <br>

         <div class="row">
            <div class="col-3" style="padding-left:0px;">
               <b style="margin:0px; font-size:16px; font-weight:400; width:70px;">인증번호</b>
            </div>
            <div class="col-6" id="id2" style="margin-bottom: 50px;">
               <input style="font-size:16px;" id='emailCheck' class='text_box' type='text' required disabled>
            </div>
            <div class="col-3" id="send">
               <button class="btn-purple" id='check' onclick='emailCheck()'>인증확인</button>
            </div>
         </div>

         <!--       인증번호확인 -->
         <%
         if (request.getAttribute("mb_Id1") != null) {
         %>
         <div class="row">
            <div class="col-4">
               <b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;아이디</b>
            </div>
            <div class="col-5" style="margin-bottom: 50px;">
               <input type="text" name="mb_id" id="mb_id" value="${mb_Id1}"
                  disabled>
                  <div class="col-3"></div>
               <%
               }
               %>
            </div>
         </div>
      </div>
   </div>
</body>
</html>