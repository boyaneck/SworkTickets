<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
/* #searchNav { */
/* 	-webkit-justify-content: flex-end; */
/* 	justify-content: flex-end; */
/* } */

/* a { */
/* 	text-decoration: none; */
/* 	font-weight: bolder; */
/* 	display: inline-block; */
/* 	padding: 5px 10px; */
/* 	background-color: blue; */
/* 	color: #fff; */
/* 	border: 1px solid #777; */
/* 	border-radius: 5px; */
/* } */

/* a:hover, a:active { */
/* 	background-color: red; */
/* } */

/* a.aSel { */
/* 	color: red; */
/* } */

/* div#btnBox { */
/* 	text-align: center; */
/* } */
</style>
<script>

function getboard(val){
	location.href="getBoard?noti_no="+val ;
	
}
function f_write(val){
    console.log("noti_writer 받아와야함"+val);
    if(val == ''){
        alert("로그인이 되야 작성 가능합니다");
        location.href="/getBoardList";
    }else{
        location.href="/goWriteBoard";
    }
}

// function f_write(val){
//     console.log(val);
//     if(val == ''){
//         alert("로그인이 되야 작성 가능합니다");
//         location.href="/getOneList";
//     }else{
//         location.href="/goWrite";
//     }
// }
</script>
<body>
	<div class="board" >
		<h1>공 지 사 항</h1>
	</div>
	
	<%-- <%@ include file="../../menu.jsp" %> --%>
	<nav id="searchNav" class="sub_title">
		<form class="form-inline" action="getOneList.do" method="post">
			<select class="form-control" id="sel1" name="searchCondition"
				style="display: inline-block !important; margin-right: 10px;">
				<c:forEach items="${conditionMap}" var="option">
					<option value="${option.value}">${option.key}</option>
				</c:forEach>
				<option value="${conditionMap['제목']}">${conditionMap['제목']}</option>

			</select> <input class="form-control mr-sm-2" type="text" name="searchKeyword"
				placeholder="검색어를 입력하세요.">
			<button class="btn btn-success" type="submit">검색</button>
		</form>
	</nav>
	<div class="container-fluid">
		<table class="table table-hover">
			<thead class="btn-primary">
				<tr>
					<th style="width:10%; text-align:center;" >번호</th>
					<th style="width:50%; text-align:center;">제목</th>
					<th style="width:20%; text-align:center;">작성자</th>
					<th style="width:20%; text-align:center;">등록일</th>

				</tr>
			</thead>
			<tbody>

				<c:forEach items="${boardList}" var="board">
					<%-- 					<c:if test="${one.one_secret eq 'true'}"> --%>
					<%-- 						<c:choose> --%>
					<%-- 							<c:when --%>
					<%-- 								test="${one.one_writer eq mb_Id || mb_Id eq 'admin'}"> --%>
					<!-- 								<tr> -->
					<%-- 									<td onclick="getone(${one.one_no})" --%>
					<%-- 										style="cursor: pointer">${one.one_no}</td> --%>
					<%-- 									<td>${one.one_title }</td> --%>
					<%-- 							</c:when> --%>
					<%-- 							<c:otherwise> --%>
					<!-- 								<tr> -->
					<!-- 									<td>비밀게시글은 작성자와 관리자만 볼 수 있습니다.</td> -->
					<!-- 								</tr> -->
					<%-- 							</c:otherwise> --%>
					<%-- 						</c:choose> --%>

					<%-- 					</c:if> --%>

					<%-- 					<c:if test="${one.one_secret eq 'false'}"> --%>

	<%-- 				<tr onclick="getboard(${board.noti_no})" style="cursor: pointer;"> --%>
					<tr onclick="location.href='getBoard?noti_no=${board.noti_no }'"; style="cursor: pointer;">
						<%-- 						<tr onclick="getboard(${board.noti_title}) style="cursor:pointer"> --%>
						<td class="tdCenter" style="width:10%;" >${board.noti_no}</td>
						<td class="tdCenter" style="width:50%;" >${board.noti_title}</td>
						<td class="tdCenter" style="width:20%;" >${board.noti_writer}</td>
						<td class="tdCenter" style="width:20%;" ><fmt:formatDate
								value="${board.noti_date}" pattern="yyyy-MM-dd HH:mm-ss"
								var="today" />${today}</td>
						<%-- 							<td class="tdCenter">${board.noti_no}</td> --%>

					</tr>

					<%-- 					</c:if> --%>

				</c:forEach>
			</tbody>
		</table>
		<div >
		<button class="write" onclick="f_write('${mb_Id}')" style="cursor:pointer">글쓰기</button>
		</div>
	</div>
		</div>
		<br><br>
		<div id="btnBox_parent">
		<div id="btnBox">
			<!-- 반복처리할 태그 시작-->
			<c:if test="${paging.nowPageBtn > 1 }">
				<a href="getBoardList?nowPageBtn=${paging.nowPageBtn -1 }" >&lt;</a>
			</c:if>
			<c:forEach begin="${paging.startBtn}" end="${paging.endBtn }"
				step="1" var="i">
				<c:choose>
					<c:when test="${paging.nowPageBtn == i}">
						<a style="font-weight:400; color:#7832f7;" class="aSel">${i}</a>
					</c:when>
					<c:otherwise>
						<a href="getBoardList?nowPageBtn=${i}">${i}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${paging.nowPageBtn < paging.totalBtnCnt }">
				<a href="getBoardList?nowPageBtn=${paging.nowPageBtn +1 }">&gt;</a>
			</c:if>
			<!-- 반복처리할 태그 끝 -->
			</div>
			</div>
		<%--   <c:if test="${session.getAttribute(mb_id) !==  --%>
		<%--   <div id="footer"> --%>
		<%-- 		      <div onclick="f_write('${mb_Id}')" style="cursor:pointer">글쓰기</div> --%>

		</body>
</body>
</html>
