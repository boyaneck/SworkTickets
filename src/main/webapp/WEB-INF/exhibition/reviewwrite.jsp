
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/gh/xpressengine/xeicon@2.3.1/xeicon.min.css">
<head>
<meta charset="UTF-8">
<style>
textarea {
	margin-top: 30px;
	width: 100%;
	height: 200px;
	padding: 10px;
	box-sizing: border-box;
	border: solid 2px #1E90FF;
	border-radius: 5px;
	font-size: 16px;
	resize: both;
}

.btn_comment_update:hover {
	color: red;
}
</style>
</head>
<%
pageContext.setAttribute("replaceChar", "\n");
%>

<script>
	$(document).ready(function(){
	const review_bno1=${exhno2};
	console.log("exhno!!!!!!!!!!"+review_bno1);
	var objparams={review_bno:review_bno1};
	
	console.log("안됨");
       	$.ajax({
		  	 	type:'get',
		   		url:"/reviewList",
		   		data:objparams,
				success:function(data) {
				console.log(data);
				 if(data.total > 0){
				console.log("get list 실행 중");
				var list = data.list;
				var reg=list.review_reg_date;
				console.log("받아온 데이터의 리스트와, 총 댓글 수 ") ;
				console.log(list);
				console.log(data.total);
				console.log("페이지 시작 버튼 "+data.paging.startBtn);
				console.log("페이지 끝 버튼 "+data.paging.endBtn);
				console.log("페이지현재 버튼 "+data.paging.nowPageBtn);
				
				var paging     =  data.paging;
			    var bno        =data.list[1].review_bno; 
				var comment_html = "<div>";
				 
				$('#count').html(data.total); //댓글 수 
				$.each(list, function(i, v){
					console.log("댓글 만들기");
					var content    =  list[i].review_content;
					var writer     =  list[i].review_writer;
					var review_no  =  list[i].review_no;
					var review_bno =  list[i].review_bno;
					var date       =  list[i].review_reg_date;
					
					
				
					
	
	var timeOff = new Date().getTimezoneOffset()*60000; // 분단위를 밀리초로 변환
	 console.log("timeOff : ", timeOff);
	var today = new Date(date-timeOff).toISOString().split("T")[0];
	 console.log("today : !!!!!!!!!!!!!!!!!!!", today);

					
					
					
					
					
					
					console.log("시작버튼 !!!!!"+paging.nowPageBtn);
					

					console.log("등록번호"+review_no);
					console.log("등록일!!!!!!!!!!!!!!!@@@@@@@@@"+ today);
					
					
					console.log("댓글번호받아라!!!" +review_no);
					console.log("writer!!!" +writer);
					
					comment_html +="<div id='a"+[i]+"' class='aa1'>";
					comment_html +="<div style='font-size:14px; color:#000; font-weight:bold; margin-top: 20px;'><span class='review_writer'>"+ content + "</div><br/>";
					comment_html +="<div style='font-size:13px; color:gray;'>"+writer+'&nbsp;'+ today+ "</div>";
					comment_html +="<div id='exh_st_date'>${today}</div>";
					comment_html +="</div>";
					
			
					comment_html +="<div>"
					comment_html +="<div id='b"+[i]+"' style='display:none'>";
					comment_html +="<form action ='/updateReview'>"	;
					comment_html +="<div><input type='hidden' name='review_bno' value='"+review_bno+"'></div>";
					comment_html +="<div><input type='hidden' name='review_no' value='"+review_no+"'></div>";
					comment_html +="<div><textarea name='review_content' class='reveiw_content' >"+content+"</textarea></div>";
					comment_html +="<button  class='btn_comment_update' style='background-color:white; border:1px solid black; border-radius:3px; '><i class = 'xi-check'></i></button>";
					comment_html += "</form>";
					comment_html +="</div>";
					
					
					
					console.log("댓글 아래로 쭉 떠야함 ");
				
			if(writer === $(".review_writer").val()){
							
				var writer_d = $(".review_writer").val()
				console.log("세션 아이디 값");
				console.log(writer_d);
				console.log("review 값은 무엇일까요?"+review_no);
				var list_no=review_no;
				console.log(list_no);
														
					comment_html += "<div style='text-align:right;'><button class='update1' style='cursor:pointer; background-color: white; border: none; font-size: 25px; margin-right: 20px;' onclick='updateReview("+[i]+")' ><i class = 'xi-pen-o'></i></button>";																
					comment_html += "<button id='delete' style='cursor:pointer; background-color: white; border: none; font-size: 25px;' onclick='del("+list_no+")'><i class = 'xi-trash-o'></i></button>";
				    comment_html += "</div><hr>";
					}
					else  comment_html += "</div><hr>";
					
					
					});  // 여기까지가 for문
					
						console.log("pageStartbtn!!!!!!!"+paging.startBtn);
						console.log("pagenowtbtn!!!!!!!!"+paging.nowPageBtn);
						console.log("pageendtbtn!!!!!!!!"+paging.endBtn);
						console.log("reviewBno!!!!!!!! " +bno);
					
					 comment_html += "<div id='btnBox_parent'>";
	 				 comment_html += "<div id='btnBox'>";
	 			     comment_html +=  "if("+(paging.nowPageBtn) > 1+"){";
	 			     comment_html +=  "<a href='reviewList?nowPageBtn='"+(paging.nowPageBtn -1)+" &review_bno="+bno+"}>&lt;</a> ";
	 			     comment_html += "}";
				          
	 			     comment_html +=  "for(i="+(paging.startBtn)+";i<="+paging.endBtn+"; i++){";
	 			     comment_html +=   "if("+paging.nowPageBtn == +"i"+"){";
	 			     comment_html +=   "<a class='aSel'>"+i+"</a> }";
	 			     //이 위의 i 값을 변수로 지정해야하는데..
				             
// 	 			     comment_html +=    "else <a href='reviewList?nowPageBtn=i&review_bno='"+bno+"'>i</a>";
				           
				 
// 	 			     comment_html +=   "if("+paging.nowPageBtn < paging.totalBtnCnt+"){";
// 	 			     comment_html +=   "<a href='reviewList?nowPageBtn='"+paging.nowPageBtn +1 +"">&gt;</a> }";
				           
// 	 			     comment_html +=     "else document.write('문제가 있습니다.');"
	 			     
	 			     comment_html += "</div>";
	 			     comment_html += "</div>";
// 				div class board에 있는 페이징 css
// 				  if < 버튼생성
// 				  each paging start버튼부터 end 버튼까지
// 				  버튼생성
// 				  if > 버튼생성
// 					지역은 버튼클릭하면 함수 호출해서 아작스 돌려서 받아온 데이터를 html에 뿌리는 방법?
		
			
				  
				$(".comment_Box").html(comment_html);
				
			     console.log("페이징 처리하는 구간입니다.!!!!!!!!");
				
					
				
				  } // 컨트롤러로 부터 받은 값=댓글이 있다면 if 문 여기서 끝 
					else{
			       console.log("total 이 0 일때 ");
				   var comment_html = "<div style='margin-left:440px; margin-top:100px;'><strong>등록된 댓글이 없습니다.</strong></div>";
				   $(".comment_Box").html(comment_html);
				   
			}
		}
   });	
		

	$('#Comment_regist').click(function() {
					console.log("댓글버튼 실행");
			
					const review_bno = 2;
					const review_writer = $('.review_writer').val();
					const review_content = $('.review_content').val();
					
					console.log(review_bno);
					console.log(review_writer);
					console.log(review_content);

			if(review_writer == ''){
					alert('로그인 후 이용해주세요');
					return;
			
			}else if(review_content == '') {
					alert('내용을 입력하세요');
			}
	
			$.ajax({
				type:'post',
				url:'/insertReview',
				data: JSON.stringify(
			{
				/*송원선*/
				"review_bno":review_bno1,
				/*송원선*/
				"review_writer":review_writer,
				"review_content":review_content
				
			}		
			),
				contentType: 'application/json',
				success:function(data){
				console.log('통신성공' + data);

			if(data === 'InsertSuccess') {
				alert('댓글 등록이 완료되었습니다.');
				console.log('댓글 등록 완료');
				$('.review_writer').val(review_writer);
					$('.review_content').val(review_content);
						window.location.reload();
			} else {
				alert('로그인 이후 이용해주시기 바랍니다.');
				console.log('댓글 등록 실패');
			}
			},
				error:function(){
				alert('통신실패');
			}
			});	
      });
    });

		function del(val){
			/*송원선*/
			const review_bno2=${exhno2};
			/*송원선*/
				console.log("딜리트함수 실행");
				console.log(val);
				console.log(val);
				var delConfirm = confirm('정말 삭제하시겠습니까?');
    	
		if (delConfirm == true) {
        		alert('삭제되었습니다.');
       			location.href ="deleteReview?review_no="+val+"&review_bno="+review_bno2;
   		 }
   		 else {
       			 alert('삭제가 취소되었습니다.');
                }
         }

		function updateReview(val){
				console.log("updateReview 함수 실행"+val);
				console.log(val);
				console.log('#a'+val);
				$('#a'+val).hide();
				$('#b'+val).show();
				$(".update1").hide();
		document.querySelectorAll('.btn_comment_update').forEach(function (item) {
        		item.addEventListener('click', function () { 
        	
             	const form = this.closest('form'); 
            	commentUpdate(form); 
         });
        });

    	 function commentUpdate(form) {
        		const data = { comment: form.querySelector('.review_content').value() };
       		if (!data.comment || data.comment.trim() === "") {
           		 alert("공백 또는 입력하지 않은 부분이 있습니다.");
            		return false;
             }
                const con_check = confirm("수정하시겠습니까?");
        
         if (con_check === true) {
             $.ajax({
                type: 'POST',
                url: "updateReview",
                dataType: 'JSON',
                contentType: 'application/json; charset=utf-8',
                data: JSON.stringify(data)
                
            }).done(function () {
            	debugger;
                window.location.reload();
            }).fail(function (error) {
            	
                alert(JSON.stringify(error));
            });
        }
	
	 }
			
}

