<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../../header.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<%

String sts = "";
if (session.getAttribute("mb_Id") == null) {
	sts = "disabled";
}
%>
<script>
function deleteone(val,mal){
	
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
    		
    	
		$("#oneanswer").hide();
    	$(".answer").show();
    	$(".didanswer").hide();
  
    		
     }
  
   
    $(document).ready(function (){
    	
   
    function answer_update( ){
    	$(".didanswer").show();
    	
    }
    });
   	
    	
//      else alert("관리자만 답변이 가능합니다.");
    

    function f_write(val){
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
}    

.btn-success{
margin:5px;
}

.span{
   width: 72px;
    }
    
 
.span2{
   width: 72px;
 	padding-left: 19px;
    }
    
    @media (max-width: 768px) {
  .fff {
	width:100%;
}


</style>
<body class="d-flex flex-column min-vh-100">
<div class="board" ><h1 >상세보기</h1></div>
		<%
		if (request.getParameter("error") != null) {
			out.println("<div class='alert alert-danger'>");
			out.println("해당 글은 작성자만이 수정할 수 있습니다.");
			out.println("</div>");
		}
		%>
	<div class="container-fluid">
		<form name="update" action="updateOne" method="post">
			<input type="hidden" name="one_no" value="${one.one_no}">
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="span2 input-group-text text-center" >제목</span>
				</div>
				<input type="text" class="form-control innm" name="one_title"
					value="${one.one_title}"  style="background-color:white !important;">
			</div>
			<div class="input-group mb-3">
				<div class="input-group-prepend text-center">
					<span class="span input-group-text">작성자</span>
				</div>
				<input type="text" class="form-control innm" name="one_writer"
					value="${one.one_writer}" readonly <%=sts %> style="background-color:white !important;">
			</div>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="span2 input-group-text" >내용</span>
				</div>
				<textarea class="form-control innm" rows="10" cols="10" id="one_comment" 
					name="one_content" <%=sts%> style="background-color:white !important; resize:none;">${one.one_content}</textarea>
			</div>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="span input-group-text">등록일</span>
				</div>
					<span class="input-group-text" style="background-color:white !important;"><fmt:formatDate value="${one.one_date}" pattern="yyyy-MM-dd HH:mm-ss" var="today" />${today} </span>
			</div>
			<div class="container" style="text-align: center;">
			
		<c:if test="${one.one_writer eq mb_Id}">			
            <button class="btn btn-success t" type="submit" <%=sts%>>글수정</button>
            <button  type="button" class="btn btn-success t" onclick="deleteone(${one.one_no},`${one.one_writer}`)"  <%=sts%> >글삭제</button>

		</c:if>
            <a href="getOneList"  style="color:#7832f7 !important;">
            <button type="button" class="btn btn-success t" <%=sts%>  onclick="location.href='getOneList';">글목록</button></a>
			
			</div>
			</form>
			</div>
			<!-- 					1:1문의 답변 -->
			<div class="container-fluid">
					<div style="display:none" class="answer"> 
					<form action="/oneAnswer">
					<div><input type='hidden' name='one_no' value='${one.one_no}'></div>
					<div class="regBtn">
					<textarea name='one_answer' class="one_answer" cols="70" rows="4" style="resize: none;" >${one.one_answer}</textarea></div>
					<div class="regBtn" style="text-align:center; margin: 20px;">
					<button class="btn btn-success"  style="cursor: pointer">답변하기</button>
					</div>
					</form>
					</div>
				<div class="regBtn" style="text-align:right; margin: 20px;">
					<button class="fff btn btn-success"  id="oneanswer" onclick="answer(${one.one_no})">답변달기</button>
				</div>
			
			<!-- 		답변한것 보여주기 -->
			
			<div class="didanswer">
								
			<div class="regBtn ttt" style="text-align:center; margin-top: 20px; margin-bottom:20px; display:none; ">답변<i class = "xi-kakaotalk" style="font-size: 26px; " ></i> </div>	
			
				

	<div class="input-group mb-3 " id="answered" style="display:none;">
			
				<div class="col" style="width: 100%;">
				<textarea class=" form-control innm a_content" rows="10" cols="70" id="one_comment" 
					name="one_content" readonly style="background-color:white !important; resize: none;" >${one.one_answer}</textarea>
				</div>
			</div>

</div>
</div>
<%@ include file="../../footer.jsp" %>
</body>
</html>
