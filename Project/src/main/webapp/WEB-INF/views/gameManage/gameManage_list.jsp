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
			<form method="get" action="gameManage_list" onsubmit="return find_check();">
			 <div id="gameList_wrap">
			  <h2 class="gameList_title">게임관리</h2>
			  <div class="gameList_count">글개수: ${listcount} 개</div>
			  <table class="table table-hover" id="gameList_t">
			   <tr>
			    <th width="43%">게임명</th>
			    <th width="34%">작성자</th>
			    <th width="17%">게임일시</th>
			   </tr>
			   <c:if test="${!empty gameList}">
			   <c:forEach var="b" items="${gameList}">
			   <tr><td>
			<a href="gameManage_cont?no=${b.gameId}&page=${page}&state=cont">${b.gameNm}</a>
			<%-- gameManage_cont?no=번호&page=쪽번호&state=cont 3개의 인자값이 get방식으로 &구분하면서 전달된다. --%>
			    </td>
			    <td align="center">${b.wrighterNm}</td>
			    <td align="center">${b.gameDtime}</td>
			   </tr>
			   </c:forEach>
			   </c:if>
			   <c:if test="${empty gameList}">
			   <tr>
			    <th colspan="5">목록이 없습니다!</th>
			   </tr>
			   </c:if>
			  </table>
			  
			  <%--페이징 즉 쪽나누기 추가 --%>
			  <div id="gameList_paging">
			    <%-- 검색전 페이징 --%>
			<c:if test="${(empty find_field) && (empty find_name)}">    
			    <c:if test="${page<=1}">
			     [이전]&nbsp;
			    </c:if>
			    <c:if test="${page>1}">
			     <a href="gameManage_list?page=${page-1}">[이전]</a>&nbsp;
			    </c:if>
			    
			    <%--현재 쪽번호 출력--%>
			    <c:forEach var="a" begin="${startpage}" end="${endpage}"
			    step="1">
			     <c:if test="${a == page}"><%--현재 페이지가 선택되었다면--%>
			      <${a}>
			     </c:if>
			     <c:if test="${a != page}"><%--현재 페이지가 선택되지 않았
			     다면 --%>
			     <a href="gameManage_list?page=${a}">[${a}]</a>&nbsp;
			     </c:if>
			    </c:forEach>
			    
			    <c:if test="${page >= maxpage}">
			    [다음]
			    </c:if>
			    <c:if test="${page<maxpage}">
			    <a href="gameManage_list?page=${page+1}">[다음]</a>
			    </c:if>
			</c:if>
			
			<%-- 검색후 페이징 --%>
			 <c:if test="${(!empty find_field) && (!empty find_name)}">    
			    <c:if test="${page<=1}">
			     [이전]&nbsp;
			    </c:if>
			    <c:if test="${page>1}">
			     <a href="gameManage_list?page=${page-1}&find_field=${find_field}&find_name=${find_name}">[이전]</a>&nbsp;
			    </c:if>
			    
			    <%--현재 쪽번호 출력--%>
			    <c:forEach var="a" begin="${startpage}" end="${endpage}"
			    step="1">
			     <c:if test="${a == page}"><%--현재 페이지가 선택되었다면--%>
			      <${a}>
			     </c:if>
			     <c:if test="${a != page}"><%--현재 페이지가 선택되지 않았
			     다면 --%>
			     <a href="gameManage_list?page=${a}&find_field=${find_field}&find_name=${find_name}">[${a}]</a>&nbsp;
			     </c:if>
			    </c:forEach>
			    
			    <c:if test="${page >= maxpage}">
			    [다음]
			    </c:if>
			    <c:if test="${page < maxpage}">
			    <a href="gameManage_list?page=${page+1}&find_field=${find_field}&find_name=${find_name}">[다음]</a>
			    </c:if>
			</c:if>   
			  </div>
			  
			  <div id="gameList_menu">
			   <input type="button" class="btn btn-primary btn-sm btn-block" value="글쓰기" onclick="location='gameManage_write?page=${page}';" />   
			  </div>
			  
			  <%--검색 폼추가 --%>
			  <div id="bFind_wrap">
			  <select name="find_field" class = "form-control">
			    <option value="게임명" <c:if test="${find_field=='GAME_NM'}"> ${'selected'} </c:if>>게임명</option>
			    <option value="작성자명" <c:if test="${find_field=='WRIGHTER_NM'}">  ${'selected'} </c:if>>작성자명</option>  
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
    <script src="<c:url value="/resources/bootstrap-4.1.1-dist/js/bootstrap.min.js" />"></script>
    <script src="<c:url value="/resources/bootstrap-4.1.1-dist/js/bootstrap.js" />"></script>
    <script src="<c:url value="/resources/bootstrap-4.1.1-dist/js/bootstrap.bundle.min.js" />"></script>
    <script src="<c:url value="/resources/bootstrap-4.1.1-dist/js/bootstrap.bundle.js" />"></script>
 
</body>
</html>

<!-- 부트스트랩클래스 참고사이트
https://bootswatch.com/default/ -->















