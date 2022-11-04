<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<script>
$(document).ready(function(){
	

		
		const review_bno1=2;
		var objparams={review_bno:review_bno1};
		
		console.log("안됨");
		
// 	var objparams={review_bno:review_bno1,review_writer:review_writer1,review_content:review_content1};

		
   $.ajax({
		 type:'post',
		 url:"/reviewList",
		 data:objparams,
		
		success:function(data) {
			if(data.total > 0){
				console.log("get list 실행 중");
				var list = data.list;
				
				var reviewList=data.reviewlist;
				console.log("받아온 데이터의 리스트와, 총 댓글 수 ")
				console.log(list);
				console.log(data.total);
				console.log(list.review_no);
				console.log(reviewList);
				
				var comment_html = "<div>";
				
				$('#count').html(data.total);
				for(i = 0;i < list.length;i++){
					console.log("댓글 만들기");
					var content = list[i].review_content;
					var writer = list[i].review_writer;
					var review_no=list[i].review_no;
					console.log("댓글번호받아라!!!" +review_no);
					comment_html += "<div><span id='review_writer'><strong>" + writer + "</strong></span><br/>";
					comment_html += "<span id='review_content'>" + content + "</span><br>";
					
					
					console.log("댓글 아래로 쭉 떠야함 ");
					if(writer === $("#review_writer").val()){
						//wirter는 db에 있는것   , #review_writer은 세션에 있는 것 
						
						var writer_d = $("#review_writer").val()
						console.log("세션 아이디 값");
						console.log(writer_d);
// 						console.log("딜리트!!!!!!!!!"+reviewList.review_writer);
// 						 comment_html += "<span id='delete' style='cursor:pointer;' >(삭제하기)</span><br></div><hr>";
// 						comment_html += "<button id='delete' style='cursor:pointer;' onclick='del(`${mb_Id}`)'>(삭제하기)</button><br></div><hr>";
						comment_html += "<button id='delete' style='cursor:pointer;' onclick='del(`${reviewlist.review_no}`)'>(삭제하기)</button><br></div><hr>";
									 
					}
					else{
						comment_html += "</div><hr>";
					}
				}
				
				$(".comment_Box").html(comment_html);
				
				
			}
			else{
					console.log("total 이 0 일때 ");
				var comment_html = "<div>등록된 댓글이 없습니다.</div>";
				$(".comment_Box").html(comment_html);
			}
		}
   });	
		
 	


$('#Comment_regist').click(function() {
	
	console.log("댓글버튼 실행");
	//Json으로 전달할 파라미터 변수선언 // 전시회에서 와야할 게시물 번호 
			//${exh_no};
	const review_bno = 2;
	const review_writer = $('#review_writer').val();
	const review_content = $('#review_content').val();
	//작성한 작성자와 내용 
	
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
				"review_bno":review_bno,
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
				console.log();
				$('#review_writer').val(review_writer);
//					$('#review_content').val('');
					$('#review_content').val(review_content);
					// 댓글이 등록되면 , 새로운 댓글창 나오면서 댓글 아이디는 작성자로, 댓글창은 빈문자로 만든다 .
				
			} else {
				alert('로그인 이후 이용해주시기 바랍니다.');
				console.log('댓글 등록 실패');
			}
		},
		error:function(){
			alert('통신실패');
		}
	});// 댓글 비동기 끝
		
})// 댓글등록 이벤트 끝



});

function del(val){
	console.log("딜리트함수 실행");
	console.log(val);
	var delConfirm = confirm('정말 삭제하시겠습니까?');
    if (delConfirm == true) {
        alert('삭제되었습니다.');
        location.href ="deleteReview?review_writer="+ val;
    }
    else {
        alert('삭제가 취소되었습니다.');
    }
}
// $(document).ready(function(){
// $("#delete").click(function(){
	
// 	console.log("딜리트함수 실행");
// });
// });

</script>

<div class="comment-box">
                    
   		                 <div class="comment-count">댓글 <span id="count">0</span></div>
   		                 
						<input type="hidden" id="review_bno" name="review_bno" value="2">
						
   		                 	   <!-- <span class="c-icon"><i class="fa-solid fa-user"></i>  -->
   		                 <div class="comment-name">
	                        <span class="anonym">작성자  <input type="text" class="form-control"  placeholder="아이디" id="review_writer" name ="review_writer" value="${mb_Id}" readonly style="width: 300px; border:none;">
	                        </span>
	                      </div>   
	                  
	                  
	                        	<div class="content"> 내용:
	                        	
	                        	<span><input type="text" class="form-control"id="review_content" name="review_content" placeholder="내용을 입력하세요" style="width: 300px; border:none;">
	                        	</span>
	                        	</div>
	                        	<div class="regBtn">
                    		<button id="Comment_regist"> 댓글등록</button>
                    	 </div>
	                        	
	                   	
<!-- 	                        	댓글 작성되면 작고 올라올 곳  -->
	                        	<div class="">
	                        	</div>
	                        	
	                        	
	                        	
                    <div class="comment_Box">
<!--                         <input type="text" class="comment-input" id="review_content" cols="80" rows="2" placeholder="내용을 입력해주세요" name="review_content" style="height:200px; height:200px;"> -->
                        </div>
	                        <!-- </span> -->
                     <!--<img src="/익명.jpg" width ="50px" alt="My Image"><!-->
                     
                     
                        <!-- <span class="com-function-btn" type="hidden">
                            
                            <a href="#"><i class="fa-solid fa-pen-to-square"></i></a>
                            <a href="#"><i class="fa-solid fa-trash-can"></i></a>
                         </span> -->
                    </div>
                    	
                    	 
</body>
</html>