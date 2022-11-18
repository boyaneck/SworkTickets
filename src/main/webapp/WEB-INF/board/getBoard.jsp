<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>

.btn-success:hover {
    background-color: #7832f7 !important;
    color: white;
</style>
</head>
<body>
	<%
	String sts = "";
	String ro = "";
	if (session.getAttribute("mb_id")==null ||!session.getAttribute("mb_Id").equals("admin")) {
		sts = "disabled";
		ro= "readonly";
	}
	%>
	<script>
function deleteboard(val){
    var delConfirm = confirm('정말 삭제하시겠습니까?');
    if (delConfirm == true) {
        alert('삭제되었습니다.');
        location.href ="deleteBoard?noti_no="+ val;
    }
    else {
        alert('삭제가 취소되었습니다.');
    }
    }
    
    
    


</script>
<body class="d-flex flex-column min-vh-100">
<%    
response.setHeader("Cache-Control","no-store");    
response.setHeader("Pragma","no-cache");    
response.setDateHeader("Expires",0);    
if (request.getProtocol().equals("HTTP/1.1"))  
        response.setHeader("Cache-Control", "no-cache");  
%>
	<div class="board">
		<h1>상세 보기</h1>
	</div>
	<%-- <%@ include file="../../menu.jsp" %>   --%>
	<div class="container-fluid" style="margin-bottom:60px;">

		<form name="update" action="updateBoard" method="post">
		
		
			<input type="hidden" name="noti_no" value="${board.noti_no}">
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">제목</span>
				</div>
				<input type="text" class="form-control innm" name="noti_title"
					maxlength="40" value="${board.noti_title}"  <%=ro %> style="background-color:white !important;">
			</div>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">작성자</span>
				</div>
				<input type="text" class="form-control innm" name="noti_writer"
					value="${board.noti_writer}" readonly  style="background-color:white !important;">
			</div>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text"> 내용</span>
				</div>

				<textarea class="form-control innm" rows="20" cols="10" id="board_comment"
					name="noti_content" <%=ro %>  style="background-color:white !important; resize: none;">${board.noti_content}</textarea>

			</div>

			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text" >등록일</span> <span
						class="input-group-text" style="background-color:white !important;"><fmt:formatDate
							value="${board.noti_date}" pattern="yyyy-MM-dd HH:mm-ss"
							var="today"  />${today} </span>
				</div>
				<%--       <input type="text" class="form-control innm" name="regDate" value="${one.regdate}" readonly <%=sts %>>       --%>
			</div>
			<div class="input-group mb-3">

				<%--       <input type="text" class="form-control innm" name="cnt" value="${one.cnt}" readonly <%=sts %>>       --%>
			</div>
					<div id="btnBox_parent">
					<button class="btn btn-success"  href="getBoardList" >글목록</button>
			<c:choose>
				<c:when test="${mb_Id eq 'admin' }">
						<button class="btn btn-success" type="submit"  >글수정</button>
						<button class="btn btn-success" class="btn btn-delete" onclick="deleteboard(${board.noti_no})" style="cursor: pointer">글삭제</button>
				</c:when>
				<c:otherwise></c:otherwise>
			</c:choose>
						
					</div>
		</form>

		<form action="deleteboard">
			<input type="hidden" name="noti_no" value="${board.noti_no}">
		</form>

	</div>
	
	<%@ include file="../../footer.jsp"%>
</body>
</html>