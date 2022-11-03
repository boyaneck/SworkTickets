<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<script>
$(document).ready(function(){
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
					$('#review_writer').val(review_writer);
// 					$('#review_content').val('');
  					$('#review_content').val(review_content);
  					// 댓글이 등록되면 , 새로운 댓글창 나오면서 댓글 아이디는 작성자로, 댓글창은 빈문자로 만든다 .
  					console.log("getList 메소드 실행 전");
  					getList();
  					console.log("getList 메소드 호출");
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



function getList() {
	
	//${exh_no}
	
	const review_bno1=$('#review_bno').val();
	const review_writer1 = $('#review_writer').val();
		const review_content1 = $('#review_content').val();
		
	var objparams={review_bno:review_bno1,review_writer:review_writer1,review_content:review_content1};
		/* const com_no = ${com}; */
// 	$.getJSON(
// 		"/reviewList"+review_bno,

   $.ajax({
		 type:'post',
		 url:"/reviewList",
		 data:objparams,
		
		success:function(data) {
			if(data.total > 0){
				console.log("get list 실행 중");
				var list = data.list;
				
				console.log("받아온 데이터의 리스트와, 총 댓글 수 ")
				console.log(list);
				console.log(data.total);
				
				var comment_html = "<div>";
				
				$('#count').html(data.total);
				for(i = 0;i < list.length;i++){
					console.log("댓글 만들기");
					var content = list[i].review_content;
					var writer = list[i].review_writer;
					comment_html += "<div><span id='review_writer'><strong>" + writer + "</strong></span><br/>";
					comment_html += "<span id='review_content'>" + content + "</span><br>";
					if(writer === $("#review_writer").val()){
						 comment_html += "<span id='delete' style='cursor:pointer;' data-id ="+content+">[삭제]</span><br></div><hr>";
						 
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
		
	
};
});







		
</script>



<div class="comment-box">
                    
   		                 <div class="comment-count">댓글 <span id="count">0</span></div>
						<input type="hidden" id="review_bno" name="review_bno" value="2">
   		                 	   <!-- <span class="c-icon"><i class="fa-solid fa-user"></i>  -->
   		                 <div class="comment-name">
	                        <span class="anonym">작성자 : 
	                    	    <input type="text" class="form-control" id="review_writer" placeholder="이름" name ="review_writer" value='${login.userId}'  style="width: 100px; border:none;">
	                        </span>
	                      </div>   
	                        	
	                        <!-- </span> -->
                     <!--<img src="/익명.jpg" width ="50px" alt="My Image"><!-->
                    <div class="comment_Box">
                        <input type="text" class="comment-input" id="review_content" cols="80" rows="2" name="review_content" >
                        </div>
                        <!-- <span class="com-function-btn" type="hidden">
                            
                            <a href="#"><i class="fa-solid fa-pen-to-square"></i></a>
                            <a href="#"><i class="fa-solid fa-trash-can"></i></a>
                         </span> -->
                    </div>
                    	<div class="regBtn">
                    		<button id="Comment_regist"> 댓글등록</button>
                    	 </div>
                    	 
                    	 
                    	 
</body>
</html>