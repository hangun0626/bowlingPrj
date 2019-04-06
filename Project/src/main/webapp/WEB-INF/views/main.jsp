<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

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
		 window.open($url,"비번검색","width=400px,height=300px"+
				 ",scrollbars=yes");
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
	<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous"> -->
 	<link href="<c:url value='/resources/bootstrap-4.1.1-dist/css/bootstrap.css'/>" rel="stylesheet">
	<link href="<c:url value='/resources/bootstrap-4.1.1-dist/css/bootstrap-grid.css'/>" rel="stylesheet">
	<link href="<c:url value='/resources/bootstrap-4.1.1-dist/js/bootstrap.min.js'/>" rel="stylesheet">
	<link href="<c:url value='/resources/bootstrap-4.1.1-dist/css/bootstrap-grid.min.css'/>" rel="stylesheet">

  </head>

  <body>
	<jsp:include page="headNav.jsp"></jsp:include>
	<jsp:include page="mainMain.jsp"></jsp:include>

    <!-- Bootstrap core JavaScript -->
   <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
   <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
  
<!--     <script src="../_vendor/jquery/dist/jquery.min.js"></script>
    <script src="../_vendor/popper.js/dist/umd/popper.min.js"></script>
    <script src="../_vendor/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="../_assets/js/custom.js"></script> -->
  
  </body>

</html>
