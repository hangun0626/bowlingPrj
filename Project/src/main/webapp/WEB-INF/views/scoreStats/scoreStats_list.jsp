<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<script src="<c:url value="/resources/js/jquery.js"/>"></script>
	<script>
	 function login_check(){
		 if($.trim($("#login_id").val())==""){
			 alert("로그인 아이디를 입력하세요!");
			 $("#login_id").val("").focus();
			 return false;
		 }
		 if($.trim($("#login_pwd").val())==""){
			 alert("로그인 비번을 입력하세요!");
			 $("#login_pwd").val("").focus();
			 return false;
		 }
	 }//로그인 인증 유효성 검증
	 
	 //비번찾기
	 function pwd_find(){
		 $url="pwd_find";//매핑주소
		 window.open($url,"비번검색","width=400px,height=300px"+",scrollbars=yes");
		 //open(공지창경로,공지창이름,속성) 메서드로 폭이 300픽셀,
		 //높이가 300픽셀,스크롤바가 생성되는 새로운 공지창을 만든다.
	 }
	</script>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>CORE BOWLING TEAM</title>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/bootstrap-4.1.1-dist/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/bootstrap-4.1.1-dist/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/bootstrap-4.1.1-dist/css/bootstrap-reboot.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/bootstrap-4.1.1-dist/css/bootstrap-reboot.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/bootstrap-4.1.1-dist/css/bootstrap-grid.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/bootstrap-4.1.1-dist/css/bootstrap-grid.css">
    
    
<meta charset="UTF-8">
<title>게시판 목록</title>
<script>
 function find_check(){
	 if($.trim($("#find_name").val())==""){
		 alert("검색어를 입력하세요!");
		 $("#find_name").val("").focus();
		 return false;
	 }
 }
</script>

</head>
<body id="page-top">
    <!-- Navigation -->
	<jsp:include page="../headNav.jsp"></jsp:include>
 	<header class="masthead text-center d-flex">
    	<div class="container mx-auto my-5">
    </div>
    </header>
    <div class="row">
    	<div class="container my-auto text-center ">
          <div class="mx-auto">
			<form method="get" action="scoreStats_list" onsubmit="return find_check();">
			 <div id="bList_wrap">
			  <h2 class="bList_title">점수집계</h2>
			  <table class="table table-hover" id="bList_t">
			   <tr>
			    <th width="6%" height="26">순위</th>
			    <th width="37%">이름</th>
			    <th width="24%">참여</th>
			    <th width="20%">평균</th>   
			   </tr>
			   <c:if test="${!empty blist}">
			   <c:forEach var="b" items="${blist}">
			   <tr>
			    <td align="center">${b.scoreNo}</td>
			    <td align="center">${b.memName}</td>
			    <td align="center">${b.gameCnt}</td>
			    <td align="center">${b.avgScore}</td>
			   </tr>
			   </c:forEach>
			   </c:if>
			   <c:if test="${empty blist}">
			   <tr>
			    <th colspan="5">목록이 없습니다!</th>
			   </tr>
			   </c:if>
			  </table>
 		</div>
 	</div>
 </div>
 
    <!-- Bootstrap core JavaScript -->
    <script src="<c:url value="/resources/bootstrap-4.1.1-dist/js/bootstrap.min.js" />"></script>
    <script src="<c:url value="/resources/bootstrap-4.1.1-dist/js/bootstrap.js" />"></script>
    <script src="<c:url value="/resources/bootstrap-4.1.1-dist/js/bootstrap.bundle.min.js" />"></script>
    <script src="<c:url value="/resources/bootstrap-4.1.1-dist/js/bootstrap.bundle.js" />"></script>
 
</body>
</html>

<!-- 부트스트랩클래스 참고사이트
https://bootswatch.com/default/ -->















