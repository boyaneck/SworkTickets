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
      console.log(mb_id);
      /* var mb_id = mb_id.val(); */
      
      if (mb_id != null) {
         console.log("if문 입니다.");
         location.href = "deleteMember?mb_id="+mb_id;
      } else {
         console.log("else문입니다.");
      }
   }
</script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   마이페이지입니다
   <div class="input-group mb-3">
      <form name="form" action="updateMember" method="post">
         <input type="hidden" name="mb_no" value="${member.mb_no}">
         <div class="input-group mb-3">
            <div class="input-group-prepend">
               <span class="input-group-text">아이디</span>
            </div>
            <input type="text" class="form-control innm" name="mb_id" value="${member.mb_id}" readonly="readonly" >
         </div>
            <div class="mb-3">
                  <label for="pw">*비밀번호</label> <input type="password"
                     class="form-control" name="mb_pw" id="pw" value="${member.mb_pw}" minlength="4" maxlength="8" readonly
                     >
               </div>

               <div class="mb-3">
                  <label for="pw2">*비밀번호 확인</label> <input type="password"
                     class="form-control" name="mb_pw" id="pw2" value="${member.mb_pw}" minlength="4" maxlength="8" readonly
                     >
                     <font id="checkPw" size="2">비밀번호는 4~8글자입니다</font>
               </div>
         
            <div class="input-group mb-3">
            <div class="input-group-prepend">
               <span class="input-group-text">이름</span>
            </div>
            <input type="text" class="form-control innm" name="mb_name" value="${member.mb_name}" <%=sts %>>
         </div>

         <div class="input-group mb-3">
            <div class="input-group-prepend">
               <span class="input-group-text">핸드폰번호</span>
            </div>
            <input type="text" class="form-control innm" name="mb_phone" value="${member.mb_phone}" <%=sts %>>
         </div>

         <div class="input-group mb-3">
            <div class="input-group-prepend">
               <span class="input-group-text">이메일</span>
            </div>
            <input type="text" class="form-control innm" name="mb_email" value="${member.mb_email}" <%=sts %>>
         </div>
         <%--           <div class="input-group mb-3">
      <div class="input-group-prepend">
        <span class="input-group-text">작성자</span>
      </div>
      <input type="text" class="form-control innm" name="writer" value="${board.writer}" readonly <%=sts %>>      
      <input type="text" class="form-control innm" value="${board.writer}" readonly <%=sts %>>      
    </div>
    <div class="input-group mb-3">
      <div class="input-group-prepend">
        <span class="input-group-text">내용</span>
      </div>
      <textarea class="form-control innm" rows="10" id="comment" name="content" <%=sts %>>${board.content}</textarea>      
    </div>   --%>
         <div id="footer">
            <button type="submit" class="btn btn-primary" <%=sts%>>회원정보수정</button>
            <%-- <button id="conWrite" type="button" class="btn btn-primary" <%=sts %>>글쓰기</button> --%>
            <button id="conDel" type="button" class="btn btn-primary" onclick="quitMember(`${member.mb_id}`)" >회원탈퇴</button>
            <!-- <button id="conList" type="button" class="btn btn-primary">글목록</button> -->
         </div>
      </form>
   </div>

</body>
</html>