<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../header.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
/* Custom style */
.accordion-button:not(.collapsed) {
   padding:60px;
   
    color: #8c00ff;
    border:none;
    background-color: white !important; 
    box-shadow: inset 0 -1px 0 rgb(0 0 0 / 13%);
}
    .accordion-button::after {
      background-image: url("data:image/svg+xml,%3csvg viewBox='0 0 16 16' fill='%23333' xmlns='http://www.w3.org/2000/svg'%3e%3cpath fill-rule='evenodd' d='M8 0a1 1 0 0 1 1 1v6h6a1 1 0 1 1 0 2H9v6a1 1 0 1 1-2 0V9H1a1 1 0 0 1 0-2h6V1a1 1 0 0 1 1-1z' clip-rule='evenodd'/%3e%3c/svg%3e");
      transform: scale(.7) !important;
    }
    .accordion-button:not(.collapsed)::after {
      background-image: url("data:image/svg+xml,%3csvg viewBox='0 0 16 16' fill='%23333' xmlns='http://www.w3.org/2000/svg'%3e%3cpath fill-rule='evenodd' d='M0 8a1 1 0 0 1 1-1h14a1 1 0 1 1 0 2H1a1 1 0 0 1-1-1z' clip-rule='evenodd'/%3e%3c/svg%3e");
    }
    
    //아코언 크기 
   .accordion-item{
   
   font-size:20px !important;
   border-left:none !important;
   border-right:none !important;
   width:60% !important;
   margin-left:20% !important;
   margin-right:20% !important;
   
   }
 @media (max-width:768px){ 
   .accordion-item{ 
   width:90% !important;
   margin-left:5%!important; 
   margin-right:5%!important; 
    } 
    } 
   
   
   .accordion-button title collapsed{
/*    border:1px solid #8c00ff; */
   }
   
   
   //제목  hover했을때
   .accordion-item:hover{
   background-color: #f9fafa !important;
   }
   .board > h1{
   
   font-size:50px;
   
   }
   .title{
   font-weight:bold;
   font-size:22px;
   }
   
   .accordion-button:hover{
   background-color:#b13dfa
   border-bottom:1px solid #8c00ff;
   border-top:1px solid #8c00ff;
   border-bottom:1px solid #8c00ff;
   }
   
</style>
<script>

function getfaq(val){
   location.href="getFaq?faq_no="+val;

}
function f_write(val){
    console.log(val);
    if(val == ''){
        alert("로그인이 되야 작성 가능합니다");
        location.href="/getFaqList";
    }else{
        location.href="/goWriteFaq";
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
      <h1>FAQ</h1>
   </div>
<div class="faqP">
<div class="faqC">
<div class="m-4">
<c:forEach items="${faqList}" var="faq">

    <div class="accordion" id="myAccordion">
        <div class="accordion-item" >
        
            <h1 class="accordion-header" id="headingOne">
            
                <button type="button"  style="padding:40px;"  class="accordion-button collapsed title" data-bs-toggle="collapse" data-bs-target="#collapseOne${faq.faq_no }">Q. ${faq.faq_title}</button>                           
            </h1>
            <div id="collapseOne${faq.faq_no }" class="accordion-collapse collapse panel-violet" data-bs-parent="#myAccordion">
                <div class="card-body">
                <div>
                    <p><strong>${faq.faq_content} </strong></p>
                    <fmt:formatDate value="${faq.faq_reg}" pattern="yyyy-MM-dd" var="today" />${today}

                </div>
                     
                </div> 
               
            </div>
        </div>
    </div>
    </c:forEach>
</div>
</div>
</div>



<%@ include file="../../footer.jsp" %>
</body>
</html>