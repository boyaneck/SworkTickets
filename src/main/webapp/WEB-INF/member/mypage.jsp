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
//    $("#btn1").click(function() {
//       alert("수정하시겠습니까?")
//    }
   
   function validate() {
      var mb_pw = document.getElementById("pw").value;
      var mb_pw2 = document.getElementById("pw2").value;
      var mb_phone = document.getElementById("mb_phone").value;
      if(mb_pw != mb_pw2) {
            alert("비밀번호가 다릅니다.");
             return false;
      } 

      if(!phone_chk(mb_phone)){
            alert("번호를 형식에 맞게 입력하세요");
            return false;
          } else {
             if(document.form.mb_phone.value.length < document.form.mb_phone.minLength){
                alert("번호를 형식에 맞게 입력하세요 제발");
                return false;
             }
          }
      }
      
      
   function quitMember(mb_id) {
      if(confirm('정말 탈퇴하시겠습니까?')){
      if (mb_id != null) {
         location.href = "deleteMember?mb_id=" + mb_id;
      } else {
      }
      } else{
         location.href= "mypage";
      }
   }
   
   function editMember(mb_id) {
// 	   let mb_name = document.getElementById('mb_name').value;
// 	   let mb_pw = document.getElementById('pw').value;
// 	   debugger;
         if(confirm('정말 수정하시겠습니까?')){
            location.href = "updateMember?mb_id=" + mb_id;
         } else{
            location.href= "mypage";
         }
      }
   
   function numberMaxLength(e){
       if(e.value.length > e.maxLength){
           e.value = e.value.slice(0, e.maxLength);
       }
   }
   
   function email_chk(obj){
       var regex=/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
       return (regex.test(obj));
   }
   
   function phone_chk(obj){
       var regex=/^01([0|1|6|7|8|9])?([0-9]{3,4})?([0-9]{4})$/i;
       return (regex.test(obj));
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
@media (max-width: 768px) {
.container{
width:100% !important;
margin:0;

}
}

</style>
</head>
<body class="d-flex flex-column min-vh-100">
<%    
response.setHeader("Cache-Control","no-store");    
response.setHeader("Pragma","no-cache");    
response.setDateHeader("Expires",0);    
if (request.getProtocol().equals("HTTP/1.1"))  
        response.setHeader("Cache-Control", "no-cache");  
%>
   <div class="container"
   style="width: 40%; padding: 30px;">
      <h2 style="text-align: center; font-weight: bolder; padding: 30px 0;">마이페이지</h2>
      <hr>
   
      <form name="form" action="updateMember" method="post" onsubmit="return validate()">
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
              <input type="password" class="form-control" name="mb_pw" id="pw"  maxlength="20">
         </div>

         <div class="mb-3" style="width:100%;">
            <label for="pw2">*비밀번호 확인</label>
              <input type="password" class="form-control" name="mb_pw2" id="pw2"  maxlength="20" minlength="8"> 
               <span><font id="checkPw"  size="2">비밀번호는 4~8글자입니다</font></span>
         </div>

         <div class="input-group mb-3">
            <div class="input-group-prepend">
               <span class="input-group-text">이름</span>
            </div>
            <input type="text" class="form-control innm" id="mb_name" name="mb_name" maxlength="5" minlength="2" 
               value="${member.mb_name}" <%=sts %> required>
         </div>

         <div class="input-group mb-3">
            <div class="input-group-prepend">
               <span class="input-group-text">핸드폰번호</span>
            </div>
            <input type="number" class="form-control innm" name="mb_phone" id="mb_phone" maxlength="11" minlength="10"
               oninput="numberMaxLength(this);" value="${member.mb_phone}" <%=sts %>  required >
         </div>

         <div class="input-group mb-3">
            <div class="input-group-prepend">
               <span class="input-group-text">이메일</span>
            </div>
            <input type="email" class="form-control innm" name="mb_email" id="mb_email" maxlength="50"
               value="${member.mb_email}" <%=sts %> required>
         </div>
         <div id="footer">
         <div class="container text-center" >
            <button type="submit" class="btn1" name="btn1" onclick="editMember(`${member.mb_id}`)"<%=sts%>>회원정보수정</button>
            <button id="conDel" type="button" class="btn2"
                onclick="quitMember(`${member.mb_id}`)">회원탈퇴</button>
         </div>
         </div>
   </div>
      </form>
</div>
<%@ include file="../../footer.jsp"%>
</body>
</html>