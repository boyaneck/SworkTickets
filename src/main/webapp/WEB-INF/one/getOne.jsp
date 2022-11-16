<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<%

String sts = "";
if (session.getAttribute("mb_Id") == null) {
	sts = "disabled";
}
%>
<script>
function deleteone(val,mal){
	
	console.log("22222222"+val);
	console.log("333333333"+mal);
	
	
	if(`${mb_Id}` == mal){
		  var delConfirm = confirm('정말 삭제하시겠습니까?');
		    if (delConfirm == true) {
		        alert('삭제되었습니다.');
		        location.href ="deleteOne?one_no="+val+"&one_writer="+mal;
		    }
		    else {
		        alert('삭제가 취소되었습니다.');
		    }
		
	}
	else alert("작성자만 글을 삭제 할 수 있습니다.");
    }
    
    
    function answer(val){ 
    		
    	console.log(val);
    	
		$("#oneanswer").hide();
    	$(".answer").show();
    	$(".didanswer").hide();
  
    	console.log("답글달기 콘솔");	
    		
     }
  
   
    $(document).ready(function (){
    	
   
    function answer_update( ){
    	$(".didanswer").show();
    	
    }
    });
   	
    	
//      else alert("관리자만 답변이 가능합니다.");
    

    function f_write(val){
        console.log(val);
        console.log("이게 되면안됨");
        if(val == ''){
            alert("로그인이 되야 작성 가능합니다");
            location.href="/getOne";
        }else{
            location.href="/goWrite";
        }
    }
    
    $(document).ready(function tt(){
    	
    if($(".a_content").val() != ''){
    	$("#answered").show();
    	$(".ttt").show();
    	
    }
    else document.getElementById("answered").innerHTML="등록된 댓글이 없습니다.";
    	
    
    
    
    if(`${mb_Id}` != 'admin'){
    	
    console.log("mbid!!!!"+`${mb_Id}`);
    $("#oneanswer").hide();
    }
    
    });
  
    
    
    
</script>
<style>



textarea {
			
			width: 100%;
			height: 200px;
			padding: 10px;
			box-sizing: border-box;
			border: solid 2px #1E90FF;
			border-radius: 5px;
			font-size: 16px;
			resize: both;
		}
 .one_answer {
	margin-top:30px;
 
}

a{
text-decoration:none;
}

 a:hover{
 color:white !important;
 text-decoration:none;
}
.btn-success:hover {
    background-color: #7832f7 !important;
    color: #fff !important;
    }
    
 .t{
 color:#7832f7 !important;
 border:1px solid #7832f7 !important;
 }
.btn btn-success:hover{
background-color:#7832f7 !important;
color:white !important;
/* cursor:pointer; */
}    

</style>

<body>
	<div class="jumbotron">
		<h1>상세 보기</h1>
	</div>
	<%-- <%@ include file="../../menu.jsp" %>   --%>
	<div class="container-fluid">
		<%
		if (request.getParameter("error") != null) {
			out.println("<div class='alert alert-danger'>");
			out.println("해당 글은 작성자만이 수정할 수 있습니다.");
			out.println("</div>");
		}
		%>
		<form name="update" action="updateOne" method="post">
			<input type="hidden" name="one_no" value="${one.one_no}">
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text" style="padding-left:19.5px; padding-right:19.5px">제목</span>
				</div>
				<input type="text" class="form-control innm" name="one_title"
					value="${one.one_title}"  style="background-color:white !important;">
			</div>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">작성자</span>
				</div>
				<input type="text" class="form-control innm" name="one_writer"
					value="${one.one_writer}" readonly <%=sts %> style="background-color:white !important;">
			</div>
			<div class="input-group mb-3">
				<div class="input-group-prepend" >
					<span class="input-group-text" style="padding-left:19.5px; padding-right:19.5px;">내용</span>
				</div>
				<textarea class="form-control innm" rows="10" cols="10" id="one_comment"
					name="one_content" <%=sts%> style="background-color:white !important;">${one.one_content}</textarea>
			</div>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">등록일</span>
					<span class="input-group-text" style="background-color:white !important;"><fmt:formatDate value="${one.one_date}" pattern="yyyy-MM-dd HH:mm-ss" var="today" />${today} </span>
				</div>
				<%--       <input type="text" class="form-control innm" name="regDate" value="${one.regdate}" readonly <%=sts %>>       --%>
			</div>
			
			
					
					

			
			<div id="btnBox_parent">
            <button class="btn btn-success t" type="submit" <%=sts%> style="float:left; margin-left:550px; ">글수정</button>
			</div>
			
			</form>
            <button class="btn btn-success t" onclick="deleteone(${one.one_no},`${one.one_writer}`)" style=" float:left; margin-left:5px;" <%=sts%> >글삭제</button>
			
			
            <a href="getOneList"  style="color:#7832f7 !important; "><button class="btn btn-success t" style="margin-left:5px;"<%=sts%>>글목록</button></a>
			<a href="write.jsp" style="color:#7832f7 !important; "><button class="btn btn-success t" onclick="f_write('${mb_Id}')" >글쓰기</button></a>
			
			<!-- 					1:1문의 답변 -->
					<div style="display:none" class="answer"> 
					<form action="/oneAnswer">
					<div><input type='hidden' name='one_no' value='${one.one_no}'></div>
					<div class="regBtn"><textarea name='one_answer' class="one_answer" cols="70" rows="4">${one.one_answer}</textarea></div>
					<div class="regBtn" style="text-align:center; margin: 20px;">
					<button class="btn btn-success"  style="cursor: pointer">답변하기</button>
				
					</div>
					</form>
					</div>
				<div class="regBtn" style="text-align:right; margin: 20px;">
			<button class="btn btn-success"  id="oneanswer" onclick="answer(${one.one_no})">답변달기</button>
		</div>
			
			<!-- 		답변한것 보여주기 -->
			
			<div class="didanswer">
								
			<div class="regBtn ttt" style="text-align:center; margin-top: 20px; margin-bottom:20px; display:none; ">답변<i class = "xi-kakaotalk" style="padding-top:px; font-size: 26px; " ></i> </div>	
			
				
	<div class="input-group mb-3 " id="answered"style="display:none; style="margin-left:20px;">
				<div class="input-group-prepend">
					<span class="input-group-text" >답변 내용</span>
				</div>
				<textarea class="form-control innm a_content" rows="10" cols="10" id="one_comment"
					name="one_content" readonly style="background-color:white !important; " >${one.one_answer}</textarea>
			</div>



		

</body>
</html>