</script>
<style>
#Comment_regist {
	width: 200px;
	height: 45px;
	color: #7329f7;
	background-color: white;
	border: solid 1px;
	font-size: 16pt;
}

#Comment_regist:hover {
	width: 200px;
	height: 45px;
	color: white;
	background-color: #7329f7;
	border: solid 0px 0px 1px 0px;
	font-size: 16pt;
}

textarea:focus, input:focus {
	outline: none;
}
</style>
<body>
	<div class="container">
		<div class="comment-box">

			<div class="comment-count" style="margin-top: 30px;">
				댓글 <span id="count">0</span>
			</div>

			<input type="hidden" id="review_no" name="review_no" value="2">
			<div class="row">
				<div class="col" style="font-size: 15px;">
					<small> <span class="text-danger">매매, 욕설</span> 등 게시판 운영
						규정에 위반되는 글은 사전 통보없이 삭제될 수 있습니다.<br> <span class="text-danger">개인정보</span>가
						포함된 내용은 삼가 주시기 바라며, 게시물로 인해 발생하는 문제는 작성자 <span class="text-danger">본인</span>에게
						책임이 있습니다.
					</small>
				</div>

				<div class="comment-name ">
					<span class="anonym"> <input type="hidden"
						class="form-control review_writer" placeholder="아이디"
						name="review_writer" value="${mb_Id}" readonly
						style="width: 300px; border: none;">
					</span>
				</div>

			</div>
			<div class="container" style="border: 1px solid lightgray;">
				<div class="content" style="font-size: 13px;">
					<span><textarea class="review_content" name="review_content"
							placeholder="관람후기를 남겨주세요"
							style="resize: none; width: 100%; height: 8em; border: none;"></textarea></span>
				</div>
				<hr>
				<div class="regBtn" style="text-align: right; margin: 20px;">
					<button id="Comment_regist">등록</button>
				</div>
			</div>

			<div class="comment_Box"></div>


		</div>
	</div>











