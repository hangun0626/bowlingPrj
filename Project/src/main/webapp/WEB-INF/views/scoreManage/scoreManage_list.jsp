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
    <link href="<c:url value='/resources/vendor/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet">
    <!-- Custom fonts for this template -->
   <%--  <link href="<c:url value='/resources/vendor/font-awesome/css/font-awesome.min.css'/>" rel="stylesheet" type="text/css">
    <link href="<c:url value='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'/>" rel="stylesheet" type="text/css">
    <link href="<c:url value='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic'/>" rel="stylesheet" type="text/css">
 --%>
    <!-- Plugin CSS -->
    <link href="<c:url value='/resources/vendor/magnific-popup/magnific-popup.css'/>" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="<c:url value='/resources/css/creative.min.css'/>" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
    
    
<meta charset="UTF-8">
<title>게시판 목록</title>
<link rel="stylesheet" type="text/css" href="/resources/css/scoreManage.css" />
<script src="/resources/js/jquery.js"></script>
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
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
	  <a class="navbar-brand" href="main">CORE</a>
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	
	  <div class="collapse navbar-collapse" id="navbarColor01">
	    <ul class="navbar-nav mr-auto">
<!-- 	      <li class="nav-item active">
	        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
	      </li> -->
	      <li class="nav-item">
	        <a class="nav-link" href="scoreManage_list">공지사항</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="#">점수관리</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="#">회원리스트</a>
	      </li>
	    </ul>
		  <c:if test="${empty id}">
		    <form class="form-inline my-2 my-lg-0" method="post" action="member_login_ok" onsubmit="return login_check();">
			    <input class="form-control mr-sm-2" name="login_id" id="login_id" tabindex="1" placeholder="ID" required autofocus />
				<input class="form-control mr-sm-2" type="password" name="login_pwd" id="login_pwd" tabindex="2" id="inputPassword" placeholder="Password" required />&nbsp;
				<input class="btn btn-secondary my-2 my-sm-0" type="submit" value="로그인" />&nbsp;
				<input class="btn btn-secondary my-2 my-sm-0" type="button" value="비번찾기" onclick="pwd_find();" />&nbsp;
				<input class="btn btn-secondary my-2 my-sm-0" type="button" value="회원가입" onclick="location='member_join';" />
			</form>
		  </c:if>
		  <c:if test="${!empty id}"><!-- 로그인 이후 화면 -->
		    <form class="form-inline my-2 my-lg-0" method="post" action="member_logout">
		      <input class="btn btn-secondary my-2 my-sm-0"" type="button" value="${id}회원님 정보수정" onclick="location='member_del';" />&nbsp;
			  <input class="btn btn-secondary my-2 my-sm-0"" type="button" value="회원탈퇴" onclick="location='member_del';" />&nbsp;
			  <input class="btn btn-secondary my-2 my-sm-0"" type="submit" value="로그아웃" />
			</form>
		  </c:if>
	  </div>
	</nav>
 	<header class="masthead text-center d-flex">
    	<div class="container mx-auto my-5">
    </div>
    </header>
    <div class="row">
    	<div class="container my-auto text-center ">
          <div class="mx-auto">
			<form method="get" action="scoreManage_list" onsubmit="return find_check();">
			 <div id="bList_wrap">
			  <h2 class="bList_title">점수관리</h2>
			  <div class="bList_count">글개수: ${listcount} 개</div>
			  <table class="table table-hover" id="bList_t">
			   <tr>
			    <th width="6%" height="26">번호</th>
			    <th width="50%">제목</th>
			    <th width="14%">작성자</th>
			    <th width="17%">작성일</th>
			    <th width="14%">조회수</th>     
			   </tr>
			   <c:if test="${!empty blist}">
			   <c:forEach var="b" items="${blist}">
			   <tr>
			    <td align="center">
			    <c:if test="${b.scoreManage_step == 0}">
			    <%-- 원본글일때만 그룹번호가 출력 --%>
			     ${b.scoreManage_ref}
			    </c:if>
			    </td>
			    <td>
			<c:if test="${b.scoreManage_step != 0}"><%--답변글일때만 실행--%>
			  <c:forEach begin="1" end="${b.scoreManage_step}" step="1">
			   &nbsp;<%--답변글 들여쓰기 --%>
			  </c:forEach>
			  <img src="/resources/images/AnswerLine.gif" />
			  <%--답변글 이미지 출력부분 --%>
			</c:if>    
			<a href="scoreManage_cont?no=${b.scoreManage_no}&page=${page}&state=cont">
			${b.scoreManage_title}</a>
			<%-- scoreManage_cont?no=번호&page=쪽번호&state=cont 3개의 인자값이
			get방식으로 &구분하면서 전달된다. --%>
			    </td>
			    <td align="center">${b.scoreManage_name}</td>
			    <td align="center">${b.scoreManage_date}</td>
			    <td align="center">${b.scoreManage_hit}</td>
			   </tr>
			   </c:forEach>
			   </c:if>
			   <c:if test="${empty blist}">
			   <tr>
			    <th colspan="5">목록이 없습니다!</th>
			   </tr>
			   </c:if>
			  </table>
			  
			  <%--페이징 즉 쪽나누기 추가 --%>
			  <div id="bList_paging">
			    <%-- 검색전 페이징 --%>
			<c:if test="${(empty find_field) && (empty find_name)}">    
			    <c:if test="${page<=1}">
			     [이전]&nbsp;
			    </c:if>
			    <c:if test="${page>1}">
			     <a href="scoreManage_list?page=${page-1}">[이전]</a>&nbsp;
			    </c:if>
			    
			    <%--현재 쪽번호 출력--%>
			    <c:forEach var="a" begin="${startpage}" end="${endpage}"
			    step="1">
			     <c:if test="${a == page}"><%--현재 페이지가 선택되었다면--%>
			      <${a}>
			     </c:if>
			     <c:if test="${a != page}"><%--현재 페이지가 선택되지 않았
			     다면 --%>
			     <a href="scoreManage_list?page=${a}">[${a}]</a>&nbsp;
			     </c:if>
			    </c:forEach>
			    
			    <c:if test="${page >= maxpage}">
			    [다음]
			    </c:if>
			    <c:if test="${page<maxpage}">
			    <a href="scoreManage_list?page=${page+1}">[다음]</a>
			    </c:if>
			</c:if>
			
			<%-- 검색후 페이징 --%>
			 <c:if test="${(!empty find_field) && (!empty find_name)}">    
			    <c:if test="${page<=1}">
			     [이전]&nbsp;
			    </c:if>
			    <c:if test="${page>1}">
			     <a href="scoreManage_list?page=${page-1}&find_field=${find_field}&find_name=${find_name}">[이전]</a>&nbsp;
			    </c:if>
			    
			    <%--현재 쪽번호 출력--%>
			    <c:forEach var="a" begin="${startpage}" end="${endpage}"
			    step="1">
			     <c:if test="${a == page}"><%--현재 페이지가 선택되었다면--%>
			      <${a}>
			     </c:if>
			     <c:if test="${a != page}"><%--현재 페이지가 선택되지 않았
			     다면 --%>
			     <a href="scoreManage_list?page=${a}&find_field=${find_field}&find_name=${find_name}">[${a}]</a>&nbsp;
			     </c:if>
			    </c:forEach>
			    
			    <c:if test="${page >= maxpage}">
			    [다음]
			    </c:if>
			    <c:if test="${page < maxpage}">
			    <a href="scoreManage_list?page=${page+1}&find_field=${find_field}&find_name=${find_name}">[다음]</a>
			    </c:if>
			</c:if>   
			  </div>
			  
			  <div id="bList_menu">
			   <input type="button" class="btn btn-primary btn-sm btn-block" value="글쓰기" onclick="location='scoreManage_write?page=${page}';" />   
			  </div>
			  
			  <%--검색 폼추가 --%>
			  <div id="bFind_wrap">
			  <select name="find_field" class = "form-control">
			    <option value="scoreManage_title" <c:if test="${find_field=='scoreManage_title'}"> ${'selected'} </c:if>>제목 </option>
			    <option value="scoreManage_cont" <c:if test="${find_field=='scoreManage_cont'}">  ${'selected'} </c:if>>내용 </option>  
			  </select>
			  <input class = "form-control mr-sm-2" name="find_name" id="find_name" placeholder="검색내용" size="14" value="${find_name}" />
			  <input type="submit" class="btn btn-primary btn-sm btn-block" value="검색" />
			  </div>
			 </div>
			 </form>
 		</div>
 	</div>
 </div>
 
    <!-- Bootstrap core JavaScript -->
   <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
   <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
 
</body>
</html>

<!-- 부트스트랩클래스 참고사이트
https://bootswatch.com/default/ -->















