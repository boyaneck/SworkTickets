<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"	%>
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
  
    
    $(document).ready(function aa() {
    	if(${one.one_secret} == true){
    		$("#box").prop("checked",true);
    		
    	}
    	else {
    		
    		
    	}
    	
//    	if($("#box").prop("checked",true)){
   	
//    		 $("#box").prop("checked",false);
   		
//    	} else{}
   	
    });
    	
    
</script>
<style>

input[id="box"]{
 display:none;
}

input[id="box"] + label em {
display:inline-block;
width:25px;
height:25px;
margin-right:5px;
background:url(images/bg_chkbox.gif) 0 0 no-repeat;
vertical-align:middle;
}

input[id="box"]:checked + label em{
background-position:-38px 0;

}

.btn-success.disabled, .btn-success:disabled
{
 color:#7832f7 !important;
}
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
/*  color:white !important; */
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
		

<div class="input-group mb-3">
            <div class="input-group-prepend"> 
<%-- 			<input id="box" type="checkbox" name="one_secret" id="box" style="margin-top:50px;" <c:if test="${one.one_secret == true}">checked</c:if>> --%>
			<input id="box" type="checkbox" name="one_secret" onclick="secretChk()" id="box" style="margin-top:50px;">
			<label for="box" style="margin-top:50px;"><em></em>비밀글 설정</label>
            </div>
            </div>
            
         
        
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
			
			<a href="getOneList"  style="color:#7832f7 !important;">
            <button type="button" class="btn btn-success t"  onclick="location.href='getOneList';">글목록</button></a>
			
			
		<c:if test="${one.one_writer eq mb_Id or admin}">			
            <button class="btn btn-success t" <%=sts%>>글수정</button>
            <button  type="button" class="btn btn-success t" onclick="deleteone(${one.one_no},`${one.one_writer}`)"  <%=sts%> >글삭제</button>

		</c:if>
		<script>
		function secretChk(){
			if ($("#box").is(":checked")){
				$("#box").val(true);
			}else{
				$("#box").val(false);
			}
		}
		
		</script>
            
			
			</div>
			</form>
			</div>
			<!-- 					1:1문의 답변 -->
			<div class="container-fluid">
					<div style="display:none" class="answer"> 
					<form action="/oneAnswer">
					<div><input type='hidden' name='one_no' value='${one.one_no}'></div>
					<div class="regBtn">
					<textarea name='one_answer' class="one_answer" cols="" rows="4" style="resize: none;" >${one.one_answer}</textarea></div>
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
				<textarea class=" form-control innm a_content" rows="15" cols="10" id="one_comment" 
					name="one_content" readonly style="background-color:white !important; resize: none;" >${one.one_answer}</textarea>
				</div>
			</div>

</div>
</div>
<%@ include file="../../footer.jsp" %>
</body>
</html>
