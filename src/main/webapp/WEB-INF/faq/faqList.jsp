<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../header.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
.collapsible-link::before {
  content: '';
  width: 14px;
  height: 2px;
  background: #333;
  position: absolute;
  top: calc(50% - 1px);
  right: 1rem;
  display: block;
  transition: all 0.5s;
}

/* Vertical line */
.collapsible-link::after {
  content: '';
  width: 2px;
  height: 14px;
  background: #333;
  position: absolute;
  top: calc(50% - 7px);
  right: calc(1rem + 6px);
  display: block;
  transition: all 0.5s;
}

.collapsible-link[aria-expanded='true']::after {
  transform: rotate(90deg) translateX(-1px);
}

.collapsible-link[aria-expanded='true']::before {
  transform: rotate(180deg);
}


/*
*
* ==========================================
* FOR DEMO PURPOSES
* ==========================================
*
*/
body {
/*   background: #dd5e89; */
/*   background: -webkit-linear-gradient(to left, #dd5e89, #f7bb97); */
/*   background: linear-gradient(to left, #dd5e89, #f7bb97); */
/*   min-height: 100vh; */
}

 
</style>


</head>
<body class="d-flex flex-column min-vh-100">

<div class="container">
  <!-- For demo purpose -->
  <div class="row py-5">
    <div class="col-lg-9 mx-auto text-white text-center">
      <h1 class="display-4" style="color:black !important;">FAQ</h1>
    </div>
  </div>



  <div class="row">
<c:forEach items="${faqList}" var="faq">
    <div class="col-lg-9 mx-auto">
      <!-- Accordion -->
      <div id="accordionExample" class="accordion shadow">
        <!-- Accordion item 1 -->
        <div class="card">
          <div id="headingTwo" class="card-header bg-white shadow-sm border-0">
            <h6 class="mb-0 font-weight-bold" style="text-decoration:none;"><a href="#" data-toggle="collapse" data-target="#collapseTwo${faq.faq_no }" aria-expanded="false" aria-controls="collapseTwo" class="d-block position-relative collapsed text-dark text-uppercase collapsible-link py-2">${faq.faq_title }</a></h6>
          </div>
          <div id="collapseTwo${faq.faq_no }" aria-labelledby="headingTwo" data-parent="#accordionExample" class="collapse">
            <div class="card-body p-5">
              <p class="font-weight-light m-0">${faq.faq_content }</p>
            </div>
          </div>
        </div>


      </div>
    </div>
        </c:forEach>
  </div>
  
</div>

<%@ include file="../../footer.jsp" %>
</body>
</html>