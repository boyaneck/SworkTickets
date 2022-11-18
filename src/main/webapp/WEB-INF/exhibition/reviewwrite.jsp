
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
   var objparams={review_bno:review_bno1};
   
          $.ajax({
               type:'get',
               url:"/reviewList",
               data:objparams,
            success:function(data) {
             if(data.total > 0){
            var list = data.list;
            var reg=list.review_reg_date;
            
            var paging     =  data.paging;
             var bno        =data.list[1].review_bno; 
            var comment_html = "<div>";
             
            $('#count').html(data.total); //댓글 수 
            $.each(list, function(i, v){
               var content    =  list[i].review_content;
               var writer     =  list[i].review_writer;
               var review_no  =  list[i].review_no;
               var review_bno =  list[i].review_bno;
               var date       =  list[i].review_reg_date;
               
               
            
               
   
   var timeOff = new Date().getTimezoneOffset()*60000; // 분단위를 밀리초로 변환
   var today = new Date(date-timeOff).toISOString().split("T")[0];

               
               comment_html +="<div id='a"+[i]+"' class='aa1'>";
               comment_html +="<div style='font-size:14px; color:#000; font-weight:bold; margin-top: 20px;'><span class='review_writer'>"+ content + "</div><br/>";
               comment_html +="<div style='font-size:13px; color:gray;'>"+writer+'&nbsp;'+ today+ "</div>";
               comment_html +="<div id='exh_st_date'>${today}</div>";
               comment_html +="</div>";
               
         
               comment_html +="<div>"
               comment_html +="<div id='b"+[i]+"' style='display:none'>";
               comment_html +="<form action ='/updateReview'>"   ;
               comment_html +="<div><input type='hidden' name='review_bno' value='"+review_bno+"'></div>";
               comment_html +="<div><input type='hidden' name='review_no' value='"+review_no+"'></div>";
               comment_html +="<div><textarea name='review_content' class='reveiw_content' required >"+content+"</textarea></div>";
               comment_html +="<button  class='btn_comment_update' style='background-color:white; border:1px solid black; border-radius:3px; '><i class = 'xi-check'></i></button>";
               comment_html += "</form>";
               comment_html +="</div>";
               
               
               
            
         if(writer === $(".review_writer").val()){
                     
            var writer_d = $(".review_writer").val()
            var list_no=review_no;
                                          
               comment_html += "<div style='text-align:right;'><button class='update1' style='cursor:pointer; background-color: white; border: none; font-size: 25px; margin-right: 20px;' onclick='updateReview("+[i]+")' ><i class = 'xi-pen-o'></i></button>";                                                
               comment_html += "<button id='delete' style='cursor:pointer; background-color: white; border: none; font-size: 25px;' onclick='del("+list_no+")'><i class = 'xi-trash-o'></i></button>";
                comment_html += "</div><hr>";
               }
               else  comment_html += "</div><hr>";
               
               
               });  
               
      
         
              
            $(".comment_Box").html(comment_html);
            
            
               
            
              }
               else{
               var comment_html = "<div style='margin-left:440px; margin-top:100px;'><strong>등록된 댓글이 없습니다.</strong></div>";
               $(".comment_Box").html(comment_html);
               
         }
      }
   });   
      

   
    });

      function del(val){
         /*송원선*/
         const review_bno2=${exhno2};
         /*송원선*/
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

      
      
      $('#Comment_regist').click(function() {
   
         const review_bno = 2;
         const review_writer = $('.review_writer').val();
         const review_content = $('.review_content').val();
         

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

   if(data === 'InsertSuccess') {
      alert('댓글 등록이 완료되었습니다.');
      $('.review_writer').val(review_writer);
         $('.review_content').val(review_content);
            $('#con2').load(location.href + '#con2');
            $(".tabDiv").eq(1).click();	
   } else {
      alert('로그인 이후 이용해주시기 바랍니다.');
   }
   },
      error:function(){
      alert('통신실패');
   }
   });   
});
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
<body class="d-flex flex-column min-vh-100">
   <div class="container">
      <div class="mb-5 comment-box">

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

	<%@ include file="../../footer.jsp" %>
</body>
</html>