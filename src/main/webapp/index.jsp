<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- header -->
<%@ include file="header.jsp"%>
<!-- header end -->
</head>
<body class="d-flex flex-column min-vh-100">
<br>
<br>
<a href="/login/naver">네이버로그인</a>
<a href="/getMemberList">회원목록</a><br>
<a href="/getCouponList"> 쿠폰목록</a> <br>
<a href="/pay">관리자 결제목록</a><br>
<a href="/payUser">회원 결제</a><br>
<a href="/getPayList">나의 구매내역</a><br>
<a href="insertCoupon.jsp">쿠폰등록</a><br>
<a href="/MyCoupon">내 쿠폰함</a><br>
<a href="/getBoardList">게시판 가기</a><br>
<a href="/getUserExhibitionList">회원전시</a>
<a href="/write.jsp">글쓰기</a>

<!-- footer -->
<%@ include file="footer.jsp"%>
<!-- footer end -->
</body>
</html>