<%-- 	         <c:if test="${paging.nowPageBtn > 1 }"> --%>
<%-- 	            <a href="getUserExhibition?nowPageBtn=${paging.nowPageBtn -1 }">&lt;</a> --%>
<%-- 	         </c:if> --%>
<%-- 	         <c:forEach begin="${paging.startBtn}" end="${paging.endBtn }" --%>
<%-- 	           step="1" var="i"> --%> 
<%-- 	            <c:choose> --%> 
<%-- 	                <c:when test="${paging.nowPageBtn == i}"> --%> 
<%-- 	                   <a class="aSel">${i}</a> --%> 
<%-- 	               </c:when> --%> 
<%-- 	               <c:otherwise> --%> 
<%-- 	                  <a href="getUserExhibition?nowPageBtn=${i}&exh_no=${exhno2}">${i}</a> --%> 
<%-- 	               </c:otherwise> --%> 
<%-- 	             </c:choose> --%> 
<%-- 	      </c:forEach> --%> 
<%-- 	          <c:if test="${paging.nowPageBtn < paging.totalBtnCnt }"> --%> 
<%-- 	             <a href="getUserExhibition?nowPageBtn=${paging.nowPageBtn +1 }">&gt;</a> --%> 
<%-- 	          </c:if> --%> 
<!-- 	         반복처리할 태그 끝 -->
<!-- 	      <br> -->
<!-- 	      <br> -->


	<%-- 		시작:${paging.startBtn} --%>
	<%--        값:${paging.nowPageBtn} --%>

	<%--      끝:${paging.endBtn } --%>

</body>
</html>