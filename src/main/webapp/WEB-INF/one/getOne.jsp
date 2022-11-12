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



function list(){

	
	console.log("list 로 찍혀라 !!!!!OneList!!!!");
	location.href="/getOneList";
	
}

function f_write(val){
    console.log(val);
    if(val == ''){
        alert("로그인이 되야 작성 가능합니다");
        location.href="/getOneList";
    } else{
        location.href="/goWrite";
    }
}


// function f_del(){
	

	
//     var delConfirm = confirm('정말 삭제하시겠습니까?');
//     if (delConfirm == true) {
//         alert('삭제되었습니다.');
//         location.href ="/deleteOne?one_no="+ val;
//     }
//     else {
//         alert('삭제가 취소되었습니다.');
//     }

// }


 
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
   	
    	
    

    
</script>
<style>
#imgBox { 
display: none; 
position: absolute; 
top: 0; 
left: 0; 
height: 100vh !important; 
background-color: rgba(0, 0, 0, 0.5); 
z-index: 9999999; 
}

#imgContentBox { 
width: 600px; 
max-height: 550px; 
overflow: auto; 
position: absolute; 
top: 30%; 
left: 30%; 
border-radius: 5px; 
z-index: 9999999; 
} 

#imgBoxTitleBar { 
border-bottom: 1px solid #777; 
border-radius: 5px 5px 0 0; 
background-color: #ddd; 
width: 100%; 
padding: 10px; 
text-align: right; 
font-size: 20px; 
font-weight: bolder; 
} 

#imgBoxImg { 
width: 100%; 
border-radius: 0 0 5px 5px; 
} 

#closeX { 
padding: 5px 20px; 
border-radius: 5px; 
border: 1px solid #777; 
background-color: red; 
color: #fff; 
} 

#closeX:hover { 
background-color: #777; 
cursor: pointer; 
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

 a:hover{
 color:white !important;
 text-decoration:none;
}
.btn-success:hover{
    background-color: #7832f7 !important;
    color:white !important;
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
					<span class="input-group-text">제목</span>
				</div>
				<input type="text" class="form-control innm" name="one_title"
					value="${one.one_title}" <%=sts %>>
			</div>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">작성자</span>
				</div>
				<input type="text" class="form-control innm" name="one_writer"
					value="${one.one_writer}" readonly <%=sts %>>
			</div>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">내용</span>
				</div>
				<textarea class="form-control innm" rows="10" cols="10" id="one_comment"
					name="one_content" <%=sts%>>${one.one_content}</textarea>
			</div>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">파일</span>
				</div>
				<c:if test="${one.filename ne NULL}">
					<span style="cursor: pointer; padding: 0 20px;" onclick="seeImg()">[파일보기]</span>
					<script>
	        	function seeImg(){
	        		$("#imgBox").show();
	        	}
<!-- 	        </script> 
<%--    			<span style="cursor:pointer;" onclick="downloadFile('${one.filename}')">[파일다운]</span> --%>
					   			<script>
	   			function downloadFile(filename){
	   			    window.location ='download.do?filename='+filename;
	   			}
			</script>
				</c:if>
			</div>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">등록일</span>
					<span class="input-group-text"><fmt:formatDate value="${one.one_date}" pattern="yyyy-MM-dd HH:mm-ss" var="today" />${today} </span>
				</div>
			</div>
			
			 <button class="btn btn-success" type="submit"  style="float:left; margin-left:610px">글수정</button>
          </form>
          
             <button class="btn btn-success" onclick="list()" style="margin-left:7px;">글목록</button>
             <button class="btn btn-success" onclick="f_write('${mb_Id}')" style="text-align:center" >글쓰기</button>
       
			  <div id="btnBox_parent">
			  <form action="deleteOne">
			  <input type="hidden" name="one_no" value="${one.one_no}">
			  <input type="hidden" name="one_writer" value="${one.one_writer}">
      <button class="btn btn-delete"  onclick="f_del()"style="cursor: pointer; margin-top:50px; margin-left:10px">글삭제</button>
			  
			  </form>
<%-- 			  <button class="btn btn-delete" onclick="deleteone(${one.one_no},${one.one_writer })" style="cursor: pointer; margin-top:50px; margin-left:10px">글삭제</button> --%>
      </div>
         
			
			
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
								
			<div class="regBtn" style="text-align:center; margin: 20px;">답변 </div>		
			<div style="text-align:center; margin:30px; padding:50px; border:2px solid #cdb3fc; border-radius:4px;">${one.one_answer}</div>
					</div>
	



<!-- 		<div id="btnBox_parent"> -->
<!-- 		<form action="deleteOne"> -->
<%-- 			<input type="hidden" name="one_no" value="${one.one_no}"> --%>
<!-- 		</form> -->
		

		<!-- 클릭시 보이는 이미지 start -->
		<div id="imgBox" class="container-fluid">
		<div id="imgContentBox">
		<div id="imgBoxTitleBar">
			<span id="closeX" onclick="closeX()">X</span>
			<script>
        	function closeX(){
        		$("#imgBox").hide();
        	}
        </script>
			</div>
			<img id="imgBoxImg" src="img/${one.filename}">
		</div>
	</div>
	<!-- 클릭시 보이는 이미지 end -->
</body>
</html>
