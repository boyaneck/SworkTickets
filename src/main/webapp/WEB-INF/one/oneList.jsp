<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../header.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet"
   href="//cdn.jsdelivr.net/gh/xpressengine/xeicon@2.3.1/xeicon.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
.table tr:hover{
 background-color:#e8dbfe!important;

}
.aa{
color:
}
.write{
border-radius:4px;
border: 1px solid #1f1f1f;
    background-color: white;
    width: 100px;
    height: 40px;
    color: #f4f4f4;
    font-size: 18px;
    color: black;
}
@media (max-width: 768px) {
  .tb {
  display:none;
}
.searchNav{
text-align:center;
width:100%;


}
.sub_title{
float:none;
margin-bottom: 20px;
}
.btn-success{
width:100%;
margin-top: 10px;
}
.container-fluid{
padding:0;}
}

.container-fluid{
 padding:0 8% 0 8%;
}
</style>
<script>

   function getone(val){
   location.href="getOne?one_no="+val;

 }
//    function f_write(val){
//     console.log(val);
//     if(val == ''){
//         alert("로그인이 되야 작성 가능합니다");
//         location.href="/getOneList";
//     }else{
//         location.href="/goWrite";
//     }
//  }
   function f_write(val){
		
		  if(val ==''){
			  var delConfirm = confirm(' 회원만 작성 가능합니다. 로그인 하시겠습니까?');
			    if (delConfirm == true) {
			        
			        location.href ="login.jsp";
			    }
			    else {}
			
		}
		else location.href="/goWrite";
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
      <h1>1:1문의 </h1>
   </div>
   <nav id="searchNav" class="sub_title">
      <form class="form-inline justify-content-end" action="getOneList" method="post">
          <input  class="form-control mr-sm-2" type="text" name="searchKeyword"
            placeholder="제목 또는 작성자 검색" value="${searchKeyword }">
         <button class="btn btn-success" type="submit" style="border-radius:4px">검색</button>
      </form>
   </nav>
   <div class="container-fluid" >
      <table class="table table-hover">
         <thead class="btn-primary">
            <tr>
               <th class="tb"  style="width:10%; text-align:center;">번호</th>
               <th style="width:50%; text-align:center;">제목</th>
               <th style="width:20%; text-align:center;">작성자</th>
               <th class="tb" style="width:20%; text-align:center;">등록일</th>
               
            </tr>
         </thead>
         <tbody>

            <c:forEach items="${oneList}" var="one">
         
			
	    	 <c:choose>
	               <c:when test="${one.one_secret eq 'true'}">
	               <c:choose>
			               <c:when test="${one.one_writer eq mb_Id || mb_Id eq 'admin' }">
			                
						               <tr onclick="getone(${one.one_no})" style="cursor: pointer;" onmouseover="this.style.fontWeight='bold'" onmouseout="this.style.fontWeight=''">
						                <td onclick="getone(${one.one_no})" style="cursor: pointer" class="tdCenter tb">${one.one_no}</td>
						                <td class="tdCenter"><i class = "xi-lock-o" style="padding-top:px; font-size: 17.5px; cursor:pointer;"></i> ${one.one_title}  <c:if test="${one.one_answer ne NULL}"><i class ="xi-wechat" style="font-size: 24px; " ></i> </c:if></td>
						                <td class="tdCenter">${one.one_writer}</td>
						                <td class="tdCenter tb"><fmt:formatDate value="${one.one_date}" pattern="yyyy-MM-dd HH:mm-ss" var="today" />${today}</td>
			                     </tr>
	                 
	                     </c:when>
	                     <c:otherwise>
	                     
	                        <tr><td class="tdCenter tb" >${one.one_no}</td>
	                           <td class="tdCenter aa"><i class = "xi-lock-o" style="padding-top:px; font-size: 17.5px; cursor:pointer;"></i> 비밀게시글은 작성자와 관리자만 볼 수 있습니다.<c:if test="${one.one_answer ne NULL}">  <i class ="xi-wechat" style="font-size: 24px; " ></i></c:if></td>
	                           <td class="tdCenter">****</td>             
	                           <td class="tdCenter tb"><fmt:formatDate value="${one.one_date}" pattern="yyyy-MM-dd HH:mm-ss" var="today" />${today}</td>
	                        </tr>
	                     </c:otherwise>
	                  </c:choose>

               </c:when>

               <c:otherwise>

                  <tr onclick="getone(${one.one_no})" style="cursor: pointer;" onmouseover="this.style.fontWeight='bold'" onmouseout="this.style.fontWeight=''">
                     <td class="tdCenter tb">${one.one_no}</td>
                     <td class="tdCenter">${one.one_title} <c:if test="${one.one_answer ne NULL}">  <i class ="xi-wechat" style="font-size: 24px; " > </i></c:if></td>
                  					   <c:set var="index" value='${fn:indexOf(one.one_writer, "@")}'/>
								         	<c:choose>
										        <c:when test="${index ne -1 }">
										         	 <c:set var="sub" value='${fn:substring(one.one_writer,0,index+1) }***'/>
										         	 <td class="tdCenter">${sub}</td>
												</c:when>
												<c:otherwise>
												  <td class="tdCenter">${one.one_writer }</td>
												</c:otherwise>			
											</c:choose>
                 
                     <td class="tdCenter tb"><fmt:formatDate value="${one.one_date}" pattern="yyyy-MM-dd HH:mm-ss" var="today" />${today}</td>
                  </tr>
               </c:otherwise>
               </c:choose>
               
              
			
            </c:forEach>
         </tbody>
      </table>
      
            <button class="write" onclick="f_write('${mb_Id}')" style="cursor:pointer" ">글쓰기</button>
      <br>
      <br>
     <div id="btnBox_parent">
      <div id="btnBox">
         <!-- 반복처리할 태그 시작-->
         <c:if test="${paging.nowPageBtn > 1 }">
            <a href="getOneList?nowPageBtn=1&searchKeyword=${searchKeyword }"  ><strong>&laquo;</strong></a>
         </c:if>
         <c:if test="${paging.nowPageBtn > 1 }">
            <a href="getOneList?nowPageBtn=${paging.nowPageBtn -1 }&searchKeyword=${searchKeyword }"  class="tt" ><strong>&lt;</strong></a>
         </c:if>
         <c:forEach begin="${paging.startBtn}" end="${paging.endBtn }"
            step="1" var="i">
            <c:choose>
               <c:when test="${paging.nowPageBtn == i}">
                  <a style=" color: #7832f7; font-size:21px;" class="aSel"
                     href="getOneList?nowPageBtn=${i}&searchKeyword=${searchKeyword }" ><strong>${i}</strong></a>
               </c:when>
               <c:otherwise>
                  <a href="getOneList?nowPageBtn=${i}&searchKeyword=${searchKeyword }">${i}</a>
               </c:otherwise>
            </c:choose>
         </c:forEach>
         <c:if test="${paging.nowPageBtn < paging.totalBtnCnt }">
            <a href="getOneList?nowPageBtn=${paging.nowPageBtn +1 }&searchKeyword=${searchKeyword }"><strong>&gt;</strong></a>
         </c:if>
         <c:if test="${paging.nowPageBtn < paging.totalBtnCnt }">
            <a href="getOneList?nowPageBtn=${paging.totalBtnCnt}&searchKeyword=${searchKeyword }"><strong>&raquo;</strong></a>
         </c:if>
         <!-- 반복처리할 태그 끝 -->
      </div>
   </div>
      <br>
      <br>

   
   </div>

<%@ include file="/footer.jsp"%>

</body>
</html>