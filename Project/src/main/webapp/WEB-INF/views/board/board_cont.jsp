<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<script src="<c:url value="/resources/js/jquery.js"/>"></script>
<meta charset="UTF-8">
<title>공지내용</title>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/bootstrap-4.1.1-dist/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/bootstrap-4.1.1-dist/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/bootstrap-4.1.1-dist/css/bootstrap-reboot.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/bootstrap-4.1.1-dist/css/bootstrap-reboot.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/bootstrap-4.1.1-dist/css/bootstrap-grid.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/bootstrap-4.1.1-dist/css/bootstrap-grid.css">

</head>
<body>
	<jsp:include page="../headNav.jsp"></jsp:include>
 <div id="bCont_wrap">
  <h2 class="bCont_title">공지내용</h2>
  <table id="bCont_t">
   <tr>
    <th>제목</th> <td>${b.board_title}</td>
   </tr>
   <tr>
    <th>내용</th> <td>${bcont}</td>   
   </tr>
   <tr>
    <th>조회수</th> <td>${b.board_hit}</td>
   </tr>
  </table>
  <div id="bCont_menu">
   <input type="button" class="btn btn-primary btn-sm btn-block" value="답변" onclick="location='board_cont?no=${b.board_no}&page=${page}&state=reply';" />
   <input type="button" class="btn btn-primary btn-sm btn-block" value="수정" onclick="location='board_cont?no=${b.board_no}&page=${page}&state=edit';" />
   <input type="button" class="btn btn-primary btn-sm btn-block" value="삭제" onclick="location='board_cont?no=${b.board_no}&page=${page}&state=del';" />
   <input type="button" class="btn btn-primary btn-sm btn-block" value="목록" onclick="location='board_list?page=${page}';" />               
  </div>
 </div>
 
      <!-- Bootstrap core JavaScript -->
    <script src="<c:url value="/resources/bootstrap-4.1.1-dist/js/bootstrap.min.js" />"></script>
    <script src="<c:url value="/resources/bootstrap-4.1.1-dist/js/bootstrap.js" />"></script>
    <script src="<c:url value="/resources/bootstrap-4.1.1-dist/js/bootstrap.bundle.min.js" />"></script>
    <script src="<c:url value="/resources/bootstrap-4.1.1-dist/js/bootstrap.bundle.js" />"></script>
 
</body>
</html>















